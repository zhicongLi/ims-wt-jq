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

import com.alibaba.fastjson.JSONObject;
import com.ims.jq.utils.CookieUtils;
import com.ims.jq.utils.Global;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class IAMUtils {

    private static final String PREFIX= "bearer ";

    public static final String CODE="iamCode";
    public static final String TOKEN="iamAccessToken";


    public static void clearCookie(HttpServletRequest request, HttpServletResponse response){
        CookieUtils.setCookie(response,CODE,"",0);
        CookieUtils.setCookie(response,TOKEN,"", 0);
    }
    public static void setCookie(HttpServletRequest request, HttpServletResponse response,String code,String token){
        CookieUtils.setCookie(response,CODE,code, -1);
        CookieUtils.setCookie(response,TOKEN,token, -1);
    }


    public static String pathPrefix(String url) throws TrepsException {
        if(StringUtils.isBlank(url)){
            return null;
        }
//        if(url.contains("code=")){
//            throw new TrepsException("url不能包含code，否则和工作台code冲突！");
//        }
//        String prefix = "http://192.168.0.241:8181/treps/mis/validate?url=";
        String prefix = Global.getConfig("integrate.url");
        String adminPath = "/mis";
        if(StringUtils.isBlank(prefix)){
            try {
                new TrepsException("integrate.url不能为空");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(url.contains("http")){
            return prefix+url;
        }else{
            if(StringUtils.isNotBlank(adminPath)){
                return prefix+adminPath.substring(1,adminPath.length())+url;
            }else{
                return prefix+url;
            }
        }
    }

    //获取token
    public static String fromIamGetToken(String iamCode) throws TrepsException {
        if(StringUtils.isBlank(iamCode)){
            return null;
        }
//        String url = "http://192.168.0.171:86/ims-idms/usersession/getTokenByCode";
        String url = Global.getConfig("iam.getTokenByCode");
        if(StringUtils.isBlank(url)){
            throw new TrepsException("配置iam.getTokenByCode不能为空！");
        }

        String result = null;
        try {
            url = url + "?code="+iamCode;

            HttpGet request = new HttpGet(url);
            HttpClient httpClient = new DefaultHttpClient();
            HttpResponse response = httpClient.execute(request);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                result= EntityUtils.toString(response.getEntity(),"utf-8");
            }

            if(StringUtils.isBlank(result)){
                return null;
            }
            JSONObject resultJson = JSONObject.parseObject(result);
            if (resultJson.containsKey("error")) {
                log.error("iam.getTokenByCode error result:" + resultJson.toString());
                return null;
            } else {
                return resultJson.getString("data");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //获取用户信息
    public static String fromIamGetUserInfo(String token) throws TrepsException {
//        String url = "http://192.168.0.171:86/ims-idms/auth/oauth/IUserInfo";
        String url = Global.getConfig("iam.getUserInfo");
        if(StringUtils.isBlank(url)){
            throw new TrepsException("config中iam.getUserInfo不能为空！");
        }

        String result = null;
        try {
            HttpGet request = new HttpGet(url);
            request.addHeader("Authorization", "bearer " + token);
            request.addHeader("Blade-Auth", "bearer "+token);
            HttpClient httpClient = new DefaultHttpClient();
            HttpResponse response = httpClient.execute(request);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                result= EntityUtils.toString(response.getEntity(),"utf-8");
            }

            if(StringUtils.isBlank(result)){
                return null;
            }
            JSONObject resultJson = JSONObject.parseObject(result);
            if (resultJson.containsKey("error")) {
                log.error("iam.fromIamGetUserInfo error result:" + resultJson.toString());
                return null;
            } else {
                // 获取userId
                JSONObject userJson = resultJson.getJSONObject("data");
                return userJson.getString("loginName");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

}
