package com.gs.mapper;

import com.gs.domain.PomsEnergyUsingLocation;
import com.gs.domain.PomsEnergyUsingOrganization;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PomsEnergyUsingLocationMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsEnergyUsingLocation record);

    int insertSelective(PomsEnergyUsingLocation record);

    PomsEnergyUsingLocation selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsEnergyUsingLocation record);

    int updateByPrimaryKey(PomsEnergyUsingLocation record);

    List<PomsEnergyUsingLocation> selectByPId(@Param("pid") String pid);
}