package com.gs.common.util;

import java.text.DecimalFormat;
public class NumberUtils {
	/**
	 * 转换成两位小数
	 * @param number
	 * @return
	 */
	public static double NumberTwoDecimal(double number){
		return Double.parseDouble(new DecimalFormat("########0.00").format(number));
	}
	/**
	 * 得到能源的计量单位
	 * @param str
	 * @return
	 */
	public static String getMeasuringunitByStr(String str){
		if(str==null||str.equals("")){
			return "";
		}
		int index=str.indexOf("/");
		if(index>0&&index<str.length()-1){
			str= str.substring(index+1);
		}
		return str;
	}

	/**
	 * 查询数组的最大值下标和最小值下标
	 * @param obj
	 * @return
	 */
	public static int[] searchArrayNum(Object[] obj){
		int[] num = new int[2];
		Object max=obj[0];
		Object min = obj[0];
		int maxDex=0;
		int minDex = 0;
		for(int i=0;i<obj.length;i++){
			if(Double.parseDouble(StringUtils.toParseString(obj[i])) > Double.parseDouble(StringUtils.toParseString(max))){ 
				max=obj[i];
				maxDex=i;
			}
			if(Double.parseDouble(StringUtils.toParseString(obj[i])) < Double.parseDouble(StringUtils.toParseString(min))){ 
				min=obj[i];
				minDex=i;
			}
		}
		num[0] = maxDex;num[1] = minDex;
		return num;
	}
}
