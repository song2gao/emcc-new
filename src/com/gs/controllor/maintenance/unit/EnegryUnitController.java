package com.gs.controllor.maintenance.unit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.common.util.Constants;
import com.gs.common.util.EnegryUnit;
import com.gs.common.util.GUID;
import com.gs.domain.PomsCalculateTerminalModel;
import com.gs.domain.PomsCodeManagement;
import com.gs.domain.PomsEnergyUnitInfo;
import com.gs.service.maintenance.unit.EnergryUnitService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年10月26日 上午11:54:18 描述： 用能单位控制类
 */
@Controller
@RequestMapping("unit/enegryUnit")
public class EnegryUnitController {

	@Resource
	public EnergryUnitService enegryUintService;

	/**
	 * 方法： treeByCode
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/treeByCode")
	public String toTreeByCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		// 接收页面穿过来的参数
		String type = request.getParameter("type");
		System.out.println(type);
		List<PomsCodeManagement> lst = null;

		if ("euiBelongIndustry1".equals(type)) {
			// 查询各个行业
			lst = this.enegryUintService.findCodeByParentId(Constants.CM_INDUSTRY_ID);
		} else if ("euiBelongDistrct1".equals(type)) {
			// 查询各个区县
			lst = this.enegryUintService.findCodeByParentId(Constants.CM_AREA_ID);
		} else if ("engrgytype".equals(type)) {

			lst = this.enegryUintService.findCodeByParentId(Constants.CM_ENGRGYTYPE_ID);
		}
		JSONObject obj = new JSONObject();
		obj.put("lst", lst);

		PrintWriter out = response.getWriter();
		out.print(obj);
		return null;
	}

	/**
	 * 方法： 树子节点下查询treeId
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/treeId")
	public String totreeId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		String enegryid = request.getParameter("eid");
		// 取得企业子项
		List<PomsEnergyUnitInfo> list = enegryUintService.findUnitById(enegryid);
		String flogforsssj = request.getParameter("ss");
		//
		JSONArray json = enegryUintService.PingJieEnegryJson(list, flogforsssj, enegryid);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 方法：添加、修改
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("addUnit")
	public String toAddUnit(EnegryUnit unit, HttpServletResponse response) throws IOException {

		PomsEnergyUnitInfo pomsUnit = new PomsEnergyUnitInfo();

		pomsUnit.setEuiCode(unit.getEuiCode());
		pomsUnit.setEuiNames(unit.getEuiNames());
		pomsUnit.setEuiBelongIndustry(unit.getEuiBelongIndustry1());
		pomsUnit.setEuiContentWay(unit.getEuiContentWay());
		pomsUnit.setEuiHoldPerson(unit.getEuiHoldPerson());
		pomsUnit.setEuiConsumeBand(unit.getEuiConsumeBand());
		pomsUnit.setEuiParentid(unit.getParentName());
		pomsUnit.setEuiRepresentative(unit.getEuiRepresentative());
		pomsUnit.setEuiBelongDistrct(unit.getEuiBelongDistrct1());
		pomsUnit.setEuiLocation(unit.getEuiLocation());
		double building = unit.getEuiBuildingArea();
		java.math.BigDecimal bd = new java.math.BigDecimal(building);
		pomsUnit.setEuiBuildingArea(bd);
		pomsUnit.setEuiChargeDepartment(unit.getEuiChargeDepartment());
		pomsUnit.setEuiBackups(unit.getEuiBackups());
		int falg = 0;
		if (unit.getId() == "") {
			GUID guid = new GUID();
			String id = guid.toString();
			pomsUnit.setId(id);
			falg = enegryUintService.saveUnit(pomsUnit);
		} else {
			pomsUnit.setId(unit.getId());
			falg = enegryUintService.updateUnit(pomsUnit);
			falg = 2;
		}
		PrintWriter out = response.getWriter();

		out.print(falg);

		return null;
	}

	/**
	 * 方法：删除
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("deleteEnegryInfo")
	public String todeleteEnegryInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		String id = request.getParameter("eid");

		int flag = enegryUintService.delUnitInfo(id);

		PrintWriter out = response.getWriter();
		out.print(flag);
		return null;
	}

	/**
	 * 方法：查询一个
	 */
	@RequestMapping("/unitByID")
	public String toUnitByID(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		String id = request.getParameter("eid");
		List<PomsEnergyUnitInfo> unit = enegryUintService.findUnitById(id);
		PomsEnergyUnitInfo unitinfo = unit.get(0);
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		json.put("unitinfo", unitinfo);
		out.print(json);
		return null;
	}
	/**
	 * 方法：查询一个 测量表模块
	 */
	@RequestMapping("/findUnitByID")
	public String toFindUnitByID(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		String id = request.getParameter("eid");
		List<PomsCalculateTerminalModel> unit = enegryUintService.findUnitModelById(id);
		PomsCalculateTerminalModel unitinfo = unit.get(0);
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		json.put("unitinfo", unitinfo);
		out.print(json);
		return null;
	}
	/**
	 * 方法：全查询 测量表模块
	 */
	@RequestMapping("/findUnitModelAll")
	public String toFindUnitAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
//		String id = request.getParameter("eid");
		List<PomsCalculateTerminalModel> model = enegryUintService.findUnitModelAll();
		PrintWriter out = response.getWriter();
		JSONObject json = new JSONObject();
		json.put("model", model);
		out.print(json);
		return null;
	}
}
