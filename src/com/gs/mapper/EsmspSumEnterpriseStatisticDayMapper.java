package com.gs.mapper;

import com.gs.domain.EsmspSumEnterpriseStatisticDay;

public interface EsmspSumEnterpriseStatisticDayMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EsmspSumEnterpriseStatisticDay record);

    int insertSelective(EsmspSumEnterpriseStatisticDay record);

    EsmspSumEnterpriseStatisticDay selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EsmspSumEnterpriseStatisticDay record);

    int updateByPrimaryKey(EsmspSumEnterpriseStatisticDay record);
}