package com.nieyue.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Withdrawals;
import com.nieyue.dao.WithdrawalsDao;
import com.nieyue.service.WithdrawalsService;
@Service
public class WithdrawalsServiceImpl implements WithdrawalsService{
	@Resource
	WithdrawalsDao withdrawalsDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addWithdrawals(Withdrawals withdrawals) {
		boolean b = withdrawalsDao.addWithdrawals(withdrawals);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delWithdrawals(Integer withdrawalsId) {
		boolean b = withdrawalsDao.delWithdrawals(withdrawalsId);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateWithdrawals(Withdrawals withdrawals) {
		boolean b = withdrawalsDao.updateWithdrawals(withdrawals);
		return b;
	}

	@Override
	public Withdrawals loadWithdrawals(Integer withdrawalsId) {
		Withdrawals r = withdrawalsDao.loadWithdrawals(withdrawalsId);
		return r;
	}

	@Override
	public int countAll(Integer financeRecordId) {
		int c = withdrawalsDao.countAll(financeRecordId);
		return c;
	}

	@Override
	public List<Withdrawals> browsePagingWithdrawals(Integer financeRecordId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Withdrawals> l = withdrawalsDao.browsePagingWithdrawals(financeRecordId,pageNum-1, pageSize, orderName, orderWay);
		return l;
	}

	
}
