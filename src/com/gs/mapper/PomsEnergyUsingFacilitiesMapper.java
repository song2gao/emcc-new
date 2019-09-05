package com.gs.mapper;

import com.gs.domain.PomsEnergyUsingFacilities;

public interface PomsEnergyUsingFacilitiesMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsEnergyUsingFacilities record);

    int insertSelective(PomsEnergyUsingFacilities record);

    PomsEnergyUsingFacilities selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsEnergyUsingFacilities record);

    int updateByPrimaryKey(PomsEnergyUsingFacilities record);
}