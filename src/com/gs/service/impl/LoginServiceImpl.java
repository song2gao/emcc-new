package com.gs.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.gs.domain.PomsModulesManagement;
import com.gs.domain.PomsRoleModuleAction;
import com.gs.domain.PomsRolesUsersRela;
import com.gs.domain.PomsUsersManagement;
import com.gs.mapper.PomsModulesManagementMapper;
import com.gs.mapper.PomsRoleModuleActionMapper;
import com.gs.mapper.PomsRolesUsersRelaMapper;
import com.gs.mapper.PomsUsersManagementMapper;
import com.gs.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private PomsUsersManagementMapper userManagement;
	@Autowired
	private PomsRolesUsersRelaMapper roleUserReal;
	@Autowired
	private PomsRoleModuleActionMapper moduleAction;
	@Autowired
	private PomsModulesManagementMapper modulesManagement;

	public JSONObject loginUser(String name, String pwd, String type,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		PomsUsersManagement user = userManagement.selectByUnamePwd(name, pwd);
		JSONObject json = new JSONObject();
		HttpSession session = request.getSession();
		String selType=type;
		if (user == null) {
			json.put("utype", -1);
			return json;
		} else {
			boolean test = false; // 记录是否有相应的权限
			List<PomsRolesUsersRela> ps = roleUserReal.selectByUserId(user
					.getId());
			if (user.getId().equals("1")) {
				test = true;
			} else {
				for (PomsRolesUsersRela p : ps) {
					List<PomsRoleModuleAction> setrm = moduleAction
							.selectByRAId(p.getRoleId());
					session.setAttribute("loginUserModule", setrm);// 登录用户该角色的模块
					for (PomsRoleModuleAction rm : setrm) {
						PomsModulesManagement pmm = modulesManagement
								.selectByPrimaryKey(rm.getMmId());
						if (pmm.getMmModuleProperty() != null
								&& pmm.getMmModuleProperty().equals(type)) {// 发现有进入某个模块的权利
							test = true;
							break;
						}
					}
				}
			}
			if (test) { // 判断是否有权限进入所选择的系统
				json.put("utype", 0);
				String url = "";
				// 修改url , 将进入各个系统正确的路径赋予 url.
				if (type.equals("3") && test) {// 进入采集系统
					url = "index-qz";
					selType="3";
				} else if ((type.equals("1")||type.equals("6")||type.equals("7")) && test) { // 运维
					url = "index-yw";
					selType="1";
				} else if ((type.equals("2") || type.equals("9")||type.equals("5")||type.equals("4")||type.equals("10")) && test) { // 监测
					url = "index";
				}
				List<PomsModulesManagement> modules = getModules(user.getId(),
						selType, "0");
				session.setAttribute("loginUser", user); // 登陆的用户
				session.setAttribute("loginUserRole", ps);// 登录的角色
				session.setAttribute("loginType", type);
				session.setAttribute("loginMenu", modules); // 用户的菜单
				session.setAttribute("loginDate", new SimpleDateFormat(
						"yyyy年MM月dd日  E").format(new Date()));

				json.put("url", url);
				return json;
			} else {
				json.put("utype", -2);
				return json;
			}
		}
	}

	public List<PomsModulesManagement> getModules(String userId, String type,
			String parentId) {
		List<PomsModulesManagement> modules = modulesManagement
				.selectByRoleAction(userId, type + "", parentId);
		return getChildrenModel(modules, userId, type);
	}

	public List<PomsModulesManagement> getChildrenModel(
			List<PomsModulesManagement> models, String userId, String property) {
		for (PomsModulesManagement pm : models) {

			pm.setChildren(modulesManagement.selectByRoleAction(userId,
					property, pm.getMmModuleCode()));

			if (pm.getChildren() != null && pm.getChildren().size() > 0) {
				getChildrenModel(pm.getChildren(), userId, property);
			}
		}

		return models;
	}

}
