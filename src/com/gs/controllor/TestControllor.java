package com.gs.controllor;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: gaosong
 * @date:2018-1-15 下午10:03:35
 * @version :1.0.0
 * 
 */
@Controller
@RequestMapping("/test")
public class TestControllor {
	@RequestMapping("/test")
	public String toAddUser(HttpServletRequest request) {
		return "/coolingsystem/ktxtgl";
	}
}
