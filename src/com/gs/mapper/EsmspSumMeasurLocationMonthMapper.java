package com.gs.mapper;

import com.gs.domain.EsmspSumMeasurLocationMonth;

public interface EsmspSumMeasurLocationMonthMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspSumMeasurLocationMonth record);

    int insertSelective(EsmspSumMeasurLocationMonth record);

    EsmspSumMeasurLocationMonth selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspSumMeasurLocationMonth record);

    int updateByPrimaryKey(EsmspSumMeasurLocationMonth record);
}