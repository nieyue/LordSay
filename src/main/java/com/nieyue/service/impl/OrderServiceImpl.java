package com.nieyue.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.nieyue.bean.Order;
import com.nieyue.bean.OrderDetail;
import com.nieyue.business.FinanceBusiness;
import com.nieyue.business.PaymentBusiness;
import com.nieyue.dao.OrderDao;
import com.nieyue.exception.PayException;
import com.nieyue.service.AccountService;
import com.nieyue.service.FinanceService;
import com.nieyue.service.OrderDetailService;
import com.nieyue.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{
	@Resource
	OrderDao orderDao;
	@Resource
	OrderDetailService orderDetailService;
	@Resource
	AccountService accountService;
	@Resource
	FinanceService financeService;
	@Resource
	FinanceBusiness financeBusiness;
	@Resource
	PaymentBusiness paymentBusiness;
	/**
	 * 第三方支付
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public String thirdPartyPaymentOrder(
			Integer type,
			Integer payType,
			Integer accountId,
			Integer businessId
			) {
		String result=null;
		if(payType==1){//支付宝
			
		}else if(payType==2){//微信
			
		}else if(payType==4){//ios内购
			
		}
		return result;
	}
	/**
	 * 余额支付
	 */
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public Order balancePaymentOrder(Integer type,
			Integer payType,
			Integer accountId,
			Integer businessId) {
		//1.获取订单详情
		OrderDetail orderDetail = paymentBusiness.getPaymentType(type, payType, accountId, businessId);
		if(orderDetail==null){
			throw new PayException();
		}
		//2.财务执行
		int r = financeBusiness.financeExcute(type, payType, accountId,businessId, orderDetail);
		if(r==-1){
			throw new PayException();
		}else if(r==0){
			return null;
		}	
		return null;
	}
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
			Integer payType,
			Integer accountId,
			Integer status,
			Date createDate,
			Date updateDate
			) {
		int c = orderDao.countAll(
				type,payType,accountId,status,createDate,updateDate);
		return c;
	}

	@Override
	public List<Order> browsePagingOrder(
			Integer type,
			Integer payType,
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
				payType,
				accountId,
				status,
				createDate,
				updateDate,
				pageNum-1,
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
	@Override
	public String alipayNotifyUrl(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String wechatpayNotifyUrl(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String iospayNotifyUrl(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
