package com.gs.service.impl.maintenance.unitImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.common.util.EnegryUnit;
import com.gs.common.util.GUID;
import com.gs.domain.PomsAssembledTerminalDevice;
import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.domain.PomsEnergyUnitInfo;
import com.gs.domain.PomsFrontProcessorConfig;
import com.gs.mapper.PomsAssembledTerminalDeviceMapper;
import com.gs.mapper.PomsCalculateTerminalDeviceMapper;
import com.gs.mapper.PomsCalculateTerminalModelMapper;
import com.gs.mapper.PomsEnergyUnitInfoMapper;
import com.gs.mapper.PomsFrontProcessorConfigMapper;
import com.gs.service.maintenance.unit.InventoryService;

import net.sf.json.JSONObject;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年10月26日 下午2:07:51 
 * 描述： 测量仪表实现类
 */
@Service
@Transactional
public class InventoryServiceImpl implements InventoryService {

	@Resource
	public PomsEnergyUnitInfoMapper unitInfoMapper;
	@Resource
	public PomsAssembledTerminalDeviceMapper assMapper;
	@Resource
	public PomsCalculateTerminalDeviceMapper calCulateMapper;
	@Resource
	public PomsCalculateTerminalModelMapper calModelMapper;
	@Resource
	public PomsFrontProcessorConfigMapper frontMapper;

	/**
	 * 分页查询 cc
	 */
	@Override
	public JSONObject getEnegryUints(String pageIndex, String pageSize, String qyname) {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		List<PomsEnergyUnitInfo> list = null;
		if (qyname == null || qyname.equals("")) {
			list = unitInfoMapper.findAllEnegryUnits();
		} else {
			list = unitInfoMapper.findEnegryUnits(qyname);
		}
		List<EnegryUnit> eneList = new ArrayList<EnegryUnit>();

		if (list != null && !list.isEmpty()) {
			eneList = getE(list); // 处理用能单位企业a
			json.put("size", list.size());
			json.put("list", eneList);
		}
		return json;
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
	 * 分页查询 cc
	 */
	/**
	 * 取得采集终端设备信息
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@Override
	public JSONObject getAss(String pageIndex, String pageSize, String unitid) {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		List<PomsAssembledTerminalDevice> list = null;
		if (unitid != null && unitid != "") {
			list = assMapper.findAss(unitid);
		} else {

			list = assMapper.findAssAll();
		}
		List<EnegryUnit> listene = new ArrayList<EnegryUnit>();
		for (int i = 0; i < list.size(); i++) {
			PomsAssembledTerminalDevice assDevice = list.get(i);

			EnegryUnit enegryUnit = new EnegryUnit();
			enegryUnit.setId(assDevice.getId());
			enegryUnit.setAsstdCode(assDevice.getAsstdCode());
			enegryUnit.setAsstdNames(assDevice.getAsstdNames());
			enegryUnit.setAsstdProduction(assDevice.getAsstdProduction());
			enegryUnit.setAsstdBackups(assDevice.getAsstdBackups());
			enegryUnit.setAsstdRunStatus(assDevice.getAsstdRunStatus());
			enegryUnit.setAsstdAssembleIp(assDevice.getAsstdAssembleIp());
			enegryUnit.setCrcCommunicateType(assDevice.getCrcCommunicateType());
			enegryUnit.setCrcCommunicateSerial(assDevice.getCrcCommunicateSerial());
			listene.add(enegryUnit);

		}
		listene = PageSize(listene, Integer.parseInt(pageIndex), Integer.parseInt(pageSize));
		json.put("size", list.size());
		json.put("list", listene);

		return json;
	}

	/**
	 * 分页
	 * 
	 * @param list
	 * @param index
	 * @param size
	 * @return
	 */
	private List<EnegryUnit> PageSize(List<EnegryUnit> list, int index, int size) {
		// TODO Auto-generated method stub
		List<EnegryUnit> l = new ArrayList<EnegryUnit>();
		if (list.size() == 0 || list.isEmpty()) {
			return list;
		} else {
			for (int i = ((index - 1) * size); i < list.size(); i++) {
				l.add(list.get(i));
				if (l.size() == size) {
					break;
				}
			}
		}

		return l;
	}

	/**
	 * 全查询 测量仪表配置、计量终端信息
	 */
	@Override
	public JSONObject getCalculte(String unitid, String calculteid, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		List<PomsCalculateTerminalDevice> list = calCulateMapper.findMeasurCalculateAndPoint(unitid, calculteid,
				pageSize * (pageIndex - 1), pageSize);
		if (list != null && !list.isEmpty()) {
			int count = calCulateMapper.findMeasurCalculateCount(unitid, calculteid);
			json.put("list", list);
			json.put("size", count);
		} else {
			json.put("size", 0);
			json.put("list", "[]");
		}
		return json;
	}

	/**
	 * 全查询 前置机信息
	 */
	@Override
	public JSONObject getfpc() {
		// TODO Auto-generated method stub

		List<PomsFrontProcessorConfig> list = (List<PomsFrontProcessorConfig>) frontMapper.selectByAll();

		JSONObject json = new JSONObject();

		if (list != null && !list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				// PomsFrontProcessorConfig cof=list.get(i);
				// cof.setPomsCommunicationRoutingConfigs(new HashSet(0));
			}
			json.put("size", list.size());
			json.put("list", list);
			return json;
		}
		return null;
	}

