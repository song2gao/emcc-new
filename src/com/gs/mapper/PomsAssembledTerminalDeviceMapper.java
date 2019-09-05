package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsAssembledTerminalDevice;

public interface PomsAssembledTerminalDeviceMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsAssembledTerminalDevice record);

    int insertSelective(PomsAssembledTerminalDevice record);

    PomsAssembledTerminalDevice selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsAssembledTerminalDevice record);

    int updateByPrimaryKey(PomsAssembledTerminalDevice record);

	List<PomsAssembledTerminalDevice> findAss(@Param("unitid")String unitid);

	List<PomsAssembledTerminalDevice> findAssAll();

}