package com.gs.controllor.maintenance.unit;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gs.common.util.GUID;
import com.gs.domain.PomsPersonalsInfo;
import com.gs.service.maintenance.unit.PersonInfoService;

import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年10月26日 上午11:55:01 
 * 描述： 人员信息维护  
 */
@Controller
@RequestMapping("unit/person")
public class PersonInfoController {

	@Resource
	public PersonInfoService personService;

	/**
	 * 方法：全查询 人员信息维护
	 * 
	 * @throws IOException
	 */
	@RequestMapping("person")
	public String toAllPersonInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		String pageIndex = request.getParameter("pageIndex");
		String pageSize = request.getParameter("pageSize");
		String unitid = request.getParameter("qyid");

		String pname = request.getParameter("pname");
		String pcodes = request.getParameter("pcodes");

		PomsPersonalsInfo person = new PomsPersonalsInfo();
		person.setEuiId(unitid);
		person.setPiName(pname);
		person.setPiCodes(pcodes);

		List<PomsPersonalsInfo> list = personService.getPersonPage(person, Integer.parseInt(pageIndex),
				Integer.parseInt(pageSize));

		int count = personService.getCount(unitid);

		JSONObject json = new JSONObject();
		json.put("list", list);
		json.put("size", count);
		PrintWriter out = response.getWriter();
		out.print(json);
		return null;
	}

	/**
	 * 方法：人员信息维护 添加、修改
	 */
	@RequestMapping("savePerson")
	public String tosavePerson(PomsPersonalsInfo info, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		int flag = 0;
		if (info.getId() == "") {
			GUID guid = new GUID();
			String id = guid.toString();
			info.setId(id);
			flag = personService.savePerson(info);
		} else {
			flag = personService.uppPerson(info);
		}
		PrintWriter out = response.getWriter();
		if (flag == 1) {
			out.print("success");
		} else {
			out.print("error");
		}
		return null;
	}

	/**
	 * 方法：人员信息维护 删除
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("delPerson")
	public String toDelPerson(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("application/json;charset=UTF-8");
		String id = request.getParameter("pid");

		int flag = personService.delPersonInfo(id);

		PrintWriter out = response.getWriter();
		out.print(flag);
		return null;
	}

	/**
	 * 方法 查询方法 废弃了！！！
	 * 
	 * @param search
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("personSearch")
	public String toPerSonSearch(String search, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// response.setContentType("application/json;charset=UTF-8");
		// String sea=request.getParameter("search");
		search = new String(search.getBytes("iso8859-1"), "utf-8");
		PrintWriter out = response.getWriter();
		List<PomsPersonalsInfo> list = personService.findSearch(search);
		JSONObject json = new JSONObject();
		json.put("list", list);
		out.print(json);
		return null;
	}
}
