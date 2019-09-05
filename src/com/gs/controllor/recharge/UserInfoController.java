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
import com.gs.domain.EsmspUserRechargeDetail;
import com.gs.domain.EsmspUserRechargeRecord;
import com.gs.service.recharge.UserInfoService;

import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年11月3日 上午9:57:01 描述： 充值用户信息管理
 */
@Controller
@RequestMapping("/rechargeUser")
public class UserInfoController {

	@Resource
	public UserInfoService userService;

	/**
	 * 跳转用户信息界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/userinfo")
	public String touser(HttpServletRequest request) {
		return "/recharge/userinfo";
	}

	/**
	 * 分页加载所有信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/dataUser")
	public String toDataUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		int total = userService.finCount();
		List<EsmspUserInfo> userlist = userService.findPageAll(pageIndex, pageSize);
		System.out.println("用户信息数据总数=====" + userlist.size());
		JSONObject json = new JSONObject();
		json.put("size", total);
		json.put("list", userlist);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 条件查询 用户信息
	 */
	@RequestMapping("/searchUser")
	public String toSearchSUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {

		String search = new String(request.getParameter("search").getBytes("ISO-8859-1"), "UTF-8");
		System.out.println("search==" + search);
		List<EsmspUserInfo> userlist = userService.findAllBySearch(search);
		System.out.println("用户信息数据总数=====" + userlist.size());
		JSONObject json = new JSONObject();
		json.put("list", userlist);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 仅加载 欠费用户信息
	 */
	@RequestMapping("/numUser")
	public String toNumUser(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
		List<EsmspUserInfo> userlist = userService.findAllByNum();
		System.out.println("用户信息数据总数=====" + userlist.size());
		JSONObject json = new JSONObject();
		json.put("list", userlist);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 添加、修改用户信息
	 */
	@RequestMapping("/addUser")
	public String toDataAddUser(HttpServletRequest request, HttpServletResponse response)
			throws IOException, Exception {

		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userAmount = request.getParameter("userAmount");
		String userTel = request.getParameter("userTel");
		String userAddress = request.getParameter("userAddress");
		String userNote = request.getParameter("userNote");
		String rightsId = request.getParameter("rightsId");

		EsmspUserInfo userinfo = new EsmspUserInfo();
		userinfo.setUserName(userName);
		userinfo.setUserAmount(Float.parseFloat(userAmount));
		userinfo.setUserTel(userTel);
		userinfo.setUserAddress(userAddress);
		userinfo.setUserNote(userNote);
		userinfo.setRightsId(rightsId);

		int falg = 0;
		if (userId != null) {
			userinfo.setUserId(userId);
			falg = userService.uppUser(userinfo);

		} else {
			GUID guid = new GUID();
			String id = guid.toString();
			userinfo.setUserId(id);
			falg = userService.saveUser(userinfo);
		}
		System.out.println("falg==" + falg);
		if (falg==1) {
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
	 * 删除 用户信息
	 */
	@RequestMapping("/delUser")
	public String toDelUserById(HttpServletRequest request,
			HttpServletResponse response) throws IOException, Exception{
		
		String userId=request.getParameter("userId");
//		EsmspUserInfo userinfo=userService.findById(userId);
		boolean falg=userService.delById(userId);
		PrintWriter out=response.getWriter();
		System.out.println("falg=="+falg);
		if(falg){
			out.print("success");
			return null;
		}else{
			out.print("error");
			return null;
		}
	}

	/**
	 * 查询一个 用户信息
	 */
	@RequestMapping("/findByID")
	public String toUserById(HttpServletRequest request,
			HttpServletResponse response) throws IOException, Exception{
		
		String userId=request.getParameter("userId");
		EsmspUserInfo userinfo=userService.findById(userId);
		JSONObject json = new JSONObject();
		json.put("userinfo", userinfo);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 删除 判断该ID下用户信息
	 */
	@RequestMapping("/delByFind")
	public String toFindUserById(HttpServletRequest request,
			HttpServletResponse response) throws IOException, Exception{
		
		String userId=request.getParameter("userId");
		
		//查询充值记录 通过外键ID
		List<EsmspUserRechargeRecord> recordlist = userService.findAllRecordById(userId);
		
		//查询消费记录 通过外键ID
		List<EsmspUserRechargeDetail> detaillist = userService.findAllDetailById(userId);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(recordlist.size()==0&&detaillist.size()==0){
			out.print("success");
			return null;
		}else{
			out.print("error");
			return null;
		}
		
	}
}
