package com.gs.service.impl.rechargeImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gs.domain.EsmspUserInfo;
import com.gs.domain.EsmspUserRights;
import com.gs.mapper.EsmspUserInfoMapper;
import com.gs.mapper.EsmspUserRightsMapper;
import com.gs.service.recharge.UserRightService;

/**
 * @author 作者 朱亚彬:
 * @version 创建时间：2017年11月3日 上午10:10:28 描述： 预付费充值用户权限实现类
 */
@Service
@Transactional
public class UserRightServiceImpl implements UserRightService {

	@Resource
	public EsmspUserRightsMapper rightsMapper;
	@Resource
	public EsmspUserInfoMapper userMapper;

	/**
	 * 分页全查询用户权限信息
	 */
	@Override
	public List<EsmspUserRights> findPageAll(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		List<EsmspUserRights> list = rightsMapper.findPageAll(pageSize, pageSize * (pageIndex - 1));
		return list;
	}

	/**
	 * 查询用户权限总数
	 */
	@Override
	public int finCount() {
		// TODO Auto-generated method stub
		int falg = rightsMapper.getCount();
		return falg;
	}

	/**
	 * 权限ID作为外键查询用户信息表
	 */
	@Override
	public List<EsmspUserInfo> findAllById(String parseInt) {
		// TODO Auto-generated method stub
		List<EsmspUserInfo> list = userMapper.findByPK(parseInt);
		return list;
	}

	/**
	 * 权限添加
	 */
	@Override
	public boolean saveRights(EsmspUserRights right) {
		// TODO Auto-generated method stub

		int falg = rightsMapper.insert(right);
		if (falg == 1) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 权限修改
	 */
	@Override
	public boolean uppRights(EsmspUserRights right) {
		// TODO Auto-generated method stub
		int falg = rightsMapper.updateByPrimaryKey(right);
		if (falg == 1) {
			return true;
		} else {
			return false;
		}
	}

}
