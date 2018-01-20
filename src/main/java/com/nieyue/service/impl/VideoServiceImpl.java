package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Video;
import com.nieyue.dao.VideoDao;
import com.nieyue.service.VideoService;
@Service
public class VideoServiceImpl implements VideoService{
	@Resource
	VideoDao videoDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addVideo(Video video) {
		video.setCreateDate(new Date());
		video.setUpdateDate(new Date());
		boolean b = videoDao.addVideo(video);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delVideo(Integer videoId) {
		boolean b = videoDao.delVideo(videoId);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateVideo(Video video) {
		video.setUpdateDate(new Date());
		boolean b = videoDao.updateVideo(video);
		return b;
	}

	@Override
	public Video loadVideo(Integer videoId) {
		Video r = videoDao.loadVideo(videoId);
		return r;
	}

	@Override
	public int countAll(
			Integer videoSetId,
			Date createDate,
			Date updateDate,
			Integer status) {
		int c = videoDao.countAll(
				videoSetId,createDate,updateDate,status);
		return c;
	}

	@Override
	public List<Video> browsePagingVideo(
			Integer videoSetId,
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
		List<Video> l = videoDao.browsePagingVideo(
				videoSetId,
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
