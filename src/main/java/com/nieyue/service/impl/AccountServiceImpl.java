package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Account;
import com.nieyue.bean.Finance;
import com.nieyue.dao.AccountDao;
import com.nieyue.dao.FinanceDao;
import com.nieyue.service.AccountService;
@Service
public class AccountServiceImpl implements AccountService{
	@Resource
	AccountDao accountDao;
	@Resource
	FinanceDao financeDao;
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addAccount(Account account) {
		Date date=new Date();
		account.setCreateDate(date);
		account.setLoginDate(date);
		account.setStatus(0);
		account.setAuth(0);//没认证
		boolean b = accountDao.addAccount(account);
		Finance finance=new Finance();
		finance.setRecharge(0.0);//充值金额
		finance.setConsume(0.0);//消费金额
		finance.setWithdrawals(0.0);//提现金额
		finance.setRecruitingCommission(0.0);//招收学员佣金
		finance.setRecommendCommission(0.0);//推荐佣金
		finance.setTeamPurchasePrice(0.0);//团购账单
		finance.setSplitReward(0.0);//拆分奖励
		finance.setSplitParentReward(0.0);//拆分上级奖励
		Double unitBaseProfit=0.0;//赠送金钱
		finance.setBaseProfit(unitBaseProfit);
		finance.setMoney(finance.getBaseProfit());//初始余额=赠送金钱+0.0
		finance.setCreateDate(date);
		finance.setUpdateDate(date);
		finance.setAccountId(account.getAccountId());
		b=financeDao.addFinance(finance);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delAccount(Integer accountId) {
		boolean b = accountDao.delAccount(accountId);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateAccount(Account account) {
		boolean b = accountDao.updateAccount(account);
		return b;
	}

	@Override
	public Account loadAccount(Integer accountId) {
		Account r = accountDao.loadAccount(accountId);
		return r;
	}

	@Override
	public int countAll(
			Integer accountId,
			Integer auth,
			String phone,
			String realname,
			Integer roleId,
			Integer status,
			Date createDate,
			Date loginDate) {
		int c = accountDao.countAll(
				accountId,
				auth,
				phone,
				realname,
				roleId,
				status,
				createDate,
				loginDate);
		return c;
	}

	@Override
	public List<Account> browsePagingAccount(
			Integer accountId,
			Integer auth,
			String phone,
			String realname,
			Integer roleId,
			Integer status,
			Date createDate,
			Date loginDate,
			int pageNum, 
			int pageSize,
			String orderName,
			String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Account> l = accountDao.browsePagingAccount(
				accountId,
				auth,
				phone,
				realname,
				roleId,
				status,
				createDate,
				loginDate,
				pageNum-1,
				pageSize, 
				orderName,
				orderWay);
		return l;
	}
	@Override
	public Account loginAccount(String adminName, String password,Integer accountId) {
		Account Account = accountDao.loginAccount(adminName, password, accountId);
		return Account;
	}

}
