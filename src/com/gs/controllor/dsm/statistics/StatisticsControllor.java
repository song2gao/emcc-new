package com.gs.controllor.dsm.statistics;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.common.util.Constants;
import com.gs.common.util.DateUtils;
import com.gs.common.util.NumberUtils;
import com.gs.domain.DataTable;
import com.gs.domain.DldhfxModel;
import com.gs.domain.EsmspSumMeasurOrganizationDay;
import com.gs.domain.EsmspSumMeasurOrganizationMonth;
import com.gs.domain.EsmspSumMeasurOrganizationYear;
import com.gs.fusioncharts.ChartXTData;
import com.gs.service.MonitorService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/statistics")
public class StatisticsControllor {
	@Autowired
	private MonitorService monitorService;

	/**
	 * 跳转到电力需求侧管理平台单元能耗分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/dynhfx")
	public String toDynhfx(HttpServletRequest request) {
		return "/DSM/esmsp-statistics/cpdhfx";
	}

	/**
	 * 跳转到电力需求侧管理平台用电分项报表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/yddhbb")
	public String toYddhbb(HttpServletRequest request) {
		return "/DSM/esmsp-statistics/yddhbb";
	}

	/**
	 * 跳转到电力需求侧管理平台楼层用电报表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/ydzlbb")
	public String toYdzlbb(HttpServletRequest request) {
		return "/DSM/esmsp-statistics/ydzlbb";
	}

	/**
	 * 跳转到电力需求侧管理平台用水分项报表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/ysdhbb")
	public String toYsdhbb(HttpServletRequest request) {
		return "/DSM/esmsp-statistics/ysdhbb";
	}

	/**
	 * 跳转到电力需求侧管理平台单元能耗分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/dldhfx")
	public String toDldhfx(HttpServletRequest request) {
		return "/DSM/esmsp-statistics/dldhfx";
	}

	/**
	 * 跳转到电力需求侧管理平台单元能耗分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/nhqsfx")
	public String toYnqsfx(HttpServletRequest request) {
		return "/DSM/esmsp-statistics/nhqsfx-zf";
	}

	/**
	 * 跳转到电力需求侧管理平台单元能耗分析
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/dldhdata")
	public String toGetDldhData(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String code = request.getParameter("id");
		String type = request.getParameter("type");
		String dateCode = request.getParameter("date");
		if (code == null) {
			code = Constants.eusCode;
		} else if (code.equals("")) {
			code = Constants.eusCode;
		}
		double sumvalue = 0d;
		double fvalue = 0d;
		double pvalue = 0d;
		double gvalue = 0d;
		double fprice = 0d;
		double pprice = 0d;
		double gprice = 0d;
		if (type == null || type.equals("")) {
			type = "2";
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYearMonth1();
			} else {
				dateCode = dateCode.replaceAll("-", "").substring(0, 4);
			}
		} else if (type.equals("2")) {
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYear();
			} else {
				dateCode = dateCode.replaceAll("-", "").substring(0, 6);
			}
			List<EsmspSumMeasurOrganizationMonth> list = monitorService
					.getOrganizationMonthByCode(Constants.type,code, "31",
							new String[] { dateCode });
			for (EsmspSumMeasurOrganizationMonth m : list) {
				fvalue = Double.parseDouble(m.getfValue() + "");
				pvalue = Double.parseDouble(m.getpValue() + "");
				gvalue = Double.parseDouble(m.getgValue() + "");
				sumvalue = Double.parseDouble(m.getSumValue() + "");
				break;
			}
		} else if (type.equals("1")) {
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYearMonth1();
			}
			dateCode = dateCode.replaceAll("-", "").substring(0, 4);
			List<EsmspSumMeasurOrganizationYear> list = monitorService
					.getYearAndLastYear(Constants.type,code, "31", new String[] { dateCode });
			for (EsmspSumMeasurOrganizationYear y : list) {
				fvalue = Double.parseDouble(y.getfValue() + "");
				pvalue = Double.parseDouble(y.getpValue() + "");
				gvalue = Double.parseDouble(y.getgValue() + "");
				sumvalue = Double.parseDouble(y.getSumValue() + "");
				break;
			}

		} else {
			dateCode = dateCode.replaceAll("-", "");
			List<EsmspSumMeasurOrganizationDay> daylist = monitorService
					.getOrganizationDayByCode(Constants.type,code, new String[] { "31" },
							new String[] { dateCode });
			for (EsmspSumMeasurOrganizationDay y : daylist) {
				fvalue = Double.parseDouble(y.getfValue() + "");
				pvalue = Double.parseDouble(y.getpValue() + "");
				gvalue = Double.parseDouble(y.getgValue() + "");
				sumvalue = Double.parseDouble(y.getSumValue() + "");
				break;
			}
		}
		fprice = NumberUtils.NumberTwoDecimal(fvalue * Constants.FPrice);
		pprice = NumberUtils.NumberTwoDecimal(pvalue * Constants.PPrice);
		gprice = NumberUtils.NumberTwoDecimal(gvalue * Constants.Gprice);
		List<ChartXTData> chartList = new ArrayList<ChartXTData>();
		ChartXTData dlqs = new ChartXTData();
		String[] dlqs_cate = new String[] { dateCode };
		String[] dlqs_seriesName = new String[] { "总电量", "峰", "平", "谷" };
		String[][] dlqs_datavalue = new String[dlqs_cate.length][dlqs_seriesName.length];
		dlqs_datavalue[0][0] = sumvalue + "";
		dlqs_datavalue[0][1] = fvalue + "";
		dlqs_datavalue[0][2] = pvalue + "";
		dlqs_datavalue[0][3] = gvalue + "";
		dlqs.setShowValues("1");
		dlqs.setBgColor("2c3240");
		dlqs.setCanvasBgColor("2c3240");
		dlqs.setData(dlqs_cate, dlqs_seriesName, dlqs_datavalue);
		dlqs.setType("mscolumn2d");
		chartList.add(dlqs);
		ChartXTData dlpie_data = new ChartXTData();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("峰", fvalue);
		map.put("平", pvalue);
		map.put("谷", gvalue);
		dlpie_data.setCaption(dateCode + "用电量占比(kWh)");
		dlpie_data.setCanvasBgAlpha("100");
		dlpie_data.setCanvasBgColor("2c3240");
		dlpie_data.setBgColor("2c3240");
		dlpie_data.setBgAlpha("100");
		dlpie_data.getPieData(map);
		dlpie_data.setType("pie2d");
		chartList.add(dlpie_data);
		ChartXTData dfqs_data = new ChartXTData();
		String[] dfqs_cate = new String[] { dateCode };
		String[] dfqs_seriesName = new String[] { "总电费", "峰", "平", "谷" };
		String[][] dfqs_datavalue = new String[dfqs_cate.length][dfqs_seriesName.length];
		dfqs_datavalue[0][0] = (fprice + pprice + gprice) + "";
		dfqs_datavalue[0][1] = fprice + "";
		dfqs_datavalue[0][2] = pprice + "";
		dfqs_datavalue[0][3] = gprice + "";
		dfqs_data.setShowValues("0");
		dfqs_data.setBgColor("2c3240");
		dfqs_data.setCanvasBgColor("2c3240");
		dfqs_data.setData(dfqs_cate, dfqs_seriesName, dfqs_datavalue);
		dfqs_data.setType("mscolumn2d");
		chartList.add(dfqs_data);
		ChartXTData dfpie_data = new ChartXTData();
		Map<String, Object> dfpie_map = new LinkedHashMap<String, Object>();
		dfpie_map.put("峰", fprice);
		dfpie_map.put("平", pprice);
		dfpie_map.put("谷", gprice);
		dfpie_data.setCaption(dateCode + "电费占比(kWh)");
		dfpie_data.setCanvasBgAlpha("100");
		dfpie_data.setCanvasBgColor("2c3240");
		dfpie_data.setBgColor("2c3240");
		dfpie_data.setBgAlpha("100");
		dfpie_data.getPieData(dfpie_map);
		dfpie_data.setType("pie2d");
		chartList.add(dfpie_data);
		String s = "0:0:0";
		if (gvalue != 0d) {
			s = NumberUtils.NumberTwoDecimal(fvalue / gvalue) + ":"
					+ NumberUtils.NumberTwoDecimal(pvalue / gvalue) + ":1";
		}
		double sumprice = fprice + pprice + gprice;
		DldhfxModel model = new DldhfxModel();
		model.setEusCode(code);
		model.setDateCode(dateCode);
		model.setSumvalue(sumvalue);
		model.setFvalue(fvalue);
		model.setPvalue(pvalue);
		model.setGvalue(gvalue);
		model.setSumprice(sumprice);
		model.setFprice(fprice);
		model.setPprice(pprice);
		model.setGprice(gprice);
		model.setFgpcom(s);
		JSONObject json = new JSONObject();
		try {
			json.put("model", model);
			json.put("charts", chartList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 跳转到电力需求侧管理平台单元能耗分析
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/dldhtb")
	public String toDldhtb(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String code = request.getParameter("id");
		String type = request.getParameter("type");
		String dateCode = request.getParameter("date");
		if (code == null) {
			code = Constants.eusCode;
		} else if (code.equals("")) {
			code = Constants.eusCode;
		}
		double sumvalue = 0d;
		double fvalue = 0d;
		double pvalue = 0d;
		double gvalue = 0d;
		double fprice = 0d;
		double pprice = 0d;
		double gprice = 0d;
		if (type == null || type.equals("")) {
			type = "2";
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYearMonth1();
			}
		} else if (type.equals("2")) {
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYearMonth1();
			} else {
				dateCode = dateCode.replaceAll("-", "").substring(0, 6);
			}
			List<EsmspSumMeasurOrganizationMonth> list = monitorService
					.getOrganizationMonthByCode(Constants.type,code, "31",
							new String[] { dateCode });
			for (EsmspSumMeasurOrganizationMonth m : list) {
				fvalue = Double.parseDouble(m.getfValue() + "");
				pvalue = Double.parseDouble(m.getpValue() + "");
				gvalue = Double.parseDouble(m.getgValue() + "");
				sumvalue = Double.parseDouble(m.getSumValue() + "");
				break;
			}
		} else {
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYear();
			} else {
				dateCode = dateCode.replaceAll("-", "").substring(0, 4);
			}
			List<EsmspSumMeasurOrganizationYear> list = monitorService
					.getYearAndLastYear(Constants.type,code, "31", new String[] { dateCode });
			for (EsmspSumMeasurOrganizationYear y : list) {
				fvalue = Double.parseDouble(y.getfValue() + "");
				pvalue = Double.parseDouble(y.getpValue() + "");
				gvalue = Double.parseDouble(y.getgValue() + "");
				sumvalue = Double.parseDouble(y.getSumValue() + "");
				break;
			}
		}
		fprice = fvalue * Constants.FPrice;
		pprice = pvalue * Constants.PPrice;
		gprice = gvalue * Constants.Gprice;
		String s = "0:0:0";
		if (gvalue != 0d) {
			s = NumberUtils.NumberTwoDecimal(fvalue / gvalue) + ":"
					+ NumberUtils.NumberTwoDecimal(pvalue / gvalue) + ":1";
		}
		double sumprice = fprice + pprice + gprice;
		DldhfxModel model = new DldhfxModel();
		model.setEusCode(code);
		model.setDateCode(dateCode);
		model.setSumvalue(sumvalue);
		model.setFvalue(fvalue);
		model.setPvalue(pvalue);
		model.setGvalue(gvalue);
		model.setSumprice(sumprice);
		model.setFprice(fprice);
		model.setPprice(pprice);
		model.setGprice(gprice);
		model.setFgpcom(s);
		JSONObject json = new JSONObject();
		try {
			json.put("model", model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 跳转到电力需求侧管理平台单元能耗分析
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws SecurityException
	 * @throws NoSuchMethodException
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws ParseException
	 */
	@RequestMapping("/nhqsdata")
	public String toNhqsData(HttpServletRequest request,
			HttpServletResponse response) throws IOException,
			NoSuchMethodException, SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, ParseException {
		String code = request.getParameter("id");
		String type = request.getParameter("type");
		String dateBeginCode = request.getParameter("dateBeginCode");
		String dateEndCode = request.getParameter("dateEndCode");
		String mmpCode = request.getParameter("mmpCode");
		if (mmpCode == null) {
			mmpCode = "31";
		}
		ChartXTData data = new ChartXTData();
		String[] cate = DateUtils.getTime60Min();
		String[] seriesName = null;
		String[][] datavalue = null;
		if (code == null || code.equals("")) {
			code = Constants.eusCode;
		}
		if (type == null || type.equals("") || type.equals("1")) {
			type = "1";
			if (dateBeginCode == null || dateBeginCode.equals("")) {
				dateBeginCode = DateUtils.getYear();// 年
				dateEndCode = DateUtils.getYear();
			} else {
				dateBeginCode = dateBeginCode.replaceAll("-", "").substring(0,
						4);
				dateEndCode = dateEndCode.replaceAll("-", "").substring(0, 4);
			}
			if (dateBeginCode.equals(dateEndCode)) {
				seriesName = new String[] { dateBeginCode };
			} else {
				seriesName = new String[] { dateBeginCode, dateEndCode };
			}
			// seriesName = DateUtils.getYears(dateBeginCode, dateEndCode);
			List<EsmspSumMeasurOrganizationYear> list = monitorService
					.getYearAndLastYear(Constants.type,code, mmpCode, seriesName);
			cate = new String[] { "1月", "2月", "3月", "4月", "5月", "6月", "7月",
					"8月", "9月", "10月", "11月", "12月" };
			datavalue = new String[cate.length][seriesName.length];
			for (int i = 0; i < seriesName.length; i++) {
				EsmspSumMeasurOrganizationYear year = new EsmspSumMeasurOrganizationYear();
				for (int s = 0; s < list.size(); s++) {
					if (seriesName[i].equals(list.get(s).getDateCode())) {
						year = list.get(s);
					}
				}
				for (int k = 1; k < 13; k++) {
					Class<EsmspSumMeasurOrganizationYear> c = EsmspSumMeasurOrganizationYear.class;
					Method m = c.getDeclaredMethod("getPoint" + k);

					if (m.invoke(year) != null) {
						datavalue[k - 1][i] = m.invoke(year).toString();
					} else {
						datavalue[k - 1][i] = 0 + "";
					}
				}

			}
			data.setType("mscolumn2d");
		} else if (type.equals("3")) {
			if (dateBeginCode == null || dateBeginCode.equals("")) {
				dateBeginCode = DateUtils.getYearMonDay();
				dateEndCode = DateUtils.getYearMonDay();
			} else {
				dateBeginCode = dateBeginCode.replaceAll("-", "");
				dateEndCode = dateEndCode.replaceAll("-", "");
			}
			if (dateBeginCode.equals(dateEndCode)) {
				seriesName = new String[] { dateBeginCode };
			} else {
				seriesName = new String[] { dateBeginCode, dateEndCode };
			}
			// seriesName = DateUtils.display(dateBeginCode, dateEndCode);
			List<EsmspSumMeasurOrganizationDay> list = monitorService
					.getOrganizationDayByCode(Constants.type,code, new String[] { mmpCode },
							seriesName);
			cate = DateUtils.getTime60Min();
			datavalue = new String[cate.length][seriesName.length];
			for (int i = 0; i < seriesName.length; i++) {
				EsmspSumMeasurOrganizationDay day = new EsmspSumMeasurOrganizationDay();
				for (int s = 0; s < list.size(); s++) {
					if (seriesName[i].equals(list.get(s).getDateCode())) {
						day = list.get(s);
						break;
					}
				}
				double sumValue = 0;
				for (int k = 1; k < 97; k++) {
					Class<EsmspSumMeasurOrganizationDay> c = EsmspSumMeasurOrganizationDay.class;
					Method m = c.getDeclaredMethod("getPoint" + k);
					double value = 0;
					if (m.invoke(day) != null) {
						value = Double.parseDouble(m.invoke(day).toString());
					}
					if (k % 4 == 0) {
						sumValue += value;
						datavalue[k / 4 - 1][i] = NumberUtils
								.NumberTwoDecimal(sumValue)
								+ "";
						sumValue = 0;
					} else {
						sumValue += value;
					}

				}

			}
			data.setType("mscolumn2d");
		} else if (type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			int begin = getDaysOfMonth(sdf.parse(dateBeginCode));
			int end = getDaysOfMonth(sdf.parse(dateEndCode));
			int mon = 0;
			int y = 0;
			if (begin > end) {
				y = Integer.parseInt(dateBeginCode.substring(0, 4));
				mon = Integer.parseInt(dateBeginCode.substring(5, 7));
			} else {
				y = Integer.parseInt(dateEndCode.substring(0, 4));
				mon = Integer.parseInt(dateBeginCode.substring(5, 7));
			}
			seriesName = DateUtils.getMonthsBetweenStartYearsAndEndYears(
					dateBeginCode, dateEndCode);
			List<EsmspSumMeasurOrganizationMonth> list = monitorService
					.getOrganizationMonthByCode(Constants.type,code, mmpCode, seriesName);

			cate = DateUtils.getDays(y, mon);
			datavalue = new String[cate.length][seriesName.length];
			for (int i = 0; i < seriesName.length; i++) {
				EsmspSumMeasurOrganizationMonth month = new EsmspSumMeasurOrganizationMonth();
				for (int s = 0; s < list.size(); s++) {
					if (seriesName[i].equals(list.get(s).getDateCode())) {
						month = list.get(s);
					}
				}
				// EsmspSumMeasurOrganizationMonth month = list.get(i);
				for (int k = 1; k <= cate.length; k++) {
					Class<EsmspSumMeasurOrganizationMonth> c = EsmspSumMeasurOrganizationMonth.class;
					Method m = c.getDeclaredMethod("getPoint" + k);
					if (m.invoke(month) != null) {
						datavalue[k - 1][i] = m.invoke(month).toString();
					} else {
						datavalue[k - 1][i] = 0 + "";
					}
				}
			}
			data.setType("mscolumn2d");
		}
		// 图标上是否显示数据 0 为不显示，1 显示
		data.setShowValues("0");
		data.setBgColor("2c3240");
		data.setCanvasBgColor("2c3240");
		data.setData(cate, seriesName, datavalue);
		data.setWidth(seriesName.length * (seriesName.length == 1 ? 100 : 50)
				+ "%");
		data.setHeight("100%");
		request.setAttribute("width", "100%");
		request.setAttribute("height", "100%");
		request.setAttribute("swf", data.getType());
		request.setAttribute("data", data.getData());
//		JSONObject json = new JSONObject();
//		json.put("data", data);
//		PrintWriter out = response.getWriter();
//		out.print(json);
		return "common/chart-xt";
	}

