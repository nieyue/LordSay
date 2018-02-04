package com.nieyue.business;


import java.util.Date;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;

import com.nieyue.bean.AccountLevel;
import com.nieyue.bean.OrderDetail;
import com.nieyue.bean.VideoSet;
import com.nieyue.service.AccountLevelService;
import com.nieyue.service.VideoSetService;

/**
 * 支付业务
 */
@Configuration
public class PaymentBusiness {
	@Resource
	VideoSetService videoSetService;
	@Resource
	AccountLevelService accountLevelService;
	/**
	 *  获取订单详情
	 * @param type 类型，1VIP购买，2团购卡团购，3付费课程
	 * @param payType 支付类型，默认1支付宝支付，2微信支付，3余额支付
	 * @param accountId 账户id
	 * @param businessId 业务id
	 * @return null为不成功
	 */
	public  OrderDetail getPaymentType(
			Integer type,
			Integer payType,
			Integer accountId,
			Integer businessId
			){
		OrderDetail od=new OrderDetail();
		od.setCreateDate(new Date());
		od.setUpdateDate(new Date());
		od.setBusinessId(businessId);//业务id
		if(type==1){//vip购买
			 AccountLevel al = accountLevelService.loadAccountLevel(businessId);
			if(al ==null||al.getLevel()!=1){//只有等级1才是普通vip
				return null;
			}
			od.setName(al.getName());//名称
			od.setTotalPrice(al.getTeamPurchasePrice());//团购金额
			od.setNumber(1);//数量1
			od.setImgAddress(al.getImgAddress());//图片
			return od;
		}else if(type==2){//团购卡团购
			AccountLevel al = accountLevelService.loadAccountLevel(businessId);
			if(al ==null||al.getLevel()<=1){//只有等级大于1才是团购
				return null;
			}
			od.setName(al.getName());//名称
			od.setTotalPrice(al.getTeamPurchasePrice());//团购金额
			od.setNumber(1);//数量1
			od.setImgAddress(al.getImgAddress());//图片
			return od;
		}else if(type==3){//付费课程
			VideoSet vs = videoSetService.loadVideoSet(businessId);
			if(vs==null){
				return null;
			}
			od.setName(vs.getName());//名称
			od.setTotalPrice(vs.getTotalPrice());//总价
			od.setNumber(vs.getNumber());//集数
			od.setImgAddress(vs.getImgAddress());//图片
			return od;
		}
		return null;
	}
}
