package com.gs.service.alarm;

import java.util.List;

import com.gs.domain.PomsOperationAssignmentSheet;
import com.gs.domain.PomsUsersManagement;

/** 
* @Package:com.gs.service 
* @author:  ybzhu
* @version:2017年11月7日 上午9:30:28 
* @描述： 
*/
public interface AlarmService {

	/**
	 * 查询所有报警信息记录
	 * @param pageIndex 
	 * @param pageSize 
	 * @return
	 */
	List<PomsOperationAssignmentSheet> findAll(int pageSize, int pageIndex);

	/**  
	* @Title: finCount  
	* @Description: 计算报警信息总数 
	* @return int    
	* @throws  
	*/  
	int finCount();

	/**  
	* @Title: findById  
	* @Description: 去查询用户管理表（PomsUsersManagement）
	* @param @param id
	* @return PomsUsersManagement    
	* @throws  
	*/  
	PomsUsersManagement findById(String id);

	/**  
	* @Title: findByAll  
	* @Description: 全查询 所有
	* @return List<PomsUsersManagement>    
	* @throws  
	*/  
	List<PomsUsersManagement> findByAll();

	
	/**  
	* @Title: saveAlarm  
	* @Description: 添加报警信息
	* @param @param sheet
	* @return boolean    
	* @throws  
	*/  
	boolean saveAlarm(PomsOperationAssignmentSheet sheet);

	/**  
	* @Title: updateAlarm  
	* @Description: 修改报警信息
	* @return boolean    
	* @throws  
	*/  
	boolean updateAlarm(PomsOperationAssignmentSheet sheet);

	/**  
	* @Title: delAlarm  
	* @Description:   删除报警信息
	* @return boolean
	* @throws  
	*/  
	boolean delAlarm(String[] array);

	/**  
	* @Title: findAllBySearch  
	* @Description:   条件查询
	* @return List<PomsOperationAssignmentSheet> 
	* @throws  
	*/  
	List<PomsOperationAssignmentSheet> findAllBySearch(String search, String alarminfo, String isok, String date);

	/**
	 * 
	* @Title: findByName  
	* @Description:   通过名字 查询用户
	* @return PomsUsersManagement
	* @throws
	 */
	PomsUsersManagement findByName(String userName);

}
