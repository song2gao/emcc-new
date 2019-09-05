package com.gs.mapper;

import com.gs.domain.PomsOperationBussinessLog;

public interface PomsOperationBussinessLogMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsOperationBussinessLog record);

    int insertSelective(PomsOperationBussinessLog record);

    PomsOperationBussinessLog selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsOperationBussinessLog record);

    int updateByPrimaryKey(PomsOperationBussinessLog record);
}