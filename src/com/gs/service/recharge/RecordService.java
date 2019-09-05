package com.gs.service.recharge;

import java.util.List;

import com.gs.domain.EsmspUserRechargeRecord;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年11月3日 上午10:06:44 
* 描述： 预付费充值记录接口
*/
public interface RecordService {

	/**计算充值记录总数
	 * @return
	 */
	int finCountRecord();

	
	/**
	 * 分页查询 充值记录
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<EsmspUserRechargeRecord> findPageAllRecord(int pageIndex, int pageSize);


	/**
	 * 条件模糊查询
	 * @param string
	 * @param beforeDate
	 * @param alterDate
	 * @return
	 */
	List<EsmspUserRechargeRecord> findRecordBySearch(String string, String beforeDate, String alterDate);

}
