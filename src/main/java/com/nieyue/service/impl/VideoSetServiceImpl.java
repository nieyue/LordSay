package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.VideoSet;
import com.nieyue.dao.VideoSetDao;
import com.nieyue.service.VideoSetService;
@Service
public class VideoSetServiceImpl implements VideoSetService{
	@Resource
	VideoSetDao videoSetDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addVideoSet(VideoSet videoSet) {
		videoSet.setCreateDate(new Date());
		videoSet.setUpdateDate(new Date());
		boolean b = videoSetDao.addVideoSet(videoSet);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delVideoSet(Integer videoSetId) {
		boolean b = videoSetDao.delVideoSet(videoSetId);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateVideoSet(VideoSet videoSet) {
		videoSet.setUpdateDate(new Date());
		boolean b = videoSetDao.updateVideoSet(videoSet);
		return b;
	}

	@Override
	public VideoSet loadVideoSet(Integer videoSetId) {
		VideoSet r = videoSetDao.loadVideoSet(videoSetId);
		return r;
	}

	@Override
	public int countAll(
			Integer recommend,
			Integer cost,
			Integer videoSetCateId,
			Date createDate,
			Date updateDate,
			Integer status) {
		int c = videoSetDao.countAll(
				recommend,cost,videoSetCateId,createDate,updateDate,status);
		return c;
	}

	@Override
	public List<VideoSet> browsePagingVideoSet(
			Integer recommend,
			Integer cost,
			Integer videoSetCateId,
			Date createDate,
			Date updateDate,
			Integer status,
			int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<VideoSet> l = videoSetDao.browsePagingVideoSet(
				recommend,
				cost,
				videoSetCateId,
				createDate,
				updateDate,
				status,
				pageNum-1,
				pageSize,
				orderName,
				orderWay);
		return l;
	}

	
}
