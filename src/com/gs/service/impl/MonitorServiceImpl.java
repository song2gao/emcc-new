package com.gs.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.gs.domain.*;
import com.gs.mapper.*;
import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.common.util.Constants;
import com.gs.common.util.DateUtils;
import com.gs.common.util.NumberUtils;
import com.gs.fusioncharts.ChartXTData;
import com.gs.service.MonitorService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional
public class MonitorServiceImpl implements MonitorService {
	@Resource
	public EsmspSumMeasurOrganizationDayMapper organizationDay;
	@Resource
	public EsmspSumMeasurOrganizationMonthMapper organizationMonth;
	@Resource
	public EsmspSumMeasurOrganizationYearMapper organizationYear;
	@Resource
	public EsmspIndexDataMapper indexData;
	@Resource
	public PomsEnergyUsingOrganizationMapper pomsOrganization;
    @Resource
    public PomsEnergyUsingLocationMapper locationMapper;
    @Resource
    public PomsEnergyUsingSystemMapper systemMapper;
	@Resource
	public PomsCodeManagementMapper codeManagement;
	@Resource
	public PomsCalculateTerminalDeviceMapper calculateTerminalDeviceMapper;
	@Resource
	private PomsDeviceMeasurPointMapper pdmMapper;
	@Resource
	// 计量表计与用能分项关联
	private PomsConsumeEnergyTerminalRefMapper pctRefMapper;

	public List<EsmspSumMeasurOrganizationYear> getYearAndLastYear(String type,
			String code, String mmpCode, String dateCode[]) {
		// TODO Auto-generated method stub
		String[] ctds = pctRefMapper.selectCtdsByTypeAndCode(type, code);
		List<EsmspSumMeasurOrganizationYear> yearlist = organizationYear
				.selectByCode(ctds, mmpCode, Constants.euiCode, dateCode);
		for (EsmspSumMeasurOrganizationYear year : yearlist) {
			year.setEusName(pomsOrganization.selectByCode(year.getEusCode(),
					Constants.euiCode).getEuoNames());
		}
		return yearlist;
	}

