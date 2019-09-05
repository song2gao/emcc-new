package com.gs.controllor.maintenance.unit;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gs.domain.PomsAssembledTerminalDevice;
import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.service.maintenance.unit.InventoryService;

import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年10月26日 上午11:51:54 描述： 测量仪表控制类
 */
@Controller
@RequestMapping("unit/inventory")
public class InventoryController {

	@Resource
	public InventoryService inService;

	/**
	 * 方法：  全查询用能单位信息 table="cc"
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getEneUnits", method = RequestMethod.POST)
	public String toGetEneUnits(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		JSONObject json = new JSONObject();
		String pageIndex = request.getParameter("pageIndex");
		String pageSize = request.getParameter("pageSize");
		json = inService.getEnegryUints(pageIndex, pageSize, null);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 方法：  全查询采集终端设备的信息 table="dd"
	 * 
	 * @param request
	 * @return
	 */
	// @RequestMapping(value = "/getAss", method = RequestMethod.POST)
	@RequestMapping("/getAss")
	public String toGetAss(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		JSONObject json = new JSONObject();
		String pageIndex = request.getParameter("pageIndex");
		String pageSize = request.getParameter("pageSize");
		String unitid = request.getParameter("enegryUnitId");
		json = inService.getAss(pageIndex, pageSize, unitid);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 方法：  全查询采集计量终端信息 table="ee"
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/getDeviceConfigs")
	public String toGetDeviceConfigs(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		JSONObject json = new JSONObject();
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex").toString());
		int pageSize = Integer.parseInt(request.getParameter("pageSize").toString());
		String unitid = request.getParameter("unitid");
		String calculteid = request.getParameter("calculteid");
		json = inService.getCalculte(unitid, calculteid, pageIndex, pageSize);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 方法：  添加前查询前置机列表信息 table="dd"
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/getFrontConfig")
	public String toGetFrontConfig(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		JSONObject json = inService.getfpc();
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 方法：  添加 table="dd"
	 */
	@RequestMapping("/saveAssembled")
	public String toSaveAssembled(HttpServletRequest request, HttpServletResponse response,
			PomsAssembledTerminalDevice ass) throws IOException {

		// 用能单位ID
		String eid = request.getParameter("eid");
		// 前置机ID
		String qzjid = request.getParameter("qzjid");
		int bool = inService.saveAssembled(ass, eid, qzjid);

		System.out.println(bool);
		// boolean bool=true;
		// if(bool){
		// this.Add_BUSSINESS_LOG(request, "新增一个采集终端设备","1");
		// }
		PrintWriter out = response.getWriter();
		out.print(bool);
		return null;
	}

	/**
	 * 方法：  修改 table="dd"
	 */
	@RequestMapping("/saveOrUpdateAssembled")
	public String tosaveOrUpdateAssembled(HttpServletRequest request, HttpServletResponse response,
			PomsAssembledTerminalDevice ass) throws IOException {
		// 用能单位ID
		String eid = request.getParameter("eid");
		// 采集器ID
		String pid = request.getParameter("pid");

		int bool = inService.saveOrUpdateAssembled(ass, eid, pid);

		PrintWriter out = response.getWriter();
		out.print(bool);
		return null;
	}

	/**
	 * 方法：  删除 table="dd"
	 */
	@RequestMapping("/delAssembled")
	public String todelAssembled(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 用能单位ID
		String eid = request.getParameter("eid");
		// 采集器ID
		String pid = request.getParameter("pid");

		System.out.println(eid + "===" + pid);

		int bool = inService.delAssembled(eid, pid);
		System.out.println(bool);
		PrintWriter out = response.getWriter();
		out.print(bool);
		return null;
	}

	/**
	 * 方法：  添加 table="ee" 
	 * @throws IOException 
	 */
	@RequestMapping("/saveMeter")
	public String tosaveMeter(HttpServletRequest request, HttpServletResponse response,PomsCalculateTerminalDevice calculate) throws IOException{
		
		// 采集器ID
		String aid = request.getParameter("aid");
		//
		String bid = request.getParameter("bid");
		int bool=0;
		PrintWriter out = response.getWriter();
		if(bid==""){
			bool = inService.saveMeter(calculate,aid);
			out.print(bool);
			return null;
		}else{
			calculate.setId(bid);
			calculate.setCdtAssembleid(aid);
			bool = inService.uppMeter(calculate);
			out.print(bool);
			return null;
		}
		
	}
	/**
	 * 方法：   删除 table="ee"
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/delCalculte")
	public String todelCalculte(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String calculIds = request.getParameter("calculIds");
		
		int bool=inService.delMeter(calculIds);
		
		PrintWriter out = response.getWriter();
		out.print(bool);
		return null;
	}
	
}
