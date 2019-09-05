package com.gs.service.impl.coolsystem;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Service;

import com.gs.common.util.DateUtils;
import com.gs.common.util.NumberUtils;
import com.gs.domain.CoolSystemIndex;
import com.gs.domain.DataTable;
import com.gs.domain.DayMonthYear;
import com.gs.domain.EsmspSumMeasurOrganizationDay;
import com.gs.domain.HistoryTableData;
import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.domain.PomsDeviceMeasurPoint;
import com.gs.domain.PomsEnergySystemParam;
import com.gs.domain.PomsEnergyUsingOrganization;
import com.gs.domain.PomsModleMeasurPoint;
import com.gs.mapper.EsmspSumMeasurOrganizationDayMapper;
import com.gs.mapper.EsmspSumMeasurOrganizationMonthMapper;
import com.gs.mapper.EsmspSumMeasurOrganizationYearMapper;
import com.gs.mapper.PomsCalculateTerminalDeviceMapper;
import com.gs.mapper.PomsDeviceMeasurPointMapper;
import com.gs.mapper.PomsEnergySystemParamMapper;
import com.gs.mapper.PomsModleMeasurPointMapper;
import com.gs.service.coolsystem.CoolSystemService;

/**
 * @author: gaosong
 * @date:2017-12-4 下午09:28:05
 * @version :1.0.0
 * 
 */
@Service
public class CoolSystemServiceImpl implements CoolSystemService {
	@Resource
	private PomsCalculateTerminalDeviceMapper ctdMapper;
	@Resource
	private EsmspSumMeasurOrganizationDayMapper dayMapper;
	@Resource
	private EsmspSumMeasurOrganizationMonthMapper monthMapper;
	@Resource
	private EsmspSumMeasurOrganizationYearMapper yearMapper;
	@Resource
	private PomsDeviceMeasurPointMapper pdmMapper;
	@Resource
	private PomsModleMeasurPointMapper pmmpMapper;
	@Resource
	private PomsEnergySystemParamMapper systemParamMapper;

	/**
	 * @Title: daySum @Description: TODO(这里用一句话描述这个方法的作用) @param @return 返回类型 @throws
	 */
	@Override
	public Double daySum(String[] ctds, String dateCode, String[] mmpCode) {
		Double r = null;
		if (dateCode
				.equals(new SimpleDateFormat("yyyyMMdd").format(new Date()))) {
			r = dayMapper.daySum(ctds, mmpCode, "");
		} else {
			r = dayMapper.daySum(ctds, mmpCode, dateCode);
		}
		if (r != null) {
			r = NumberUtils.NumberTwoDecimal(r);
		}
		return r;
	}

	/**
	 * @Title: monthSum @Description: TODO(这里用一句话描述这个方法的作用) @param @return 返回类型 @throws
	 */
	@Override
	public Double monthSum(String[] ctds, String dateCode, String[] mmpCode) {
		Double monthSum = monthMapper.monthSum(ctds, dateCode, mmpCode);
		if (monthSum != null) {
			monthSum = NumberUtils.NumberTwoDecimal(monthSum);
		}
		return monthSum;
	}

	/**
	 * @Title: yearSum @Description: TODO(这里用一句话描述这个方法的作用) @param @return 返回类型 @throws
	 */
	@Override
	public Double yearSum(String[] ctds, String dateCode, String[] mmpCode) {
		Double yearSum = yearMapper.yearSum(ctds, dateCode, mmpCode);
		if (yearSum != null) {
			yearSum = NumberUtils.NumberTwoDecimal(yearSum);
		}
		return yearSum;
	}

	/**
	 * @Title: yearSum @Description: TODO(这里用一句话描述这个方法的作用) @param @return 返回类型 @throws
	 */
	@Override
	public Double lyearSum(String ctds, String[] mmpCode) {
		Double yearSum = dayMapper.lyearSum(ctds, mmpCode);
		if (yearSum != null) {
			yearSum = NumberUtils.NumberTwoDecimal(yearSum);
		}
		return yearSum;
	}

	/**
	 * @Title: getCtdsByType @Description: TODO(这里用一句话描述这个方法的作用) @param @return
	 *         返回类型 @throws
	 */
	@Override
	public String[] getCtdsByType(String energyType, String flag) {
		return ctdMapper.findByEnergyType(new String[] { energyType }, flag);
	}

