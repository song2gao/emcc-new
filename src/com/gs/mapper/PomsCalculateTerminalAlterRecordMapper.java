package com.gs.mapper;

import com.gs.domain.PomsCalculateTerminalAlterRecord;

public interface PomsCalculateTerminalAlterRecordMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsCalculateTerminalAlterRecord record);

    int insertSelective(PomsCalculateTerminalAlterRecord record);

    PomsCalculateTerminalAlterRecord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsCalculateTerminalAlterRecord record);

    int updateByPrimaryKey(PomsCalculateTerminalAlterRecord record);
}