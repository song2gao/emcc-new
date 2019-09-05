package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsDeviceMeasurPoint;

public interface PomsDeviceMeasurPointMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PomsDeviceMeasurPoint record);

    int insertSelective(PomsDeviceMeasurPoint record);
    
    PomsDeviceMeasurPoint selectByCalMmpCode(@Param("calId")String ctdCode,@Param("mmpCode")String mmmpCode);
    
    List<PomsDeviceMeasurPoint> selectByCalCode(@Param("calId")String ctdCode);

    int updateByPrimaryKeySelective(PomsDeviceMeasurPoint record);

    int updateByPrimaryKey(PomsDeviceMeasurPoint record);

	List<PomsDeviceMeasurPoint> selectByAll(@Param("point")PomsDeviceMeasurPoint point);

	int updateByCalSelective(PomsDeviceMeasurPoint point);
}