package com.gs.controllor.recharge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.common.util.GUID;
import com.gs.domain.EsmspUserInfo;
import com.gs.domain.EsmspUserRights;
import com.gs.service.recharge.UserRightService;

import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年11月3日 上午9:57:01 描述： 充值用户权限管理
 */
@Controller
@RequestMapping("/userRight")
public class UserRightController {

	@Resource
	public UserRightService rightService;

	/**
	 * 跳转用户权限界面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/userright")
	public String touser(HttpServletRequest request) {
		return "/recharge/userright";
	}

	/**
	 * 分页加载所有信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/dataUserRights")
	public String toDataRights(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		int total = rightService.finCount();
		List<EsmspUserRights> userlist = rightService.findPageAll(pageIndex, pageSize);
		System.out.println("用户权限数据总数=====" + userlist.size());
		JSONObject json = new JSONObject();
		json.put("size", total);
		json.put("list", userlist);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	
	/**
	 * 加载 用户权限 关联用户信息
	 */
	@RequestMapping("/toDataRightsAndUser")
	public String toDataRightsAndUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {
		response.setContentType("text/html;charset=UTF-8");
		String rightsId = new String(request.getParameter("rightsId").getBytes("ISO-8859-1"), "UTF-8");
		List<EsmspUserInfo> userlist = rightService.findAllById(rightsId);
		System.out.println(" 用户权限 关联用户信息总数=====" + userlist.size());
		JSONObject json = new JSONObject();
		json.put("list", userlist);
		json.put("size", userlist.size());
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
	
	/**
	 * 添加 、修改用户权限
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/toDataAddRights")
	public String toDataAddRights(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {

		String rightsId = request.getParameter("rightsId");
		String rightsName = request.getParameter("rightsName");
		String rightsStyle = request.getParameter("rightsStyle");

		EsmspUserRights right = new EsmspUserRights();
		right.setRightsName(rightsName);
		right.setRightsStyle(rightsStyle);

		boolean falg = false;
		if (rightsId != null) {
			right.setRightsId(rightsId);
			falg = rightService.uppRights(right);
		} else {
			GUID guid = new GUID();
			String id = guid.toString();
			right.setRightsId(id);
			falg = rightService.saveRights(right);
		}
		System.out.println("falg==" + falg);
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

}
