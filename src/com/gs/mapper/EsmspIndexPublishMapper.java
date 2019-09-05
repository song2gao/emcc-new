package com.gs.mapper;

import com.gs.domain.EsmspIndexPublish;

public interface EsmspIndexPublishMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspIndexPublish record);

    int insertSelective(EsmspIndexPublish record);

    EsmspIndexPublish selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspIndexPublish record);

    int updateByPrimaryKey(EsmspIndexPublish record);
}