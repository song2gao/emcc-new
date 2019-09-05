package com.gs.mapper;

import com.gs.domain.EsmspEnterpriseDataAnalyseMonth;

public interface EsmspEnterpriseDataAnalyseMonthMapper {
    int deleteByPrimaryKey(String id);

    int insert(EsmspEnterpriseDataAnalyseMonth record);

    int insertSelective(EsmspEnterpriseDataAnalyseMonth record);

    EsmspEnterpriseDataAnalyseMonth selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(EsmspEnterpriseDataAnalyseMonth record);

    int updateByPrimaryKey(EsmspEnterpriseDataAnalyseMonth record);
}