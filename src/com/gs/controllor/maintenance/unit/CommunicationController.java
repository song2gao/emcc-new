package com.gs.controllor.maintenance.unit;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.service.maintenance.unit.CommunicationService;

import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年10月26日 上午11:56:50 描述： 通讯路由控制类
 */
@Controller
@RequestMapping("/unit/communication")
public class CommunicationController {

	@Resource
	public CommunicationService communService;

	/**
	 * table tt 全查询
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/communInfo")
	public String tocommunInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {


		JSONObject json = new JSONObject();
//		json.put("list", list);
//		json.put("size", count);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}
}
