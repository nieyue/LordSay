package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Vip;
import com.nieyue.dao.VipDao;
import com.nieyue.service.VipService;
@Service
public class VipServiceImpl implements VipService{
	@Resource
	VipDao vipDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addVip(Vip vip) {
		vip.setCreateDate(new Date());
		vip.setUpdateDate(new Date());
		boolean b = vipDao.addVip(vip);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delVip(Integer vipId) {
		boolean b = vipDao.delVip(vipId);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateVip(Vip vip) {
		vip.setUpdateDate(new Date());
		boolean b = vipDao.updateVip(vip);
		return b;
	}

	@Override
	public Vip loadVip(Integer vipId) {
		Vip r = vipDao.loadVip(vipId);
		return r;
	}

	@Override
	public int countAll(Integer accountId,Integer level,Date createDate) {
		int c = vipDao.countAll(accountId,level,createDate);
		return c;
	}

	@Override
	public List<Vip> browsePagingVip(Integer accountId,Integer level,Date createDate,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Vip> l = vipDao.browsePagingVip(accountId,level,createDate,pageNum-1, pageSize, orderName, orderWay);
		return l;
	}

	
}
