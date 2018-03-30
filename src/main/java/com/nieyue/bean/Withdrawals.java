package com.nieyue.bean;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
/**
 * 提现信息
 * @author 聂跃
 * @date 2017年4月12日
 */
@ApiModel(value="提现信息",description="提现信息")
public class Withdrawals implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 提现信息id
	 */
	@ApiModelProperty(value="提现信息id",example="提现信息id")
	private Integer withdrawalsId;
	/**
	 * 真实姓名
	 */
	@ApiModelProperty(value="真实姓名",example="真实姓名")
	private String realname;
	/**
	 * 账号名称
	 */
	@ApiModelProperty(value="账号名称",example="账号名称")
	private String accountname;
	/**
	 * 财务记录id外键
	 */
	@ApiModelProperty(value="财务记录id外键",example="财务记录id外键")
	private Integer financeRecordId;
	public Integer getWithdrawalsId() {
		return withdrawalsId;
	}
	public void setWithdrawalsId(Integer withdrawalsId) {
		this.withdrawalsId = withdrawalsId;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getAccountname() {
		return accountname;
	}
	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}
	public Integer getFinanceRecordId() {
		return financeRecordId;
	}
	public void setFinanceRecordId(Integer financeRecordId) {
		this.financeRecordId = financeRecordId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
