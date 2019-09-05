package com.gs.controllor.dsm.monitor;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.common.util.Constants;
import com.gs.common.util.DateUtils;
import com.gs.domain.EsmspSumMeasurOrganizationDay;
import com.gs.fusioncharts.ChartXTData;
import com.gs.service.MonitorService;
import com.gs.service.socket.SocketService;

@Controller
@RequestMapping("/monitor")
public class MonitorController {
	@Autowired
	public MonitorService monitorService;
	@Autowired
	public SocketService socketService;

	/**
	 * 跳转到电力需求侧管理平台实时监测
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/ynssjc")
	public String toYnssjc(HttpServletRequest request) {
		return "/DSM/monitor/ynssjc";
	}
	/**
	 * 跳转到电力需求侧管理平台节能目标监测
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/jnmbjc")
	public String toJnmbjc(HttpServletRequest request) {
		return "/DSM/monitor/jnmbjc-new";
	}
	/**
	 * 跳转到电力需求侧管理平台能耗总量监测
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/nhzljc")
	public String toNhzljc(HttpServletRequest request) {
		return "/DSM/monitor/nhzljc-new";
	}

	/**
	 * 跳转到电力需求侧管理平台历史曲线查询
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/lsqxcx")
	public String toLsqxcx(HttpServletRequest request) {
		return "/DSM/esmsp-statistics/ynfhjc";
	}
	/**
	 * 跳转到电力需求侧管理平台用能负荷监测
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/ynfhjc")
	public String toYnfhjc(HttpServletRequest request) {
		return "/DSM/monitor/ynfhjc-new";
	}
	
	/**
	 * 运行状态监控
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/yxztjk")
	public String toyxztjk(HttpServletRequest request) {
		return "/poms_sbwhgl/yxztjk";
	}

	/**
	 * 得到仪表盘图表
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/gauges")
	public String toGetGauges(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String code = request.getParameter("id");
		String type=request.getParameter("type");
		String dateCode="";
		if(type==null||type.equals("")){
			type="2";
			dateCode=DateUtils.getYearMonth1();
		}else if(type.equals("1")){
			dateCode=DateUtils.getYear();
		}else{
			dateCode=DateUtils.getYearMonth1();
		}
		if (code == null) {
			
			code=Constants.eusCode;
		} else if (code.equals("")) {
			code=Constants.eusCode;
		}
		ChartXTData data = monitorService.getMonthGauges(Constants.type,code,"31", dateCode,type);
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
	 * 跳转到电力需求侧管理平台用能设备占比
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/pie")
	public String toGetPie(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		if (id == null || id.equals("")) {
			id = Constants.eusCode;
		}
		ChartXTData data = monitorService.getMonthPie(id,"31", DateUtils
				.getYearMonth1());
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
	 * 跳转到电力需求侧管理平台用能设备占比
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/pieLayer")
	public String toGetPieLayer(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
//		String id = request.getParameter("id");
//		if (id == null || id.equals("")) {
//			id = Constants.eusCode;
//		}
		int type=Integer.parseInt(request.getParameter("type"));
		ChartXTData data = monitorService.getMonthPieNew(type);
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
	 * 电力需求侧月能耗趋势
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 * @throws SecurityException 
	 * @throws NoSuchMethodException 
	 */
	@RequestMapping("/monthColumn")
	public String toMonthColumn(HttpServletRequest request,
			HttpServletResponse response) throws IOException, NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ChartXTData data = monitorService.getMonthAreaBar(Constants.type,Constants.eusCode,"31", DateUtils
				.getYearMonth1());
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
	 * 电力需求侧年能耗趋势
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/yearColumn")
	public String toYearColumn(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ChartXTData chartdata = monitorService.getYearColumn(Constants.type,Constants.eusCode,"31", new SimpleDateFormat("yyyy").format(new Date()));
		request.setAttribute("data", chartdata.getData());
		request.setAttribute("swf", "msline");
		request.setAttribute("width", "100%");
		request.setAttribute("height", "100%");
		return "common/chart-xt";
	}

