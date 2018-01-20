package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 拆分
 * @author yy
 *
 */
public class Split implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 拆分id
	 */
	private Integer splitId;
	
	/**
	 * 购买人
	 */
	private String realname;
	/**
	 *数量
	 */
	private Integer number;
	/**
	 *金额
	 */
	private Double price;
	/**
	 * 申请时间
	 */
	private Date applyDate;
	/**
	 * 拆分时间
	 */
	private Date splitDate;
	/**
	 * 创建更新时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 拆分状态，默认0已申请，1已拆分，2已拒绝，3已退款，4已推荐给上级
	 */
	private Integer status;
	/**
	 * 账户自身id,邀请码
	 */
	private Integer accountId;
	/**
	 * 购买者id,外键
	 */
	private Integer buyAccountId;
	public Integer getSplitId() {
		return splitId;
	}
	public void setSplitId(Integer splitId) {
		this.splitId = splitId;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	public Date getSplitDate() {
		return splitDate;
	}
	public void setSplitDate(Date splitDate) {
		this.splitDate = splitDate;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public Integer getBuyAccountId() {
		return buyAccountId;
	}
	public void setBuyAccountId(Integer buyAccountId) {
		this.buyAccountId = buyAccountId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
