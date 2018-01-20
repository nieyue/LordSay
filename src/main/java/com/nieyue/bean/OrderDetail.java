package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 订单详情
 * @author 聂跃
 */
public class OrderDetail implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 订单详情id
	 */
	private Integer orderDetailId;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 封面
	 */
	private String imgAddress;
	/**
	 * 总价
	 */
	private Double totalPrice;
	/**
	 * 数量/集数
	 */
	private Integer number;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 订单状态，1待处理，2已完成
	 */
	private Integer status;
	/**
	 * 下单人
	 */
	private Integer accountId;
	public Integer getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgAddress() {
		return imgAddress;
	}
	public void setImgAddress(String imgAddress) {
		this.imgAddress = imgAddress;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
