package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsCalculateTerminalModel;

public interface PomsCalculateTerminalModelMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsCalculateTerminalModel record);

    int insertSelective(PomsCalculateTerminalModel record);

    PomsCalculateTerminalModel selectByPrimaryKey(String id);
    
    List<PomsCalculateTerminalModel> selectByPrimaryKeyByID(String id);

    int updateByPrimaryKeySelective(PomsCalculateTerminalModel record);

    int updateByPrimaryKey(PomsCalculateTerminalModel record);

	List<PomsCalculateTerminalModel> selectAll();

	/**
	 * 分页查询 条件查询
	 * @param calmodel
	 * @param pageSize
	 * @param pageBegin
	 * @return
	 */
	List<PomsCalculateTerminalModel> selectCodesPage(@Param("calmodel")PomsCalculateTerminalModel calmodel, @Param("pageSize")int pageSize, @Param("pageBegin")int pageBegin);

	/**
	 * 查询总数
	 * @return
	 */
	int getCount();
}