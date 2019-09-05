package com.gs.service.maintenance;

import java.util.List;

import com.gs.domain.PomsCodeManagement;
import com.gs.domain.PomsEnergyUnitInfo;

import net.sf.json.JSONArray;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017-9-18 下午04:46:28 描述： UnitService 用能单位维护 接口
 */
public interface UnitService {

	/**
	 * treeInfo(用能单位全查询)
	 * 
	 * @return
	 */
	List<PomsEnergyUnitInfo> getAllEnegryUnit();

	/**
	 * 得到拼接成的企业信息
	 * 
	 * @param list
	 * @return
	 */
	JSONArray PingJieEnergyJson(List<PomsEnergyUnitInfo> list);

	/**
	 * 通过ID全查询
	 * 
	 * @param enegryid
	 * @return
	 */
	List<PomsEnergyUnitInfo> findUnitById(String enegryid);

	/**
	 * 条件查询通用方法
	 * 
	 * @param parameter1
	 * @return
	 */
	PomsCodeManagement findCodeBycmCode(PomsCodeManagement parameter1);

	/**
	 * 根据外键ID查询
	 * 
	 * @param euiParentid
	 * @return
	 */
	List<PomsEnergyUnitInfo> getEnegry(String euiParentid);

}
