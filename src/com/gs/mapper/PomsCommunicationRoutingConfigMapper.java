package com.gs.mapper;

import com.gs.domain.PomsCommunicationRoutingConfig;

public interface PomsCommunicationRoutingConfigMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsCommunicationRoutingConfig record);

    int insertSelective(PomsCommunicationRoutingConfig record);

    PomsCommunicationRoutingConfig selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsCommunicationRoutingConfig record);

    int updateByPrimaryKey(PomsCommunicationRoutingConfig record);
}