package com.gs.mapper;

import com.gs.domain.PomsMeasurpointWarningStorage;

public interface PomsMeasurpointWarningStorageMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsMeasurpointWarningStorage record);

    int insertSelective(PomsMeasurpointWarningStorage record);

    PomsMeasurpointWarningStorage selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsMeasurpointWarningStorage record);

    int updateByPrimaryKey(PomsMeasurpointWarningStorage record);
}