package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsFrontProcessorConfig;

public interface PomsFrontProcessorConfigMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsFrontProcessorConfig record);

    int insertSelective(PomsFrontProcessorConfig record);

    PomsFrontProcessorConfig selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsFrontProcessorConfig record);

    int updateByPrimaryKey(PomsFrontProcessorConfig record);

	
    List<PomsFrontProcessorConfig> getFrontendAll(@Param("i")int i, @Param("pageSize")int pageSize);

	int getFrontendAllCount();

	List<PomsFrontProcessorConfig> getFrontendMo(@Param("names")String names, @Param("ports")String ports, @Param("i")int i, @Param("pageSize")int pageSize);

	int getFrontendMoCount(@Param("names")String names, @Param("ports")String ports);

	List<PomsFrontProcessorConfig> selectByAll();
}