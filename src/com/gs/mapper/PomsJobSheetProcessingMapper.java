package com.gs.mapper;

import com.gs.domain.PomsJobSheetProcessing;

public interface PomsJobSheetProcessingMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsJobSheetProcessing record);

    int insertSelective(PomsJobSheetProcessing record);

    PomsJobSheetProcessing selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsJobSheetProcessing record);

    int updateByPrimaryKey(PomsJobSheetProcessing record);
}