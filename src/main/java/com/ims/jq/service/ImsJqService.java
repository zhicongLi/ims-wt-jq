package com.ims.jq.service;

import java.util.HashMap;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import com.alibaba.fastjson.JSON;
import com.ims.jq.interceptor.IAMUtils;

@Service
public class ImsJqService {
   
	//展示6种工作票打印信息
   public Model findWoWt(String id,String wtType,String iamCode,Model model){	   
	   RestTemplate restTemplate = new RestTemplate();
	   MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
	   form.add("id", id);	 
	   HttpHeaders headers = new HttpHeaders();
	   headers.setContentType(MediaType.MULTIPART_FORM_DATA);
	   headers.setConnection("Keep-Alive");
	   headers.setCacheControl("no-cache");
	   headers.add(IAMUtils.CODE,iamCode);
	   HttpEntity req = new HttpEntity(form, headers);
	  // String uploadUrl = systemProperties.getDocUploadUrl()+"/documentCenter/onlyOfficePutObject";
	   String uploadUrl = "http://192.168.0.171:18600/wo-wt/wo/woWt/listWtType"+wtType+"Print";
	   try {
	      ResponseEntity<String> responseEntity = restTemplate.postForEntity(uploadUrl, req, String.class);
	      String str = responseEntity.getBody();
	      System.out.println(str);
	      //JSONObject jsonObject = JsonMapper.getInstance().fromJson(str,JSONObject.class);
	      //boolean isSuccess = jsonObject.getBoolean("success");	  
	      HashMap hashMap = JSON.parseObject(str, HashMap.class);
	      model.addAllAttributes(hashMap);
	      //model.addAttribute("woWtList", aa);
	   } catch (Exception e) {	      
	      e.printStackTrace();
	   }
	   	   
	   return model;
   }
   
   //展示工作任务单打印信息
   public Model findWoWtTask(String id,String iamCode,Model model){	   
	   RestTemplate restTemplate = new RestTemplate();
	   MultiValueMap<String, Object> form = new LinkedMultiValueMap<>();
	   form.add("id", id);	 
	   HttpHeaders headers = new HttpHeaders();
	   headers.setContentType(MediaType.MULTIPART_FORM_DATA);
	   headers.setConnection("Keep-Alive");
	   headers.setCacheControl("no-cache");
	   headers.add(IAMUtils.CODE,iamCode);
	   HttpEntity req = new HttpEntity(form, headers);
	  // String uploadUrl = systemProperties.getDocUploadUrl()+"/documentCenter/onlyOfficePutObject";
	   String uploadUrl = "http://192.168.0.171:18600/wo-wt/wo/woWtTask/viewWoWtTask";
	   try {
	      ResponseEntity<String> responseEntity = restTemplate.postForEntity(uploadUrl, req, String.class);
	      String str = responseEntity.getBody();
	      System.out.println(str);
	      //JSONObject jsonObject = JsonMapper.getInstance().fromJson(str,JSONObject.class);
	      //boolean isSuccess = jsonObject.getBoolean("success");	  
	      HashMap hashMap = JSON.parseObject(str, HashMap.class);
	      model.addAllAttributes(hashMap);
	      //model.addAttribute("woWtList", aa);
	   } catch (Exception e) {	      
	      e.printStackTrace();
	   }
	   	   
	   return model;
   }
}
