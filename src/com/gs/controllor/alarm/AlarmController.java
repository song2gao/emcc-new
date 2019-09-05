package com.gs.controllor.alarm;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gs.common.util.GUID;
import com.gs.domain.PomsOperationAssignmentSheet;
import com.gs.domain.PomsUsersManagement;
import com.gs.service.alarm.AlarmService;

import net.sf.json.JSONObject;

/**
 * @Package:com.gs.controllor
 * @author: ybzhu
 * @version:2017年11月7日 上午9:27:02 @描述：
 */
@Controller
@RequestMapping("/alarm")
public class AlarmController {

	@Resource
	public AlarmService alarmService;

	@RequestMapping("/alarminfo")
	public String tostatus(HttpServletRequest request) {
		return "/alarm/alarminfo";
	}

	/**
	 * 加载 报警信息
	 * 
	 * @param request
	 * @param response
	 * @param command
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/toDataAllAlarm")
	public String toDataAllAlarm(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {

		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		int total = alarmService.finCount();

		List<PomsOperationAssignmentSheet> sheetlist = alarmService.findAll(pageSize, pageIndex);
		for (PomsOperationAssignmentSheet sheet : sheetlist) {
			try {
				// 去查询 用户管理（PomsUsersManagement）表
				PomsUsersManagement user=alarmService.findById(sheet.getUmId());
				sheet.setUmName(user.getLoginName());
				PomsUsersManagement users=alarmService.findById(sheet.getOasProposer());
				sheet.setOasProposer(users.getLoginName());
				String is = sheet.getDealStatus();
				if (is == "1") {
					sheet.setDealStatus("已处理");
				} else if (is == "2") {
					sheet.setDealStatus("未处理");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("报警信息数据总数=====" + sheetlist.size());
		JSONObject json = new JSONObject();
		json.put("size", total);
		json.put("list", sheetlist);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * @throws IOException @Title: toFindByAll @Description: 加载表单
	 * 发起人列表 @param @param request @param @param response  @return String 返回类型 @throws
	 */
	@RequestMapping("/finByAll")
	public String toFindByAll(HttpServletRequest request, HttpServletResponse response) throws IOException {

		List<PomsUsersManagement> users = alarmService.findByAll();
		JSONObject json = new JSONObject();
		json.put("list", users);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 添加、修改报警信息
	 */
	@RequestMapping("/addAlarm")
	public String toAddAlarm(PomsOperationAssignmentSheet sheet,HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		
		String userName = request.getParameter("umName");
		sheet.setUmId(userName);
		String sheetID = request.getParameter("sheetID");
		boolean falg = false;
		if (sheetID == ""||sheetID==null) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			String time=df.format(new Date());
			sheet.setProposeTime(time);
			GUID gu = new GUID();
			String id = gu.toString();
			System.out.println(id);
			sheet.setId(id);
//			if(sheet.getOasProposer()!=null){
//				PomsUsersManagement users=alarmService.findByName(sheet.getOasProposer());
//				sheet.setOasProposer(users.getId());
//			}
//			PomsUsersManagement user=alarmService.findByName(userName);
//			sheet.setUmId(user.getId());
			 falg=alarmService.saveAlarm(sheet);
		} else {
			PomsUsersManagement users=alarmService.findByName(sheet.getOasProposer());
			sheet.setOasProposer(users.getId());
			sheet.setDealStatus("1");
			sheet.setId(sheetID);
			PomsUsersManagement user=alarmService.findByName(userName);
			sheet.setUmId(user.getId());
			 falg=alarmService.updateAlarm(sheet);
		}
		if (falg) {
			System.out.println("操作成功");
			PrintWriter out = response.getWriter();
			out.print("success");
			return null;
		} else {
			System.out.println("操作失败");
			PrintWriter out = response.getWriter();
			out.print("error");
			return null;
		}
	}
	
	/**
	 * 删除 报警信息一个
	 */
	@RequestMapping("/toDelAlarmById")
	public String toDelAlarmById(HttpServletRequest request,
			HttpServletResponse response) throws IOException, Exception{
		
		
		String[] array = request.getParameterValues("array[]"); 
		
		System.out.println("======="+array);
		
//		String id=request.getParameter("id");
		
		boolean falg=alarmService.delAlarm(array);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(falg){
			out.print("success");
			return null;
		}else{
			out.print("error");
			return null;
		}
	}
	/**
	 * 条件查询 用户信息
	 */
	@RequestMapping("/toSearchAlarm")
	public String toSearchAlarm(HttpServletRequest request,
			HttpServletResponse response) throws IOException, Exception{
		
		String search = new String(request.getParameter("search").getBytes(
		"ISO-8859-1"), "UTF-8");
		System.out.println(search);
		String alarminfo = new String(request.getParameter("alarminfo").getBytes(
		"ISO-8859-1"), "UTF-8");
		System.out.println(alarminfo);
		String isok = new String(request.getParameter("isok").getBytes(
		"ISO-8859-1"), "UTF-8");
		System.out.println(isok);
		String date = new String(request.getParameter("date").getBytes(
		"ISO-8859-1"), "UTF-8");
		System.out.println(date);
		
		List<PomsOperationAssignmentSheet> sheet=new ArrayList<PomsOperationAssignmentSheet>(); 
		sheet = alarmService.findAllBySearch(search,alarminfo,isok,date);
		for (PomsOperationAssignmentSheet sheets : sheet) {
			try {
				// 去查询 用户管理（PomsUsersManagement）表
				PomsUsersManagement users = alarmService.findById(sheets.getUmId());
				sheets.setUmName(users.getLoginName());
				String is = sheets.getDealStatus();
				if (is == "1") {
					sheets.setDealStatus("已处理");
				} else if (is == "2") {
					sheets.setDealStatus("未处理");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("条件查询数据总数====="+sheet.size());
		JSONObject json = new JSONObject();
		json.put("list", sheet);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	
	/**  
	* @Title: uppAlarm  
	* @Description:   双击单元格修改
	* @return String
	* @throws  
	*/  
	@RequestMapping("/uppAlarm")
	@ResponseBody  
	public String toUppdate(String test,HttpServletRequest request, HttpServletResponse response) throws IOException{
		JSONObject json=JSONObject.fromObject(test);
		PomsOperationAssignmentSheet sheet=(PomsOperationAssignmentSheet)JSONObject.toBean(json,PomsOperationAssignmentSheet.class);
		boolean flag=alarmService.updateAlarm(sheet);
		
		if (flag) {
			System.out.println("操作成功");
			PrintWriter out = response.getWriter();
			out.print("success");
			return null;
		} else {
			System.out.println("操作失败");
			PrintWriter out = response.getWriter();
			out.print("error");
			return null;
		}
	}
}
