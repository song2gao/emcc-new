package com.gs.service.maintenance.unit;

import java.util.List;

import com.gs.domain.PomsPersonalsInfo;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年10月26日 下午2:43:52 
* 描述： 人员信息维护 接口
*/
public interface PersonInfoService {

	/**
	 * 全查询 人员信息维护
	 * 
	 * @param person
	 * @param parseInt
	 * @param parseInt2
	 * @return
	 */
	List<PomsPersonalsInfo> getPersonPage(PomsPersonalsInfo person, int pageIndex, int pageSize);

	/**
	 * 人员信息维护 添加
	 * @param info
	 * @return
	 */
	int savePerson(PomsPersonalsInfo info);

	/**
	 * 人员信息维护 修改
	 * @param info
	 * @return
	 */
	int uppPerson(PomsPersonalsInfo info);

	/**
	 * 人员信息维护 删除
	 * @param id
	 * @return
	 */
	int delPersonInfo(String id);

	/**
	 * 查询方法 废弃了！！！
	 * @param search
	 * @return
	 */
	List<PomsPersonalsInfo> findSearch(String search);

	/**
	 * 通过ID查询总数
	 * @param unitid
	 * @return
	 */
	int getCount(String unitid);

}
