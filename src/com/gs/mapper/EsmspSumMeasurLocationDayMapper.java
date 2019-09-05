package com.gs.mapper;

import com.gs.domain.EsmspSumMeasurLocationDay;

public interface EsmspSumMeasurLocationDayMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspSumMeasurLocationDay record);

    int insertSelective(EsmspSumMeasurLocationDay record);

    EsmspSumMeasurLocationDay selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspSumMeasurLocationDay record);

    int updateByPrimaryKey(EsmspSumMeasurLocationDay record);
}