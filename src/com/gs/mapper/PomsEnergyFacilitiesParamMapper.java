package com.gs.mapper;

import com.gs.domain.PomsEnergyFacilitiesParam;

public interface PomsEnergyFacilitiesParamMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsEnergyFacilitiesParam record);

    int insertSelective(PomsEnergyFacilitiesParam record);

    PomsEnergyFacilitiesParam selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsEnergyFacilitiesParam record);

    int updateByPrimaryKey(PomsEnergyFacilitiesParam record);
}