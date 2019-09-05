package com.gs.controllor.recharge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.domain.EsmspUserInfo;
import com.gs.domain.EsmspUserRechargeRecord;
import com.gs.service.recharge.RecordService;
import com.gs.service.recharge.UserInfoService;

import net.sf.json.JSONObject;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年11月3日 上午9:59:24 
* 描述： 充值记录查询
*/
@Controller
@RequestMapping("/rechargeRecord")
public class RecordController {

	@Resource
	public RecordService recordService;
	@Resource
	public UserInfoService userService;
	/**
	 * 跳转充值信息界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/recordinfo")
	public String touser(HttpServletRequest request) {
		return "/recharge/record";
	}
	
	/**
	 * 加载 充值记录 页面
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/recordAll")
	public String toDataRecord(HttpServletRequest request,
			HttpServletResponse response) throws IOException, Exception{
		int pageSize=Integer.parseInt(request.getParameter("pageSize"));
		int pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		int total=recordService.finCountRecord();
		List<EsmspUserRechargeRecord> userlist = recordService.findPageAllRecord(pageIndex,pageSize);
		System.out.println("充值记录数据总数====="+userlist.size());
		for (EsmspUserRechargeRecord record : userlist) {
			EsmspUserInfo user = userService.findById(record.getUserId());
			record.setUserTel(user.getUserTel());
			record.setUserAddress(user.getUserAddress());
			record.setUserId(user.getUserName());
		}
		JSONObject json = new JSONObject();
		json.put("size", total);
		json.put("list", userlist);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	/**
	 * 条件查询 充值记录信息
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/toSearchRecord")
	public String toSearchRecord(HttpServletRequest request,
			HttpServletResponse response ) throws  IOException, Exception{
		
		String search = new String(request.getParameter("search").getBytes(
		"ISO-8859-1"), "UTF-8");
		String beforeDate = new String(request.getParameter("beforeDate").getBytes(
		"ISO-8859-1"), "UTF-8");
		String alterDate = new String(request.getParameter("alterDate").getBytes(
		"ISO-8859-1"), "UTF-8");
		
		List<EsmspUserRechargeRecord> recordlist = recordService.findRecordBySearch("%"+search+"%",beforeDate,alterDate);
		System.out.println("条件查询 充值记录信息数据总数====="+recordlist.size());
		for (EsmspUserRechargeRecord record : recordlist) {
			EsmspUserInfo user = userService.findById(record.getUserId());
			record.setUserTel(user.getUserTel());
			record.setUserAddress(user.getUserAddress());
			record.setUserId(user.getUserName());
		}
		JSONObject json = new JSONObject();
		json.put("list", recordlist);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
}
