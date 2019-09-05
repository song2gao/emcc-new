package com.gs.mapper;

import com.gs.domain.PomsUnitInfo;

public interface PomsUnitInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsUnitInfo record);

    int insertSelective(PomsUnitInfo record);

    PomsUnitInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsUnitInfo record);

    int updateByPrimaryKey(PomsUnitInfo record);
}