package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspIndexData;

public interface EsmspIndexDataMapper {
	int deleteByPrimaryKey(String id);

	int insert(EsmspIndexData record);

	int insertSelective(EsmspIndexData record);

	EsmspIndexData selectByPrimaryKey(String id);

	List<EsmspIndexData> selectByParam(@Param("type") String type,
			@Param("code") String code,@Param("flag") String flag,
			@Param("date") String date);

	int updateByPrimaryKeySelective(EsmspIndexData record);

	int updateByPrimaryKey(EsmspIndexData record);
}