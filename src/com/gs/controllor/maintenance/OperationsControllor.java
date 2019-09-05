package com.gs.controllor.maintenance;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.service.maintenance.OperationsService;

/** 
 * @author 作者 朱亚彬: 
 * @version 创建时间：2017-9-18 上午09:47:23 
 * 描述： 设备维护管理————运维业务管理  控制层Controllor
 */
@Controller
@RequestMapping("/operations")
public class OperationsControllor {

	@Autowired
	public OperationsService operationsService;
	
	/**
	 * 跳转到 设备维护管理系统————运维业务管理》》计量终端模型
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/meterModel")
	public String tostatus(HttpServletRequest request) {
		return "/maintenance/operations/metermodel-index";
	}
	
	/**
	 * 跳转到 设备维护管理系统————运维业务管理》》接入测试管理
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/data")
	public String todata(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/data-index";
	}
	/**
	 * 跳转到 设备维护管理系统————运维业务管理》》平台日志管理
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/faultinfo")
	public String tofaultinfo(HttpServletRequest request) {
		return "/maintenance/runningState/realtimestatus/faultinfo-index";
	}
	
}
