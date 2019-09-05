package com.gs.controllor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	public LoginService login;
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String uName=request.getParameter("uname");
		String uPwd=request.getParameter("upwd");
		String type=request.getParameter("type");
		JSONObject json=login.loginUser(uName, uPwd, type,request);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

}
