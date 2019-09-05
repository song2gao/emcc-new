package com.gs.mapper;

import com.gs.domain.PreDaysFreezing;
import com.gs.domain.PreDaysFreezingKey;

public interface PreDaysFreezingMapper {
    int deleteByPrimaryKey(PreDaysFreezingKey key);

    int insert(PreDaysFreezing record);

    int insertSelective(PreDaysFreezing record);

    PreDaysFreezing selectByPrimaryKey(PreDaysFreezingKey key);

    int updateByPrimaryKeySelective(PreDaysFreezing record);

    int updateByPrimaryKey(PreDaysFreezing record);
}