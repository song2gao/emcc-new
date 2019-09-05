package com.gs.mapper;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsConsumeEnergyTerminalRef;

public interface PomsConsumeEnergyTerminalRefMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsConsumeEnergyTerminalRef record);

    int insertSelective(PomsConsumeEnergyTerminalRef record);

    PomsConsumeEnergyTerminalRef selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsConsumeEnergyTerminalRef record);

    int updateByPrimaryKey(PomsConsumeEnergyTerminalRef record);
    /**
     * 根据分项类型和分项编码查找表计
     * @param type 分项类型
     * @param code 分项编码
     * @return 表计数组
     */
    String[] selectCtdsByTypeAndCode(@Param("type")String type,@Param("code")String code);
}