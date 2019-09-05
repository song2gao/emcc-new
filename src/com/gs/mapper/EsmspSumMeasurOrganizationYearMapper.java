package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspSumMeasurOrganizationYear;

public interface EsmspSumMeasurOrganizationYearMapper {

	EsmspSumMeasurOrganizationYear selectByPrimaryKey(Integer id);
	List<EsmspSumMeasurOrganizationYear> selectByCode(
			@Param("eusCodes") String[] systemCode,
			@Param("mmpCode") String mmpCode,
			@Param("euoCode") String euoCode, 
			@Param("date") String[] date);
	List<EsmspSumMeasurOrganizationYear> selectTop5(@Param("date") String date);
	Double yearSum(@Param("ctds") String[] ctds,@Param("dateCode") String dateCode,@Param("mmpCode") String[] mmpCode);
}