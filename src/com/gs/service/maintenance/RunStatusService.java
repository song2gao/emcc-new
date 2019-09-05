package com.gs.service.maintenance;

import net.sf.json.JSONObject;

/** 
 * @author 作者 朱亚彬: 
 * @version 创建时间：2017-9-18 下午04:43:37 
 * 描述： RunStatusService  运行状态监视
 */
public interface RunStatusService {

	//通过 ID 查询所有  返回  josn格式
	JSONObject findFrontendById(String id);

	JSONObject getFrontend(String names, String ports, int pageIndex, int pageSize);

}