	public static int getDaysOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	public static String[] display2(String dateFirst, String dateSecond,
			String format) throws ParseException {
		SimpleDateFormat dateFormat = null;
		if (format.equals("3")) {
			dateFormat = new SimpleDateFormat("yyyyMMdd");
		}
		if (format.equals("2")) {
			dateFormat = new SimpleDateFormat("yyyyMM");
		}
		if (format.equals("1")) {
			dateFormat = new SimpleDateFormat("yyyy");
		}
		Date fDate = dateFormat.parse(dateFirst);
		Date oDate = dateFormat.parse(dateSecond);
		Calendar bef = Calendar.getInstance();
		Calendar aft = Calendar.getInstance();
		int days = 0;
		bef.setTime(fDate);
		aft.setTime(oDate);
		if (format.equals("3")) {

			days = (int) ((aft.getTimeInMillis() - bef.getTimeInMillis()) / (24 * 3600 * 1000));
		}
		if (format.equals("2")) {
			days = aft.get(Calendar.YEAR) * 12 + aft.get(Calendar.MONTH)
					- (bef.get(Calendar.YEAR) * 12 + bef.get(Calendar.MONTH));
		}
		if (format.equals("1")) {
			days = aft.get(Calendar.YEAR) - bef.get(Calendar.YEAR);
		}
		String[] arr = null;
		if (days == 0) {
			days = 1;
			arr = new String[days];
			arr[0] = dateFirst;
		} else {
			arr = new String[days];
		}
		try {
			int i = 0;
			while (bef.getTime().before(oDate)) {
				System.out.println(dateFormat.format(bef.getTime()));
				String time = dateFormat.format(bef.getTime());
				arr[i] = time;
				i++;
				bef.add(Calendar.DAY_OF_MONTH, 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}

	/**
	 * 跳转到电力需求侧管理平台单元能耗分析
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws SecurityException
	 * @throws NoSuchMethodException
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	@RequestMapping("/cpdhdata")
	public String toCpdhData(HttpServletRequest request,
			HttpServletResponse response) throws IOException,
			NoSuchMethodException, SecurityException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException {
		String type = request.getParameter("type");
		String dateCode = request.getParameter("date");
		JSONObject json = new JSONObject();
		if (type == null || type.equals("") || type.equals("1")) {
			type = "1";
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYear();
			} else {
				dateCode = dateCode.replaceAll("-", "").substring(0, 4);
			}
			List<EsmspSumMeasurOrganizationYear> list = monitorService
					.getYearAndLastYear(Constants.type,null, "31", new String[] { dateCode });
			json.put("list", list);
		} else if (type.equals("3")) {
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYearMonthDay();
			} else {
				dateCode = dateCode.replaceAll("-", "");
			}
			List<EsmspSumMeasurOrganizationDay> list = monitorService
					.getOrganizationDayByCode(Constants.type,null, new String[] { "31" },
							new String[] { dateCode });
			json.put("list", list);
		} else if (type.equals("2")) {
			if (dateCode == null || dateCode.equals("")) {
				dateCode = DateUtils.getYearMonth1();
			} else {
				dateCode = dateCode.replaceAll("-", "").substring(0, 6);
			}
			List<EsmspSumMeasurOrganizationMonth> list = monitorService
					.getOrganizationMonthByCode(Constants.type,null, "31",
							new String[] { dateCode });
			json.put("list", list);
		}
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;

	}

	/**
	 * 得到能耗报表
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/dataTable")
	public String dateTable(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String mmpCode = request.getParameter("mmpCode");
		String energyType = "1";
		if (mmpCode.equals("31_")) {
			energyType = "1";
		} else if (mmpCode.equals("64_")) {
			energyType = "2";
		} else {
			energyType = "5";
		}
		String bdate = request.getParameter("begindate");
		String begindate = bdate.split(" ")[0];
		String begintime = bdate.split(" ")[1];
		String edate = request.getParameter("enddate");
		String enddate = edate.split(" ")[0];
		String endtime = edate.split(" ")[1];
		List<Object[]> listeast = monitorService.getDataTable(mmpCode,begindate,begintime,enddate,endtime);
		JSONObject json = new JSONObject();
		json.put("list", listeast);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

}
