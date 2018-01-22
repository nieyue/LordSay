package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
/**
 * 积分榜
 * @author 聂跃
 */
@ApiModel(value="积分榜",description="积分榜")
public class IntegralBoard implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 积分榜id
	 */
	@ApiModelProperty(value="积分榜id",example="积分榜id")
	private Integer integralBoardId;
	/**
	 * 类型,1个人，2团队
	 */
	@ApiModelProperty(value="类型,1个人，2团队",example="类型,1个人，2团队")
	private Integer type;
	/**
	 * 时间类型,1周，2月，3总
	 */
	@ApiModelProperty(value="时间类型,1周，2月，3总",example="时间类型,1周，2月，3总")
	private Integer timeType;
	/**
	 * 积分
	 */
	@ApiModelProperty(value="积分",example="积分")
	private Double integral;
	/**
	 * 记录时间
	 */
	@ApiModelProperty(value="记录时间",example="记录时间")
	private Date recordTime;
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
	public Integer getIntegralBoardId() {
		return integralBoardId;
	}
	public void setIntegralBoardId(Integer integralBoardId) {
		this.integralBoardId = integralBoardId;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getTimeType() {
		return timeType;
	}
	public void setTimeType(Integer timeType) {
		this.timeType = timeType;
	}
	public Double getIntegral() {
		return integral;
	}
	public void setIntegral(Double integral) {
		this.integral = integral;
	}
	public Date getRecordTime() {
		return recordTime;
	}
	public void setRecordTime(Date recordTime) {
		this.recordTime = recordTime;
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
