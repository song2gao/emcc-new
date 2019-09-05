package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsRoleModuleAction;

public interface PomsRoleModuleActionMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsRoleModuleAction record);

    int insertSelective(PomsRoleModuleAction record);

    PomsRoleModuleAction selectByPrimaryKey(String id);
    
    List<PomsRoleModuleAction> selectByRAId(@Param("raId")String raId);

    int updateByPrimaryKeySelective(PomsRoleModuleAction record);

    int updateByPrimaryKey(PomsRoleModuleAction record);
}