package com.gs.mapper;

import com.gs.domain.PreChannelInfo;

public interface PreChannelInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(PreChannelInfo record);

    int insertSelective(PreChannelInfo record);

    PreChannelInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PreChannelInfo record);

    int updateByPrimaryKey(PreChannelInfo record);
}