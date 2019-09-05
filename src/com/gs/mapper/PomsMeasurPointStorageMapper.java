package com.gs.mapper;

import com.gs.domain.PomsMeasurPointStorage;

public interface PomsMeasurPointStorageMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsMeasurPointStorage record);

    int insertSelective(PomsMeasurPointStorage record);

    PomsMeasurPointStorage selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsMeasurPointStorage record);

    int updateByPrimaryKeyWithBLOBs(PomsMeasurPointStorage record);

    int updateByPrimaryKey(PomsMeasurPointStorage record);
}