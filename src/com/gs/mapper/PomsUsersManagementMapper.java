package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsUsersManagement;

public interface PomsUsersManagementMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsUsersManagement record);

    int insertSelective(PomsUsersManagement record);

    PomsUsersManagement selectByPrimaryKey(String id);
    
    PomsUsersManagement selectByUnamePwd(@Param("loginName")String loginName,@Param("loginPassword")String loginPassword);

    int updateByPrimaryKeySelective(PomsUsersManagement record);

    int updateByPrimaryKey(PomsUsersManagement record);

	/**  
	* @Title: findByAll  
	* @Description: 无条件 全查询
	* @param @return    设定文件  
	* @return List<PomsUsersManagement>    返回类型  
	* @throws  
	*/  
	List<PomsUsersManagement> findByAll();

	/**  
	* @Title: findByName  
	* @Description:   通过名字查询用户ID
	* @return PomsUsersManagement
	* @throws  
	*/  
	PomsUsersManagement findByName(@Param("userName")String userName);

}