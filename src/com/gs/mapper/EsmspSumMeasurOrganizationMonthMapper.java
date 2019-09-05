package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspSumMeasurOrganizationMonth;

public interface EsmspSumMeasurOrganizationMonthMapper {
    EsmspSumMeasurOrganizationMonth selectByPrimaryKey(Integer id);
    List<EsmspSumMeasurOrganizationMonth> selectByCode(
			@Param("eusCodes") String[] systemCode,
			@Param("mmpCode")String mmpCode,
			@Param("euoCode") String euoCode,
			@Param("date") String[] date);
	List<EsmspSumMeasurOrganizationMonth> selectTop5(@Param("date")String date);
	Double monthSum(@Param("ctds")String[] ctds,@Param("dateCode") String dateCode,@Param("mmpCode") String[] mmpCode);
}