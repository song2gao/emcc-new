package com.gs.mapper;

import com.gs.domain.PomsUserDefinedStatistics;

public interface PomsUserDefinedStatisticsMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsUserDefinedStatistics record);

    int insertSelective(PomsUserDefinedStatistics record);

    PomsUserDefinedStatistics selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsUserDefinedStatistics record);

    int updateByPrimaryKey(PomsUserDefinedStatistics record);
}