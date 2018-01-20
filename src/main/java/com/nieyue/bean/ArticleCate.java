package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 文章类型
 * @author 聂跃
 */
public class ArticleCate implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 文章类型id
	 */
	private Integer articleCateId;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	public Integer getArticleCateId() {
		return articleCateId;
	}
	public void setArticleCateId(Integer articleCateId) {
		this.articleCateId = articleCateId;
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
