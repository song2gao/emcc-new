package com.gs.controllor.alarm;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.domain.PomsDeviceMeasurPoint;
import com.gs.service.alarm.AlarmPointService;

import net.sf.json.JSONObject;

/** 
* @Package:com.gs.controllor.alarm 
* @author:  ybzhu
* @version:2017年11月22日 下午4:56:18 
* @描述： 表 报警功能
*/
@Controller
@RequestMapping("/point")
public class AlarmPointController {

	
	@Resource
	private AlarmPointService pointService;
	
	@RequestMapping("/pointInfo")
	public String selectAll(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String condes=request.getParameter("codes");
		String calId=request.getParameter("calId");
		PomsDeviceMeasurPoint point=new PomsDeviceMeasurPoint();
		point.setMmpCodes(condes);
		point.setCalId(calId);
		List<PomsDeviceMeasurPoint> pointList=pointService.selectAll(point);
		System.out.println("报警信息数据总数=====" + pointList.size());
		List<PomsCalculateTerminalDevice> cal=null;
		if(calId!=null){
			PomsCalculateTerminalDevice calmodel=new PomsCalculateTerminalDevice();
			calmodel.setCtdCodes(calId);
			cal=pointService.getName(calmodel);
		}
		JSONObject json = new JSONObject();
		json.put("list", pointList);
		json.put("name", cal.get(0).getCdtMeasureLoop());
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	@RequestMapping("/uppPoint")
	public String uppPoint(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String ctdCode=request.getParameter("ctdCode");
		String mmpCode=request.getParameter("mmpCode");
		String up=request.getParameter("up");
		String down=request.getParameter("down");
		PomsDeviceMeasurPoint point=new PomsDeviceMeasurPoint();
		point.setCalId(ctdCode);
		BigDecimal sup=new BigDecimal(up);
		point.setMmpUpValue(sup);
		BigDecimal sdown=new BigDecimal(down);
		point.setMmpDownValue(sdown);
		PomsDeviceMeasurPoint list=pointService.getPojo(ctdCode,mmpCode);
		point.setMmpCodes(list.getMmpCodes());
		int flag=pointService.uppPointById(point);
		response.setContentType("text/html;charset=UTF-8");
		if (flag==1) {
			PrintWriter out = response.getWriter();
			out.print(flag);
			return null;
		} else {
			PrintWriter out = response.getWriter();
			out.print(flag);
			return null;
		}
	}
	
}
