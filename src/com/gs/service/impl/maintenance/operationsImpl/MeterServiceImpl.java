package com.gs.service.impl.maintenance.operationsImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.PomsCalculateTerminalModel;
import com.gs.domain.PomsModleMeasurPoint;
import com.gs.mapper.PomsCalculateTerminalModelMapper;
import com.gs.mapper.PomsModleMeasurPointMapper;
import com.gs.service.maintenance.operations.MeterService;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年11月1日 下午4:00:24 描述：
 */
@Service
@Transactional
public class MeterServiceImpl implements MeterService {

	@Resource
	public PomsCalculateTerminalModelMapper calmodelMapper;//模型表 mapper
	@Resource
	public PomsModleMeasurPointMapper PorintMapper;//模型测点表 mapper
	
	/**
	 * 计量模型终端 模型表分页全查询
	 */
	@Override
	public List<PomsCalculateTerminalModel> getPersonPage(PomsCalculateTerminalModel calmodel, int pageIndex,
			int pageSize) {
		// TODO Auto-generated method stub
		List<PomsCalculateTerminalModel> list = calmodelMapper.selectCodesPage(calmodel, pageSize, pageSize * (pageIndex - 1));

		return list;
	}

	/**
	 * 计量模型终端 查询总数
	 */
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		
		int count=calmodelMapper.getCount();
		return count;
	}

	/**
	 * 计量模型终端 模型测点表分页全查询
	 */
	@Override
	public List<PomsModleMeasurPoint> getPersonPage(PomsModleMeasurPoint measurPoint, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		List<PomsModleMeasurPoint> list = PorintMapper.selectCodesPage(measurPoint, pageSize, pageSize * (pageIndex - 1));

		return list;
	}

	/**
	 * 计量模型终端 模型测点表查询总数
	 */
	@Override
	public int getCountByMeasurPoint() {
		// TODO Auto-generated method stub
		int count=PorintMapper.getCount();
		return count;
	}

}
