package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsEnergyUsingOrganization;

public interface PomsEnergyUsingOrganizationMapper {
	int deleteByPrimaryKey(String id);

	int insert(PomsEnergyUsingOrganization record);

	int insertSelective(PomsEnergyUsingOrganization record);

	PomsEnergyUsingOrganization selectByCode(@Param("euoCode")String euocode,@Param("euiCode") String euiCode);

	List<PomsEnergyUsingOrganization> selectByPId(@Param("pid") String pid);

	List<PomsEnergyUsingOrganization> selectByPIdAndType(@Param("pid") String pid,@Param("type") String type);
	
	int updateByPrimaryKeySelective(PomsEnergyUsingOrganization record);

	int updateByPrimaryKey(PomsEnergyUsingOrganization record);
}