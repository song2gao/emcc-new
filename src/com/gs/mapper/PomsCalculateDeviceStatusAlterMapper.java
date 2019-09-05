package com.gs.mapper;

import com.gs.domain.PomsCalculateDeviceStatusAlter;

public interface PomsCalculateDeviceStatusAlterMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsCalculateDeviceStatusAlter record);

    int insertSelective(PomsCalculateDeviceStatusAlter record);

    PomsCalculateDeviceStatusAlter selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsCalculateDeviceStatusAlter record);

    int updateByPrimaryKey(PomsCalculateDeviceStatusAlter record);
}