	/***
	 * @Title: getCoolSystemIndex @Description: TODO(这里用一句话描述这个方法的作用) @param @return
	 *         返回类型 @throws
	 */
	@Override
	public List<CoolSystemIndex> getCoolSystemIndex(String[] energyTypes,
			String flag) {
		List<CoolSystemIndex> list = new ArrayList<CoolSystemIndex>();
		Date date = new Date();
		String day = new SimpleDateFormat("yyyyMMdd").format(date);
		String month = new SimpleDateFormat("yyyyMM").format(date);
		String year = new SimpleDateFormat("yyyy").format(date);
		for (String s : energyTypes) {
			String[] mmpCode = new String[] { "31" };
			if (s.equals("1")) {
				mmpCode = new String[] { "31" };
			} else if (s.equals("2")) {
				mmpCode = new String[] { "64" };
			} else if (s.equals("5")) {
				mmpCode = new String[] { "66", "65" };
			}else if(s.equals("6")){
				mmpCode=new String[]{"1031"};
			}
			String[] ctds = getCtdsByType(s, flag);
			Double daySum = daySum(ctds, day, mmpCode);
			Double monthSum = monthSum(ctds, month, mmpCode);
			Double yearSum = yearSum(ctds, year, mmpCode);
			daySum = daySum == null ? 0 : daySum;
			monthSum = monthSum == null ? 0 : monthSum;
			yearSum = yearSum == null ? 0 : yearSum;
			CoolSystemIndex cool = new CoolSystemIndex();
			cool.setEnergyType(s);
			cool.setDaySum(daySum);
			cool.setMonthSum(NumberUtils.NumberTwoDecimal(monthSum + daySum));
			cool.setYearSum(NumberUtils.NumberTwoDecimal(yearSum + monthSum
					+ daySum));
			list.add(cool);
		}
		return list;
	}

	public List<DayMonthYear> getDayMonthYear(String energyType,
			String[] mmpCode, String ctdCode, String flag, String dateCode) {
		List<DayMonthYear> list = new ArrayList<DayMonthYear>();
		String ctdName = "";
		Double daySum = 0d;
		Double lastDaySum = 0d;
		Double monthSum = 0d;
		Double lastMonthSum = 0d;
		Double yearSum = 0d;
		Double lastYearSum = 0d;
		String unit = "kWh";
		if(energyType.equals("1")){
			unit="kWh";
		}else if(energyType.equals("2")){
			unit="吨";
		}else{
			unit="GJ";
		}
		Double lyearSum = 0d;
		String[] ctds;
		if (flag.equals("0")) {
			ctdName = ctdMapper.selectByCode(ctdCode).getCdtTerminalName();
			ctds = new String[] { ctdCode };
		} else if (flag.equals("1")) {
			ctdName = "东站";
			ctds = getCtdsByType(energyType, flag);
		} else if (flag.equals("2")) {
			ctdName = "西站";
			ctds = getCtdsByType(energyType, flag);
		} else {
			ctdName = "热力站总";
			ctds = getCtdsByType(energyType, flag);
		}
		String d = dateCode;
		String m = dateCode.substring(0, 6);
		String y = dateCode.substring(0, 4);
		Date date=new Date();
		String currentm=new SimpleDateFormat("yyyyMM").format(date);
		String currentd=new SimpleDateFormat("yyyyMMdd").format(date);
		daySum = daySum(ctds, d, mmpCode);
		monthSum = monthSum(ctds, m, mmpCode);
		yearSum = yearSum(ctds, y, mmpCode);
		if (ctds.length == 1) {
			lyearSum = lyearSum(ctds[0], mmpCode);
		}
		daySum = daySum == null ? 0 : daySum;
		monthSum = monthSum == null ? 0 : monthSum;
		yearSum = yearSum == null ? 0 : yearSum;
		if(d.equals(currentd)){
			monthSum=monthSum+daySum;
		}
		if(m.equals(currentm)){
			yearSum=yearSum+monthSum;
		}
		DayMonthYear day = new DayMonthYear();
		day.setCtdName(ctdName);
		day.setRoundName("日累计");
		day.setDateCode(d);
		day.setValue(daySum + "");
		day.setUnit(unit);
		day.setLastValue(lastDaySum + "");
		list.add(day);
		DayMonthYear month = new DayMonthYear();
		month.setCtdName(ctdName);
		month.setRoundName("月累计");
		month.setDateCode(m);
		month.setUnit(unit);
		month.setValue(NumberUtils.NumberTwoDecimal(monthSum)+"");
		month.setLastValue(lastMonthSum + "");
		list.add(month);
		DayMonthYear year = new DayMonthYear();
		year.setCtdName(ctdName);
		year.setRoundName("年累计");
		year.setDateCode(y);
		year.setUnit(unit);
		year.setValue(NumberUtils.NumberTwoDecimal(yearSum)
				+ "");
		year.setLastValue(lastYearSum + "");
		list.add(year);
		DayMonthYear lyear = new DayMonthYear();
		lyear.setCtdName(ctdName);
		lyear.setRoundName("常年累计");
		lyear.setDateCode("-");
		lyear.setUnit(unit);
		if (ctds.length == 1) {
			lyear.setValue(lyearSum + "");
		} else {
			lyear.setValue("-");
		}
		lyear.setLastValue("-");
		list.add(lyear);
		return list;
	}

