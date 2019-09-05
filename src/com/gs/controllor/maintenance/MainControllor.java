package com.gs.controllor.maintenance;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 * @author 作者 朱亚彬: 
 * @version 创建时间：2017-9-18 上午09:47:23 
 * 描述： 设备维护管理系统————首页  控制层Controllor
 */
@Controller
@RequestMapping("/mainten")
public class MainControllor {
	/**
	 * 跳转到 设备维护管理系统	————	首页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/maintenance")
	public String toMaintenance(HttpServletRequest request) {
		return "/maintenance/maintenance-index";
	}
	/**
	 * 跳转到 设备维护管理系统	————	运行状态管理
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/runstatus")
	public String toRunstatus(HttpServletRequest request) {
		return "/maintenance/maintenance-index";
	}
}
