package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspSumMeasurSystemDay;

public interface EsmspSumMeasurSystemDayMapper {
	EsmspSumMeasurSystemDay selectByPrimaryKey(String id);

	EsmspSumMeasurSystemDay selectByCode(
			@Param("systemCode") String systemCode,
			@Param("euoCode") String euoCode,
			@Param("mmpCode") String mmpCode,
			@Param("date") String date);

	List<EsmspSumMeasurSystemDay> selectTop5();
}