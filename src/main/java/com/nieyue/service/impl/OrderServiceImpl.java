package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Order;
import com.nieyue.bean.OrderDetail;
import com.nieyue.dao.OrderDao;
import com.nieyue.service.OrderDetailService;
import com.nieyue.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{
	@Resource
	OrderDao orderDao;
	@Resource
	OrderDetailService orderDetailService;
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
		List<OrderDetail> orderDetailList = orderDetailService.browsePagingOrderDetail(orderId, null, null, 1, Integer.MAX_VALUE, "order_detail_id", "asc");
		for (int i = 0; i < orderDetailList.size(); i++) {
			b=orderDetailService.delOrderDetail(orderDetailList.get(i).getOrderDetailId());
		}
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
		List<OrderDetail> orderDetailList = orderDetailService.browsePagingOrderDetail(orderId, null, null, 1, Integer.MAX_VALUE, "order_detail_id", "asc");
		r.setOrderDetailList(orderDetailList);
		return r;
	}

	@Override
	public int countAll(
			Integer type,
			Integer accountId,
			Integer status,
			Date createDate,
			Date updateDate
			) {
		int c = orderDao.countAll(
				type,accountId,status,createDate,updateDate);
		return c;
	}

	@Override
	public List<Order> browsePagingOrder(
			Integer type,
			Integer accountId,
			Integer status,
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
				status,
				createDate,
				updateDate,
				pageNum,
				pageSize,
				orderName,
				orderWay);
		for (int i = 0; i < l.size(); i++) {
			Order o = l.get(i);
			List<OrderDetail> orderDetailList = orderDetailService.browsePagingOrderDetail(o.getOrderId(), null, null, 1, Integer.MAX_VALUE, "order_detail_id", "asc");
			o.setOrderDetailList(orderDetailList);
		}
		return l;
	}

	
}
