package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsEnergySystemParam;

public interface PomsEnergySystemParamMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsEnergySystemParam record);

    int insertSelective(PomsEnergySystemParam record);

    PomsEnergySystemParam selectByPrimaryKey(String id);
    
    List<PomsEnergySystemParam> selectBySystemCode(@Param("systemCode") String systemCode);

    int updateByPrimaryKeySelective(PomsEnergySystemParam record);

    int updateByPrimaryKey(PomsEnergySystemParam record);
}