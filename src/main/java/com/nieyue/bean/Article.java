package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;
/**
 * 文章
 * @author 聂跃
 */
public class Article implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 文章id
	 */
	private Integer articleId;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 跳转url
	 */
	private String redirectUrl;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 评论数
	 */
	private String commentNumber;
	/**
	 * 状态,下架0，上架1
	 */
	private Integer status;
	/**
	 * 创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 文章类型id外键
	 */
	private Integer articleCateId;
	public Integer getArticleId() {
		return articleId;
	}
	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCommentNumber() {
		return commentNumber;
	}
	public void setCommentNumber(String commentNumber) {
		this.commentNumber = commentNumber;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
	public Integer getArticleCateId() {
		return articleCateId;
	}
	public void setArticleCateId(Integer articleCateId) {
		this.articleCateId = articleCateId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
