package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsEnergyUnitInfo;

public interface PomsEnergyUnitInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsEnergyUnitInfo record);

    int insertSelective(PomsEnergyUnitInfo record);

    List<PomsEnergyUnitInfo> selectByPrimaryKey(String id);
    
//    List<PomsEnergyUnitInfo> selectAllById(String id);
    
    List<PomsEnergyUnitInfo> selectAll();

    int updateByPrimaryKeySelective(PomsEnergyUnitInfo record);

    int updateByPrimaryKey(PomsEnergyUnitInfo record);

	List<PomsEnergyUnitInfo> findAllEnegryUnits();

	/**
	 * 根据企业单位名称取得
	 */
	List<PomsEnergyUnitInfo> findEnegryUnits(@Param("code")String code);

	/**
	 * 通过 ROOT  查询企业信息
	 * @param euiParentid
	 * @return
	 */
	List<PomsEnergyUnitInfo> selectByParentid(@Param("euiParentid")String euiParentid);

}