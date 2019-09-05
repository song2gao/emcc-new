package com.gs.service.impl.maintenance;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.common.util.EnegryUnit;
import com.gs.domain.PomsAssembledTerminalDevice;
import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.domain.PomsCodeManagement;
import com.gs.domain.PomsEnergyUnitInfo;
import com.gs.mapper.PomsAssembledTerminalDeviceMapper;
import com.gs.mapper.PomsCodeManagementMapper;
import com.gs.mapper.PomsEnergyUnitInfoMapper;
import com.gs.service.maintenance.UnitService;

import net.sf.json.JSONArray;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017-9-19 上午09:43:38 描述： UnitServiceImpl 用能单位维护管理 实现类
 */
@Service
@Transactional
public class UnitServiceImpl implements UnitService {

	@Resource
	public PomsEnergyUnitInfoMapper unitInfoMapper;
	@Resource
	public PomsCodeManagementMapper codeMapper;
	@Resource
	public PomsAssembledTerminalDeviceMapper assMapper;

	/**
	 * 查询所有企业
	 */
	@Override
	public List<PomsEnergyUnitInfo> getAllEnegryUnit() {
		// TODO Auto-generated method stub

		List<PomsEnergyUnitInfo> list = unitInfoMapper.selectAll();
		if (list != null && !list.isEmpty()) {

			return list;
		}
		return list;
	}

	/**
	 * 方法：数据转换 json格式
	 */
	@Override
	public JSONArray PingJieEnergyJson(List<PomsEnergyUnitInfo> list) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();

		sb.append("[");
		for (int i = 0; i < list.size(); i++) {
			sb.append("{");
			sb.append("\"id\":\"" + list.get(i).getId() + "\",\"text\":\"" + list.get(i).getEuiNames()
					+ "\",\"state\":\"closed\",\"attributes\":{\"type\":" + "\"1\"}");// 拼接上ID，Text，State以及自定义的type属性(type:区分是企业还是用户)
			if (i == list.size() - 1) {
				sb.append("}");
			} else {
				sb.append("},");
			}

		}
		sb.append("]");
		JSONArray js = JSONArray.fromObject(sb.toString());
		return js;
	}

	/**
	 * 方法： 取得企业子项 通过 enegryid 查询
	 */
	@Override
	public List<PomsEnergyUnitInfo> findUnitById(String enegryid) {

		List<PomsEnergyUnitInfo> list = unitInfoMapper.selectByPrimaryKey(enegryid);
		return list;
	}

	/**
	 * 方法：取得用能单位根据id
	 */
	@Override
	public List<PomsEnergyUnitInfo> getEnegry(String euiParentid) {
		// TODO Auto-generated method stub
		List<PomsEnergyUnitInfo> list = unitInfoMapper.selectByParentid(euiParentid);

		return list;
	}

	/**
	 * 方法：提供给 service 返回结果 查询 所属区县和所属行业
	 */
	@Override
	public PomsCodeManagement findCodeBycmCode(PomsCodeManagement parameters) {
		// TODO Auto-generated method stub

		PomsCodeManagement parameter = new PomsCodeManagement();
		parameter.setCmCodeType(parameters.getCmCodeType());
		parameter.setCmName(parameters.getCmName());
		List<PomsCodeManagement> list = codeMapper.selectByCodes(parameter);
		PomsCodeManagement code = new PomsCodeManagement();
		if (list.size() > 0) {
			code = list.get(0);
		} else {
			code = null;
		}
		return code;
	}

	/**
	 * 填充企业信息
	 * 
	 * @param peneInfo
	 * @return
	 */
	public List<EnegryUnit> getE(List<PomsEnergyUnitInfo> list) {
		List<EnegryUnit> eneList = new ArrayList<EnegryUnit>();
		for (int i = 0; i < list.size(); i++) {
			PomsEnergyUnitInfo peneInfo = list.get(i);
			EnegryUnit eneUnit = new EnegryUnit();

			eneUnit.setId(peneInfo.getId());
			eneUnit.setEuiCode(peneInfo.getEuiCode());
			eneUnit.setEuiNames(peneInfo.getEuiNames());
			// eneUnit.setEuiRepresentative(peneInfo.getEuiLineId());
			eneUnit.setEuiBelongIndustry(peneInfo.getEuiBelongIndustry());
			eneUnit.setEuiBelongDistrct(peneInfo.getEuiBelongDistrct());

			eneUnit.setEuiConsumeBand(peneInfo.getEuiConsumeBand());
			eneUnit.setEuiChargeDepartment(peneInfo.getEuiChargeDepartment());
			eneUnit.setEuiLocation(peneInfo.getEuiLocation());
			eneUnit.setEuiContentWay(peneInfo.getEuiContentWay());
			// eneUnit.setEuiBuildingArea(peneInfo.getEuiBuildingArea());
			eneUnit.setEuiHoldPerson(peneInfo.getEuiHoldPerson());
			eneUnit.setEuiBackups(peneInfo.getEuiBackups());
			eneList.add(eneUnit);
		}
		return eneList;
	}

	/**
	 * 解析计量表信息
	 * 
	 * @param list
	 * @return
	 */
	public List<PomsCalculateTerminalDevice> jieXi(List<PomsCalculateTerminalDevice> list) {
		for (int i = 0; i < list.size(); i++) {
			PomsCalculateTerminalDevice object = list.get(i);

			String infoID = object.getCdtAssembleid();

			PomsAssembledTerminalDevice ass = assMapper.selectByPrimaryKey(infoID);

			PomsAssembledTerminalDevice assembled = new PomsAssembledTerminalDevice();
			// 放入采集器
			if (object != null) {

				assembled.setId(ass.getId());
				assembled.setAsstdNames(ass.getAsstdNames());
				assembled.setAsstdCode(ass.getAsstdCode());
				assembled.setAsstdProduction(ass.getAsstdProduction());
				assembled.setAsstdRunStatus(ass.getAsstdRunStatus());
			}
		}
		return list;
	}

}
