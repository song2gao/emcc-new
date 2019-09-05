package com.gs.service.impl.alarmImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.PomsOperationAssignmentSheet;
import com.gs.domain.PomsUsersManagement;
import com.gs.mapper.PomsOperationAssignmentSheetMapper;
import com.gs.mapper.PomsUsersManagementMapper;
import com.gs.service.alarm.AlarmService;

/**
 * @Package:com.gs.service
 * @author: ybzhu
 * @version:2017年11月7日 上午9:31:01 @描述：
 */
@Service
@Transactional
public class AlarmServiceImpl implements AlarmService {

	@Resource
	public PomsOperationAssignmentSheetMapper sheetMapper;
	@Resource
	public PomsUsersManagementMapper usersMapper;

	/*
	 * 
	 * 
	 * @Title: findAll
	 * 
	 * @Description: 查询所有报警记录信息
	 * 
	 * @param pageSize
	 * 
	 * @param pageIndex
	 * 
	 * @return
	 * 
	 * @see com.gs.service.alarm.AlarmService#findAll(int, int)
	 */
	@Override
	public List<PomsOperationAssignmentSheet> findAll(int pageSize, int pageIndex) {
		// TODO Auto-generated method stub

		List<PomsOperationAssignmentSheet> list = sheetMapper.findAll(pageSize, pageSize * (pageIndex - 1));
		return list;
	}

	/*
	 * 
	 * 
	 * @Title: finCount
	 * 
	 * @Description: TODO 计算报警信息总数
	 * 
	 * @return
	 * 
	 * @see com.gs.service.alarm.AlarmService#finCount()
	 */
	@Override
	public int finCount() {
		// TODO Auto-generated method stub
		int flag = sheetMapper.getCount();
		return flag;
	}

	/*
	 * 
	 * 
	 * @Title: findById
	 * 
	 * @Description: 查询 用户管理（PomsUsersManagement）表
	 * 
	 * @param id
	 * 
	 * @return
	 * 
	 * @see com.gs.service.alarm.AlarmService#findById(java.lang.String)
	 */
	@Override
	public PomsUsersManagement findById(String id) {
		// TODO Auto-generated method stub
		PomsUsersManagement users = usersMapper.selectByPrimaryKey(id);
		return users;
	}

	
	/* 
	 * @Title: findByAll
	 * @Description: 全查询所有
	 * @return 
	 * @see com.gs.service.alarm.AlarmService#findByAll() 
	 */
	@Override
	public List<PomsUsersManagement> findByAll() {
		// TODO Auto-generated method stub
		
		List<PomsUsersManagement> list=usersMapper.findByAll();
		return list;
	}

	/* 
	 * @Title: saveAlarm
	 * @Description: 添加
	 * @param sheet
	 * @return 
	 * @see com.gs.service.alarm.AlarmService#saveAlarm(com.gs.domain.PomsOperationAssignmentSheet) 
	 */
	@Override
	public boolean saveAlarm(PomsOperationAssignmentSheet sheet) {
		// TODO Auto-generated method stub
		
		int falg=sheetMapper.insert(sheet);
		if(falg==1){
			return true;
		}else{
			return false;
		}
	}

	/* 
	 * @Title: updateAlarm
	 * @Description: 修改
	 * @param sheet
	 * @return 
	 * @see com.gs.service.alarm.AlarmService#updateAlarm(com.gs.domain.PomsOperationAssignmentSheet) 
	 */
	@Override
	public boolean updateAlarm(PomsOperationAssignmentSheet sheet) {
		// TODO Auto-generated method stub
		int falg=sheetMapper.updateByPrimaryKey(sheet);
		if(falg==1){
			return true;
		}else{
			return false;
		}
	}

	/* 
	 * @Title: delAlarm
	 * @Description: 删除
	 * @param id
	 * @return 
	 * @see com.gs.service.alarm.AlarmService#delAlarm(java.lang.String) 
	 */
	@Override
	public boolean delAlarm(String[] id) {
		// TODO Auto-generated method stub
		int falg=sheetMapper.deleteByAll(id);
		if(falg>0){
			return true;
		}else{
			return false;
		}
		
	}

	
	/* 
	 * @Title: findAllBySearch
	 * @Description: 条件查询
	 * @param search
	 * @param alarminfo
	 * @param isok
	 * @param date
	 * @return 
	 * @see com.gs.service.alarm.AlarmService#findAllBySearch(java.lang.String, java.lang.String, java.lang.String, java.lang.String) 
	 */
	@Override
	public List<PomsOperationAssignmentSheet> findAllBySearch(String search, String alarminfo, String isok,
			String date) {
		// TODO Auto-generated method stub
		List<PomsOperationAssignmentSheet> list=sheetMapper.findBySearch(search,alarminfo,isok,date);
		
		return list;
	}

	/* 
	 * @Title: findByName
	 * @Description: 通过名字查询用户ID
	 * @param userName
	 * @return 
	 * @see com.gs.service.alarm.AlarmService#findByName(java.lang.String) 
	 */
	@Override
	public PomsUsersManagement findByName(String userName) {
		// TODO Auto-generated method stub
		PomsUsersManagement user=usersMapper.findByName(userName);
		return user;
	}

}
