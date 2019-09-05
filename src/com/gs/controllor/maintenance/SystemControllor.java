package com.gs.controllor.maintenance;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.service.maintenance.SystemService;

/** 
 * @author 作者 朱亚彬: 
 * @version 创建时间：2017-9-18 上午09:47:23 
 * 描述： 设备维护管理————系统权限管理  控制层Controllor
 */
@Controller
@RequestMapping("/system")
public class SystemControllor {

	@Autowired
	public SystemService systemService;
	
	/**
	 * 跳转到 设备维护管理系统————系统权限管理》》用户管理
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/status")
	public String tostatus(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/status-index";
	}
	/**
	 * 跳转到 设备维护管理系统————系统权限管理》》角色授权
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/data")
	public String todata(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/data-index";
	}
	/**
	 * 跳转到 设备维护管理系统————系统权限管理》》模块管理
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/module")
	public String tofaultinfo(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/faultinfo-index";
	}
	/**
	 * 跳转到 设备维护管理系统————系统权限管理》》  编码管理
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/coding")
	public String toCoding(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/faultinfo-index";
	}
}
