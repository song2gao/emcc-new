package com.gs.controllor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.common.util.Constants;
import com.gs.common.util.DateUtils;
import com.gs.common.util.ExcelsUtils;
import com.gs.common.util.JsGridReportBase;
import com.gs.domain.CoolSystemIndex;
import com.gs.domain.DataTable;
import com.gs.domain.DayMonthYear;
import com.gs.domain.HistoryTableData;
import com.gs.fusioncharts.ChartXTData;
import com.gs.service.MonitorService;
import com.gs.service.coolsystem.CoolSystemService;
import com.gs.service.maintenance.unit.Test;
import com.gs.service.socket.SocketService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/coolindex")
public class CoolingSystemController {
	@Autowired
	public MonitorService monitorService;
	@Autowired
	public SocketService socketService;
	@Autowired
	public CoolSystemService coolSystemService;

	/**
	 * 跳转到节能控制系统--照明控制管理系统
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/zmkzgl")
	public String toZmkzgl(HttpServletRequest request) {
		return "/coolingsystem/zmkzgl";
	}
	/**
	 * 跳转到节能控制系统--视频监控
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/spjk")
	public String toSpjk(HttpServletRequest request) {
		return "/coolingsystem/spjk";
	}
	/**
	 * 跳转到节能控制系统--环境参数监测
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/hjcsjc")
	public String toAddUser(HttpServletRequest request) {
		return "/coolingsystem/ktxtgl";
	}

	/**
	 * 跳转到节能控制系统--实时数据监测
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/sssjjc")
	public String toSssjjc(HttpServletRequest request) {
		return "/coolingsystem/ynssjc";
	}

	/**
	 * 跳转到节能控制系统--东站空调系统
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/ktxtjc")
	public String toKtxtjc(HttpServletRequest request) {
		return "/coolingsystem/ktsyt";
	}

	/**
	 * 跳转到节能控制系统--西站空调系统
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/xzktxt")
	public String toXzktxt(HttpServletRequest request) {
		return "/coolingsystem/xzktxt";
	}

	/**
	 * 跳转到节能控制系统--东站供暖系统
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/dzgnxt")
	public String toDzgnxl(HttpServletRequest request) {
		System.out.println("123");
		return "/coolingsystem/dzgnxt";
	}

	/**
	 * 跳转到节能控制系统--东站供暖系统
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/95dzgnxt")
	public String to95Dzgnxl(HttpServletRequest request) {
		return "/coolingsystem/95dzgnxt";
	}

	/**
	 * 跳转到节能控制系统--西站供暖系统
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/xzgnxt")
	public String toXzgnxl(HttpServletRequest request) {
		return "/coolingsystem/xzgnxt";
	}

	/**
	 * 跳转到节能控制系统--冷热源分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/lryfxfx")
	public String toLryfxfx(HttpServletRequest request) {
		return "/coolingsystem/lryfxfx";
	}

	/**
	 * 跳转到节能控制系统--东站生活用水系统
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/dzshys")
	public String toDzshys(HttpServletRequest request) {
		return "/coolingsystem/dzshys";
	}

	/**
	 * 跳转到节能控制系统--西站生活用水系统
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/xzshys")
	public String toXzshys(HttpServletRequest request) {
		return "/coolingsystem/xzshys";
	}

	/**
	 * 跳转到节能控制系统--用电分项分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/ydfxfx")
	public String toYdfxfx(HttpServletRequest request) {
		return "/coolingsystem/ydfxfx";
	}

	/**
	 * 跳转到节能控制系统--用水分项分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/ysfxfx")
	public String toYsfxfx(HttpServletRequest request) {
		return "/coolingsystem/ysfxfx";
	}

	/**
	 * 跳转到节能控制系统--用气分项分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/yqfxfx")
	public String toYqfxfx(HttpServletRequest request) {
		return "/coolingsystem/yqfxfx";
	}

	/**
	 * 跳转到节能控制系统--费用分项分析
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/fyfxfx")
	public String toFyfxfx(HttpServletRequest request) {
		return "/coolingsystem/fyfxfx";
	}

	/**
	 * 跳转到节能控制系统--历史数据查询
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/lssjcx")
	public String toLssjcx(HttpServletRequest request) {
		return "/coolingsystem/rsyxjl";
	}

	/**
	 * 跳转到节能控制系统--无负压PLC数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/plc")
	public String toPlc(HttpServletRequest request) {
		return "/coolingsystem/plc";
	}

	/**
	 * 跳转到节能控制系统--冷热量表数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/coolhot")
	public String toCoolhot(HttpServletRequest request) {
		return "/coolingsystem/coolhot";
	}
	
	/**
	 * 跳转到节能控制系统--采暖运行记录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/cnyxjl")
	public String toCnyxjl(HttpServletRequest request) {
		return "/coolingsystem/cnyxjl";
	}
	/**
	 * 跳转到节能控制系统--热力能耗记录
	 * 
	 * @param request
	 * @return 
	 */
	@RequestMapping("/rlnhjl")
	public String toRlnhjl(HttpServletRequest request) {
		return "/coolingsystem/rlnhjl";
	}
	/**
	 * 跳转到节能控制系统--热水运行记录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/rsyxjl")
	public String toRsyxjl(HttpServletRequest request) {
		return "/coolingsystem/rsyxjl";
	}
	/**
	 * 跳转到节能控制系统--制冷运行记录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/zlyxjl")
	public String toZlyxjl(HttpServletRequest request) {
		return "/coolingsystem/zlyxjl";
	}
	/**
	 * 跳转到节能控制系统--供暖计量记录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/gnjljl")
	public String gnJljl(HttpServletRequest request) {
		return "/coolingsystem/gnjljl";
	}
	
	/**
	 * 跳转到节能控制系统--树形结构
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/tree")
	public String toTree(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String state = request.getParameter("type");
		request.setAttribute("type", state);
		return "/coolingsystem/tree";
	}

	/**
	 * 跳转到节能控制系统--树形结构数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/gettree")
	public String getTree(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String state = request.getParameter("type");
		String pid = request.getParameter("pid");
		String energyType = request.getParameter("energyType");
		JSONArray json = coolSystemService.getTree(pid, energyType, state);
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.getWriter().println(json);
		return null;
	}

	/**
	 * 跳转到节能控制系统--能耗报表
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/lsqxcx")
	public String toLsqxcx(HttpServletRequest request) {
		return "/coolingsystem/ynfhjc";
	}

	/**
	 * 跳转到电力需求侧管理平台用能设备占比
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/pie")
	public String toGetPie(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			id = Constants.eusCode;
		}
		ChartXTData data = monitorService.getMonthPie(id, "31", DateUtils.getYearMonth1());
		data.setType("pie2d");
		request.setAttribute("width", "100%");
		request.setAttribute("height", "100%");
		request.setAttribute("swf", data.getType());
		request.setAttribute("data", data.getData());
		JSONObject json = new JSONObject();
		// json.put("caption", data.getCaption());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return "common/chart-xt";
	}

	/**
	 * 得到仪表盘图表
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/gauges")
	public String toGetGauges(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String code = request.getParameter("id");
		String type = request.getParameter("type");
		String dateCode = "";
		if (type == null || type.equals("")) {
			type = "2";
			dateCode = DateUtils.getYearMonth1();
		} else if (type.equals("1")) {
			dateCode = DateUtils.getYear();
		} else {
			dateCode = DateUtils.getYearMonth1();
		}
		if (code == null) {

			code = Constants.eusCode;
		} else if (code.equals("")) {
			code = Constants.eusCode;
		}
		ChartXTData data = monitorService.getMonthGauges(Constants.type,code, "31", dateCode, type);
		request.setAttribute("width", "100%");
		request.setAttribute("height", "100%");
		request.setAttribute("swf", data.getType());
		request.setAttribute("data", data.getData());
		JSONObject json = new JSONObject();
		// json.put("caption", data.getCaption());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return "common/chart-xt";
	}

	/**
	 * 得到仪表盘图表
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/tb")
	public String toTb(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject json = new JSONObject();
		Test test = new Test();
		test.setName("2017年11月");
		test.setValue(100d);
		test.setLastvalue(150d);
		test.setCompare("-33%");
		List<Test> list = new ArrayList<Test>();
		list.add(test);
		json.put("list", list);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 得到仪表盘图表
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/line")
	public String toLine(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// String[] cate = DateUtils.getTime15Min();
		String[] cate = new String[] { "7:00", "9:00", "11:00", "13:00", "15:00", "17:00", "19:00" };
		String[] seriesName = new String[] { "1#冷冻循环泵运行频率（Hz）" };
		String[][] datavalue = new String[cate.length][seriesName.length];
		for (int k = 0; k < cate.length; k++) {
			datavalue[k][0] = "50";
		}
		ChartXTData data = new ChartXTData();
		// 图标上是否显示数据 0 为不显示，1 显示
		data.setShowValues("1");
		data.setType("msline");
		data.setBgColor("2c3240");
		data.setCanvasBgColor("2c3240");
		data.setData(cate, seriesName, datavalue);
		request.setAttribute("width", "100%");
		request.setAttribute("height", "100%");
		request.setAttribute("swf", data.getType());
		request.setAttribute("data", data.getData());
		JSONObject json = new JSONObject();
		// json.put("caption", data.getCaption());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return "common/chart-xt";
	}

	/**
	 * 得到实时数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/realbyCtdCode")
	public String toCtdReal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ctdCode = request.getParameter("ctdCode");
		JSONObject json = socketService.getPlcReadData(ctdCode);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 得到实时数据
	 *
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/real")
	public String toReal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String codes = request.getParameter("codes");
		JSONObject json = socketService.getRealData(codes);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 得到实时数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/coolreal")
	public String toCoolReal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject json = socketService.getCoolRealData();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 得到PLC实时数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/plcreal")
	public String toPlcReal(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject json = socketService.getPlcRealData();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 导出报表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/export")
	public String toExport(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/msexcel;charset=GBK");
		String colums = request.getParameter("colums");
		int length = Integer.parseInt(request.getParameter("length"));
		String jrows=request.getParameter("rows");
		String fileName=request.getParameter("fileName");
		List<String[]> rows = new ArrayList<String[]>();
		JSONArray jsonArray = JSONArray.fromObject(jrows);
		for (int i = 0; i < jsonArray.size(); i++) {
			Object obj = jsonArray.get(i);
			String rowStr = obj.toString();
			rowStr = rowStr.replace("[", "");
			rowStr = rowStr.replace("]", "").replaceAll("\"", "");
			String[] row = rowStr.split(",");
			rows.add(row);
		}
//		String colums="时间,2,1:高区,1,2;温度,1,1:压力,1,1;";
//		int length=3;
//		String fileName="123";
//		List<String[]> rows = new ArrayList<String[]>();
//		String[] row=new String[]{"1:00","1","2"};
//		rows.add(row);
		XSSFWorkbook wb=ExcelsUtils.createWorkBook(colums, length, fileName,rows);
//		String hearderStr = request.getParameter("headers");
//		JSONArray dgArray = JSONArray.fromObject(hearderStr);
//		List<List<DataGrid>> headrows = JSONArray.toList(dgArray,DataGrid.class);
//		String[] hearders = hearderStr.replace("[", "").replace("]", "")
//				.replaceAll("\"", "").split(",");
//		TableData td = ExcelUtils.createTableData(rows, ExcelUtils
//				.createTableHeader(hearders), null);
//		List<String[]> list=new ArrayList<String[]>();
//		String[] row=new String[]{"1:00","1","1","12","1","1"};
//		list.add(row);
//		String[] parents=new String[]{"时间","高区","低区"};
//		String[][] children=new String[][]{new String[]{},new String[]{"出水温度","回水温度","压力"},new String[]{"出水温度","回水温度"}};
//		TableHeaderMetaData headers=ExcelUtils.createTableHeader(parents, children);
//		
//		TableData td = ExcelUtils.createTableData(list,headers,null);
		JsGridReportBase report = new JsGridReportBase(request, response);
		report.exportToExcel(wb, fileName);
		return null;
	}

	/**
	 * 得到首页数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/indexData")
	public String coolIndexData(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String type = request.getParameter("energyType");
		String[] energyTypes = type.split(",");
		List<CoolSystemIndex> cool = coolSystemService.getCoolSystemIndex(energyTypes, "0");
		JSONObject json = new JSONObject();
		json.put("cool", cool);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	@RequestMapping("/daymonyearsum")
	public String coolDayMonYearSum(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String energyType = request.getParameter("energyType");
		String ctdCode = request.getParameter("ctdCode");
		String flag = request.getParameter("flag");
		String dateCode = request.getParameter("dateBeginCode").replace("-", "");
		String[] mmpCodes=request.getParameter("mmpCode").split(",");
		List<DayMonthYear> list = coolSystemService.getDayMonthYear(energyType,mmpCodes, ctdCode, flag, dateCode);
		JSONObject json = new JSONObject();
		json.put("list", list);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 历史数据查询
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/history")
	public String history(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String type = request.getParameter("type");
		String flag = request.getParameter("flag");
		String date = request.getParameter("date");
		String dateCode = date.split(" ")[0];
		String timeCode = date.split(" ")[1];
		List<HistoryTableData> list = coolSystemService.getHistoryData(type, flag, dateCode, timeCode);
		JSONObject json = new JSONObject();
		json.put("list", list);
		response.setContentType("text/html;charset=UTF-8");
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
		String energyType="1";
		if(mmpCode.equals("31_")){
			energyType="1";
		}else if(mmpCode.equals("64_")){
			energyType="2";
		}else if(mmpCode.equals("65_")||mmpCode.equals("66_")){
			energyType="5";
		}else{
			energyType="6";
		}
		String bdate = request.getParameter("begindate");
		String begindate = bdate.split(" ")[0];
		String begintime = bdate.split(" ")[1];
		String edate = request.getParameter("enddate");
		String enddate = edate.split(" ")[0];
		String endtime = edate.split(" ")[1];
		List<DataTable> listeast = coolSystemService.getDataTable(energyType,mmpCode, begindate, begintime, enddate, endtime,"1");
		List<DataTable> listwest = coolSystemService.getDataTable(energyType,mmpCode, begindate, begintime, enddate, endtime,"2");
		for(DataTable dt:listwest){
			listeast.add(dt);
		}
		JSONObject json = new JSONObject();
		json.put("list", listeast);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 得到实时数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/realAll")
	public String realData(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String type = request.getParameter("type");// 东西站标识
		String flag = request.getParameter("flag");// 表计类型标识
		JSONObject json = socketService.getAllRealData(type, flag);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 得到实时数据
	 *
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/realCtd")
	public String realDataByCtdCode(HttpServletRequest request,
						   HttpServletResponse response) throws Exception {
		String type = request.getParameter("type");// 东西站标识
		String flag = request.getParameter("flag");// 表计类型标识
		JSONObject json = socketService.getAllRealData(type, flag);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 得到日累计
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/newTable")
	public String newTable(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String type = request.getParameter("type");
		String date = request.getParameter("date");
		String dateCode = date.split(" ")[0];
		String timeCode = date.split(" ")[1];
		List<HistoryTableData> list = coolSystemService.getNewTableData(type, dateCode, timeCode);
		/*for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getMmpName().equals(list.get(j).getMmpName())&&list.get(i).getMmpName().equals("总有功电能")) {
					String substring = list.get(i).getCtdName().substring(0, 2);
					System.out.println("=========="+substring);
					list.get(i).setCtdName(substring+list.get(i).getMmpName());
					list.get(i).calValue = list.get(i).getCalValue() + list.get(j).getCalValue();
					list.remove(j);
					j--;
				}
				if (list.get(i).getMmpName().equals(list.get(j).getMmpName())&&list.get(i).getMmpName().equals("用水量")) {
					String substring = list.get(i).getCtdName().substring(0, 2);
					System.out.println("=========="+substring);
					list.get(i).setCtdName(substring+"总"+list.get(i).getMmpName());
					list.get(i).calValue = list.get(i).getCalValue() + list.get(j).getCalValue();
					list.remove(j);
					j--;
				}
			}
		}*/
		JSONObject json = new JSONObject();
		json.put("list", list);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 得到日累计
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/point")
	public String toPoint(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String type = request.getParameter("type");
		String date = request.getParameter("date");
		String dateCode = date.split(" ")[0];
		String timeCode = date.split(" ")[1];
		List<HistoryTableData> list = coolSystemService.getNewTableData(type, dateCode, timeCode);
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if (list.get(i).getMmpName().equals(list.get(j).getMmpName())&&list.get(i).getMmpName().equals("总有功电能")) {
					String substring = list.get(i).getCtdName().substring(0, 2);
					System.out.println("=========="+substring);
					list.get(i).setCtdName(substring+list.get(i).getMmpName());
					list.get(i).calValue = list.get(i).getCalValue() + list.get(j).getCalValue();
					list.remove(j);
					j--;
				}
				if (list.get(i).getMmpName().equals(list.get(j).getMmpName())&&list.get(i).getMmpName().equals("用水量")) {
					String substring = list.get(i).getCtdName().substring(0, 2);
					System.out.println("=========="+substring);
					list.get(i).setCtdName(substring+"总"+list.get(i).getMmpName());
					list.get(i).calValue = list.get(i).getCalValue() + list.get(j).getCalValue();
					list.remove(j);
					j--;
				}
			}
		}
		JSONObject json = new JSONObject();
		json.put("list", list);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	
	/**
	 * 得到日累计
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/custom")
	public String toHistoryCustomMade(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String systemCode=request.getParameter("systemCode");
		String dateCode=request.getParameter("dateCode").replaceAll("-", "");
		JSONObject json=coolSystemService.getHistoryCustomMade(systemCode,dateCode);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 读数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/plcread")
	public String toPlcRead(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ctdCodes=request.getParameter("ctdCode");
		JSONObject json = socketService.getPlcReadData(ctdCodes);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 向PLC写入数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/plcwrite")
	public String toPlcWrite(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ctdCodes=request.getParameter("ctdCode");
		String mmpCode=request.getParameter("mmpCode");
		Double value =Double.parseDouble(request.getParameter("value"));
		JSONObject json = socketService.getPlcWriteData(ctdCodes,mmpCode
				,value);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 得到PLC实时数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/modelpoints")
	public String toGetModelPoints(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ctmId=request.getParameter("ctmId");
		JSONObject json = coolSystemService.getModelPointByCtmId(ctmId);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 得到PLC实时数据
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/allCtds")
	public String toGetAllCtds(HttpServletRequest request, HttpServletResponse response) throws IOException {
		JSONObject json = coolSystemService.getAllCtds();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
}
