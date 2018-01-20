package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 视频集收藏
 * @author 聂跃
 */
public class VideoSetCollect implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 视频集收藏id
	 */
	private Integer videoSetCollectId;
	/**
	 * 视频集收藏名称
	 */
	private String name;
	/**
	 * 封面
	 */
	private String imgAddress;
	/**
	 * 时长
	 */
	private String duration;
	/**
	 * 容量，单位byte
	 */
	private String size;
	/**
	 * 视频集收藏集id,外键
	 */
	private Integer videoSetId;
	/**
	 * 收藏人id外键
	 */
	private Integer accountId;
	/**
	 * 创建时间
	 */
	private Date createDate;
	
	public Integer getVideoSetCollectId() {
		return videoSetCollectId;
	}
	public void setVideoSetCollectId(Integer videoSetCollectId) {
		this.videoSetCollectId = videoSetCollectId;
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
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Integer getVideoSetId() {
		return videoSetId;
	}
	public void setVideoSetId(Integer videoSetId) {
		this.videoSetId = videoSetId;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