	public JSONArray getTree(String id, String energyType, String type) {
		// TODO Auto-generated method stub
		JSONArray js = new JSONArray();
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		if (id.equals("0")) {
			sb.append("{");
			sb
					.append("\"id\":\"1\",\"text\":\"东站\",\"state\":\"closed\",\"attributes\":{\"type\":"
							+ "\""
							+ type
							+ "\",\"eid\":\"1\""
							+ ",\"ename\":\"" + "" + "\"}");
			sb.append("},{");
			sb
					.append("\"id\":\"2\",\"text\":\"西站\",\"state\":\"closed\",\"attributes\":{\"type\":"
							+ "\""
							+ type
							+ "\",\"eid\":\"2\""
							+ ",\"ename\":\"" + "" + "\"}}");
		} else {
			List<PomsCalculateTerminalDevice> list = new ArrayList<PomsCalculateTerminalDevice>();
			list = ctdMapper.findAllByEnergyType(energyType, type);
			for (int i = 0; i < list.size(); i++) {
				boolean test = true;
				String state = "";
				sb.append("{");
				sb.append("\"id\":\"" + list.get(i).getCtdCodes()
						+ "\",\"text\":\"" + list.get(i).getCdtTerminalName()
						+ "\",\"state\":\"" + state
						+ "\",\"attributes\":{\"type\":" + "\""
						+ list.get(i).getPclcEnergyType() + "\",\"eid\":\"0\""
						+ ",\"ename\":\"" + "" + "\"}");
				if (!test) {
					sb.append(",\"iconCls\":\"tree-file\"");
				}
				if (i == list.size() - 1) {
					sb.append("}");
				} else {
					sb.append("},");
				}
			}
		}
		sb.append("]");
		js = JSONArray.fromObject(sb.toString());
		return js;
	}

	/**
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws NumberFormatException
	 * @throws SecurityException
	 * @throws NoSuchMethodException
	 * @throws ParseException
	 * @Title: getHistoryData @Description: TODO(这里用一句话描述这个方法的作用) @param @return
	 *         返回类型 @throws
	 */
	@Override
	public List<HistoryTableData> getHistoryData(String type, String flag,
			String dateCode, String timeCode) throws ParseException,
			NoSuchMethodException, SecurityException, NumberFormatException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		String name = "东站%";
		// String[] mmpCode=null;
		// if(flag.equals("1")){
		// mmpCode=new String[]{"31"};
		// }else if(flag.equals("2")){
		// mmpCode=new String[]{"64"};
		// }else if(flag.equals("3")){
		// mmpCode=new String[]{"14","15"};
		// }else if(flag.equals("5")){
		// mmpCode=new String[]{"65","66"};
		// }
		int point = DateUtils.getTimeOfPointNumberInDay(timeCode);
		if (type.equals("1")) {
			name = "东站%";
		} else {
			name = "西站%";
		}
		String[] ctds = ctdMapper.findByEnergyType(flag.split(","), type);
		String now = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String selDate = null;
		if (point == 0) {
			selDate = DateUtils.getLastDayOfDate(
					DateUtils.stringToDate(dateCode)).replaceAll("-", "");
			point = 96;
		} else {
			selDate = dateCode.replaceAll("-", "");
		}

		if (selDate.equals(now)) {
			selDate = null;
		}
		List<EsmspSumMeasurOrganizationDay> list = dayMapper.dayHistory(ctds,
				null, selDate);
		List<HistoryTableData> tbs = new ArrayList<HistoryTableData>();
		Class<EsmspSumMeasurOrganizationDay> c = EsmspSumMeasurOrganizationDay.class;

