package com.gs.mapper;

import com.gs.domain.PomsEnergyUsingSystemModel;

public interface PomsEnergyUsingSystemModelMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsEnergyUsingSystemModel record);

    int insertSelective(PomsEnergyUsingSystemModel record);

    PomsEnergyUsingSystemModel selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsEnergyUsingSystemModel record);

    int updateByPrimaryKey(PomsEnergyUsingSystemModel record);
}