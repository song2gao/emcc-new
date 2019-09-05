package com.gs.service.impl.maintenance.unitImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.PomsPersonalsInfo;
import com.gs.mapper.PomsPersonalsInfoMapper;
import com.gs.service.maintenance.unit.PersonInfoService;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年10月26日 下午2:44:14 描述：
 */
@Service
@Transactional
public class PersonInfoServiceImpl implements PersonInfoService {

	@Resource
	public PomsPersonalsInfoMapper personMapper;

	/**
	 * 全查询 人员信息维护
	 */
	@Override
	public List<PomsPersonalsInfo> getPersonPage(PomsPersonalsInfo person, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub

		List<PomsPersonalsInfo> list = personMapper.selectCodesPage(person, pageSize, pageSize * (pageIndex - 1));

		return list;
	}

	/**
	 * 全查询 人员信息维护
	 */
	@Override
	public int savePerson(PomsPersonalsInfo info) {
		// TODO Auto-generated method stub

		int flag = personMapper.insert(info);

		return flag;
	}

	/**
	 * 全查询 人员信息维护
	 */
	@Override
	public int uppPerson(PomsPersonalsInfo info) {
		// TODO Auto-generated method stub
		int flag = personMapper.updateByPrimaryKey(info);
		return flag;
	}

	/**
	 * 全查询 人员信息维护
	 */
	@Override
	public int delPersonInfo(String id) {
		// TODO Auto-generated method stub
		int flag = personMapper.deleteByPrimaryKey(id);
		return flag;
	}

	/**
	 * 全查询 人员信息维护
	 */
	@Override
	public List<PomsPersonalsInfo> findSearch(String search) {
		// TODO Auto-generated method stub
		PomsPersonalsInfo code = new PomsPersonalsInfo();
		code.setPiName(search);
		List<PomsPersonalsInfo> list = personMapper.selectByCodes(code);
		return list;
	}

	/**
	 * 全查询 人员信息维护
	 */
	@Override
	public int getCount(String unitid) {
		// TODO Auto-generated method stub
		int count = personMapper.getCount(unitid);
		return count;
	}

}
