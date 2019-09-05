package com.gs.mapper;

import com.gs.domain.PomsSystemModelParam;

public interface PomsSystemModelParamMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsSystemModelParam record);

    int insertSelective(PomsSystemModelParam record);

    PomsSystemModelParam selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsSystemModelParam record);

    int updateByPrimaryKey(PomsSystemModelParam record);
}