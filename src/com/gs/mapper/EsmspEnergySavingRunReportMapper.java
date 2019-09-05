package com.gs.mapper;

import com.gs.domain.EsmspEnergySavingRunReport;

public interface EsmspEnergySavingRunReportMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspEnergySavingRunReport record);

    int insertSelective(EsmspEnergySavingRunReport record);

    EsmspEnergySavingRunReport selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspEnergySavingRunReport record);

    int updateByPrimaryKey(EsmspEnergySavingRunReport record);
}