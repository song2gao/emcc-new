package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsModulesManagement;

public interface PomsModulesManagementMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsModulesManagement record);

    int insertSelective(PomsModulesManagement record);

    PomsModulesManagement selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsModulesManagement record);

    int updateByPrimaryKey(PomsModulesManagement record);
    
    List<PomsModulesManagement> selectByRoleAction(@Param("userId") String userId,@Param("property") String type,@Param("parentCode")String parentId);
}