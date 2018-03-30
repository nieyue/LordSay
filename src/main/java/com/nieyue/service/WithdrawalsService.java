package com.nieyue.service;

import java.util.List;

import com.nieyue.bean.Withdrawals;

/**
 * 提现信息逻辑层接口
 * @author yy
 *
 */
public interface WithdrawalsService {
	/** 新增提现信息 */	
	public boolean addWithdrawals(Withdrawals withdrawals) ;	
	/** 删除提现信息 */	
	public boolean delWithdrawals(Integer withdrawalsId) ;
	/** 更新提现信息*/	
	public boolean updateWithdrawals(Withdrawals withdrawals);
	/** 装载提现信息 */	
	public Withdrawals loadWithdrawals(Integer withdrawalsId);	
	/** 提现信息总共数目 */	
	public int countAll(Integer financeRecordId);
	/** 分页提现信息信息 */
	public List<Withdrawals> browsePagingWithdrawals(Integer financeRecordId,int pageNum,int pageSize,String orderName,String orderWay) ;
}
