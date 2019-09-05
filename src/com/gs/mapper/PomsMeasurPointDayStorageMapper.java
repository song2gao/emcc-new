package com.gs.mapper;

import com.gs.domain.PomsMeasurPointDayStorage;

public interface PomsMeasurPointDayStorageMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsMeasurPointDayStorage record);

    int insertSelective(PomsMeasurPointDayStorage record);

    PomsMeasurPointDayStorage selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsMeasurPointDayStorage record);

    int updateByPrimaryKey(PomsMeasurPointDayStorage record);
}