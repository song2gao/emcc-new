package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspSumMeasurSystemMonth;

public interface EsmspSumMeasurSystemMonthMapper {
	EsmspSumMeasurSystemMonth selectByPrimaryKey(String id);

	EsmspSumMeasurSystemMonth selectByCode(
			@Param("systemCode") String systemCode,
			@Param("euoCode") String euoCode, 
			@Param("mmpCode") String mmpCode,
			@Param("date") String date);

	List<EsmspSumMeasurSystemMonth> selectTop5();
}