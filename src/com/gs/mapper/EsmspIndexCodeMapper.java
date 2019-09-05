package com.gs.mapper;

import com.gs.domain.EsmspIndexCode;

public interface EsmspIndexCodeMapper {
    int deleteByPrimaryKey(Integer indexCode);

    int insert(EsmspIndexCode record);

    int insertSelective(EsmspIndexCode record);

    EsmspIndexCode selectByPrimaryKey(Integer indexCode);

    int updateByPrimaryKeySelective(EsmspIndexCode record);

    int updateByPrimaryKey(EsmspIndexCode record);
}