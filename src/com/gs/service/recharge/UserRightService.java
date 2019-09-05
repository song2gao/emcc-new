package com.gs.service.recharge;

import java.util.List;

import com.gs.domain.EsmspUserInfo;
import com.gs.domain.EsmspUserRights;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年11月3日 上午10:06:31 描述： 预付费充值用户权限接口
 */
public interface UserRightService {

	/**
	 * 分页全查询用户权限信息
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	List<EsmspUserRights> findPageAll(int pageIndex, int pageSize);

	/**
	 * 查询总数
	 * 
	 * @return
	 */
	int finCount();

	/**
	 * 权限ID作为外键查询用户信息表
	 * @param parseInt
	 * @return
	 */
	List<EsmspUserInfo> findAllById(String parseInt);

	/**
	 * 权限添加
	 * @param right
	 * @return
	 */
	boolean saveRights(EsmspUserRights right);

	/**
	 * 权限修改
	 * @param right
	 * @return
	 */
	boolean uppRights(EsmspUserRights right);

}
