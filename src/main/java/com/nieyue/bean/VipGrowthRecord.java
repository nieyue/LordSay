package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * vip成长记录
 * @author yy
 *
 */
public class VipGrowthRecord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * vip成长记录id
	 */
	private Integer vipGrowthRecordId;
	/**
	 * 等级名
	 */
	private String name;
	/**
	 * 等级,默认是0，数字越大，等级越高
	 */
	private Integer level;
	/**
	 * 金额
	 */
	private Double price;
	/**
	 * vip创建时间
	 */
	private Date createDate;
	/**
	 * 账户id外键
	 */
	private Integer accountId;
	public Integer getVipGrowthRecordId() {
		return vipGrowthRecordId;
	}
	public void setVipGrowthRecordId(Integer vipGrowthRecordId) {
		this.vipGrowthRecordId = vipGrowthRecordId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
