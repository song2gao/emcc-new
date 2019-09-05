package com.gs.mapper;

import com.gs.domain.PreMonthsFreezing;
import com.gs.domain.PreMonthsFreezingKey;

public interface PreMonthsFreezingMapper {
    int deleteByPrimaryKey(PreMonthsFreezingKey key);

    int insert(PreMonthsFreezing record);

    int insertSelective(PreMonthsFreezing record);

    PreMonthsFreezing selectByPrimaryKey(PreMonthsFreezingKey key);

    int updateByPrimaryKeySelective(PreMonthsFreezing record);

    int updateByPrimaryKey(PreMonthsFreezing record);
}