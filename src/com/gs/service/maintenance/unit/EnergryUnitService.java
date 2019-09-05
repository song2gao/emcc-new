package com.gs.service.maintenance.unit;

import java.util.List;

import com.gs.domain.PomsCalculateTerminalModel;
import com.gs.domain.PomsCodeManagement;
import com.gs.domain.PomsEnergyUnitInfo;

import net.sf.json.JSONArray;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年10月26日 下午4:52:33 
* 描述： 企业信息维护(用能单位) 接口
*/
public interface EnergryUnitService {

	/**
	 * 查询所有
	 * @param cmIndustryId
	 * @return
	 */
	List<PomsCodeManagement> findCodeByParentId(String cmIndustryId);

	/**
	 * 取得企业子项（通过ID查询）
	 * @param enegryid
	 * @return
	 */
	List<PomsEnergyUnitInfo> findUnitById(String enegryid);

	JSONArray PingJieEnegryJson(List<PomsEnergyUnitInfo> list, String flogforsssj, String enegryid);

	/**
	 * 添加
	 * @param pomsUnit
	 * @return
	 */
	int saveUnit(PomsEnergyUnitInfo pomsUnit);

	/**
	 * 修改
	 * @param pomsUnit
	 * @return
	 */
	int updateUnit(PomsEnergyUnitInfo pomsUnit);

	/**
	 * 删除
	 * @param id
	 * @return
	 */
	int delUnitInfo(String id);

	/**
	 * 通过ID查询 测量仪表模块 
	 * @param id
	 * @return
	 */
	List<PomsCalculateTerminalModel> findUnitModelById(String id);

	/**
	 * 全查询 测量仪表模块
	 * @param id
	 * @return
	 */
	List<PomsCalculateTerminalModel> findUnitModelAll();

}
