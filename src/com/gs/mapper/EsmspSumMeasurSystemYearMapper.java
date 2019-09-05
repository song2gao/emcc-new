package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.EsmspSumMeasurSystemYear;

public interface EsmspSumMeasurSystemYearMapper {

	EsmspSumMeasurSystemYear selectByPrimaryKey(String id);

	EsmspSumMeasurSystemYear selectByCode(
			@Param("systemCode") String systemCode,
			@Param("euoCode") String euoCode,
			@Param("dateCode") String dateCode,
			@Param("mmpCOde") String mmpCode);

	List<EsmspSumMeasurSystemYear> selectTop5();
}