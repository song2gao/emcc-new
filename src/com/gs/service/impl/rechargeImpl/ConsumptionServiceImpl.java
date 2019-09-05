package com.gs.service.impl.rechargeImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.EsmspUserRechargeDetail;
import com.gs.mapper.EsmspUserInfoMapper;
import com.gs.mapper.EsmspUserRechargeDetailMapper;
import com.gs.service.recharge.ConsumptionService;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年11月3日 上午10:21:57 
* 描述： 
*/
@Service
@Transactional
public class ConsumptionServiceImpl implements ConsumptionService{

	@Resource
	public EsmspUserInfoMapper userMapper;
	
	@Resource
	public EsmspUserRechargeDetailMapper detailMapper;
	
	/* (non-Javadoc)
	 * @see com.gs.service.recharge.ConsumptionService#finCountDetail()
	 */
	@Override
	public int finCountDetail() {
		// TODO Auto-generated method stub
		int falg = detailMapper.getCount();
		return falg;
	}

	/* (non-Javadoc)
	 * @see com.gs.service.recharge.ConsumptionService#findPageAllDetail(int, int)
	 */
	@Override
	public List<EsmspUserRechargeDetail> findPageAllDetail(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		List<EsmspUserRechargeDetail> list = detailMapper.findPageAll(pageSize, pageSize * (pageIndex - 1));
		return list;
	}

	/* (non-Javadoc)
	 * @see com.gs.service.recharge.ConsumptionService#findDetailBySearch(java.lang.String, java.lang.String)
	 */
	@Override
	public List<EsmspUserRechargeDetail> findDetailBySearch(String search, String beforeDate) {
		// TODO Auto-generated method stub
		
//		List<EsmspUserInfo> list = userMapper.findAllBySearch(search);
//		
		List<EsmspUserRechargeDetail> list = detailMapper.searchAll(search,beforeDate);
		return list;
	}

}
