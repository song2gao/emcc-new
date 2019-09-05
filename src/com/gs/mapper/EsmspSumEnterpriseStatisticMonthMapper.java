package com.gs.mapper;

import com.gs.domain.EsmspSumEnterpriseStatisticMonth;

public interface EsmspSumEnterpriseStatisticMonthMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EsmspSumEnterpriseStatisticMonth record);

    int insertSelective(EsmspSumEnterpriseStatisticMonth record);

    EsmspSumEnterpriseStatisticMonth selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EsmspSumEnterpriseStatisticMonth record);

    int updateByPrimaryKey(EsmspSumEnterpriseStatisticMonth record);
}