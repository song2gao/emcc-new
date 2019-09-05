 package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspUserInfo;

public interface EsmspUserInfoMapper {
    int deleteByPrimaryKey(String userId);

    int insert(EsmspUserInfo record);

    int insertSelective(EsmspUserInfo record);

    EsmspUserInfo selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(EsmspUserInfo record);

    int updateByPrimaryKey(EsmspUserInfo record);
    
    /**
     * 分页查询
     * @param pageSize 
     * @param pageIndex 
     * @return
     */
	List<EsmspUserInfo> selectByAll(@Param("pageSize")int pageSize,@Param("pageBegin")int pageBegin);

	/**
	 * 查询总数
	 */
	int getCount();

	/**
	 * 条件查询 用户信息
	 * @param search
	 * @return
	 */
	List<EsmspUserInfo> findAllBySearch(@Param("search")String search);

	/**
	 * 权限ID作为外键查询用户信息表
	 * @param parseInt
	 * @return
	 */
	List<EsmspUserInfo> findByPK(@Param("parseInt")String parseInt);
}