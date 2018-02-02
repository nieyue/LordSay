package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Integral;
import com.nieyue.bean.IntegralDetail;
import com.nieyue.bean.Video;
import com.nieyue.bean.VideoSet;
import com.nieyue.dao.VideoDao;
import com.nieyue.service.IntegralBoardService;
import com.nieyue.service.IntegralDetailService;
import com.nieyue.service.IntegralService;
import com.nieyue.service.VideoService;
import com.nieyue.service.VideoSetService;
@Service
public class VideoServiceImpl implements VideoService{
	@Resource
	VideoDao videoDao;
	@Resource
	VideoSetService videoSetService;
	@Resource
	IntegralService integralService;
	@Resource
	IntegralDetailService integralDetailService;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addVideo(Video video) {
		video.setCreateDate(new Date());
		video.setUpdateDate(new Date());
		if(video.getStatus()==null){
			video.setStatus(1);
		}
		video.setPlayNumber(0);
		boolean b = videoDao.addVideo(video);
		if(video.getVideoSetId()!=null){
			VideoSet videoSet = videoSetService.loadVideoSet(video.getVideoSetId());
			int vc = videoDao.countAll(video.getVideoSetId(), null, null, null);
			videoSet.setNumber(vc);
			b=videoSetService.updateVideoSet(videoSet);
		}
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delVideo(Integer videoId) {
		Video video = videoDao.loadVideo(videoId);
		boolean b = videoDao.delVideo(videoId);
		if(b==true &&video.getVideoSetId()!=null){
			VideoSet videoSet = videoSetService.loadVideoSet(video.getVideoSetId());
			int vc = videoDao.countAll(video.getVideoSetId(), null, null, null);
			videoSet.setNumber(vc);
			b=videoSetService.updateVideoSet(videoSet);
		}
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
	@Override
	public boolean watchVideo(Integer videoId, Integer accountId,Integer type) {
		boolean b=false;
		Video video = videoDao.loadVideo(videoId);
		if(type==1){//开始播放
		//增加视频播放次数
		b = videoDao.watchVideo(videoId);
		if(b){
		//增加视频集播放次数	
		b=videoSetService.watchVideoSet(video.getVideoSetId(), accountId);
		}
		}else if(type==2){//播放中
			b=true;
		}
		
		if(b==true &&video.getVideoSetId()!=null){
			//积分增加
			List<Integral> integrall = integralService.browsePagingIntegral(accountId, null, null, 1, 1, "integral_id", "asc");
			Integral integral = integrall.get(0);
			integral.setIntegral(integral.getIntegral()+1.0);
			b=integralService.updateIntegral(integral);
			//积分详情增加
			IntegralDetail integralDetail=new IntegralDetail();
			integralDetail.setAccountId(accountId);
			integralDetail.setIntegral(1.0);
			integralDetail.setType(1);//获得
			b=integralDetailService.addIntegralDetail(integralDetail);
		}
		return b;
	}

	
}
