package com.gs.mapper;

import com.gs.domain.PomsMeasurDeviceConfig;

public interface PomsMeasurDeviceConfigMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsMeasurDeviceConfig record);

    int insertSelective(PomsMeasurDeviceConfig record);

    PomsMeasurDeviceConfig selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsMeasurDeviceConfig record);

    int updateByPrimaryKey(PomsMeasurDeviceConfig record);
}