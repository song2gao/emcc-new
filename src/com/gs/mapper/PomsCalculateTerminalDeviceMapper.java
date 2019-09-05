package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsCalculateTerminalDevice;

public interface PomsCalculateTerminalDeviceMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsCalculateTerminalDevice record);

    int insertSelective(PomsCalculateTerminalDevice record);

    PomsCalculateTerminalDevice selectByCode(@Param("code") String ctdCode);

    int updateByPrimaryKeySelective(PomsCalculateTerminalDevice record);

    int updateByPrimaryKey(PomsCalculateTerminalDevice record);
    
    String[] findByEnergyType(@Param("energyType") String[] energyType,@Param("flag")String flag);

    String[] findTerType(@Param("terType") String[] terType);

    String[] findByEnergyType(@Param("energyType") String[] energyType);

    String[] findByLikeName(@Param("name") String name);
    
    List<PomsCalculateTerminalDevice> findAllByEnergyType(@Param("energyType") String energyType,@Param("flag")String flag);
    
    List<PomsCalculateTerminalDevice> findChildTabUnitInfo(String enegryid);

	List<PomsCalculateTerminalDevice> findMeasurCalculateAndPoint(@Param("unitid")String unitid, @Param("calculteid")String calculteid,
			@Param("i")int i,@Param("pageSize")int pageSize);

	int findMeasurCalculateCount(@Param("unitid")String unitid, @Param("calculteid")String calculteid);

	int deleteByAll(String[] aa);

	List<PomsCalculateTerminalDevice> selectByAll(@Param("calmodel")PomsCalculateTerminalDevice calmodel);
}