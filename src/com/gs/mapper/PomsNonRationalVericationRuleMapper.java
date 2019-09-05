package com.gs.mapper;

import com.gs.domain.PomsNonRationalVericationRule;

public interface PomsNonRationalVericationRuleMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsNonRationalVericationRule record);

    int insertSelective(PomsNonRationalVericationRule record);

    PomsNonRationalVericationRule selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsNonRationalVericationRule record);

    int updateByPrimaryKey(PomsNonRationalVericationRule record);
}