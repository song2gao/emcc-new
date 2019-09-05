package com.gs.mapper;

import com.gs.domain.PomsModuleAction;

public interface PomsModuleActionMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsModuleAction record);

    int insertSelective(PomsModuleAction record);

    PomsModuleAction selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsModuleAction record);

    int updateByPrimaryKey(PomsModuleAction record);
}