package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 视频缓存
 * @author 聂跃
 */
public class VideoCache implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 视频缓存id
	 */
	private Integer videoCacheId;
	/**
	 * 名称
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
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 观看者id外键
	 */
	private Integer accountId;
	/**
	 * 视频id,外键
	 */
	private Integer videoId;
	public Integer getVideoCacheId() {
		return videoCacheId;
	}
	public void setVideoCacheId(Integer videoCacheId) {
		this.videoCacheId = videoCacheId;
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
	public Integer getVideoId() {
		return videoId;
	}
	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
