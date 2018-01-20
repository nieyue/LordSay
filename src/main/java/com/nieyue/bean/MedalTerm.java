package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 勋章项
 * @author yy
 *
 */
public class MedalTerm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 勋章项id
	 */
	private Integer medalTermId;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 图片
	 */
	private String imgAddress;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	public Integer getMedalTermId() {
		return medalTermId;
	}
	public void setMedalTermId(Integer medalTermId) {
		this.medalTermId = medalTermId;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
