package com.gs.controllor.maintenance;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.service.maintenance.RunStatusService;

import net.sf.json.JSONObject;

/** 
 * @author 作者 朱亚彬: 
 * @version 创建时间：2017-9-18 上午09:47:23 
 * 描述： 设备维护管理系统————运行状态监控  控制层Controllor
 */
@Controller
@RequestMapping("/runStatus")
public class RunStatusControllor {

	@Autowired
	public RunStatusService runService;
	
	//《———————————————————实时状态监视模块—————————————————————》》
	/**
	 * 跳转到 设备维护管理系统————运行状态监控》》实时状态监视
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/status")
	public String tostatus(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/status-index";
	}
	/**
	 * 跳转到 设备维护管理系统————运行状态监控》》实时状态监视》》前置机服务跳转
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/status-frontend")
	public String tofrontend(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/status-frontend";
	}
	/**
	 * 跳转到 设备维护管理系统————运行状态监控》》实时状态监视》》前置机服务跳转2
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/status-frontendName")
	public String tofrontendName(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/status-frontendName";
	}
	/**
	 * 跳转到 设备维护管理系统————运行状态监控》》实时状态监视》》前置机服务跳转3
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/status-frontends")
	public String tofrontends(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/status-frontends";
	}
	
	//《———————————————————实时数据监视模块—————————————————————》》
	/**
	 * 跳转到 设备维护管理系统————运行状态监控》》实时数据监视
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/data")
	public String todata(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/data-index";
	}
	//《———————————————————故障记录报警模块—————————————————————》》
	/**
	 * 跳转到 设备维护管理系统————运行状态监控》》故障记录报警
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/faultinfo")
	public String tofaultinfo(HttpServletRequest request) {
		return "/maintenance/runningState/faultinfo/faultinfo-index";
	}
	/**
	 * 跳转到 故障记录报警>>>通过 ID 查询所有  返回  josn格式
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/frontendList")
	public String toGetPie(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Charset", "UTF-8");
		String id = request.getParameter("id");
		JSONObject json = new JSONObject();
		json = runService.findFrontendById(id);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 跳转到 故障记录报警>>>通过 ID 查询所有  返回  josn格式
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/frontendGet")
	public String toFrontendget(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Charset", "UTF-8");
		JSONObject json = new JSONObject();
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex").toString());
		int pageSize = Integer.parseInt(request.getParameter("pageSize").toString());
		String names = request.getParameter("names");
		String ports = request.getParameter("ports");
		json = runService.getFrontend(names, ports, pageIndex, pageSize);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	
}
