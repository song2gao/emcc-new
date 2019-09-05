package com.gs.service.impl.rechargeImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.EsmspUserRechargeRecord;
import com.gs.mapper.EsmspUserInfoMapper;
import com.gs.mapper.EsmspUserRechargeRecordMapper;
import com.gs.mapper.EsmspUserRightsMapper;
import com.gs.service.recharge.RecordService;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年11月3日 上午10:22:20 
* 描述： 
*/
@Service
@Transactional
public class RecordServiceImpl implements RecordService {

	@Resource
	public EsmspUserRechargeRecordMapper recordMapper;
	@Resource
	public EsmspUserRightsMapper rightsMapper;
	@Resource
	public EsmspUserInfoMapper userMapper;
	
	
	/* (non-Javadoc)
	 * @see com.gs.service.recharge.RecordService#finCountRecord()
	 * 计算总数
	 */
	@Override
	public int finCountRecord() {
		// TODO Auto-generated method stub
		int falg = recordMapper.getCount();
		return falg;
	}

	/* (non-Javadoc)
	 * @see com.gs.service.recharge.RecordService#findPageAllRecord(int, int)
	 * 分页方法查询
	 */
	@Override
	public List<EsmspUserRechargeRecord> findPageAllRecord(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		List<EsmspUserRechargeRecord> list = recordMapper.findPageAll(pageSize, pageSize * (pageIndex - 1));
		return list;
	}

	/* (non-Javadoc)
	 * @see com.gs.service.recharge.RecordService#findRecordBySearch(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public List<EsmspUserRechargeRecord> findRecordBySearch(String search, String beforeDate, String alterDate) {
		// TODO Auto-generated method stub
		List<EsmspUserRechargeRecord> list = recordMapper.searchAll(search,beforeDate,alterDate);
		return list;
	}

}
