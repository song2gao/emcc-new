package com.gs.mapper;

import com.gs.domain.EsmspIndexStandard;

public interface EsmspIndexStandardMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspIndexStandard record);

    int insertSelective(EsmspIndexStandard record);

    EsmspIndexStandard selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspIndexStandard record);

    int updateByPrimaryKey(EsmspIndexStandard record);
}