package com.gs.mapper;

import com.gs.domain.PomsOperationSystemLog;

public interface PomsOperationSystemLogMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsOperationSystemLog record);

    int insertSelective(PomsOperationSystemLog record);

    PomsOperationSystemLog selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsOperationSystemLog record);

    int updateByPrimaryKey(PomsOperationSystemLog record);
}