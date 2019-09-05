package com.gs.mapper;

import com.gs.domain.EsmspSumMeasurLocationYear;

public interface EsmspSumMeasurLocationYearMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspSumMeasurLocationYear record);

    int insertSelective(EsmspSumMeasurLocationYear record);

    EsmspSumMeasurLocationYear selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspSumMeasurLocationYear record);

    int updateByPrimaryKey(EsmspSumMeasurLocationYear record);
}