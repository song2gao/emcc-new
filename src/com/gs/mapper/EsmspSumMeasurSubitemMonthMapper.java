package com.gs.mapper;

import com.gs.domain.EsmspSumMeasurSubitemMonth;

public interface EsmspSumMeasurSubitemMonthMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspSumMeasurSubitemMonth record);

    int insertSelective(EsmspSumMeasurSubitemMonth record);

    EsmspSumMeasurSubitemMonth selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspSumMeasurSubitemMonth record);

    int updateByPrimaryKey(EsmspSumMeasurSubitemMonth record);
}