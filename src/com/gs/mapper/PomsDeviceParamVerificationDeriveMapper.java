package com.gs.mapper;

import com.gs.domain.PomsDeviceParamVerificationDerive;

public interface PomsDeviceParamVerificationDeriveMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsDeviceParamVerificationDerive record);

    int insertSelective(PomsDeviceParamVerificationDerive record);

    PomsDeviceParamVerificationDerive selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsDeviceParamVerificationDerive record);

    int updateByPrimaryKey(PomsDeviceParamVerificationDerive record);
}