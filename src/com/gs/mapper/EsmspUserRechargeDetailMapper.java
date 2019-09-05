package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspUserRechargeDetail;

public interface EsmspUserRechargeDetailMapper {
    int deleteByPrimaryKey(String detailId);

    int insert(EsmspUserRechargeDetail record);

    int insertSelective(EsmspUserRechargeDetail record);

    EsmspUserRechargeDetail selectByPrimaryKey(String detailId);

    int updateByPrimaryKeySelective(EsmspUserRechargeDetail record);

    int updateByPrimaryKey(EsmspUserRechargeDetail record);
    
    /**
     * 查询消费记录 通过外键ID
     * @param parseInt
     * @return
     */
	List<EsmspUserRechargeDetail> selectByPK(@Param("parseInt")String parseInt);

	/**计算总数
	 * 
	 * @return
	 */
	int getCount();

	/**
	 * 分页查询
	 * @param pageSize
	 * @param i
	 * @return
	 */
	List<EsmspUserRechargeDetail> findPageAll(@Param("pageSize")int pageSize, @Param("pageBegin")int i);

	/**
	 * 条件查询
	 * @param search
	 * @param beforeDate
	 * @return
	 */
	List<EsmspUserRechargeDetail> searchAll(@Param("search")String search, @Param("beforeDate")String beforeDate);
}