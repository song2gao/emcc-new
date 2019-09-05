package com.gs.service;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

public interface LoginService {
	JSONObject loginUser(String name,String pwd,String type,HttpServletRequest request);
}
