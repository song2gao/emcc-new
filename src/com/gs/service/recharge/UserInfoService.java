package com.gs.service.recharge;

import java.util.List;

import com.gs.domain.EsmspUserRechargeDetail;
import com.gs.domain.EsmspUserRechargeRecord;
import com.gs.domain.EsmspUserInfo;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年11月3日 上午10:06:04 
* 描述： 预付费充值用户信息接口
*/
public interface UserInfoService {

	/**
	 * 查询总数
	 * @return
	 */
	int finCount();

	/**
	 * 分页全查询加载
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<EsmspUserInfo> findPageAll(int pageIndex, int pageSize);

	/**
	 * 条件查询 用户信息
	 * @param search
	 * @return
	 */
	List<EsmspUserInfo> findAllBySearch(String search);

	/**
	 * 仅加载 欠费用户信息
	 * @return
	 */
	List<EsmspUserInfo> findAllByNum();

	/**
	 * 添加和修改用户信息
	 */
	int saveUser(EsmspUserInfo userinfo);

	/**
	 * 删除 用户信息
	 * @param userId
	 * @return
	 */
	boolean delById(String userId);

	/**
	 * 查询一个 用户信息
	 * @param userId
	 * @return
	 */
	EsmspUserInfo findById(String userId);

	/**
	 * 查询充值记录 通过外键ID
	 * @param userId
	 * @return
	 */
	List<EsmspUserRechargeRecord> findAllRecordById(String userId);

	/**
	 * 查询消费记录 通过外键ID
	 * @param userId
	 * @return
	 */
	List<EsmspUserRechargeDetail> findAllDetailById(String userId);

	/**
	 * 修改
	 * @param userinfo
	 * @return
	 */
	int uppUser(EsmspUserInfo userinfo);

}
