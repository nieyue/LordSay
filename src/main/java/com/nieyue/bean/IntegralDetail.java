package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 积分详情
 * @author 聂跃
 */
public class IntegralDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 积分详情id
	 */
	private Integer integralDetailId;
	/**
	 * 类型,0失去，1获得
	 */
	private Integer type;
	/**
	 * 积分
	 */
	private Double integral;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 账户id外键
	 */
	private Integer acountId;
	public Integer getIntegralDetailId() {
		return integralDetailId;
	}
	public void setIntegralDetailId(Integer integralDetailId) {
		this.integralDetailId = integralDetailId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Double getIntegral() {
		return integral;
	}
	public void setIntegral(Double integral) {
		this.integral = integral;
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
