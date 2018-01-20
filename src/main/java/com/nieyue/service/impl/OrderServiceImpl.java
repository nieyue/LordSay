package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Order;
import com.nieyue.dao.OrderDao;
import com.nieyue.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{
	@Resource
	OrderDao orderDao;
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean addOrder(Order order) {
		order.setCreateDate(new Date());
		order.setUpdateDate(new Date());
		boolean b = orderDao.addOrder(order);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean delOrder(Integer orderId) {
		boolean b = orderDao.delOrder(orderId);
		return b;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public boolean updateOrder(Order order) {
		boolean b = orderDao.updateOrder(order);
		return b;
	}

	@Override
	public Order loadOrder(Integer orderId) {
		Order r = orderDao.loadOrder(orderId);
		return r;
	}

	@Override
	public int countAll(
			Integer type,
			Integer accountId,
			Date createDate,
			Date updateDate
			) {
		int c = orderDao.countAll(
				type,accountId,createDate,updateDate);
		return c;
	}

	@Override
	public List<Order> browsePagingOrder(
			Integer type,
			Integer accountId,
			Date createDate,
			Date updateDate,
			int pageNum, int pageSize,
			String orderName, String orderWay) {
		if(pageNum<1){
			pageNum=1;
		}
		if(pageSize<1){
			pageSize=0;//没有数据
		}
		List<Order> l = orderDao.browsePagingOrder(
				type,
				accountId,
				createDate,
				updateDate,
				pageNum,
				pageSize,
				orderName,
				orderWay);
		return l;
	}

	
}
