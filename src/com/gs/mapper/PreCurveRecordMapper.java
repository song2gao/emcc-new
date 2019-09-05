package com.gs.mapper;

import com.gs.domain.PreCurveRecord;

public interface PreCurveRecordMapper {
    int deleteByPrimaryKey(String id);

    int insert(PreCurveRecord record);

    int insertSelective(PreCurveRecord record);

    PreCurveRecord selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PreCurveRecord record);

    int updateByPrimaryKey(PreCurveRecord record);
}