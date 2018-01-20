package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 视频
 * @author 聂跃
 */
public class Video implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 视频id
	 */
	private Integer videoId;
	/**
	 * 视频名称
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
	 * url链接
	 */
	private String url;
	/**
	 * 播放次数
	 */
	private Integer playNumber;
	/**
	 * 状态0下架,默认1上架
	 */
	private Integer status;
	/**
	 * 视频集id,外键
	 */
	private Integer videoSetId;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	public Integer getVideoId() {
		return videoId;
	}
	public void setVideoId(Integer videoId) {
		this.videoId = videoId;
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
	public Integer getPlayNumber() {
		return playNumber;
	}
	public void setPlayNumber(Integer playNumber) {
		this.playNumber = playNumber;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getVideoSetId() {
		return videoSetId;
	}
	public void setVideoSetId(Integer videoSetId) {
		this.videoSetId = videoSetId;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
