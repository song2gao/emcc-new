package com.gs.service.impl.rechargeImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.EsmspUserRechargeDetail;
import com.gs.domain.EsmspUserRechargeRecord;
import com.gs.domain.EsmspUserInfo;
import com.gs.mapper.EsmspUserRechargeDetailMapper;
import com.gs.mapper.EsmspUserRechargeRecordMapper;
import com.gs.mapper.EsmspUserInfoMapper;
import com.gs.service.recharge.UserInfoService;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年11月3日 上午10:07:46 描述： 充值用户信息实现类
 */
@Service
@Transactional
public class UserInfoServiceImpl implements UserInfoService {

	@Resource
	public EsmspUserInfoMapper userMapper;
	@Resource
	public EsmspUserRechargeRecordMapper recordMapper;
	@Resource
	public EsmspUserRechargeDetailMapper detailMapper;

	/**
	 * 查询总数
	 */
	@Override
	public int finCount() {
		// TODO Auto-generated method stub
		int flag = userMapper.getCount();
		return flag;
	}

	/**
	 * 分页查询所有
	 */
	@Override
	public List<EsmspUserInfo> findPageAll(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		List<EsmspUserInfo> list = userMapper.selectByAll(pageSize, pageSize * (pageIndex - 1));
		return list;
	}

	/**
	 * 条件查询 用户信息
	 */
	@Override
	public List<EsmspUserInfo> findAllBySearch(String search) {
		// TODO Auto-generated method stub
		List<EsmspUserInfo> list = userMapper.findAllBySearch(search);
		return list;
	}

	/**
	 * 仅加载 欠费用户信息
	 */
	@Override
	public List<EsmspUserInfo> findAllByNum() {
		// TODO Auto-generated method stub
		List<EsmspUserInfo> list = userMapper.selectByAll(0, 0);
		return list;
	}

	/**
	 * 添加和修改用户信息
	 */
	@Override
	public int saveUser(EsmspUserInfo userinfo) {
		// TODO Auto-generated method stub
		int falg = userMapper.insert(userinfo);// 第一种返回int在 controller判断
		return falg;
	}

	/**
	 * 删除 用户信息
	 */
	@Override
	public boolean delById(String userId) {
		// TODO Auto-generated method stub
		int falg = userMapper.deleteByPrimaryKey(userId);// 第一种返回int在下面判断返回
		if (falg == 1) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 查询一个 用户信息
	 */
	@Override
	public EsmspUserInfo findById(String userId) {
		// TODO Auto-generated method stub
		EsmspUserInfo userInfo = userMapper.selectByPrimaryKey(userId);
		return userInfo;
	}

	/**
	 * 查询充值记录 通过外键ID
	 */
	@Override
	public List<EsmspUserRechargeRecord> findAllRecordById(String userId) {
		// TODO Auto-generated method stub
		List<EsmspUserRechargeRecord> record = recordMapper.selectByPK(userId);
		return record;
	}

	/**
	 * 查询消费记录 通过ID
	 */
	@Override
	public List<EsmspUserRechargeDetail> findAllDetailById(String userId) {
		// TODO Auto-generated method stub
		List<EsmspUserRechargeDetail> detail = detailMapper.selectByPK(userId);
		return detail;
	}

	/**
	 * 修改用户信息
	 */
	@Override
	public int uppUser(EsmspUserInfo userinfo) {
		// TODO Auto-generated method stub
		int falg = userMapper.updateByPrimaryKey(userinfo);// 第一种返回int在 controller判断
		return falg;
	}

}
