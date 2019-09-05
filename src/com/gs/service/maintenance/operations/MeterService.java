package com.gs.service.maintenance.operations;

import java.util.List;

import com.gs.domain.PomsCalculateTerminalModel;
import com.gs.domain.PomsModleMeasurPoint;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年11月1日 下午3:57:42 
* 描述： 
*/
public interface MeterService {

	/**
	 * 计量模型终端 模型表分页全查询
 	 * @param calmodel
	 * @param parseInt
	 * @param parseInt2
	 * @return
	 */
	List<PomsCalculateTerminalModel> getPersonPage(PomsCalculateTerminalModel calmodel, int parseInt, int parseInt2);

	/**
	 * 计量模型终端 模型表查询总数
	 * @return
	 */
	int getCount();

	/**
	 * 计量模型终端 模型测点表分页全查询
	 * @param calmodel
	 * @param parseInt
	 * @param parseInt2
	 * @return
	 */
	List<PomsModleMeasurPoint> getPersonPage(PomsModleMeasurPoint measurPoint, int parseInt, int parseInt2);

	/**
	 * 计量模型终端 模型测点表查询总数
	 * @return
	 */
	int getCountByMeasurPoint();
	
	
	

}
