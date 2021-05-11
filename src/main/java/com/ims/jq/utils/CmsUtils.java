/**
 * Copyright &copy; 2012-2014 <a href="https://github.com//treps">treps</a> All rights reserved.
 */
package com.ims.jq.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;



import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.Model;

/**
 * 内容管理工具类
 * @author 
 * @version 2013-5-29
 */
public class CmsUtils {
	

	private static final String CMS_CACHE = "cmsCache";
	
	/**
	 * 获得站点列表
	 */
	public static List getSiteList(){
		List siteList = new ArrayList<>();
		return siteList;
	}
	

	public static String readFile(String Path) {
        BufferedReader reader = null;
        String laststr = "";
        try {
            FileInputStream fileInputStream = new FileInputStream(Path);
            InputStreamReader inputStreamReader = new InputStreamReader(
                    fileInputStream, "utf-8");
            reader = new BufferedReader(inputStreamReader);
            String tempString = null;
            while ((tempString = reader.readLine()) != null) {
                laststr += tempString;
            }
            reader.close();
        } catch (IOException e) {        	
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return laststr;
    }
	
}