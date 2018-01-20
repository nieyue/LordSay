package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Split;
import com.nieyue.dao.SplitDao;
import com.nieyue.service.SplitService;
@Service
public class SplitServiceImpl implements SplitService{
	@Resource
	SplitDao splitDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addSplit(Split split) {
		split.setCreateDate(new Date());
		split.setUpdateDate(new Date());
		boolean b = splitDao.addSplit(split);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delSplit(Integer splitId) {
		boolean b =splitDao.delSplit(splitId);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateSplit(Split split) {
		split.setUpdateDate(new Date());
		boolean b = splitDao.updateSplit(split);
		return b;
	}

	@Override
	public Split loadSplit(Integer splitId) {
		Split r = splitDao.loadSplit(splitId);
		return r;
	}

	@Override
	public int countAll(
			Integer accountId,
			Integer buyAccountId,
			Date applyDate,
			Date splitDate,
			Date createDate,
			Date updateDate,
			Integer status) {
		int c = splitDao.countAll(
				accountId,buyAccountId,applyDate,splitDate,createDate,updateDate,status);
		return c;
	}

	@Override
	public List<Split> browsePagingSplit(
			Integer accountId,
			Integer buyAccountId,
			Date applyDate,
			Date splitDate,
			Date createDate,
			Date updateDate,
			Integer status,
			int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Split> l = splitDao.browsePagingSplit(
				accountId,
				buyAccountId,
				applyDate,
				splitDate,
				createDate,
				updateDate,
				status,
				pageNum-1,
				pageSize,
				orderName,
				orderWay);
		return l;
	}

	
}