	/**
	 * 电力需求侧管理平台年占比
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/yearPie")
	public String toYearPie(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ChartXTData data = monitorService.getYearPie(Constants.eusCode,"31", DateUtils.getYear());
		data.setType("pie2d");
		request.setAttribute("width", "100%");
		request.setAttribute("height", "100%");
		request.setAttribute("swf", data.getType());
		request.setAttribute("data", data.getData());
		JSONObject json = new JSONObject();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return "common/chart-xt";
	}

	/**
	 * 电力需求侧管理平台年占比
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/yearBar")
	public String toYearBar(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		ChartXTData data = monitorService.getYearBar("","31", DateUtils.getYear());
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

	@RequestMapping("/tree")
	public String toTree(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String pid = request.getParameter("pid");
		String state = request.getParameter("type");
		JSONArray json = monitorService.getTree(pid, null);
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.getWriter().println(json);
		return null;
	}
	@RequestMapping("/yearmonthday")
	public String toYearMonthDay(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String eusCode=request.getParameter("id");
		
		if (eusCode == null || eusCode.equals("")) {
			eusCode=Constants.eusCode;
		}
		JSONObject json=monitorService.getYearMonthDayData(Constants.type,eusCode,"31");
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.getWriter().println(json);
		return null;
	}
	@RequestMapping("/daytable")
	public String toDayTable(HttpServletRequest request,
			HttpServletResponse response) throws IOException, InterruptedException {
		String eusCode=request.getParameter("id");
		if (eusCode == null || eusCode.equals("")) {
			eusCode=Constants.eusCode;
		}
		String date=request.getParameter("date");
		if(date==null||date.equals("")){
			date=DateUtils.getYearMonthDay();
		}else{
			date=date.replaceAll("-", "");
		}
		String mmpStr=request.getParameter("mmpName");
		JSONObject json=new JSONObject();
		List<EsmspSumMeasurOrganizationDay> list=monitorService.getOrganizationDayBymmpName(Constants.type,eusCode, mmpStr,new String[]{date});
		json.put("list", list);
		response.setContentType("application/json;charset=UTF-8");
		response.setCharacterEncoding("utf-8");
		response.getWriter().println(json);
		return null;
	}
	/**
	 * 电力需求侧管理平台动态监测日曲线
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/dayline")
	public String toDayline(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String eusCode=request.getParameter("id");
		if(eusCode==null){
			eusCode=Constants.eusCode;
		}else{
			if(eusCode.equals("")){
				eusCode=Constants.eusCode;
			}
		}
		String date=request.getParameter("date");
		if(date==null||date.equals("")){
			date=DateUtils.getYearMonthDay();
		}else{
			date=date.replaceAll("-", "");
			
		}
		String mmpStr=request.getParameter("mmpName");
		List<EsmspSumMeasurOrganizationDay> list=monitorService.getDayList(Constants.type,eusCode, mmpStr.replaceAll("@", "%"),date);
		ChartXTData data = monitorService.getDayLine(list);
		data.setType("msline");
		data.setWidth("500%");
		data.setHeight("90%");
		JSONObject json = new JSONObject();
		json.put("list", list);
		json.put("data", data);
		// json.put("caption", data.getCaption());
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
		String oragaCode = request.getParameter("ctdCode");// 组织编码
		JSONObject json = socketService.getRealDataByTypeAndCode("2",oragaCode);
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
	@RequestMapping("/test")
	public String test(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8"); 
		 InputStream is=request.getInputStream();
		String ctdCode = request.getParameter("deviceDataJson");// 表计编码
		System.out.println(ctdCode);
		//JSONObject json = socketService.getRealDataByCtdCode(ctdCode);
//		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
//		out.print(json);
		return null;
	}
}
