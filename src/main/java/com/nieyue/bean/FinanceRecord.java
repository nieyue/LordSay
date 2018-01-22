package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
/**
 * 财务记录
 * @author 聂跃
 * @date 2017年4月12日
 */
@ApiModel(value="财务记录",description="财务记录")
public class FinanceRecord implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 财务记录id
	 */
	@ApiModelProperty(value="财务记录id",example="财务记录id")
	private Integer financeRecordId;
	/**
	 * 方式，1支付宝，2微信,3ios内购
	 */
	@ApiModelProperty(value="方式，1支付宝，2微信,3ios内购",example="方式，1支付宝，2微信,3ios内购")
	private Integer method;
	/**
	 * 类型，1账户充值，2账户提现,3招收学员佣金,4推荐佣金,5团购账单,6拆分账单
	 */
	@ApiModelProperty(value="类型，1账户充值，2账户提现,3招收学员佣金,4推荐佣金,5团购账单,6拆分账单",example="类型，1账户充值，2账户提现,3招收学员佣金,4推荐佣金,5团购账单,6拆分账单")
	private Integer type;
	/**
	 * 交易单号
	 */
	@ApiModelProperty(value="交易单号",example="交易单号")
	private String transactionNumber;
	/**
	 * 余额
	 */
	@ApiModelProperty(value="余额",example="余额")
	private Double money;
	/**
	 * 创建时间
	 */
	@ApiModelProperty(value="创建时间",example="创建时间")
	private Date createDate;
	/**
	 * 更新时间
	 */
	@ApiModelProperty(value="更新时间",example="更新时间")
	private Date updateDate;
	/**
	 * 账户id外键
	 */
	@ApiModelProperty(value="账户id外键",example="账户id外键")
	private Integer acountId;
	public Integer getFinanceRecordId() {
		return financeRecordId;
	}
	public void setFinanceRecordId(Integer financeRecordId) {
		this.financeRecordId = financeRecordId;
	}
	public Integer getMethod() {
		return method;
	}
	public void setMethod(Integer method) {
		this.method = method;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getTransactionNumber() {
		return transactionNumber;
	}
	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getAcountId() {
		return acountId;
	}
	public void setAcountId(Integer acountId) {
		this.acountId = acountId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
