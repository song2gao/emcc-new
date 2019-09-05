package com.gs.mapper;

import com.gs.domain.PomsRoleAuthorization;

public interface PomsRoleAuthorizationMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsRoleAuthorization record);

    int insertSelective(PomsRoleAuthorization record);

    PomsRoleAuthorization selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsRoleAuthorization record);

    int updateByPrimaryKey(PomsRoleAuthorization record);
}