package com.gs.mapper;

import com.gs.domain.PomsFile;

public interface PomsFileMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsFile record);

    int insertSelective(PomsFile record);

    PomsFile selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsFile record);

    int updateByPrimaryKey(PomsFile record);
}