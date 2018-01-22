package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
/**
 * 订单
 * @author 聂跃
 */
@ApiModel(value="订单",description="订单")
public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 订单id
	 */
	@ApiModelProperty(value="订单id",example="订单id")
	private Integer orderId;
	/**
	 * 类型，1VIP购买，2团购卡团购，3付费课程
	 */
	@ApiModelProperty(value="类型，1VIP购买，2团购卡团购，3付费课程",example="类型，1VIP购买，2团购卡团购，3付费课程")
	private Integer type;
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
	 * 下单人
	 */
	@ApiModelProperty(value="下单人",example="下单人")
	private Integer accountId;
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
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
