package com.gs.controllor.control;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/controlindex")
public class IndexController {

	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/index")
	public String toIndex(HttpServletRequest request){
		return "/energycontrol/index/shouye";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/nhzljc")
	public String toNhzljc(HttpServletRequest request){
		return "/energycontrol/monitor/nhzljc-new";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/jnmbjc")
	public String toJnmbjc(HttpServletRequest request){
		return "/energycontrol/monitor/jnmbjc-new";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/ynfhjc")
	public String toYnfhjc(HttpServletRequest request){
		return "/energycontrol/monitor/ynfhjc-new";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/ynssjc")
	public String toYnssjc(HttpServletRequest request){
		return "/energycontrol/monitor/ynssjc-new";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/hjcsjc")
	public String toHjcsjc(HttpServletRequest request){
		return "/energycontrol/monitor/hjcsjc-new";
	}
	
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/nhqsfx")
	public String toNhqsfx(HttpServletRequest request){
		return "/energycontrol/statistics/nhqsfx-zf";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/cpdhfx")
	public String toCpdhfx(HttpServletRequest request){
		return "/energycontrol/statistics/cpdhfx";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/dldhfx")
	public String toDldhfx(HttpServletRequest request){
		return "/energycontrol/statistics/dldhfx";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/yddhbb")
	public String toYddhbb(HttpServletRequest request){
		return "/energycontrol/statistics/yddhbb";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/lsqxcx")
	public String toLsqxcx(HttpServletRequest request){
		return "/energycontrol/statistics/ynfhjc";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/jzynzl")
	public String toJzynzl(HttpServletRequest request){
		return "/energycontrol/statistics/jzynzl";
	}
	/**
	 * 跳转到能源管控系统--首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/ynfxfx")
	public String toYnfxfx(HttpServletRequest request){
		return "/energycontrol/statistics/ynfxfx";
	}
}
