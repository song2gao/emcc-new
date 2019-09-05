package com.gs.mapper;

import com.gs.domain.PomsCalculateTerminalDeviceParam;

public interface PomsCalculateTerminalDeviceParamMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsCalculateTerminalDeviceParam record);

    int insertSelective(PomsCalculateTerminalDeviceParam record);

    PomsCalculateTerminalDeviceParam selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsCalculateTerminalDeviceParam record);

    int updateByPrimaryKey(PomsCalculateTerminalDeviceParam record);
}