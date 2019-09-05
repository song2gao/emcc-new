package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspUserRights;

public interface EsmspUserRightsMapper {
    int deleteByPrimaryKey(String rightsId);

    int insert(EsmspUserRights record);

    int insertSelective(EsmspUserRights record);

    EsmspUserRights selectByPrimaryKey(String rightsId);

    int updateByPrimaryKeySelective(EsmspUserRights record);

    int updateByPrimaryKey(EsmspUserRights record);

    /**
	 * 分页全查询用户权限信息
     * @param pageSize
     * @param i
     * @return
     */
	List<EsmspUserRights> findPageAll(@Param("pageSize")int pageSize, @Param("pageBegin")int pageBegin);

	/**
	 * 查询用户权限总数
	 */
	int getCount();
}