package com.gs.mapper;

import com.gs.domain.PomsRoleCalculateTerminalRelationship;

public interface PomsRoleCalculateTerminalRelationshipMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsRoleCalculateTerminalRelationship record);

    int insertSelective(PomsRoleCalculateTerminalRelationship record);

    PomsRoleCalculateTerminalRelationship selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsRoleCalculateTerminalRelationship record);

    int updateByPrimaryKey(PomsRoleCalculateTerminalRelationship record);
}