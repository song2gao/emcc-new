package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsOperationAssignmentSheet;

public interface PomsOperationAssignmentSheetMapper {
	int deleteByPrimaryKey(String id);

	int insert(PomsOperationAssignmentSheet record);

	int insertSelective(PomsOperationAssignmentSheet record);

	PomsOperationAssignmentSheet selectByPrimaryKey(String id);

	int updateByPrimaryKeySelective(PomsOperationAssignmentSheet record);

	int updateByPrimaryKey(PomsOperationAssignmentSheet record);

	/**
	 * @Title: findAll @Description: 分页查询报警信息 @param @param
	 * pageSize @param @param i @param @return 设定文件 @return
	 * List<PomsOperationAssignmentSheet> 返回类型 @throws
	 */
	List<PomsOperationAssignmentSheet> findAll(@Param("pageSize") int pageSize, @Param("pageBegin") int pageBegin);

	/**
	 * @Title: getCount @Description: 计算总数 @param @return 设定文件 @return int
	 * 返回类型 @throws
	 */
	int getCount();

	/**
	 * @Title: findBySearch @Description: 条件查询 @return
	 * List<PomsOperationAssignmentSheet> @throws
	 */
	List<PomsOperationAssignmentSheet> findBySearch(@Param("search") String search,
			@Param("alarminfo") String alarminfo, @Param("isok") String isok, @Param("date") String date);

	/**  
	* @Title: deleteByAll  
	* @Description:   批量删除
	* @return int
	* @throws  
	*/  
	int deleteByAll(String[] id);
	
}