package com.gs.service.impl.alarmImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.domain.PomsDeviceMeasurPoint;
import com.gs.mapper.PomsCalculateTerminalDeviceMapper;
import com.gs.mapper.PomsDeviceMeasurPointMapper;
import com.gs.service.alarm.AlarmPointService;

/** 
* @Package:AlarmPointService 
* @author:  ybzhu
* @version:2017年11月22日 下午4:58:50 
* @描述： 
*/
@Service
@Transactional
public class AlarmPointServiceImpl implements AlarmPointService {

	@Resource
	private PomsDeviceMeasurPointMapper pointMapper;
	@Resource
	private PomsCalculateTerminalDeviceMapper calMapper;
	
	@Override
	public List<PomsDeviceMeasurPoint> selectAll(PomsDeviceMeasurPoint point) {
		// TODO Auto-generated method stub
		
		List<PomsDeviceMeasurPoint> list=pointMapper.selectByAll(point);
		return list;
	}


	@Override
	public int uppPointById(PomsDeviceMeasurPoint point) {
		// TODO Auto-generated method stub
		int flag=pointMapper.updateByCalSelective(point);
		return flag;
	}


	//根据calId得到计量表一条数据
	@Override
	public List<PomsCalculateTerminalDevice> getName(PomsCalculateTerminalDevice calmodel) {
		// TODO Auto-generated method stub
		
		List<PomsCalculateTerminalDevice> model=calMapper.selectByAll(calmodel);
		return model;
	}


	@Override
	public PomsDeviceMeasurPoint getPojo(String ctdCode,String mmpCode) {
		// TODO Auto-generated method stub
		PomsDeviceMeasurPoint model=pointMapper.selectByCalMmpCode(ctdCode, mmpCode);
		return model;
	}

}
