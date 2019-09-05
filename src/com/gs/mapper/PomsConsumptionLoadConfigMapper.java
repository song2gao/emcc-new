package com.gs.mapper;

import com.gs.domain.PomsConsumptionLoadConfig;

public interface PomsConsumptionLoadConfigMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsConsumptionLoadConfig record);

    int insertSelective(PomsConsumptionLoadConfig record);

    PomsConsumptionLoadConfig selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsConsumptionLoadConfig record);

    int updateByPrimaryKey(PomsConsumptionLoadConfig record);
}