	/**
	 * 
	 * @param type
	 *            分项类型
	 * @param code
	 *            分项编码
	 * @param mmpCode
	 *            测点编码
	 * @param dateCode
	 *            日期
	 * @return
	 */
	public ChartXTData getYearColumn(String type, String code, String mmpCode,
			String dateCode) {
		ChartXTData data = new ChartXTData();
		List<EsmspSumMeasurOrganizationYear> list = getYearAndLastYear(type,
				code, mmpCode, new String[] { dateCode,
						DateUtils.getLastYear(dateCode) });
		String[] cate = new String[] { "1月", "2月", "3月", "4月", "5月", "6月",
				"7月", "8月", "9月", "10月", "11月", "12月" };
		String lastyearStr = DateUtils.getLastYear(dateCode);
		String[] seriesName = new String[] { dateCode, lastyearStr, "指标" };
		BigDecimal[] thisYear = new BigDecimal[] { new BigDecimal(0d),
				new BigDecimal(0d), new BigDecimal(0d), new BigDecimal(0d),
				new BigDecimal(0d), new BigDecimal(0d), new BigDecimal(0d),
				new BigDecimal(0d), new BigDecimal(0d), new BigDecimal(0d),
				new BigDecimal(0d), new BigDecimal(0d) };
		BigDecimal[] lastYear = new BigDecimal[] { new BigDecimal(0d),
				new BigDecimal(0d), new BigDecimal(0d), new BigDecimal(0d),
				new BigDecimal(0d), new BigDecimal(0d), new BigDecimal(0d),
				new BigDecimal(0d), new BigDecimal(0d), new BigDecimal(0d),
				new BigDecimal(0d), new BigDecimal(0d) };
		String[] index = new String[12];
		for (int i = 0; i < list.size(); i++) {
			EsmspSumMeasurOrganizationYear year = list.get(i);
			if (year.getDateCode().equals(dateCode)) {
				thisYear[0] = thisYear[0].add(year.getPoint1());
				thisYear[1] = thisYear[1].add(year.getPoint2());
				thisYear[2] = thisYear[2].add(year.getPoint3());
				thisYear[3] = thisYear[3].add(year.getPoint4());
				thisYear[4] = thisYear[4].add(year.getPoint5());
				thisYear[5] = thisYear[5].add(year.getPoint6());
				thisYear[6] = thisYear[6].add(year.getPoint7());
				thisYear[7] = thisYear[7].add(year.getPoint8());
				thisYear[8] = thisYear[8].add(year.getPoint9());
				thisYear[9] = thisYear[9].add(year.getPoint10());
				thisYear[10] = thisYear[10].add(year.getPoint11());
				thisYear[11] = thisYear[11].add(year.getPoint12());
			} else if (year.getDateCode().equals(lastyearStr)) {
				lastYear[0] = lastYear[0].add(year.getPoint1());
				lastYear[1] = lastYear[1].add(year.getPoint2());
				lastYear[2] = lastYear[2].add(year.getPoint3());
				lastYear[3] = lastYear[3].add(year.getPoint4());
				lastYear[4] = lastYear[4].add(year.getPoint5());
				lastYear[5] = lastYear[5].add(year.getPoint6());
				lastYear[6] = lastYear[6].add(year.getPoint7());
				lastYear[7] = lastYear[7].add(year.getPoint8());
				lastYear[8] = lastYear[8].add(year.getPoint9());
				lastYear[9] = lastYear[9].add(year.getPoint10());
				lastYear[10] = lastYear[10].add(year.getPoint11());
				lastYear[11] = lastYear[11].add(year.getPoint12());
			}
		}
		for (int i = 0; i < 12; i++) {
			index[i] = "0";
		}
		List<EsmspIndexData> indexs = indexData.selectByParam("2", code, "2",
				dateCode);
		for (EsmspIndexData myindex : indexs) {
			int date = Integer.parseInt(myindex.getIndexDate().substring(4));
			index[date - 1] = myindex.getTargetValue() + "";
		}
		String[][] dataValue = new String[12][seriesName.length];
		for (int i = 0; i < 12; i++) {
			dataValue[i][0] = thisYear[i].setScale(2, BigDecimal.ROUND_HALF_UP)
					.toString();
			dataValue[i][1] = lastYear[i].setScale(2, BigDecimal.ROUND_HALF_UP)
					.toString();
			dataValue[i][2] = index[i];
		}
		data.setCaption("年能耗趋势（kWh）");
		// 图标上是否显示数据 0 为不显示，1 显示
		data.setShowValues("1");
		data.setBgColor("2c3240");
		data.setCanvasBgColor("2c3240");
		data.setData(cate, seriesName, dataValue);
		return data;
	}

	public List<EsmspSumMeasurOrganizationDay> getOrganizationDayByCode(
			String type, String code, String[] mmpCodes, String dateCode[]) {
		// TODO Auto-generated method stub
		List<EsmspSumMeasurOrganizationDay> list = organizationDay
				.selectByCode(code, Constants.euiCode, mmpCodes, dateCode);
		for (EsmspSumMeasurOrganizationDay day : list) {
			PomsEnergyUsingOrganization organization = pomsOrganization
					.selectByCode(day.getEusCode(), Constants.euiCode);
			day.setEusName(organization.getEuoNames());
		}
		return list;
	}

	public List<EsmspSumMeasurOrganizationMonth> getOrganizationMonthByCode(
			String type, String code, String mmpCode, String dateCode[]) {
		// TODO Auto-generated method stub
		String[] ctds = pctRefMapper.selectCtdsByTypeAndCode(type, code);
		List<EsmspSumMeasurOrganizationMonth> list = organizationMonth
				.selectByCode(ctds, mmpCode, Constants.euiCode, dateCode);
		for (EsmspSumMeasurOrganizationMonth month : list) {
			month.setEusName(pomsOrganization.selectByCode(month.getEusCode(),
					Constants.euiCode).getEuoNames());
		}
		return list;
	}

