package com.gs.controllor.maintenance.operations;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.domain.PomsCalculateTerminalModel;
import com.gs.domain.PomsModleMeasurPoint;
import com.gs.service.maintenance.operations.MeterService;

import net.sf.json.JSONObject;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年11月1日 下午2:52:22 
* 描述： 计量终端模型
*/
@Controller
@RequestMapping("operations/meter")
public class MeterController {

	@Resource
	public MeterService meterService;
	
	/**
	 * 方法：模型表分页全查询 计量模型终端
	 * 
	 * @throws IOException
	 */
	@RequestMapping("meter")
	public String toAllPersonInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		String pageIndex = request.getParameter("pageIndex");
		String pageSize = request.getParameter("pageSize");

		String pname = request.getParameter("pname");
		String pcodes = request.getParameter("pcodes");

		PomsCalculateTerminalModel calmodel = new PomsCalculateTerminalModel();
		calmodel.setCtmNames(pname);
		calmodel.setCtmCodes(pcodes);

		List<PomsCalculateTerminalModel> list = meterService.getPersonPage(calmodel, Integer.parseInt(pageIndex),
				Integer.parseInt(pageSize));

		int count = meterService.getCount();

		JSONObject json = new JSONObject();
		json.put("list", list);
		json.put("size", count);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 方法：模型测点表分页全查询 计量模型终端
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("measurPoint")
	public String toMeasurPoint(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		String pageIndex = request.getParameter("pageIndex");
		String pageSize = request.getParameter("pageSize");

		String pname = request.getParameter("pname");
		String pcodes = request.getParameter("pcodes");
		
		PomsModleMeasurPoint measurPoint = new PomsModleMeasurPoint();
		measurPoint.setMmpNames(pname);
		measurPoint.setMmpCodes(pcodes);

		List<PomsModleMeasurPoint> list = meterService.getPersonPage(measurPoint, Integer.parseInt(pageIndex),Integer.parseInt(pageSize));

		int count = meterService.getCountByMeasurPoint();

		JSONObject json = new JSONObject();
		json.put("list", list);
		json.put("size", count);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

}
