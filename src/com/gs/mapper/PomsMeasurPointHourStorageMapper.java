package com.gs.mapper;

import com.gs.domain.PomsMeasurPointHourStorage;

public interface PomsMeasurPointHourStorageMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsMeasurPointHourStorage record);

    int insertSelective(PomsMeasurPointHourStorage record);

    PomsMeasurPointHourStorage selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsMeasurPointHourStorage record);

    int updateByPrimaryKey(PomsMeasurPointHourStorage record);
}