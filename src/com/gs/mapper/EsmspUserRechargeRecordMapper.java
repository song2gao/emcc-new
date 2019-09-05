package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspUserRechargeRecord;

public interface EsmspUserRechargeRecordMapper {
	int deleteByPrimaryKey(String recordId);

	int insert(EsmspUserRechargeRecord record);

	int insertSelective(EsmspUserRechargeRecord record);

	EsmspUserRechargeRecord selectByPrimaryKey(String recordId);

	int updateByPrimaryKeySelective(EsmspUserRechargeRecord record);

	int updateByPrimaryKey(EsmspUserRechargeRecord record);

	/**
	 * 查询充值记录 通过外键ID
	 * 
	 * @param parseInt
	 * @return
	 */
	List<EsmspUserRechargeRecord> selectByPK(@Param("parseInt") String parseInt);

	/**
	 * 分页查询
	 * @param pageSize
	 * @param i
	 * @return
	 */
	List<EsmspUserRechargeRecord> findPageAll(@Param("pageSize")int pageSize, @Param("pageBegin")int i);

	/**
	 * 计算总数
	 * @return
	 */
	int getCount();

	/**
	 * 条件模糊查询
	 * @param search
	 * @param beforeDate
	 * @param alterDate
	 * @return
	 */
	List<EsmspUserRechargeRecord> searchAll(@Param("search")String search, @Param("beforeDate")String beforeDate, @Param("alterDate")String alterDate);
}