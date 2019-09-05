package com.gs.mapper;

import com.gs.domain.PomsEnergyUsingSystem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PomsEnergyUsingSystemMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsEnergyUsingSystem record);

    int insertSelective(PomsEnergyUsingSystem record);

    PomsEnergyUsingSystem selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsEnergyUsingSystem record);

    int updateByPrimaryKey(PomsEnergyUsingSystem record);

    List<PomsEnergyUsingSystem> selectByPId(@Param("pid") String pid);

    List<PomsEnergyUsingSystem> selectByPIdAndLevel(@Param("pid") String pid,@Param("level") String level);
}