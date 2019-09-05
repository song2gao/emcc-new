package com.gs.common.util;


public class StringUtils {
	public static String replaceAll(String str, String arg1, String arg2) {
		int index = str.indexOf(arg1);
		String tmp = "";
		while (index != -1) {
			tmp = tmp + str.substring(0, index) + arg2;
			str = str.substring(index + 1);
			index = str.indexOf(arg1);
		}
		tmp = tmp + str;

		return tmp;
	}

	/**
	 * 首字母小�?
	 * @param param
	 * @return
	 */
	public static String toFirstLowerCase(String param) {
		if (null == param || "".equals(param))
			return "";
		else
			return param.substring(0, 1).toLowerCase() + param.substring(1);
	}
	
	/**
	 * 将object类型转换为String类型
	 * @param param
	 * @return
	 */
	public static String toParseString(Object param){
		if(null == param || "".equals(param)){
			return "0";
		}
		else {
			return param.toString();
		}
	}
	public static boolean isNullOrEmpty(String str){
		
		if(str == null || str.trim().equals(""))	
			return true;
		else
			return false;
	}
	public static String toPascal(String str){
		if(StringUtils.isNullOrEmpty(str))	return null;
		return str.substring(0, 1).toUpperCase() + str.substring(1);
	}
	public static String toCamel(String str){
		if(StringUtils.isNullOrEmpty(str))	return null;
		return str.substring(0, 1).toLowerCase() + str.substring(1);
	}
	
	public static String clone(String str){
		String cloneStr = "";
		return cloneStr.copyValueOf(str.toCharArray());
	}
	public static String padLeftStr(String str,int len){
		String result=str;
		for(int i=str.length();i<len;i++){
			result="0"+str;
		}
		return result;
	}
}
