package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Account;
import com.nieyue.bean.Notice;
import com.nieyue.dao.NoticeDao;
import com.nieyue.service.AccountService;
import com.nieyue.service.NoticeService;
@Service
public class NoticeServiceImpl implements NoticeService{
	@Resource
	NoticeDao noticeDao;
	@Resource
	AccountService accountService;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addNotice(Notice notice) {
		boolean b=false;
		notice.setCreateDate(new Date());
		notice.setUpdateDate(new Date());
		notice.setRegion(2);//默认都是个人
		if(notice.getTitle().equals("系统通知")){
			notice.setRegion(1);//系统通知为全局
		}
		b = noticeDao.addNotice(notice);
		if(b&&notice.getTitle().equals("系统通知")){
			//通知到所有人
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					List<Account> al = accountService.browsePagingAccount(null, null, null, null, null, null, null, null, 1, Integer.MAX_VALUE, "account_id", "asc");
					al.forEach((account)->{
						Integer aid = account.getAccountId();
						Notice n=new Notice();
						n.setAccountId(aid);
						n.setContent(notice.getContent());
						n.setCreateDate(notice.getCreateDate());
						n.setUpdateDate(notice.getUpdateDate());
						n.setImgAddress(notice.getImgAddress());
						n.setRegion(2);//个人
						n.setStatus(0);//未读
						n.setTitle(notice.getTitle());
						n.setParentId(notice.getNoticeId());
						noticeDao.addNotice(n);
					});
				}
			}).start();
		}
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delNotice(Integer noticeId) {
		Notice notice = noticeDao.loadNotice(noticeId);
		boolean b = noticeDao.delNotice(noticeId);
		if(b&&notice.getTitle().equals("系统通知")&&notice.getAccountId()==null){
			//通知到所有人
			new Thread(new Runnable() {
				
				@Override
				public void run() {
					List<Account> al = accountService.browsePagingAccount(null, null, null, null, null, null, null, null, 1, Integer.MAX_VALUE, "account_id", "asc");
					al.forEach((account)->{
						Integer aid = account.getAccountId();
						List<Notice> nl = noticeDao.browsePagingNotice(2, "系统通知",null, aid,notice.getNoticeId(),0, 1, "notice_id", "asc");
						if(nl.size()==1){
						Notice n = nl.get(0);
						noticeDao.delNotice(n.getNoticeId());
						}
					});
				}
			}).start();
		}
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateNotice(Notice notice) {
		notice.setUpdateDate(new Date());
		boolean b = noticeDao.updateNotice(notice);
		if(b&&notice.getTitle().equals("系统通知")&&notice.getAccountId()==null){
				//通知到所有人
				new Thread(new Runnable() {
					
					@Override
					public void run() {
						List<Account> al = accountService.browsePagingAccount(null, null, null, null, null, null, null, null, 1, Integer.MAX_VALUE, "account_id", "asc");
						al.forEach((account)->{
							Integer aid = account.getAccountId();
							List<Notice> nl = noticeDao.browsePagingNotice(2, "系统通知",null, aid,notice.getNoticeId(),0, 1, "notice_id", "asc");
							if(nl.size()==1){
							Notice n = nl.get(0);
							n.setContent(notice.getContent());
							n.setUpdateDate(notice.getUpdateDate());
							n.setImgAddress(notice.getImgAddress());
							n.setRegion(2);//个人
							noticeDao.updateNotice(n);
							}
						});
					}
				}).start();
			}
		return b;
	}

	@Override
	public Notice loadNotice(Integer noticeId) {
		Notice r = noticeDao.loadNotice(noticeId);
		return r;
	}

	@Override
	public int countAll(Integer region,String title,Integer status,Integer accountId,Integer parentId) {
		int c = noticeDao.countAll( region,title, status,accountId,parentId);
		return c;
	}

	@Override
	public List<Notice> browsePagingNotice(Integer region,String title,Integer status,Integer accountId,Integer parentId,int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Notice> l = noticeDao.browsePagingNotice(region, title, status,accountId,parentId,pageNum-1, pageSize, orderName, orderWay);
		return l;
	}

	
}
