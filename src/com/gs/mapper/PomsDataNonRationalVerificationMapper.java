package com.gs.mapper;

import com.gs.domain.PomsDataNonRationalVerification;

public interface PomsDataNonRationalVerificationMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsDataNonRationalVerification record);

    int insertSelective(PomsDataNonRationalVerification record);

    PomsDataNonRationalVerification selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsDataNonRationalVerification record);

    int updateByPrimaryKey(PomsDataNonRationalVerification record);
}