package com.gs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gs.domain.PomsPersonalsInfo;

public interface PomsPersonalsInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsPersonalsInfo record);

    int insertSelective(PomsPersonalsInfo record);

    PomsPersonalsInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsPersonalsInfo record);

    int updateByPrimaryKey(PomsPersonalsInfo record);

	List<PomsPersonalsInfo> selectByAll(Integer index, int i);

	List<PomsPersonalsInfo> selectByAllPage(@Param("pageSize")int pageSize, @Param("i")int i, @Param("unitid")String unitid);

	List<PomsPersonalsInfo> selectByCodes(@Param("code")PomsPersonalsInfo code);

	/**
	 * 全查询  条件查询 万能方法
	 * @param person
	 * @param pageSize
	 * @param i
	 * @return
	 */
	List<PomsPersonalsInfo> selectCodesPage(@Param("person")PomsPersonalsInfo person, @Param("pageSize")int pageSize, @Param("pageBegin")int i);

	/**
	 * 查询总数  人员信息维护
	 */
	int getCount(@Param("unitid")String unitid);
}