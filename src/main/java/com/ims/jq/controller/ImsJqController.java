package com.ims.jq.controller;

import com.ims.jq.interceptor.IAMUtils;
import com.ims.jq.interceptor.TrepsException;
import com.ims.jq.interceptor.User;
import com.ims.jq.service.ImsJqService;
import com.ims.jq.utils.Global;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
//@Slf4j
@Configurable
public class ImsJqController {
	@Autowired
	private ImsJqService imsJqService;
    @RequestMapping("/")
    public String index(Model model) {
        this.handleCtx(model);
        return "sys/sysIndex"+Global.getConfig("sys.templateIndex");
    }


    @RequestMapping(value = "/doLogin")
    public String doLogin(HttpServletRequest request, HttpServletResponse response) throws TrepsException {
        String sysIndex = Global.getConfig("sys.index");
        String referer = request.getParameter("referer");
//        String redirectUrl ="http://192.168.0.171:81";
        //获取code和iam-token
        String iamCode = request.getParameter("code");
        String iamAccessToken = request.getParameter(IAMUtils.TOKEN);
        if(StringUtils.isNotBlank(iamCode)&&StringUtils.isNotBlank(iamAccessToken)){
            // 如果已经登录，则跳转到管理首页
//            System.out.println("redirectUrl:"+redirectUrl);
            String loginName = IAMUtils.fromIamGetUserInfo(iamAccessToken);
            //log.info("loginName:"+loginName);
            System.out.println("loginName:"+loginName);

            User user = new User();
            user.setLoginName(loginName);

//            AuthorityInterceptor.map.put(AuthorityInterceptor.key,user);
            //把token写入到cookie
//            CookieUtils.setCookie(response,"code",code,120000);
//            CookieUtils.setCookie(response,"iam-access-token",iamAccessToken,120000);
            IAMUtils.setCookie(request, response, iamCode, iamAccessToken);

//            request.setAttribute("t", iamAccessToken);
//            request.setAttribute("code", iamCode);
            String url = referer!= null ? referer : sysIndex;

//            if(url.indexOf("code=")!=-1){
//
//            	url = SysUtils.replaceUrlParam(url, "code", code);
//
//            }else{
//            	if(url.indexOf("?")==-1){
//            		url+="?code="+code;
//            	}else{
//            		url+="&code="+code;
//            	}
//            }


            request.setAttribute("referer",url );
        }


        return "sys/logincallback";
    }


    @RequestMapping(value = "/forward/{target}")
    public String forward(@PathVariable String target) {
        return target.replaceAll("\\_","/");
    }
    private void handleCtx(Model model){

    	String gatewayIp = Global.getConfig("gateway.ip");
        String gatewayPort =  Global.getConfig("gateway.port");
        String serviceApiName =  Global.getConfig("service.apiName");
        String docUploadUrl = Global.getConfig("doc.upload.url");
        String bucketName = Global.getConfig("doc.upload.bucket.name");
        String docDownloadUrl = Global.getConfig("doc.download.url");
        String docPreviewUrl = Global.getConfig("doc.preview.url");
        String docOnlineEditUrl = Global.getConfig("doc.online.edit.url");
        String reportUrl = Global.getConfig("reportUrl");
        //电子围栏路径
        String smElectronicFenceUrl = Global.getConfig("smElectronicFenceUrl");
        //newTabPage路径
        String woWtNewTabPageUrl = Global.getConfig("woWtNewTabPageUrl");

        String ctx = "http://"+gatewayIp+":"+gatewayPort;
        if(StringUtils.isNotBlank(serviceApiName)){
            ctx += "/"+serviceApiName;
        }

        model.addAttribute("_imsBucketName_", bucketName);
        model.addAttribute("ctx", ctx);
        model.addAttribute("rootUploadDocUrl", docUploadUrl);
        model.addAttribute("rootDownloadDocUrl", docDownloadUrl);
        model.addAttribute("rootDocPreviewUrl", docPreviewUrl);
        model.addAttribute("rootDocOnlineEditUrl", docOnlineEditUrl);
        model.addAttribute("smElectronicFenceUrl", smElectronicFenceUrl);
        model.addAttribute("woWtNewTabPageUrl", woWtNewTabPageUrl);
        model.addAttribute("reportUrl",reportUrl);
    }
    @RequestMapping(value = "/form")
    public String form(String view, Model model) {

        this.handleCtx(model);
        return view;
    }

    //获取后台接口数据用于工作票打印预览
    @RequestMapping(value = "/form2")
    public String form2(String view, Model model,String id,String wtType,String iamCode) {
    	model = imsJqService.findWoWt(id,wtType,iamCode, model);
    	 this.handleCtx(model);
    	//System.out.println(model);
        return view;
    }

  //获取后台接口数据用于工作票打印预览
    @RequestMapping(value = "/form3")
    public String form3(String view, Model model,String id,String iamCode) {
    	model = imsJqService.findWoWtTask(id,iamCode, model);
    	 this.handleCtx(model);
    	//System.out.println(model);
        return view;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) throws TrepsException {
        IAMUtils.clearCookie(request, response);
        return "redirect:/?exitFlag=true";
    }



}
