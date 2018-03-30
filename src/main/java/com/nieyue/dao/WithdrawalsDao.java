package com.nieyue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.nieyue.bean.Withdrawals;

/**
 * 提现信息数据库接口
 * @author yy
 *
 */
@Mapper
public interface WithdrawalsDao {
	/** 新增提现信息*/	
	public boolean addWithdrawals(Withdrawals withdrawals) ;	
	/** 删除提现信息 */	
	public boolean delWithdrawals(Integer withdrawalsId) ;
	/** 更新提现信息*/	
	public boolean updateWithdrawals(Withdrawals withdrawals);
	/** 装载提现信息 */	
	public Withdrawals loadWithdrawals(Integer withdrawalsId);	
	/** 提现信息总共数目 */	
	public int countAll(@Param("financeRecordId")Integer financeRecordId);	
	/** 分页提现信息信息 */
	public List<Withdrawals> browsePagingWithdrawals(@Param("financeRecordId")Integer financeRecordId,@Param("pageNum")int pageNum,@Param("pageSize")int pageSize,@Param("orderName")String orderName,@Param("orderWay")String orderWay) ;		
}
