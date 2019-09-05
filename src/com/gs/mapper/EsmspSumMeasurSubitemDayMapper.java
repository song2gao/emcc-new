package com.gs.mapper;

import com.gs.domain.EsmspSumMeasurSubitemDay;

public interface EsmspSumMeasurSubitemDayMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspSumMeasurSubitemDay record);

    int insertSelective(EsmspSumMeasurSubitemDay record);

    EsmspSumMeasurSubitemDay selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspSumMeasurSubitemDay record);

    int updateByPrimaryKey(EsmspSumMeasurSubitemDay record);
}