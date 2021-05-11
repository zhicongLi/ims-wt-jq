package com.ims.jq.utils;

import org.apache.commons.lang3.StringUtils;

public class SysUtils {
	public static String replaceUrlParam(String url, String paramName, String paramValue) {
		paramValue = paramValue == null ? "" :paramValue;
		if(StringUtils.isNotBlank(paramName)) {
			url = url.replaceAll("([\\?&])(" + paramName +"=[^&]*)", "$1"+paramName + "=" + paramValue);
		}
		return url;
	}
}
