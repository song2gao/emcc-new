package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsCodeManagement;

public interface PomsCodeManagementMapper {
	
    int deleteByPrimaryKey(String cmId);

    int insert(PomsCodeManagement record);

    int insertSelective(PomsCodeManagement record);

    List<PomsCodeManagement> selectByCode(@Param("code")String code,@Param("type") String type);
    
    List<PomsCodeManagement> selectById(@Param("cmParentId")String cmParentId);
    
    List<PomsCodeManagement> selectByCmCode(@Param("cmCode")String cmCode);
    
    List<PomsCodeManagement> selectByLikeName(@Param("name") String name,@Param("type") String type);

    int updateByPrimaryKeySelective(PomsCodeManagement record);

    int updateByPrimaryKey(PomsCodeManagement record);

//	List<PomsCodeManagement> selectByCodeType(String cmCode);
	
	
	List<PomsCodeManagement> selectByCodes(@Param("code")PomsCodeManagement code);
	
}