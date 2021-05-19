package com.ims.jq.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ims.jq.entity.SysUser;
import com.ims.jq.utils.CookieUtils;
import com.ims.jq.utils.Global;

import lombok.extern.slf4j.Slf4j;
import sun.misc.BASE64Encoder;

//@Slf4j
@Component
public class AuthorityInterceptor implements HandlerInterceptor {

    //    public static Map<String,User> map = new HashMap<>();
//    public static String key = "user_key";
    public static final String IAMACCESSTOKEN = "iamAccessToken";
    public static final String IAM_CALLBACK_CODE = "code";
    public static final String IAMCODE = "iamCode";


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        String ip = request.getLocalAddr();

        String loginRedirect = Global.getConfig("login.redirect");
        String loginSuccessUrl = Global.getConfig("login.success.url");
        String redirectUrl = Global.getConfig("redirect.url");
        //log.info("redirectUrl:" + redirectUrl);
        System.out.println("redirectUrl:" + redirectUrl);

        if ("true".equalsIgnoreCase(loginRedirect)) {
            if (StringUtils.isBlank(loginSuccessUrl) || StringUtils.isBlank(redirectUrl)) {
                throw new TrepsException("login.redirect、login.success.url、redirect.url不能为空！");
            }
            //log.info("SystemAuthorizingRealm.Principal:===");
            System.out.println("SystemAuthorizingRealm.Principal:===");
//            User user = map.get(key);
//            if(user != null){
//                return true;
//            }

            //获取code和iam-token
            String iamCode = request.getParameter(IAM_CALLBACK_CODE);
            if (StringUtils.isBlank(iamCode)) {
                iamCode = request.getParameter(IAMCODE);
            }
            String iamAccessToken = request.getParameter(IAMUtils.TOKEN);

            //登录成功之后的路径编码
            BASE64Encoder base64Encoder = new BASE64Encoder();
            String encodeRedirectUrl = base64Encoder.encode(loginSuccessUrl.getBytes());

            if (StringUtils.isNotBlank(iamCode) && StringUtils.isBlank(iamAccessToken)) {
                String token = IAMUtils.fromIamGetToken(iamCode);
                System.out.println(token);
                if (StringUtils.isNotBlank(token)) {
                    SysUser userInfo = fromIamGetUserInfoNew(token);
                    if (userInfo != null) {
                        request.setAttribute("userInfo", userInfo);
                        setUserInfoStr(request,userInfo);
                        IAMUtils.setCookie(request, response, iamCode, token);
                        return true;
                    }
                } else {
                    response.sendRedirect("/logout");
                    return false;
                }
                //                return true;
            }

            if (iamCode == null) {
                iamCode = CookieUtils.getCookie(request, IAMUtils.CODE);
            }
            if (iamAccessToken == null) {
                iamAccessToken = CookieUtils.getCookie(request, IAMUtils.TOKEN);
            }

            //退出
            if (org.springframework.util.StringUtils.isEmpty(iamCode)) {
                String rUrl = redirectUrl + "?redirect_url=" + encodeRedirectUrl;
                String exitFlag = request.getParameter("exitFlag");
                if (StringUtils.isNotBlank(exitFlag)) {
                    rUrl += "&exitFlag=true";
                }
                response.sendRedirect(rUrl);
                return false;
            }

            if (StringUtils.isNotBlank(iamCode) && StringUtils.isNotBlank(iamAccessToken)) {
                // 如果已经登录，则跳转到管理首页
                System.out.println("redirectUrl:" + redirectUrl);
                SysUser userInfo = fromIamGetUserInfoNew(iamAccessToken);
                if (userInfo == null) {
                    response.sendRedirect("/logout");
                    return false;
                }
                //log.info("loginUser:" + userInfo.toString());
                request.setAttribute("userInfo", userInfo);
                setUserInfoStr(request,userInfo);
                //把token写入到cookie
                IAMUtils.setCookie(request, response, iamCode, iamAccessToken);
                return true;
            } else if (StringUtils.isNotBlank(iamCode) && StringUtils.isBlank(iamAccessToken)) {
                String token = IAMUtils.fromIamGetToken(iamCode);
                if (StringUtils.isNotBlank(token)) {
                    SysUser userInfo = fromIamGetUserInfoNew(token);
                    if (userInfo != null) {
                        request.setAttribute("userInfo", userInfo);
                        setUserInfoStr(request,userInfo);
                        IAMUtils.setCookie(request, response, iamCode, token);
                        return true;
                    }
                }
            }
            IAMUtils.clearCookie(request, response);
            return false;
        } else {
            return true;
        }
    }

    public void setUserInfoStr(HttpServletRequest request, SysUser userInfo){
    	if(userInfo == null){
    		return;
    	}
    	String ustr = JSON.toJSONString(userInfo);
    	ustr = ustr.replace("'", "\\'");
        request.setAttribute("userinfoJson", ustr);
    }
    
    //获取用户信息
    public static SysUser fromIamGetUserInfoNew(String token) throws TrepsException {
//        String url = "http://192.168.0.171:86/ims-idms/auth/oauth/IUserInfo";
        String url = Global.getConfig("iam.getUserInfo");
        if (StringUtils.isBlank(url)) {
            throw new TrepsException("config中iam.getUserInfo不能为空！");
        }

        String result = null;
        try {
            HttpGet request = new HttpGet(url);
            request.addHeader("Authorization", "bearer " + token);
            request.addHeader("Blade-Auth", "bearer " + token);
            HttpClient httpClient = new DefaultHttpClient();
            HttpResponse response = httpClient.execute(request);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                result = EntityUtils.toString(response.getEntity(), "utf-8");
            }

            if (StringUtils.isBlank(result)) {
                return null;
            }
            JSONObject resultJson = JSONObject.parseObject(result);
            if (resultJson.containsKey("error")) {
                //log.error("iam.fromIamGetUserInfo error result:" + resultJson.toString());
                return null;
            } else {
                // 获取userId
                JSONObject userJson = resultJson.getJSONObject("data");
                SysUser sysUser = JSON.parseObject(userJson.toJSONString(), SysUser.class);
                return sysUser;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
