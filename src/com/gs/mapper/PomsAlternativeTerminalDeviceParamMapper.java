package com.gs.mapper;

import com.gs.domain.PomsAlternativeTerminalDeviceParam;

public interface PomsAlternativeTerminalDeviceParamMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsAlternativeTerminalDeviceParam record);

    int insertSelective(PomsAlternativeTerminalDeviceParam record);

    PomsAlternativeTerminalDeviceParam selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsAlternativeTerminalDeviceParam record);

    int updateByPrimaryKey(PomsAlternativeTerminalDeviceParam record);
}