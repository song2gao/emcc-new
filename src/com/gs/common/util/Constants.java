package com.gs.common.util;

import java.util.List;
import java.util.Map;
public class Constants {
	//小数点位数
	public static int deciDemial=2;
	
	//组织机构附属信息字段配置列表
	public static List orgFieldConfig;
	//用户附属信息字段配置列表
	public static List userFieldConfig;
	//用户添加时默认的密码
	public static String defaultPassword="123456";
	
	
	// 系统管理参数
	public static final String SESSION_USER_ID = "loginUserID";
	//当前用户的所有有权限的模块列表
	public static final String SESSION_USER_MODULES = "userModules";
	public static final String SESSION_USER_ALL_MODULES="userAllModules";
	
	
	//顶级系统id
	public static final String SYS_ROOT_ID = "ROOT";
	//顶级位置id
	public static final String LOCA_ROOT_ID = "-1";
	
	
	//当前用户有权限的所有模块功能MAP 
	public static final String SESSION_USER_MACTION = "userModuleActions";
	public static final String SESSION_USER_SKIN_PATH = "selfSkinPath";
	public static final String ERROR_DELETE = "删除数据失败！";
	public static final String ERROR_USERNAME_EXIST = "该登录帐号已经存在!";
	public static final String ERROR_CODE_EXIST = "该基本编码信息已经存在!";
	public static final String ERROR_LOGIN = "loginerror";
	public static final String CODE_CONSTANT_ROLETYPE = "r000000000000001";
	//系统登录的链接
	public static final String SYS_LOGIN_URL = "/login.action";
	//从系统通用的选择组件选择结果的分隔符“｜”;
	public static final String SELECT_REGEX = "\\|";
	// 默认的树节点
	
	public static final String DEFAULT_AJAX_SUCCESS = "success";
	public static final String DEFAULT_AJAX_FAILURE = "failure";
	
	//超级管理员的Code
	public static final String SYS_ROOT_CODE = "system";
	
	//行业分类标准规范的id
	public static final String CM_INDUSTRY_ID="000000060014076c17a37";
	/**
	 * 行业分类标准规范类型
	 */
	public static final String CM_INDUSTRY_TYPE="HYFLBZGF";
	//北京市区域分类标准的id
	public static final String CM_AREA_ID="0000000260014076b2a9b";
	/**
	 * 北京市区域分类标准
	 */
	public static final String CM_AREA_TYPE="BJSQYFLBZ";
	
	//能源类型id
	public static final String CM_ENGRGYTYPE_ID="00000008001407a935316";
	
	//能源品种编码规范
	public static final String NYPZBMGF_ID="00000033c0014076b2a9b";
	/**
	 * 能源品种编码规范
	 */
	public static final String NYPZBMGF_TYPE="NYPZBMGF";//能源品种编码规范
	
	//计量单位参考规范
	public static final String JLDWCKGF_ID="00000048a0014076b2a9b";
	/**
	 * 计量单位参考规范
	 */
	public static final String JLDWCKGF_TYPE="JLDWBM";
	
	/**
	 * 计量点编码规范
	 */
	public static final String ZDCLDCSBM="ZDCLDCSBM";

	
	//水的测点编码
	public static final String CM_WATER_CODE="Water_quantity";
	
	//气的测点编码
	public static final String CM_QI_CODE="Gas_quantity";
	
	
	/**
	 * 煤的测点编码
	 */
	public static final String CM_MEI_CODE="00";
	
	public static final String CM_DIAN_CODE="Pw";

	//行业标识码//行业分类标准规范
	public static final String COMPANYS_PID="000000060014076c17a37";
	
	//行业标识码//北京市区域分类标准
	public static final String Distrint_PID="0000000260014076b2a9b";

	public static final String CM_XICHENGQU_ID="0000000a00014076b2a9b";
	/**
	 * 西城区编码
	 */
	public static final String CM_XICHENGQU_CODE="000102000";
	/**
	 * 用能单位ID
	 */
	public static final String EUI_ID="000000020013ff5aa5797";//宁夏九中
	
	
	//指标选择编码表--行业标杆指标
	public static final String INDUSTRY_INDEXCODE="1";
	
	//设备标杆指标
	public static final String USESYSTEM_INDEXCODE="4";
	
	
	//万元GDP
	public static final String WY_GDP="8";
	/**
	 * 用能位置－表计集合
	 */
	public static Map<String, String[]> devicemap=null;
	/**
	 * 用能位置－所有子用能位置(包括子用能位置下的子用能位置)
	 */
	public static Map<String, String[]> locationmap=null;
	
	public static Map<String, Double> datamap=null;
	
	public static final double FPrice=0.3502;//峰电价
	
	public static final double PPrice=0.2522;//平电价
		
	public static final double Gprice=0.1610;//谷电价
	
	public static final String dianCode="31";
	/**
	 * 用能单位编码
	 */
	public static String euiCode="bcjt";
	/**
	 * 默认用能设备编码
	 */
	public static String eusCode="2";
	/**
	 * 默认分项类型  
	 */
	public static String type="2";
	
	public static String euiName="三元中能";
	
	

   
}
