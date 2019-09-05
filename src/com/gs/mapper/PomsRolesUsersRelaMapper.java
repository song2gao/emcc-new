package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsRolesUsersRela;

public interface PomsRolesUsersRelaMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsRolesUsersRela record);

    int insertSelective(PomsRolesUsersRela record);

    PomsRolesUsersRela selectByPrimaryKey(String id);
    
    List<PomsRolesUsersRela> selectByUserId(@Param("userId") String userId);

    int updateByPrimaryKeySelective(PomsRolesUsersRela record);

    int updateByPrimaryKey(PomsRolesUsersRela record);
}