package com.gs.mapper;

import com.gs.domain.PomsFileRelate;

public interface PomsFileRelateMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsFileRelate record);

    int insertSelective(PomsFileRelate record);

    PomsFileRelate selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsFileRelate record);

    int updateByPrimaryKey(PomsFileRelate record);
}