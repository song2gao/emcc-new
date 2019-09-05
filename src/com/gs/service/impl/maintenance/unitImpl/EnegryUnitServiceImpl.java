package com.gs.service.impl.maintenance.unitImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.domain.PomsCalculateTerminalModel;
import com.gs.domain.PomsCodeManagement;
import com.gs.domain.PomsEnergyUnitInfo;
import com.gs.mapper.PomsCalculateTerminalDeviceMapper;
import com.gs.mapper.PomsCalculateTerminalModelMapper;
import com.gs.mapper.PomsCodeManagementMapper;
import com.gs.mapper.PomsEnergyUnitInfoMapper;
import com.gs.service.maintenance.unit.EnergryUnitService;

import net.sf.json.JSONArray;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年10月26日 下午4:53:55 描述： 企业信息维护(用能单位) 实现类
 */
@Service
@Transactional
public class EnegryUnitServiceImpl implements EnergryUnitService {

	@Resource
	public PomsCodeManagementMapper pomsCodeMapper;
	@Resource
	public PomsEnergyUnitInfoMapper unitInfoMapper;
	@Resource
	public PomsCalculateTerminalDeviceMapper calculateMapper;
	@Resource
	public PomsCalculateTerminalModelMapper calmodelMapper;

	/**
	 * 查询所有
	 */
	@Override
	public List<PomsCodeManagement> findCodeByParentId(String cmIndustryId) {
		// TODO Auto-generated method stub

		List<PomsCodeManagement> list = (List<PomsCodeManagement>) pomsCodeMapper.selectById(cmIndustryId);

		return list;
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
	 * 方法 拼接成Json数据格式（企业）
	 */
	@Override
	public JSONArray PingJieEnegryJson(List<PomsEnergyUnitInfo> list, String flogforsssj, String enegryid) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		if (list != null && !list.isEmpty()) {
			sb.append("[");
			for (PomsEnergyUnitInfo pe : list) {
				boolean test = true;
				String state = "closed";
				List<PomsEnergyUnitInfo> uls = unitInfoMapper.selectByPrimaryKey(pe.getId());
				if (uls.size() == 0 || uls.isEmpty()) {// 没有子节点，则把"statc"改成false
					test = false;
					state = "";
				}
				sb.append("{");
				sb.append("\"id\":\"" + pe.getId() + "\",\"text\":\"" + pe.getEuiNames() + "\",\"state\":\"" + state
						+ "\",\"attributes\":{\"type\":" + "\"2\",\"test\":" + test + "}");// 拼接上ID，Text，State以及自定义的type属性(type:区分是企业还是用户)
				if (!test) {
					sb.append(",\"iconCls\":\"tree-file\"");
				}
				sb.append("},");
			}
			sb.append("]");
			JSONArray js = JSONArray.fromObject(sb.toString());
			return js;
		} else if (flogforsssj.equals("9") || flogforsssj == "9") { // 否则差旗下表计
			System.out.println("P I G  !!!");
			sb.append("[");
			List<PomsCalculateTerminalDevice> list2 = calculateMapper.findChildTabUnitInfo(enegryid);
			for (PomsCalculateTerminalDevice pe : list2) {
				boolean test = false;
				boolean textStu = false;
				String state = "";
				// List<PomsEnergyUnitInfo> uls =
				// unitInfoMapper.findEnegryUnitInfo(pe.getId());
				// if (list2.size()==0 || list2.isEmpty())
				// {//没有子节点，则把"statc"改成false
				// test = false;state = "";
				// }
				int dsb = 0;
				sb.append("{");
				sb.append("\"id\":\"" + pe.getId() + "\",\"text\":\"" + pe.getCdtMeasureLoop() + "\",\"textStu\":\""
						+ pe.getCdtBackups() + "\",\"dsq\":\"" + dsb + "\",\"state\":\"" + state
						+ "\",\"attributes\":{\"type\":" + "\"2\",\"test\":" + test + ",\"textStu\":" + textStu
						+ ",\"dsb\":" + dsb + "}");// 拼接上ID，Text，State以及自定义的type属性(type:区分是企业还是用户)
				if (!test) {
					sb.append(",\"iconCls\":\"tree-file\"");
				}
				sb.append("},");
			}
			sb.append("]");
			JSONArray js = JSONArray.fromObject(sb.toString());
			return js;
		}
		return new JSONArray();
	}

	/**
	 * 添加
	 */
	@Override
	public int saveUnit(PomsEnergyUnitInfo pomsUnit) {
		// TODO Auto-generated method stub
		int bool = unitInfoMapper.insert(pomsUnit);
		return bool;
	}

	/**
	 * 修改
	 */
	@Override
	public int updateUnit(PomsEnergyUnitInfo pomsUnit) {
		// TODO Auto-generated method stub
		int flag = unitInfoMapper.updateByPrimaryKey(pomsUnit);

		return flag;
	}

	/**
	 * 删除
	 */
	@Override
	public int delUnitInfo(String id) {
		// TODO Auto-generated method stub
		int flag = unitInfoMapper.deleteByPrimaryKey(id);
		return flag;
	}

	/**
	 * 通过ID查询测量仪表数据
	 */
	@Override
	public List<PomsCalculateTerminalModel> findUnitModelById(String id) {
		// TODO Auto-generated method stub
		
		List<PomsCalculateTerminalModel> calmodel=calmodelMapper.selectByPrimaryKeyByID(id);
		return calmodel;
	}

	/**
	 * 全查询 测量仪表模块
	 */
	@Override
	public List<PomsCalculateTerminalModel> findUnitModelAll() {
		// TODO Auto-generated method stub
		List<PomsCalculateTerminalModel> model=calmodelMapper.selectAll();
		return model;
	}

}
