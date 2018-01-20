package com.nieyue.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 公告
 * @author 聂跃
 */
public class Notice  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 公告id
	 */
	private Integer noticeId;
	/**
	 * 标题，比如：系统通知
	 */
	private String title;
	/**
	 * 图片
	 */
	private String imgAddress;
	/**
	 * 内容
	 */
	private String content;
	/**
	 *创建时间
	 */
	private Date createDate;
	/**
	 * 更新时间
	 */
	private Date updateDate;
	/**
	 * 通知人Id
	 */
	private Integer accountId;
	public Integer getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
}
