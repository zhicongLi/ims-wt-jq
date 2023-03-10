/**
 * Copyright &copy; 2012-2014 <a href="https://github.com//treps">treps</a> All rights reserved.
 */
package com.ims.jq.utils;

import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.DefaultResourceLoader;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 全局配置类
 * @author 
 * @version 2014-06-25
 */
public class Global {

	/**
	 * 当前对象实例
	 */
	private static Global global = new Global();
	
	/**
	 * 保存全局属性值
	 */
	public static Map<String, String> map = new HashMap<>();
	
	/**
	 * 属性文件加载对象
	 */
	//正式环境配置
	private static PropertiesLoader loader = new PropertiesLoader("config.properties");
	//本地开发环境配置
	//private static PropertiesLoader loader = new PropertiesLoader("config2.properties");

	/**
	 * 显示/隐藏
	 */
	public static final String SHOW = "1";
	public static final String HIDE = "0";

	/**
	 * 是/否
	 */
	public static final String YES = "1";
	public static final String NO = "0";
	
	/**
	 * 对/错
	 */
	public static final String TRUE = "true";
	public static final String FALSE = "false";
	

	
	/**
	 * 移动登录认证
	 */
	public static final String USERNAME = "userName";
	public static final String USERID = "userId";
	public static final String TOKEN = "token";
	
	/**
	 * 上传文件基础虚拟路径
	 */
	public static final String USERFILES_BASE_URL = "/userfiles/";
	
	/**
	 * 默认是域id
	 */
	public static final String SYS_SITE_ID = "100";
	
	
	/**
	 * 获取当前对象实例
	 */
	public static Global getInstance() {
		return global;
	}
	
	
	/**
	 * 获取配置
	 */
	public static String getConfig(String key) {
		String value = map.get(key);
		if (value == null){
			value = loader.getProperty(key);
			map.put(key, value != null ? value : StringUtils.EMPTY);
		}
		return value;
	}
	public static void putConfig(String key,String value){
		map.put(key, value);
	}
	/**
	 * 获取管理端根路径
	 */
	public static String getAdminPath() {
		return getConfig("adminPath");
	}
	
	/**
	 * 获取obh管理端根路径
	 */
	public static String getObhPath() {
		return getConfig("obhPath");
	}
	
	
	/**
	 * 获取前端根路径 （modify 暂时修改）
	 */
	public static String getFrontPath() {
		return getConfig("frontMainPath");
	}
	
	
	/**
	 * 获取URL后缀
	 */
	public static String getUrlSuffix() {
		return getConfig("urlSuffix");
	}
	
	/**
	 * 是否是演示模式，演示模式下不能修改用户、角色、密码、菜单、授权
	 */
	public static Boolean isDemoMode() {
		String dm = getConfig("demoMode");
		return "true".equals(dm) || "1".equals(dm);
	}
	
	/**
	 * 在修改系统用户和角色时是否同步到Activiti
	 */
	public static Boolean isSynActivitiIndetity() {
		String dm = getConfig("activiti.isSynActivitiIndetity");
		return "true".equals(dm) || "1".equals(dm);
	}
    
	/**
	 * 页面获取常量
	 */
	public static Object getConst(String field) {
		try {
			return Global.class.getField(field).get(null);
		} catch (Exception e) {
			// 异常代表无配置，这里什么也不做
		}
		return null;
	}

	/**
	 * 获取上传文件的根目录
	 * @return
	 */
	public static String getUserfilesBaseDir() {
		String dir = getConfig("userfiles.basedir");
//		if (StringUtils.isBlank(dir)){
//			try {
//				dir = ServletContextFactory.getServletContext().getRealPath("/");
//			} catch (Exception e) {
//				return "";
//			}
//		}
		if(!dir.endsWith("/")) {
			dir += "/";
		}
//		System.out.println("userfiles.basedir: " + dir);
		return dir;
	}
	
    /**
     * 获取工程路径
     * @return
     */
    public static String getProjectPath(){
    	// 如果配置了工程路径，则直接返回，否则自动获取。
		String projectPath = Global.getConfig("projectPath");
		if (StringUtils.isNotBlank(projectPath)){
			return projectPath;
		}
		try {
			File file = new DefaultResourceLoader().getResource("").getFile();
			if (file != null){
				while(true){
					File f = new File(file.getPath() + File.separator + "src" + File.separator + "main");
					if (f == null || f.exists()){
						break;
					}
					if (file.getParentFile() != null){
						file = file.getParentFile();
					}else{
						break;
					}
				}
				projectPath = file.toString();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return projectPath;
    }
	
    /**
	 * 获取前端新根路径
	 */
	public static String getFrontMainPath() {
		return getConfig("frontMainPath");
	}
	
	/**
	 * 获取系统区域ID
	 */
	public static String getSysAreaId() {
		String areaId=getConfig("sys.areaId");
		return areaId;
	}
	/**
	 * 获取站点id
	 * @return
	 */
	public static String getSysSiteId() {
		String siteId=getConfig("sys.siteId");
		if(StringUtils.isBlank(siteId)){
			return Global.SYS_SITE_ID;
		}
		return siteId;
	}
	public static String getUserExtServiceClass() {
		String userExtServiceClass=getConfig("sys.userExtServiceClass");
		return userExtServiceClass;
	}
}
