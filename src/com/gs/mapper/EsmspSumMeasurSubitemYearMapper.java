package com.gs.mapper;

import com.gs.domain.EsmspSumMeasurSubitemYear;

public interface EsmspSumMeasurSubitemYearMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspSumMeasurSubitemYear record);

    int insertSelective(EsmspSumMeasurSubitemYear record);

    EsmspSumMeasurSubitemYear selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspSumMeasurSubitemYear record);

    int updateByPrimaryKey(EsmspSumMeasurSubitemYear record);
}