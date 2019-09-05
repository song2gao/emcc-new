package com.gs.controllor;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ywindex")
public class OperationIndexController {
	/**
	 * 跳转到运维管理平台首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String toAddUser(HttpServletRequest request){
		return "/ywxx/business-index";
	}
}