	/**
	 * 添加采集器
	 */
	@Override
	public int saveAssembled(PomsAssembledTerminalDevice ass, String unitid, String qzjid) {
		// TODO Auto-generated method stub
		GUID guid = new GUID();
		ass.setId(guid.toString());
		ass.setAsstdEnterpriseid(unitid);
		ass.setAsstdAssembleIp(ass.getAsstdCode());
		ass.setAsstdCode(ass.getCrcCommunicateSerial());
		int bool = assMapper.insert(ass);
		return bool;
	}

	/**
	 * 修改采集器
	 */
	@Override
	public int saveOrUpdateAssembled(PomsAssembledTerminalDevice ass, String eid, String pid) {
		// TODO Auto-generated method stub
		ass.setId(pid);
		ass.setAsstdEnterpriseid(eid);
		ass.setAsstdAssembleIp(ass.getAsstdCode());
		ass.setAsstdCode(ass.getCrcCommunicateSerial());
		int bool = assMapper.updateByPrimaryKey(ass);
		return bool;
	}

	/**
	 * 删除采集器
	 */
	@Override
	public int delAssembled(String eid, String pid) {
		// TODO Auto-generated method stub
		int bool = assMapper.deleteByPrimaryKey(pid);
		return bool;
	}
	/**
	 * 添加计量表
	 */
	@Override
	public int saveMeter(PomsCalculateTerminalDevice calculate,String aid) {
		// TODO Auto-generated method stub
		GUID guid = new GUID();
		calculate.setId(guid.toString());
		calculate.setCdtAssembleid(aid);
		int  bool=calCulateMapper.insert(calculate);
		return bool;
	}

	/**
	 * 删除计量表  及 批量删除
	 */
	@Override
	public int delMeter(String calculIds) {
		// TODO Auto-generated method stub
		
		String[] aa = calculIds.split("\\#");  
		int flag=0;
//	    for (int i = 0 ; i <aa.length ; i++ ) {
//
//	      System.out.println("--"+aa[i]); 
//	      flag=calCulateMapper.deleteByPrimaryKey(aa[i]);
//
//	    }
		flag=calCulateMapper.deleteByAll(aa);
		return flag;
	}

	/**
	 * 修改计量表
	 */
	@Override
	public int uppMeter(PomsCalculateTerminalDevice calculate) {
		// TODO Auto-generated method stub
		int flag=calCulateMapper.updateByPrimaryKey(calculate);
		return flag;
	}

}
