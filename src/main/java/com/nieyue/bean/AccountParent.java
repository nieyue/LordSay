package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 账户上级
 * @author yy
 *
 */
public class AccountParent implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 账户上级id
	 */
	private Integer accountParentId;
	/**
	 * 账户id
	 */
	private Integer accountId;
	/**
	 * 真实姓名
	 */
	private String realname;
	/**
	 * 手机号
	 */
	private String phone;
	/**
	 * 学员数
	 */
	private Integer subordinateNumber;
	/**
	 * 直接上级id
	 */
	private Integer masterId;
	/**
	 * 真实上级id
	 */
	private Integer realMasterId;
	/**
	 * 账户等级id
	 */
	private Integer accountLevelId;
	/**
	 * 等级名
	 */
	private String name;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	public Integer getAccountParentId() {
		return accountParentId;
	}
	public void setAccountParentId(Integer accountParentId) {
		this.accountParentId = accountParentId;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getSubordinateNumber() {
		return subordinateNumber;
	}
	public void setSubordinateNumber(Integer subordinateNumber) {
		this.subordinateNumber = subordinateNumber;
	}
	public Integer getMasterId() {
		return masterId;
	}
	public void setMasterId(Integer masterId) {
		this.masterId = masterId;
	}
	public Integer getRealMasterId() {
		return realMasterId;
	}
	public void setRealMasterId(Integer realMasterId) {
		this.realMasterId = realMasterId;
	}
	public Integer getAccountLevelId() {
		return accountLevelId;
	}
	public void setAccountLevelId(Integer accountLevelId) {
		this.accountLevelId = accountLevelId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
