package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Finance;
import com.nieyue.bean.FinanceRecord;
import com.nieyue.bean.Withdrawals;
import com.nieyue.business.OrderBusiness;
import com.nieyue.dao.FinanceDao;
import com.nieyue.exception.CommonRollbackException;
import com.nieyue.exception.FinanceMoneyNotEnoughException;
import com.nieyue.exception.PayException;
import com.nieyue.service.FinanceRecordService;
import com.nieyue.service.FinanceService;
import com.nieyue.service.WithdrawalsService;
import com.nieyue.util.Arith;
@Service
public class FinanceServiceImpl implements FinanceService{
	@Resource
	FinanceDao financeDao;
	@Resource
	WithdrawalsService withdrawalsService;
	@Resource
	OrderBusiness orderBusiness;
	@Resource
	FinanceRecordService financeRecordService;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public Finance withdrawals(Integer accountId, Integer method, Double money, String realname,
			String accountname) {
		List<Finance> fl = browsePagingFinance(null, accountId, 1, 1, "finance_id", "asc");
		boolean b=false;
			if(fl.size()!=1){
				throw new CommonRollbackException("财务过多");
			}
			Finance f = fl.get(0);
			if(f.getMoney()-money<0){
				throw new FinanceMoneyNotEnoughException();//余额不足
			}
			f.setMoney(Arith.sub(f.getMoney(), money));//减
			f.setWithdrawals(Arith.add(f.getWithdrawals(), money));
			b= updateFinance(f);
			if(!b){
				throw new PayException();
			}
			FinanceRecord fr=new FinanceRecord();
			fr.setAccountId(accountId);
			fr.setMethod(method);
			fr.setMoney(money);
			String transactionNumber = orderBusiness.getOrderNumber(accountId);
			fr.setTransactionNumber(transactionNumber);
			fr.setType(2);//2是账户提现
			fr.setStatus(1);//提现待处理，后台显示操作成功
			b = financeRecordService.addFinanceRecord(fr);
			if(!b){
				throw new PayException();
			}
			Withdrawals withdrawals=new Withdrawals();
			withdrawals.setRealname(realname);
			withdrawals.setAccountname(accountname);
			withdrawals.setFinanceRecordId(fr.getFinanceRecordId());
			b=withdrawalsService.addWithdrawals(withdrawals);
			return f;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addFinance(Finance finance) {
		finance.setCreateDate(new Date());
		finance.setUpdateDate(new Date());
		boolean b = financeDao.addFinance(finance);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delFinance(Integer financeId) {
		boolean b = financeDao.delFinance(financeId);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateFinance(Finance finance) {
		finance.setUpdateDate(new Date());
		boolean b = financeDao.updateFinance(finance);
		return b;
	}

	@Override
	public Finance loadFinance(Integer financeId) {
		Finance r = financeDao.loadFinance(financeId);
		return r;
	}

	@Override
	public int countAll(
			Double money,
			Integer accountId) {
		int c = financeDao.countAll(money,accountId);
		return c;
	}

	@Override
	public List<Finance> browsePagingFinance(Double money,Integer accountId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Finance> l = financeDao.browsePagingFinance(money,accountId,pageNum-1, pageSize, orderName, orderWay);
		return l;
	}
	
}
