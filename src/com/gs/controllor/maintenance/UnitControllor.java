package com.gs.controllor.maintenance;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.common.util.EnegryUnit;
import com.gs.domain.PomsCodeManagement;
import com.gs.domain.PomsEnergyUnitInfo;
import com.gs.service.maintenance.UnitService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017-9-18 上午09:47:23 描述： 设备维护管理————用能单位管理 控制层Controllor
 */
@Controller
@RequestMapping("/unit")
public class UnitControllor {

	// @Autowired

	@Resource
	public UnitService unitService;

	// 《———————————————————企业信息维护模块—————————————————————》》
	/**
	 * 跳转到 企业信息维护
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/unitinfo")
	public String tostatus(HttpServletRequest request) {
		return "/maintenance/unitInfo/unit-index";
	}

	/**
	 * 方法：treeInfo(用能单位全查询)
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/treeInfo")
	public String totreeInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		List<PomsEnergyUnitInfo> list = unitService.getAllEnegryUnit();
		JSONArray json = unitService.PingJieEnergyJson(list); // 得到拼接成的企业信息

		for (PomsEnergyUnitInfo p : list) {
			System.out.println(p.getEuiNames());
		}
		response.getWriter().println(json);
		return null;
	}

	/**
	 * 方法：用能单位信息
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/enegryInfo")
	public String toEnegryInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		// response.setContentType("text/html;charset=UTF-8");
		String enegryId = request.getParameter("enegryId");
		List<PomsEnergyUnitInfo> enegryList = unitService.findUnitById(enegryId);
		EnegryUnit eneUnit = new EnegryUnit();
		if (enegryList != null) {
			PomsEnergyUnitInfo peneInfo = enegryList.get(0);
			eneUnit.setId(peneInfo.getId());
			eneUnit.setEuiCode(peneInfo.getEuiCode());
			eneUnit.setEuiNames(peneInfo.getEuiNames());

			PomsCodeManagement parameter1 = new PomsCodeManagement();
			PomsCodeManagement parameter2 = new PomsCodeManagement();

			parameter1.setCmName(peneInfo.getEuiBelongIndustry());
			parameter1.setCmCodeType("HYFLBZGF");

			parameter2.setCmName(peneInfo.getEuiBelongDistrct());
			parameter2.setCmCodeType("BJSQYFLBZ");
			// 根据code查
			// 查询所属行业
			PomsCodeManagement code1 = this.unitService.findCodeBycmCode(parameter1);
			// 查询所属区县
			PomsCodeManagement code2 = this.unitService.findCodeBycmCode(parameter2);

			if (code1 != null) {
				eneUnit.setEuiBelongIndustry(code1.getCmId());
				eneUnit.setEuiBelongIndustry(code1.getCmCode());
				eneUnit.setEuiBelongIndustry1(code1.getCmName());
			}
			if (code2 != null) {
				eneUnit.setEuiBelongDistrct(code2.getCmId());
				eneUnit.setEuiBelongDistrct(code2.getCmCode());
				eneUnit.setEuiBelongDistrct1(code2.getCmName());
			}
			eneUnit.setEuiConsumeBand(peneInfo.getEuiConsumeBand());
			eneUnit.setEuiChargeDepartment(peneInfo.getEuiChargeDepartment());
			eneUnit.setEuiLocation(peneInfo.getEuiLocation());
			eneUnit.setEuiContentWay(peneInfo.getEuiContentWay());
			eneUnit.setEuiRepresentative(peneInfo.getEuiRepresentative());
			eneUnit.setEuiHoldPerson(peneInfo.getEuiHoldPerson());
			eneUnit.setEuiBackups(peneInfo.getEuiBackups());
			BigDecimal account = peneInfo.getEuiBuildingArea();
			eneUnit.setEuiBuildingArea(account.doubleValue());
			eneUnit.setParentName(peneInfo.getEuiParentid());

			List<PomsEnergyUnitInfo> list = unitService.getEnegry(peneInfo.getEuiParentid());

			if (list != null) {
				PomsEnergyUnitInfo p = list.get(0);
				if (p.getEuiParentid().equals("ROOT")) {
					eneUnit.setParentName("ROOT");
				} else {
					eneUnit.setParentName(p.getEuiNames());
				}
			}
		} else {
			PrintWriter out = response.getWriter();

			JSONObject json = new JSONObject();
			json.put("eneUnit", "");
			out.print(json);
		}
		PrintWriter out = response.getWriter();

		JSONObject json = new JSONObject();
		json.put("eneUnit", eneUnit);
		out.print(json);
		return null;
	}

	// 《———————————————————人员信息维护模块—————————————————————》》
	/**
	 * 跳转到 人员信息维护
	 * 
	 */
	@RequestMapping("/personInfo")
	public String toPersonInfo(HttpServletRequest request) {
		return "/maintenance/unitInfo/personInfo-index";
	}

	// 《———————————————————通讯路由配置模块—————————————————————》》
	/**
	 * 跳转到 通讯路由配置
	 * 
	 */
	@RequestMapping("/communication")
	public String toCommunication(HttpServletRequest request) {
		return "/maintenance/unitInfo/communication-index";
	}

	// 《———————————————————能耗统计配置模块—————————————————————》》
	/**
	 * 跳转到 能耗统计配置
	 * 
	 */
	@RequestMapping("/energyStatistics")
	public String toEnergyStatistics(HttpServletRequest request) {
		return "/maintenance/unitInfo/energyStatistics-index";
	}

	// 《———————————————————测量仪表配置模块—————————————————————》》
	/**
	 * 跳转到 测量仪表配置
	 * 
	 */
	@RequestMapping("/measureTable")
	public String toMeasureTable(HttpServletRequest request) {
		return "/maintenance/unitInfo/measureTable-index";
	}

	// 《———————————————————能耗负荷配置模块—————————————————————》》
	/**
	 * 跳转到 能耗负荷配置
	 * 
	 */
	@RequestMapping("/energyLoad")
	public String toEnergyLoad(HttpServletRequest request) {
		return "/maintenance/unitInfo/energyLoad-index";
	}

}
