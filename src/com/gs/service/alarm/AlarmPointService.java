package com.gs.service.alarm;

import java.util.List;

import com.gs.domain.PomsCalculateTerminalDevice;
import com.gs.domain.PomsDeviceMeasurPoint;

/** 
* @Package:com.gs.service.alarm 
* @author:  ybzhu
* @version:2017年11月22日 下午4:58:10 
* @描述： 
*/
public interface AlarmPointService {

	List<PomsDeviceMeasurPoint> selectAll(PomsDeviceMeasurPoint point);

	int uppPointById(PomsDeviceMeasurPoint point);

	List<PomsCalculateTerminalDevice> getName(PomsCalculateTerminalDevice calmodel);

	PomsDeviceMeasurPoint getPojo(String ctdCode, String mmpCode);

}
