package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 视频集类型
 * @author 聂跃
 * @date 2017年4月12日
 */
public class VideoSetCate implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 视频集类型id
	 */
	private Integer videoSetCateId;
	/**
	 * 视频集类型名称
	 */
	private String name;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	public Integer getVideoSetCateId() {
		return videoSetCateId;
	}
	public void setVideoSetCateId(Integer videoSetCateId) {
		this.videoSetCateId = videoSetCateId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
