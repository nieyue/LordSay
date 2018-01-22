package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 勋章
 * @author yy
 *
 */
@ApiModel(value="勋章",description="勋章")
public class Feedback implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 勋章id
	 */
	@ApiModelProperty(value="勋章id",example="勋章id")
	private Integer feedbackId;
	/**
	 * 内容
	 */
	@ApiModelProperty(value="内容",example="内容")
	private String content;
	/**
	 * 创建时间
	 */
	@ApiModelProperty(value="创建时间",example="创建时间")
	private Date createDate;
	/**
	 * 提交人账户id外键
	 */
	@ApiModelProperty(value="提交人账户id外键",example="提交人账户id外键")
	private Integer accountId;
	/**
	 * 提交人注册手机号
	 */
	@ApiModelProperty(value="提交人注册手机号",example="提交人注册手机号")
	private String phone;
	public Integer getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(Integer feedbackId) {
		this.feedbackId = feedbackId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
