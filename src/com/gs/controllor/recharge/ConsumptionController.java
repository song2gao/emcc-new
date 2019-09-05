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
import com.gs.domain.EsmspUserRechargeDetail;
import com.gs.service.recharge.ConsumptionService;
import com.gs.service.recharge.UserInfoService;

import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年11月3日 上午9:59:45 描述： 充值消费记录查询
 */
@Controller
@RequestMapping("/rechargeConsumption")
public class ConsumptionController {

	@Resource
	public UserInfoService userService;
	@Resource
	public ConsumptionService cosumptionService;

	/**
	 * 跳转消费记录界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/cosumption")
	public String touser(HttpServletRequest request) {
		return "/recharge/consumption";
	}

	/**
	 * 加载 消费明细 页面
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/detaileAll")
	public String toDataDetail(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
		// 分组加载充值记录
		// List<EsmspUserRechargeRecord> record =
		// rechargeService.findGroupByRecord();
		// for (EsmspUserRechargeRecord records : record) {
		// records.setUserNames(records.getEsmspUserInfo().getUserName());
		//
		// }

		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		int total = cosumptionService.finCountDetail();
		List<EsmspUserRechargeDetail> userlist = cosumptionService.findPageAllDetail(pageIndex, pageSize);
		System.out.println("消费明细数据总数=====" + userlist.size());
		for (EsmspUserRechargeDetail detail : userlist) {
			EsmspUserInfo user = userService.findById(detail.getUserId());
			detail.setUserTel(user.getUserTel());
			detail.setUserId(user.getUserName());
		}

		JSONObject json = new JSONObject();
		json.put("list", userlist);
		json.put("size", total);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	
	/**
	 * 条件查询 消费明细信息
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/searchDetail")
	public String toSearchDetail(HttpServletRequest request,
			HttpServletResponse response ) throws  IOException, Exception{
		
		String search = new String(request.getParameter("search").getBytes(
		"ISO-8859-1"), "UTF-8");
		String beforeDate = new String(request.getParameter("beforeDate").getBytes(
		"ISO-8859-1"), "UTF-8");
		List<EsmspUserRechargeDetail> detaillist = cosumptionService.findDetailBySearch("%"+search+"%",beforeDate);
		System.out.println("条件查询 消费明细数据总数====="+detaillist.size());
		for (EsmspUserRechargeDetail detail : detaillist) {
			EsmspUserInfo user = userService.findById(detail.getUserId());
			detail.setUserTel(user.getUserTel());
			detail.setUserId(user.getUserName());
		}
		JSONObject json = new JSONObject();
		json.put("list", detaillist);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

}
