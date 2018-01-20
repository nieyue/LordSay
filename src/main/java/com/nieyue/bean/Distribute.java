package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 分发
 * @author yy
 *
 */
public class Distribute implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 分发id
	 */
	private Integer distributeId;
	
	/**
	 * 购买人
	 */
	private String realname;
	/**
	 *数量，默认1张
	 */
	private Integer number;
	/**
	 *金额
	 */
	private Double price;
	/**
	 * 分发时间
	 */
	private Date distributeDate;
	/**
	 * 创建更新时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 分发状态，默认1已分发
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
	public Integer getDistributeId() {
		return distributeId;
	}
	public void setDistributeId(Integer distributeId) {
		this.distributeId = distributeId;
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
	public Date getDistributeDate() {
		return distributeDate;
	}
	public void setDistributeDate(Date distributeDate) {
		this.distributeDate = distributeDate;
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
