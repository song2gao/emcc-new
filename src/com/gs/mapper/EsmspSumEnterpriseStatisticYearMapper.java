package com.gs.mapper;

import com.gs.domain.EsmspSumEnterpriseStatisticYear;

public interface EsmspSumEnterpriseStatisticYearMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EsmspSumEnterpriseStatisticYear record);

    int insertSelective(EsmspSumEnterpriseStatisticYear record);

    EsmspSumEnterpriseStatisticYear selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EsmspSumEnterpriseStatisticYear record);

    int updateByPrimaryKey(EsmspSumEnterpriseStatisticYear record);
}