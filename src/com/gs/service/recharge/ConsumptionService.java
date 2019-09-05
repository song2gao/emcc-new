package com.gs.service.recharge;

import java.util.List;

import com.gs.domain.EsmspUserRechargeDetail;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年11月3日 上午10:07:09 
* 描述： 充值消费记录接口
*/
public interface ConsumptionService {

	/**
	 * 计算总数
	 * @return
	 */
	int finCountDetail();

	/**
	 * 分页查询
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<EsmspUserRechargeDetail> findPageAllDetail(int pageIndex, int pageSize);

	
	/**
	 * 分页条件查询
	 * @param search
	 * @param beforeDate
	 * @return
	 */
	List<EsmspUserRechargeDetail> findDetailBySearch(String search, String beforeDate);

}
