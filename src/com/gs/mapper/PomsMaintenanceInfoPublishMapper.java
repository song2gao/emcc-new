package com.gs.mapper;

import com.gs.domain.PomsMaintenanceInfoPublish;

public interface PomsMaintenanceInfoPublishMapper {
    int deleteByPrimaryKey(String id);

    int insert(PomsMaintenanceInfoPublish record);

    int insertSelective(PomsMaintenanceInfoPublish record);

    PomsMaintenanceInfoPublish selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(PomsMaintenanceInfoPublish record);

    int updateByPrimaryKey(PomsMaintenanceInfoPublish record);
}