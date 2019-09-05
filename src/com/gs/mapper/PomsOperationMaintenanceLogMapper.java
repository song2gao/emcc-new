package com.gs.mapper;

import com.gs.domain.PomsOperationMaintenanceLog;

public interface PomsOperationMaintenanceLogMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsOperationMaintenanceLog record);

    int insertSelective(PomsOperationMaintenanceLog record);

    PomsOperationMaintenanceLog selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsOperationMaintenanceLog record);

    int updateByPrimaryKey(PomsOperationMaintenanceLog record);
}