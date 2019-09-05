package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsModleMeasurPoint;

public interface PomsModleMeasurPointMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PomsModleMeasurPoint record);

    int insertSelective(PomsModleMeasurPoint record);

    PomsModleMeasurPoint selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PomsModleMeasurPoint record);
    
    List<PomsModleMeasurPoint> findByCtmId(@Param("ctmId")String ctmId);

    int updateByPrimaryKey(PomsModleMeasurPoint record);

    /**
     * 计量模型终端 模型测点表分页全查询
     * @param measurPoint
     * @param pageSize
     * @param i
     * @return
     */
	List<PomsModleMeasurPoint> selectCodesPage(@Param("measurPoint")PomsModleMeasurPoint measurPoint, @Param("pageSize")int pageSize, @Param("pageBegin")int pageBegin);

	/**
	 * 计量模型终端 模型测点表查询总数
	 * @return
	 */
	int getCount();
}