package com.gs.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.EsmspSumMeasurOrganizationDay;

public interface EsmspSumMeasurOrganizationDayMapper {
	EsmspSumMeasurOrganizationDay selectByPrimaryKey(Integer id);
	List<EsmspSumMeasurOrganizationDay> selectByCode(
			@Param("eusCode") String eusCode,
			@Param("euoCode") String euoCode,
			@Param("mmpCodes") String[] mmpCodes,
			@Param("date") String[] date);
	List<EsmspSumMeasurOrganizationDay> selectTop5();
	Double daySum(@Param("ctds")String[] ctds,@Param("mmpCode") String[] mmpCode,@Param("dateCode")String dateCode);
	List<EsmspSumMeasurOrganizationDay> dayHistory(@Param("ctds")String[] ctds,@Param("mmpCode") String[] mmpCode, @Param("dateCode") String dateCode);
	List<EsmspSumMeasurOrganizationDay> dayHistory2(@Param("ctds")String[] ctds,@Param("mmpCode") String[] mmpCode, @Param("dateCode") String dateCode);
	Double lyearSum(@Param("ctds") String ctds, @Param("mmpCodes")String[] mmpCode);
	List<Map<String, Object>> selectMonthTable(@Param("beginDate") String beginDate,
			@Param("beginPoint") int beginPoint,
			@Param("endDate") String endDate, @Param("endPoint") int endPoint,
			@Param("mmpCode") String mmpCode);
}