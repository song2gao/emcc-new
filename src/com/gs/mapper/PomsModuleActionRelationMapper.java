package com.gs.mapper;

import com.gs.domain.PomsModuleActionRelation;

public interface PomsModuleActionRelationMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsModuleActionRelation record);

    int insertSelective(PomsModuleActionRelation record);

    PomsModuleActionRelation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsModuleActionRelation record);

    int updateByPrimaryKey(PomsModuleActionRelation record);
}