package com.gs.mapper;

import com.gs.domain.EsmspIndexAssess;

public interface EsmspIndexAssessMapper {
    int deleteByPrimaryKey(String assessId);

    int insert(EsmspIndexAssess record);

    int insertSelective(EsmspIndexAssess record);

    EsmspIndexAssess selectByPrimaryKey(String assessId);

    int updateByPrimaryKeySelective(EsmspIndexAssess record);

    int updateByPrimaryKey(EsmspIndexAssess record);
}