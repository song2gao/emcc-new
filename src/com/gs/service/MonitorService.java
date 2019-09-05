package com.gs.service;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.gs.domain.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gs.fusioncharts.ChartXTData;

public interface MonitorService {
	/**
	 * 得到年用能趋势
	 * @param type 分项类型
	 * @param code 分项编码
	 * @param mmpCode 测点
	 * @param date 日期
	 * @return
	 */
	List<EsmspSumMeasurOrganizationYear> getYearAndLastYear(String type,String code,
			String mmpCode,String date[]);

	List<EsmspSumMeasurOrganizationDay> getOrganizationDayByCode(String type,String code,
			String[] mmpCodes, String[] dateCode);
	/**
	 * 得到日曲线 
	 * @param type 分项类型
	 * @param code 分项编码
	 * @param mmpName 测点名称 
	 * @param dateCode 日期
	 * @return
	 */
	List<EsmspSumMeasurOrganizationDay> getOrganizationDayBymmpName(String type,String code,
			String mmpName, String[] dateCode);
	/***
	 * 得到月能耗集合
	 * @param code 用能组织编码
	 * @param date 日期编码
	 * @param type 分项类型
	 * @return
	 */
	List<EsmspSumMeasurOrganizationMonth> getOrganizationMonthByCode(String type,
			String code,String mmpCode, String[] date);

	List<EsmspSumMeasurOrganizationDay> getOrganizationDayTop5();

	List<EsmspSumMeasurOrganizationMonth> getOrganizationMonthTop5(String date);

	List<EsmspSumMeasurOrganizationYear> getOrganizationYearTop5(String date);

	/**
	 * 得到年趋势
	 * @param type 分项类型
	 * @param code 分项编码
	 * @param mmpCode 测点编码
	 * @param dateCode 日期
	 * @return
	 */
	ChartXTData getYearColumn(String type,String code,String mmpCode, String dateCode);

	List<EsmspSumMeasurOrganizationMonth> getMonthByPCode(String code,String mmpCode,
			String date);

	List<EsmspSumMeasurOrganizationYear> getYearByPCode(String code, String mmpCode,String date);

	ChartXTData getYearPie(String code,String mmpCode, String dateCode);
	/**
	 * 能耗排名
	 * @param type分项类型
	 * @param code分项编码
	 * @param mmpCode测点编码
	 * @param dateCode日期
	 * @return
	 */
	ChartXTData getYearBar(String code,String mmpCode, String dateCode);
	/**
	 * 得到月能耗趋势
	 * @param type 分项类型
	 * @param code 分项编码
	 * @param mmpCode 测点编码
	 * @param dateCode 日期
	 * @return
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	ChartXTData getMonthAreaBar(String type,String code,String mmpCode, String dateCode) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException;

	JSONArray getTree(String id, String type);

	ChartXTData getMonthPie(String code,String mmpCode, String dateCOde);

	ChartXTData getMonthGauges(String type,String code,String mmpCode, String dateCode,String dateType);
	/**
	 * 根据分项类型、分项编码得到日、月、年能耗
	 * @param type分项类型
	 * @param eusCode分项编码
	 * @param mmpCode 测点编码
	 * @return
	 */
	JSONObject getYearMonthDayData(String type,String eusCode,String mmpCode);

	ChartXTData getDayLine(List<EsmspSumMeasurOrganizationDay> list);
	/**
	 * 得到日曲线集合
	 * @param type 分项类型
	 * @param eusCode 分项编码
	 * @param mmpName 测点名称 
	 * @param dateCode 日期
	 * @return
	 */
	List<EsmspSumMeasurOrganizationDay> getDayList(String type,String eusCode, String mmpName,
			String dateCode);

	Map<String, Object> getPieData(Map<String, BigDecimal> map, String code);

	ChartXTData getMonthPieNew(int type);
	
	List<Object[]> getDataTable(String mmpCode,String begindate,String begintime,String enddate,String endtime) throws NumberFormatException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, ParseException, NoSuchMethodException, SecurityException;

	List<DataTable> getDataTable(String energyType, String mmpCode,
			String begindate, String begintime, String enddate, String endtime,
			String type) throws NumberFormatException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			ParseException, NoSuchMethodException, SecurityException;
	List<PomsEnergyUsingLocation> getOrganizationList(String pid);
    List<PomsEnergyUsingSystem> getSystemList(String pid,String level);
}