		Method m = c.getDeclaredMethod("getPoint" + point);
		for (EsmspSumMeasurOrganizationDay day : list) {
			if (!day.getMmpCode().equals("31")
					&& !day.getMmpCode().equals("64")) {
				HistoryTableData tb = new HistoryTableData();
				String ctdName = ctdMapper.selectByCode(day.getEusCode())
						.getCdtTerminalName();
				tb.setDateCode(dateCode);
				Double calValue = Double.parseDouble(m.invoke(day).toString());
				Double value = NumberUtils.NumberTwoDecimal(calValue
						- day.getPoint1().doubleValue());
				tb.setCalValue(calValue);
				if (!(day.getMmpCode().equals("31_") || day.getMmpCode()
						.equals("64_"))) {
					tb.setSumValue(0);
				} else {
					tb.setSumValue(value);
				}
				tb.setTimeCode(timeCode);
				PomsDeviceMeasurPoint p = pdmMapper.selectByCalMmpCode(day
						.getEusCode(), day.getMmpCode().replaceAll("_", ""));
				String unit = p.getMmpUnits();
				tb.setUnit(unit);
				tb.setCtdName(ctdName);
				tb.setMmpName(p.getMmpNames());
				tbs.add(tb);
			}
		}
		return tbs;
	}

	@Override
	public List<HistoryTableData> getPointData(String flag, String date)
			throws ParseException, NoSuchMethodException, SecurityException,
			NumberFormatException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {

		int point = 96;
		date = "20171210";
		String now = new SimpleDateFormat("yyyyMMdd").format(new Date());

		String[] ctds = ctdMapper.findByEnergyType(flag.split(","));
		List<EsmspSumMeasurOrganizationDay> list = dayMapper.dayHistory2(ctds,
				null, date);
		List<HistoryTableData> tbs = new ArrayList<HistoryTableData>();
		Class<EsmspSumMeasurOrganizationDay> c = EsmspSumMeasurOrganizationDay.class;
		Method m = c.getDeclaredMethod("getPoint" + point);
		for (EsmspSumMeasurOrganizationDay day : list) {
			if (!day.getMmpCode().equals("31")
					&& !day.getMmpCode().equals("64")) {
				HistoryTableData tb = new HistoryTableData();
				String ctdName = ctdMapper.selectByCode(day.getEusCode())
						.getCdtTerminalName();
				tb.setDateCode(date);
				Double calValue = Double.parseDouble(m.invoke(day).toString());
				Double value = NumberUtils.NumberTwoDecimal(calValue
						- day.getPoint1().doubleValue());
				tb.setCalValue(calValue);
				if (!(day.getMmpCode().equals("31_") || day.getMmpCode()
						.equals("64_"))) {
					tb.setSumValue(0);
				} else {
					tb.setSumValue(value);
				}
				tb.setTimeCode(date);
				String eus = day.getEusCode();
				String all = day.getMmpCode().replaceAll("_", "");

				PomsDeviceMeasurPoint p = pdmMapper
						.selectByCalMmpCode(eus, all);
				String unit = p.getMmpUnits();
				tb.setUnit(unit);
				tb.setCtdName(ctdName);
				tb.setMmpName(p.getMmpNames());
				tbs.add(tb);
			}
		}

		return tbs;
	}

	@Override
	/**   
	 * @Title: getDataTable   
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param       
	 * @return    返回类型   
	 * @throws   
	 */
	public List<DataTable> getDataTable(String energyType, String mmpCode,
			String begindate, String begintime, String enddate, String endtime,
			String type) throws NumberFormatException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			ParseException, NoSuchMethodException, SecurityException {
		String[] ctds = ctdMapper.findByEnergyType(energyType.split(","), type);
		String now = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String beginDate = null;
		String endDate = null;
		int beginpoint = DateUtils.getTimeOfPointNumberInDay(begintime);
		int endpoint = DateUtils.getTimeOfPointNumberInDay(endtime);
		if (beginpoint == 0) {
			beginDate = DateUtils.getLastDayOfDate(
					DateUtils.stringToDate(begindate)).replaceAll("-", "");
			beginpoint = 96;
		} else {
			beginDate = begindate.replaceAll("-", "");
		}
		if (endpoint == 0) {
			endDate = DateUtils.getLastDayOfDate(
					DateUtils.stringToDate(enddate)).replaceAll("-", "");
			endpoint = 96;
		} else {
			endDate = enddate.replaceAll("-", "");
		}
		if (beginDate.equals(now)) {
			beginDate = null;
		}
		if (endDate.equals(now)) {
			endDate = null;
		}
		List<EsmspSumMeasurOrganizationDay> beginlist = dayMapper.dayHistory(
				ctds, new String[] { mmpCode }, beginDate);
		List<EsmspSumMeasurOrganizationDay> endlist = dayMapper.dayHistory(
				ctds, new String[] { mmpCode }, endDate);
		Class<EsmspSumMeasurOrganizationDay> c = EsmspSumMeasurOrganizationDay.class;
		Method m = c.getDeclaredMethod("getPoint" + beginpoint);
		Method endm = c.getDeclaredMethod("getPoint" + endpoint);
		List<DataTable> list = new ArrayList<DataTable>();
		Double sumValue = 0d;
		for (EsmspSumMeasurOrganizationDay day : beginlist) {
			if (day.getMmpCode().indexOf("_") > 0) {
				DataTable table = new DataTable();
				String ctdName = ctdMapper.selectByCode(day.getEusCode())
						.getCdtTerminalName();
				Double beginValue = Double
						.parseDouble(m.invoke(day).toString());
				Double endValue = 0d;
				for (EsmspSumMeasurOrganizationDay d : endlist) {
					if (d.getEusCode().equals(day.getEusCode())
							&& d.getMmpCode().equals(day.getMmpCode())) {
						endValue = Double
								.parseDouble(endm.invoke(d).toString());
						break;
					}
				}
				PomsDeviceMeasurPoint p = pdmMapper.selectByCalMmpCode(day
						.getEusCode(), day.getMmpCode().replaceAll("_", ""));
				String unit = p.getMmpUnits();
				table.setCtdCode(day.getEusCode());
				table.setCtdName(ctdName);
				table.setBeginDate(begindate);
				table.setBeginValue(beginValue);
				table.setEndDate(enddate);
				table.setEndValue(endValue);
				Double value = NumberUtils.NumberTwoDecimal(endValue
						- beginValue);
				table.setValue(value);
				table.setUnit(unit);
				list.add(table);
				sumValue = NumberUtils.NumberTwoDecimal((sumValue + value));
			}
		}
		DataTable dataTable = new DataTable();
		String ctdName = "东站总";
		String unit = "kWh";
		if (type.equals("1")) {
			ctdName = "东站总";
		} else {
			ctdName = "西站总";
		}
		if (energyType.equals("1")) {
			unit = "kWh";
		} else {
			unit = "吨";
		}
		dataTable.setCtdName(ctdName);
		dataTable.setBeginDate(begindate);
		dataTable.setBeginValue(0d);
		dataTable.setEndDate(enddate);
		dataTable.setEndValue(0d);
		dataTable.setValue(sumValue);
		dataTable.setUnit(unit);
		list.add(dataTable);
		return list;
	}

	/**
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws NumberFormatException
	 * @throws SecurityException
	 * @throws NoSuchMethodException
	 * @throws ParseException
	 * @Title: getHistoryData
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	@Override
	public List<HistoryTableData> getNewTableData(String type, String dateCode,
			String timeCode) throws ParseException, NoSuchMethodException,
			SecurityException, NumberFormatException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		int point = DateUtils.getTimeOfPointNumberInDay(timeCode);
		String[] ctds = ctdMapper.findTerType(type.split(","));
		String now = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String selDate = null;
		String lastDate = null;
		if (point == 0) {
			selDate = DateUtils.getLastDayOfDate(
					DateUtils.stringToDate(dateCode)).replaceAll("-", "");
			point = 96;
		} else {
			selDate = dateCode.replaceAll("-", "");
		}
		lastDate = DateUtils.getLastDayOfDate(DateUtils.stringToDate(dateCode))
				.replaceAll("-", "");
		if (selDate.equals(now)) {
			selDate = null;
		}
		List<EsmspSumMeasurOrganizationDay> list = dayMapper.dayHistory(ctds,
				null, selDate);
		List<EsmspSumMeasurOrganizationDay> lastlist = dayMapper.dayHistory(
				ctds, null, lastDate);
		List<HistoryTableData> tbs = new ArrayList<HistoryTableData>();
		Class<EsmspSumMeasurOrganizationDay> c = EsmspSumMeasurOrganizationDay.class;
		Method m = c.getDeclaredMethod("getPoint" + point);
		for (EsmspSumMeasurOrganizationDay day : list) {
			if (!day.getMmpCode().equals("31")
					&& !day.getMmpCode().equals("64")) {
				HistoryTableData tb = new HistoryTableData();
				String ctdName = ctdMapper.selectByCode(day.getEusCode())
						.getCdtTerminalName();
				tb.setDateCode(dateCode);
				Double calValue = Double.parseDouble(m.invoke(day).toString());
				Double point0Value = 0d;
				for (EsmspSumMeasurOrganizationDay d : lastlist) {
					if (d.getEusCode().equals(day.getEusCode())
							&& d.getMmpCode().equals(d.getMmpCode())) {
						point0Value = NumberUtils.NumberTwoDecimal(calValue
								- d.getPoint96().doubleValue());
					}
				}
				tb.setCalValue(calValue);
				if (!(day.getMmpCode().equals("31_")
						|| day.getMmpCode().equals("64_")
						|| day.getMmpCode().equals("65_") || day.getMmpCode()
						.equals("66_"))) {
					tb.setSumValue(0);
				} else {
					tb.setSumValue(point0Value);
				}
				tb.setTimeCode(timeCode);
				PomsDeviceMeasurPoint p = pdmMapper.selectByCalMmpCode(day
						.getEusCode(), day.getMmpCode().replaceAll("_", ""));
				String unit = p.getMmpUnits();
				tb.setUnit(unit);
				tb.setCtdName(ctdName);
				tb.setMmpName(p.getMmpNames());
				tbs.add(tb);
			}
		}
		return tbs;
	}

	@Override
	/**   
	 * @Title: getModelPointByCtmId   
	 * @Description: TODO(这里用一句话描述这个方法的作用)   
	 * @param       
	 * @return    返回类型   
	 * @throws   
	 */
	public JSONObject getModelPointByCtmId(String ctmId) {
		List<PomsModleMeasurPoint> list = pmmpMapper.findByCtmId(ctmId);
		JSONObject json = new JSONObject();
		json.put("points", list);
		return json;
	}

	/**
	 * @Title: getHistoryCustomMade
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	@Override
	public JSONObject getHistoryCustomMade(String systemCode, String dateCode) {
		List<PomsEnergySystemParam> params = systemParamMapper
				.selectBySystemCode(systemCode);
		Map<String, List<String>> map = new LinkedHashMap<String, List<String>>();
		Class<EsmspSumMeasurOrganizationDay> c = EsmspSumMeasurOrganizationDay.class;
		String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
		for (PomsEnergySystemParam param : params) {
			String[] ctdCodes = param.getEspCtdCode().split(",");
			String[] mmpCodes = param.getEspMmpCode().split(",");
			// if (!(ctdCodes[0].equals("0") || mmpCodes[0].equals("0"))) {
			List<EsmspSumMeasurOrganizationDay> days = dayMapper
					.dayHistory(ctdCodes, mmpCodes,
							dateCode.equals(date) ? null : dateCode);
			EsmspSumMeasurOrganizationDay day = null;
			if (days.size() == 1) {
				day = days.get(0);
			}
			Double sumValue = 0d;
			for (int i = 4; i < 97; i++) {
				try {
					Double value = 0d;
					if (day != null) {
						String mmpCode = day.getMmpCode();
						if (mmpCode.equals("31") || mmpCode.equals("64")
								|| mmpCode.equals("65") || mmpCode.equals("66")) {
							Method m = c.getDeclaredMethod("getPoint" + i);
							value = Double
									.parseDouble(m.invoke(day).toString());
							sumValue += value;
							if (i == 4) {
								sumValue = 0d;
							}
						} else {
							if (i % 4 == 0) {
								Method m = c.getDeclaredMethod("getPoint" + i);
								value = Double.parseDouble(m.invoke(day)
										.toString());
								sumValue = value;
							}
						}
					}
					if (i % 4 == 0) {
						String key = i / 4 + ":00";
						sumValue = NumberUtils.NumberTwoDecimal(sumValue);
						if (map.containsKey(key)) {
							List<String> outParams = map.get(key);
							if (day == null) {
								outParams.add("");
							} else {
								outParams.add(sumValue + "");
							}
						} else {
							List<String> outParams = new ArrayList<String>();
							outParams.add(key);
							if (day == null) {
								outParams.add("");
							} else {
								outParams.add(sumValue + "");
							}
							map.put(key, outParams);
						}
						sumValue = 0d;
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		// }
		JSONObject json = new JSONObject();
		json.put("list", map.values());
		return json;
	}
	@Override
	public JSONObject getAllCtds(){
		JSONObject json=new JSONObject();
		List<PomsCalculateTerminalDevice> ctds=ctdMapper.findAllByEnergyType(null, null);
		json.put("list", ctds);
		return json;
	}
}
