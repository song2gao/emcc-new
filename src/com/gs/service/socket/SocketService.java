package com.gs.service.socket;


import net.sf.json.JSONObject;

/**
 * @author: gaosong
 * @date:2017-12-3 下午03:43:11
 * @version :1.0.0
 * 
 */
public interface SocketService {
	JSONObject getRealData(String ctdCodes);
	JSONObject getCoolRealData();
	JSONObject getPlcRealData();
	JSONObject getAllRealData(String pclcType, String type);
	JSONObject getAllRealData(String pclcType, String type,String mmpCodeStr);
	JSONObject getPlcReadData(String CtdCode);
	JSONObject getPlcWriteData(String ctdCode,String mmpCode,Double value);
	//JSONObject getRealDataByCtdCode(String ctdCode);
	JSONObject getRealDataByTypeAndCode(String type,String oragaCode);
}
