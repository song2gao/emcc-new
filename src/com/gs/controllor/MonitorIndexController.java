package com.gs.controllor;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class MonitorIndexController {
	/**
	 * 跳转到电力需求侧管理平台首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String toAddUser(HttpServletRequest request){
		return "/DSM/index/shouye";
	}
	/**
	 * 跳转到节能控制系统首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/coolingsystem")
	public String toCoolingSystem(HttpServletRequest request){
		return "/coolingsystem/shouye";
	}
}