	public List<EsmspSumMeasurOrganizationDay> getOrganizationDayTop5() {
		// TODO Auto-generated method stub
		return organizationDay.selectTop5();
	}

	public List<EsmspSumMeasurOrganizationMonth> getOrganizationMonthTop5(
			String date) {
		// TODO Auto-generated method stub
		return organizationMonth.selectTop5(date);
	}

	public List<EsmspSumMeasurOrganizationYear> getOrganizationYearTop5(
			String date) {
		// TODO Auto-generated method stub
		return organizationYear.selectTop5(date);
	}

	@Override
	public List<EsmspSumMeasurOrganizationYear> getYearByPCode(String code,
			String mmpCode, String date) {
		// TODO Auto-generated method stub
		List<PomsEnergyUsingOrganization> list = pomsOrganization
				.selectByPId(code);
		String[] codes = null;
		if (list != null && list.size() > 0) {
			codes = new String[list.size() + 1];
			codes[0] = code;
			for (int i = 0; i < list.size(); i++) {
				PomsEnergyUsingOrganization pom = list.get(i);
				codes[i + 1] = pom.getId();
			}
		} else {
			codes = new String[] { code };
		}
		List<EsmspSumMeasurOrganizationYear> years = organizationYear
				.selectByCode(codes, mmpCode, Constants.euiCode,
						new String[] { date });
		return years;
	}

	@Override
	public ChartXTData getYearPie(String code, String mmpCode, String dateCode) {
		// TODO Auto-generated method stub
		List<EsmspSumMeasurOrganizationYear> list = getYearByPCode(code,
				mmpCode, dateCode);
		Map<String, BigDecimal> monthMap = new LinkedHashMap<String, BigDecimal>();
		for (EsmspSumMeasurOrganizationYear year : list) {
			monthMap.put(year.getEusCode(), year.getSumValue());
		}
		Map<String, Object> map = getPieData(monthMap, code);
		ChartXTData data = new ChartXTData();
		data.setCaption(dateCode + "能耗占比(kWh)");
		data.setCanvasBgAlpha("100");
		data.setCanvasBgColor("2c3240");
		data.setBgColor("2c3240");
		data.setBgAlpha("100");
		data.getPieData(map);
		return data;
	}

	@Override
	public ChartXTData getYearBar(String code, String mmpCode, String dateCode) {
		// TODO Auto-generated method stub
		List<EsmspSumMeasurOrganizationYear> list = getOrganizationYearTop5(dateCode);
		for(EsmspSumMeasurOrganizationYear year : list){
			year.setEusName(pomsOrganization.selectByCode(year.getEusCode(), Constants.euiCode).getEuoNames());
		}
		ChartXTData data = new ChartXTData();
		data.setType("bar2d");
		data.setCaption("能耗排名(kWh)");
		data.setBgColor("2c3240");
		data.setPalette("2B3745");
		data.setCanvasBgColor("2c3240");
		data.setPlotGradientColor("#00A3D7");
		Map<String, BigDecimal> map = new LinkedHashMap<String, BigDecimal>();
		if (list != null && list.size() > 0) {
			for (EsmspSumMeasurOrganizationYear year : list) {
				map.put(year.getEusName(), year.getSumValue());
			}
		} else {
			map.put("暂无数据", new BigDecimal(0d));
		}
		data.getAreaBarData(map);
		return data;
	}

