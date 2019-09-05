package com.gs.mapper;

import com.gs.domain.EsmspIndexType;

public interface EsmspIndexTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EsmspIndexType record);

    int insertSelective(EsmspIndexType record);

    EsmspIndexType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EsmspIndexType record);

    int updateByPrimaryKey(EsmspIndexType record);
}