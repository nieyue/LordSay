package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 配置
 * @author yy
 *
 */
public class Config implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 配置id
	 */
	private Integer configId;
	/**
	 * 客服电话
	 */
	private String customerServicePhone;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	public Integer getConfigId() {
		return configId;
	}
	public void setConfigId(Integer configId) {
		this.configId = configId;
	}
	public String getCustomerServicePhone() {
		return customerServicePhone;
	}
	public void setCustomerServicePhone(String customerServicePhone) {
		this.customerServicePhone = customerServicePhone;
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