	@Override
	public ChartXTData getMonthAreaBar(String type, String code,
			String mmpCode, String dateCode) throws NoSuchMethodException,
			SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		// TODO Auto-generated method stub
		List<EsmspSumMeasurOrganizationMonth> list = getOrganizationMonthByCode(
				type, code, mmpCode, new String[] { dateCode });
		ChartXTData data = new ChartXTData();
		data.setCaption("月能耗趋势(kWh)");
		data.setType("area2d");
		data.setBgColor("2c3240");
		data.setPlotGradientColor("00699b");
		data.setPalette("2B3745");
		data.setCanvasBgColor("2c3240");
		Map<String, BigDecimal> map = new LinkedHashMap<String, BigDecimal>();
		if (list != null && list.size() > 0) {
			for (EsmspSumMeasurOrganizationMonth month : list) {
				Class<EsmspSumMeasurOrganizationMonth> c = EsmspSumMeasurOrganizationMonth.class;
				Calendar cal = Calendar.getInstance();
				String[] days = DateUtils.getDays(cal.get(Calendar.YEAR), cal
						.get(Calendar.MONTH) + 1);
				for (int i = 0; i < days.length; i++) {
					Method m = c.getDeclaredMethod("getPoint" + (i + 1));
					BigDecimal value = new BigDecimal(m.invoke(month)
							.toString());
					if (map.containsKey(days[i])) {
						map.put(days[i], map.get(days[i]).add(value));
					} else {
						map.put(days[i], value);
					}
				}
			}
		} else {
			map.put("暂无数据", new BigDecimal(0d));
		}
		data.getAreaBarData(map);
		return data;
	}

	@Override
	public JSONArray getTree(String id, String type) {
		// TODO Auto-generated method stub
		JSONArray js = new JSONArray();
		List<PomsEnergyUsingOrganization> list = new ArrayList<PomsEnergyUsingOrganization>();
		if (type == null || type.equals("")) {
			list = pomsOrganization.selectByPId(id);
		} else {
			list = pomsOrganization.selectByPIdAndType(id, type);
		}
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for (int i = 0; i < list.size(); i++) {
			boolean test = true;
			String state = "closed";
			List<PomsEnergyUsingOrganization> list2 = pomsOrganization
					.selectByPId(list.get(i).getId());
			if (list2.size() == 0 || list2.isEmpty()) {// 没有子节点，则把"statc"改成false
				test = false;
				state = "";
			}
			sb.append("{");
			sb.append("\"id\":\"" + list.get(i).getId() + "\",\"text\":\""
					+ list.get(i).getEuoNames() + "\",\"state\":\"" + state
					+ "\",\"attributes\":{\"type\":" + "\""
					+ list.get(i).getEuoBackups() + "\",\"eid\":\""
					+ list.get(i).getEuiId() + "\"" + ",\"ename\":\"" + ""
					+ "\"}");
			if (!test) {
				sb.append(",\"iconCls\":\"tree-file\"");
			}
			if (i == list.size() - 1) {
				sb.append("}");
			} else {
				sb.append("},");
			}
		}
		sb.append("]");
		js = JSONArray.fromObject(sb.toString());
		return js;
	}

	@Override
	public ChartXTData getMonthGauges(String type, String code, String mmpCode,
			String dateCode, String dateType) {
		// TODO Auto-generated method stub
		double value = 0d;
		double yellowvalue = 0d;
		double redvalue = 0d;
		double upvalue = 0d;
		double lowvalue = 0d;
		String[] ctds = pctRefMapper.selectCtdsByTypeAndCode(type, code);
		if (dateType.equals("1")) {
			List<EsmspSumMeasurOrganizationMonth> monthlist = organizationMonth
					.selectByCode(ctds, mmpCode, Constants.euiCode,
							new String[] { DateUtils.getYearMonth1() });
			double monthValue = 0d;
			if (monthlist != null && monthlist.size() > 0) {
				monthValue = Double.parseDouble(monthlist.get(0).getSumValue()
						+ "");
			}
			List<EsmspSumMeasurOrganizationYear> list = organizationYear
					.selectByCode(ctds, mmpCode, Constants.euiCode,
							new String[] { dateCode });
			if (list != null && list.size() > 0) {
				value = Double.parseDouble(list.get(0).getSumValue() + "");
			}
			value += monthValue;
		} else {
			List<EsmspSumMeasurOrganizationMonth> list = organizationMonth
					.selectByCode(ctds, mmpCode, Constants.euiCode,
							new String[] { dateCode });
			if (list != null && list.size() > 0) {
				value = Double.parseDouble(list.get(0).getSumValue() + "");
			}
		}
		List<EsmspIndexData> index = indexData.selectByParam(type, code, "1",
				dateCode);
		ChartXTData data = new ChartXTData();
		data.setCaption(dateCode + "能耗总量(kWh)");
		data.setType("angulargauge");
		data.setBgColor("2c3240");
		data.setCanvasBgColor("2c3240");
		if (index != null && index.size() > 0) {
			yellowvalue = Double.parseDouble(index.get(0).getWarningValue()
					+ "");
			redvalue = Double.parseDouble(index.get(0).getTargetValue() + "");
			upvalue = redvalue * 1.5;
		} else {
			yellowvalue = 2;
			upvalue = value * 2;
		}
		data.setGaugeData(value, yellowvalue, redvalue, upvalue, lowvalue);
		return data;
	}

	@Override
	public ChartXTData getMonthPie(String code, String mmpCode, String dateCode) {
		// TODO Auto-generated method stub
		List<EsmspSumMeasurOrganizationMonth> list = getMonthByPCode(code,
				"31", dateCode);
		Map<String, Object> monthMap = new LinkedHashMap<String, Object>();
		int i = 0;
		Double parentValue = 0d;
		if(list.size()==1){
			EsmspSumMeasurOrganizationMonth month=list.get(0);
			Double value = month.getSumValue();
			String name = calculateTerminalDeviceMapper.selectByCode(
					month.getEusCode()).getCdtTerminalName();
			monthMap.put(name, value);
		}else {
			for (EsmspSumMeasurOrganizationMonth month : list) {
				if (i == 0) {
					parentValue = month.getSumValue();
				} else {
					Double value = month.getSumValue();
					String name = calculateTerminalDeviceMapper.selectByCode(
							month.getEusCode()).getCdtTerminalName();
					parentValue -= value;
					monthMap.put(name, value);
					if (i == list.size() - 1 && parentValue > 0) {
						monthMap.put("未监测", parentValue);
					}
				}
				i++;
			}
		}
		ChartXTData data = new ChartXTData();
		data.setCaption(dateCode + "能耗占比(kWh)");
		data.setCanvasBgAlpha("100");
		data.setCanvasBgColor("2c3240");
		data.setBgColor("2c3240");
		data.setBgAlpha("100");
		data.getPieData(monthMap);
		return data;
	}

	@Override
	public ChartXTData getMonthPieNew(int type) {
		// TODO Auto-generated method stub
		// List<EsmspSumMeasurOrganizationMonth> list = getMonthByPCode(code,
		// dateCode);
		// Map<String, Double> monthMap = new LinkedHashMap<String, Double>();
		// for (EsmspSumMeasurOrganizationMonth month : list) {
		// monthMap.put(month.getEusCode(), month.getSumValue());
		// }
		// Map<String,Object> map = new HashMap<String,Object>();
		// switch(type){
		// case 1:
		// map.put(key, value);
		// break;
		// case 2:
		// break;
		// case 3:
		// break;
		// }
		ChartXTData data = new ChartXTData();
		// data.setCaption(dateCode + "能耗占比(kWh)");
		data.setCanvasBgAlpha("0");
		data.setCanvasBgColor("");
		data.setBgColor("");
		data.setBgAlpha("0");
		// data.getPieData(map);
		return data;
	}

	@Override
	public List<EsmspSumMeasurOrganizationMonth> getMonthByPCode(String code,
			String mmpCode, String date) {
		// TODO Auto-generated method stub
		List<PomsEnergyUsingOrganization> list = pomsOrganization
				.selectByPId(code);
		String[] codes = null;
		if (list != null && list.size() > 0) {
			codes = new String[list.size() + 1];
			codes[0] = code;
			for (int i = 0; i < list.size(); i++) {
				PomsEnergyUsingOrganization pom = list.get(i);
				codes[i + 1] = pom.getId();
			}
		} else {
			codes = new String[] { code };
		}
		List<EsmspSumMeasurOrganizationMonth> months = organizationMonth
				.selectByCode(codes, mmpCode, Constants.euiCode,
						new String[] { date });

		return months;
	}

	@Override
	public List<EsmspSumMeasurOrganizationDay> getDayList(String type,
			String eusCode, String mmpName, String dateCode) {
		// TODO Auto-generated method stub
		String[] dates = new String[] { dateCode };
		if (dateCode
				.equals(new SimpleDateFormat("yyyyMMdd").format(new Date()))) {
			dates = null;
		}
		List<EsmspSumMeasurOrganizationDay> list = getOrganizationDayBymmpName(
				type, eusCode, mmpName, dates);
		return list;

	}

	/**
	 * 根据日能耗集合得到能耗图形
	 * 
	 * @param list
	 *            日能耗报表
	 * @return
	 */
	public ChartXTData getDayLine(List<EsmspSumMeasurOrganizationDay> list) {
		String[] cate = DateUtils.getTime15Min();
		String[] seriesName = new String[list.size()];
		String[][] datavalue = new String[cate.length][seriesName.length];
		int i = 0;
		for (EsmspSumMeasurOrganizationDay day : list) {
			String name = (codeManagement.selectByCode(day.getMmpCode(),
					Constants.ZDCLDCSBM).get(0)).getCmName();
			seriesName[i] = name;
			day.setMmpName(name);
			for (int j = 1; j < 97; j++) {
				Object value = 0;
				Class<EsmspSumMeasurOrganizationDay> c = EsmspSumMeasurOrganizationDay.class;
				Method m;
				try {
					m = c.getDeclaredMethod("getPoint" + j);
					value = m.invoke(day);
				} catch (NoSuchMethodException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				datavalue[j - 1][i] = value + "";
			}
			i++;
		}
		ChartXTData data = new ChartXTData();
		// 图标上是否显示数据 0 为不显示，1 显示
		data.setShowValues("0");
		data.setBgColor("2c3240");
		data.setCanvasBgColor("2c3240");
		data.setData(cate, seriesName, datavalue);
		return data;
	}

	@Override
	public JSONObject getYearMonthDayData(String type, String eusCode,
			String mmpCode) {
		// TODO Auto-generated method stub
		String y = DateUtils.getYear();
		String m = DateUtils.getYearMonth1();
		String d = DateUtils.getYearMonthDay();
		String lasty = DateUtils.getLastYear(y);
		String lastm = DateUtils.getMonthOfLastYear(m);
		String lastd = DateUtils.getLastDayOfCurrent();
		List<EsmspSumMeasurOrganizationDay> daylist = getOrganizationDayByCode(
				type, eusCode, new String[] { mmpCode }, new String[] { lastd });// 日同期
		EsmspSumMeasurOrganizationDay thisDay = getOrganizationDayByCode(type,
				eusCode, new String[] { mmpCode }, null).get(0);
		daylist.add(thisDay);
		List<EsmspSumMeasurOrganizationMonth> monthlist = getOrganizationMonthByCode(
				type, eusCode, mmpCode, new String[] { m, lastm });
		List<EsmspSumMeasurOrganizationYear> yearlist = getYearAndLastYear(
				type, eusCode, mmpCode, new String[] { y, lasty });
		List<EsmspYearMonthDayData> datalist = new ArrayList<EsmspYearMonthDayData>();
		double dayValue = 0;
		double monthValue = 0;
		if (daylist != null) {
			EsmspYearMonthDayData data = new EsmspYearMonthDayData();
			data.setName("日累计能耗");
			double value = 0d;
			double lastvalue = 0d;
			for (EsmspSumMeasurOrganizationDay orgday : daylist) {
				if (orgday.getDateCode().equals(d)) {
					value = orgday.getSumValue();
					dayValue = value;
				} else if (orgday.getDateCode().equals(lastd)) {
					lastvalue = orgday.getSumValue();
				}
			}
			data.setValue(value);
			data.setLastvalue(lastvalue);
			if (lastvalue != 0) {
				data.setCompare((value - lastvalue) / lastvalue * 100 + "%");
			} else {
				data.setCompare("0%");
			}
			datalist.add(data);
		}
		if (monthlist != null) {
			EsmspYearMonthDayData data = new EsmspYearMonthDayData();
			data.setName("月累计能耗");
			double value = 0d;
			double lastvalue = 0d;
			for (EsmspSumMeasurOrganizationMonth orgmonth : monthlist) {
				if (orgmonth.getDateCode().equals(m)) {
					value = orgmonth.getSumValue();
				} else if (orgmonth.getDateCode().equals(lastd)) {
					lastvalue = orgmonth.getSumValue();
				}
			}
			monthValue = value + dayValue;
			data.setValue(monthValue);
			data.setLastvalue(lastvalue);
			if (lastvalue != 0) {
				data.setCompare((value - lastvalue) / lastvalue * 100 + "%");
			} else {
				data.setCompare("0%");
			}
			datalist.add(data);
		}
		if (yearlist != null) {
			EsmspYearMonthDayData data = new EsmspYearMonthDayData();
			data.setName("年累计能耗");
			double value = 0d;
			double lastvalue = 0d;
			for (EsmspSumMeasurOrganizationYear orgyear : yearlist) {
				if (orgyear.getDateCode().equals(y)) {
					value = orgyear.getSumValue().doubleValue();
				} else if (orgyear.getDateCode().equals(lastd)) {
					lastvalue = orgyear.getSumValue().doubleValue();
				}
			}
			data.setValue(value + monthValue);
			data.setLastvalue(lastvalue);
			if (lastvalue != 0) {
				data.setCompare((value - lastvalue) / lastvalue * 100 + "%");
			} else {
				data.setCompare("0%");
			}
			datalist.add(data);
		}
		JSONObject json = new JSONObject();
		json.put("list", datalist);
		return json;
	}

	@Override
	public Map<String, Object> getPieData(Map<String, BigDecimal> monthMap,
			String code) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		double total = 0d;
		double add = 0d;
		int i = 0;
		if (monthMap.size() > 0) {
			for (String key : monthMap.keySet()) {
				i++;
				String name = pomsOrganization.selectByCode(key,
						Constants.euiCode).getEuoNames();
				double value = monthMap.get(key).doubleValue();
				if (key.equals(code)) {
					total = value;
					if (monthMap.size() == 1) {
						map.put(name, value);
					}
				} else {
					add += value;
					map.put(name, value);
					if (i == monthMap.size()) {
						double compare = total - add;
						if (compare > 0) {
							map.put("未监测", value);
						}
					}
				}
			}
		} else {
			map.put("无数据", 0);
		}
		return map;
	}

	@Override
	public List<EsmspSumMeasurOrganizationDay> getOrganizationDayBymmpName(
			String type, String eusCode, String mmpName, String[] dateCode) {
		// TODO Auto-generated method stub
		List<PomsCodeManagement> codes = codeManagement.selectByLikeName(
				mmpName, Constants.ZDCLDCSBM);
		String[] mmpCodes = new String[codes.size() + 1];
		mmpCodes[0] = "";
		int l = 1;
		for (PomsCodeManagement code : codes) {
			mmpCodes[l] = code.getCmCode();
			l++;
		}
		return getOrganizationDayByCode(type, eusCode, mmpCodes, dateCode);
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
		List<EsmspSumMeasurOrganizationDay> beginlist = organizationDay
				.dayHistory(null, new String[] { mmpCode }, beginDate);
		List<EsmspSumMeasurOrganizationDay> endlist = organizationDay
				.dayHistory(null, new String[] { mmpCode }, endDate);
		Class<EsmspSumMeasurOrganizationDay> c = EsmspSumMeasurOrganizationDay.class;
		Method m = c.getDeclaredMethod("getPoint" + beginpoint);
		Method endm = c.getDeclaredMethod("getPoint" + endpoint);
		List<DataTable> list = new ArrayList<DataTable>();
		Double sumValue = 0d;
		for (EsmspSumMeasurOrganizationDay day : beginlist) {
			if (day.getMmpCode().indexOf("_") > 0) {
				DataTable table = new DataTable();
				String ctdName = pomsOrganization.selectByCode(
						day.getEusCode(), Constants.euiCode).getEuoNames();
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
		String ctdName = "总用电量";
		String unit = "kWh";
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
	 * @Title: getDataTable
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param
	 * @return 返回类型
	 * @throws
	 */
	@Override
	@Transactional
	public List<Object[]> getDataTable(String mmpCode, String begindate,
			String begintime, String enddate, String endtime)
			throws NumberFormatException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException,
			ParseException, NoSuchMethodException, SecurityException {
		String now = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String beginDate = null;
		String endDate = null;
		int beginpoint = 0;
		try {
			beginpoint = DateUtils.getTimeOfPointNumberInDay(begintime);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int endpoint = 0;
		try {
			endpoint = DateUtils.getTimeOfPointNumberInDay(endtime);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
		// List<EsmspSumMeasurOrganizationDay> beginlist = organizationDay
		// .dayHistory(null, new String[] { mmpCode }, beginDate);
		// List<EsmspSumMeasurOrganizationDay> endlist = organizationDay
		// .dayHistory(null, new String[] { mmpCode }, endDate);
		// Class<EsmspSumMeasurOrganizationDay> c =
		// EsmspSumMeasurOrganizationDay.class;
		// Method m = c.getDeclaredMethod("getPoint" + beginpoint);
		// Method endm = c.getDeclaredMethod("getPoint" + endpoint);
		// List<DataTable> list = new ArrayList<DataTable>();
		// Double sumValue = 0d;
		// String unit = "kWh";
		// if (energyType.equals("1")) {
		// unit = "kWh";
		// } else {
		// unit = "吨";
		// }
		// for (EsmspSumMeasurOrganizationDay day : beginlist) {
		// if (day.getMmpCode().indexOf("_") > 0) {
		// DataTable table = new DataTable();
		// PomsCalculateTerminalDevice ctd = ctdMapper.selectByCode(day
		// .getEusCode());
		// String ctdName = ctd.getCdtTerminalName();
		// Double beginValue = Double
		// .parseDouble(m.invoke(day).toString());
		// Double endValue = 0d;
		// for (EsmspSumMeasurOrganizationDay d : endlist) {
		// if (d.getEusCode().equals(day.getEusCode())
		// && d.getMmpCode().equals(day.getMmpCode())) {
		// endValue = Double
		// .parseDouble(endm.invoke(d).toString());
		// break;
		// }
		// }
		// table.setCtdCode(day.getEusCode());
		// table.setCtdName(ctdName);
		// table.setBeginDate(begindate);
		// table.setBeginValue(beginValue + "");
		// table.setEndDate(enddate);
		// table.setEndValue(endValue + "");
		// Double value = NumberUtils.NumberTwoDecimal(endValue
		// - beginValue);
		// table.setValue(value);
		// table.setUnit(unit);
		// list.add(table);
		// sumValue = NumberUtils.NumberTwoDecimal((sumValue + value));
		// }
		// }
		// DataTable dataTable = new DataTable();
		// String ctdName = "内科楼总";
		// if (type.equals("1")) {
		// ctdName = "内科楼总";
		// } else {
		// ctdName = "外科楼总";
		// }
		// dataTable.setCtdName(ctdName);
		// dataTable.setBeginDate(begindate);
		// dataTable.setBeginValue("-");
		// dataTable.setEndDate(enddate);
		// dataTable.setEndValue("-");
		// dataTable.setValue(sumValue);
		// dataTable.setUnit(unit);
		// list.add(dataTable);
		List<Map<String, Object>> mapList = organizationDay.selectMonthTable(
				beginDate, beginpoint, endDate, endpoint, mmpCode);
		List<Object[]> obj = new ArrayList<Object[]>();
		for (Map<String, Object> map : mapList) {
			System.out.println(map.values());
			Collection values = map.values();
			List list = new ArrayList(values);
			obj.add(list.toArray());
		}
		return obj;
	}
    public List<PomsEnergyUsingLocation> getOrganizationList(String pid){
	    return locationMapper.selectByPId(pid);
    }
    public List<PomsEnergyUsingSystem> getSystemList(String pid,String level){
        return systemMapper.selectByPIdAndLevel(pid,level);
    }
}
