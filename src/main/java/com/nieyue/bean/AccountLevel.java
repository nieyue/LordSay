package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 等级
 * @author yy
 *
 */
public class AccountLevel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 等级id
	 */
	private Integer accountLevelId;
	
	/**
	 * 等级名
	 */
	private String name;
	/**
	 * 等级,默认是0，数字越大，等级越高
	 */
	private Integer level;
	/**
	 * 等级图片
	 */
	private String imgAddress;
	/**
	 * 团购金额
	 */
	private Double teamPurchasePrice;
	/**
	 * 推荐佣金,默认是0表示不是推荐，无佣金
	 */
	private Double recommendCommission;
	/**
	 * 拆分奖励
	 */
	private Double splitReward;
	/**
	 * 拆分上级奖励
	 */
	private Double splitParentReward;
	/**
	 * 拆分平台奖励
	 */
	private Double splitPlatformReward;
	/**
	 * VIP名额，默认为0表示普通vip
	 */
	private Integer number;
	/**
	 * 优惠价格
	 */
	private Double discountPrice;
	/**
	 * 总价值
	 */
	private Double totalPrice;
	/**
	 * 备注（权益）
	 */
	private String mark;
	/**
	 * 等级更新时间
	 */
	private Date updateDate;
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
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getImgAddress() {
		return imgAddress;
	}
	public void setImgAddress(String imgAddress) {
		this.imgAddress = imgAddress;
	}
	public Double getTeamPurchasePrice() {
		return teamPurchasePrice;
	}
	public void setTeamPurchasePrice(Double teamPurchasePrice) {
		this.teamPurchasePrice = teamPurchasePrice;
	}
	public Double getRecommendCommission() {
		return recommendCommission;
	}
	public void setRecommendCommission(Double recommendCommission) {
		this.recommendCommission = recommendCommission;
	}
	public Double getSplitReward() {
		return splitReward;
	}
	public void setSplitReward(Double splitReward) {
		this.splitReward = splitReward;
	}
	public Double getSplitParentReward() {
		return splitParentReward;
	}
	public void setSplitParentReward(Double splitParentReward) {
		this.splitParentReward = splitParentReward;
	}
	public Double getSplitPlatformReward() {
		return splitPlatformReward;
	}
	public void setSplitPlatformReward(Double splitPlatformReward) {
		this.splitPlatformReward = splitPlatformReward;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Double getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(Double discountPrice) {
		this.discountPrice = discountPrice;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
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
