package com.nieyue.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nieyue.bean.Order;
import com.nieyue.service.OrderService;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResult;
import com.nieyue.util.StateResultList;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;


/**
 * 订单控制类
 * @author yy
 *
 */
@Api(tags={"order"},value="订单",description="订单管理")
@RestController
@RequestMapping("/order")
public class OrderController {
	@Resource
	private OrderService orderService;
	
	/**
	 * 订单分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "订单列表", notes = "订单分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="type",value="类型，1VIP购买，2团购卡团购，3付费课程",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="accountId",value="下单人id外键",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="createDate",value="创建时间",dataType="date-time", paramType = "query"),
	  @ApiImplicitParam(name="updateDate",value="更新时间",dataType="date-time", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="create_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList browsePagingOrder(
			@RequestParam(value="type",required=false)Integer type,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="createDate",required=false)Date createDate,
			@RequestParam(value="updateDate",required=false)Date updateDate,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="create_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<Order> list = new ArrayList<Order>();
			list= orderService.browsePagingOrder(type,accountId,createDate,updateDate,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				return ResultUtil.getSlefSRFailList(list);
			}
	}
	/**
	 * 订单修改
	 * @return
	 */
	@ApiOperation(value = "订单修改", notes = "订单修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult updateOrder(@ModelAttribute Order order,HttpSession session)  {
		boolean um = orderService.updateOrder(order);
		return ResultUtil.getSR(um);
	}
	/**
	 * 订单增加
	 * @return 
	 */
	@ApiOperation(value = "订单增加", notes = "订单增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult addOrder(@ModelAttribute Order order, HttpSession session) {
		boolean am = orderService.addOrder(order);
		return ResultUtil.getSR(am);
	}
	/**
	 * 订单删除
	 * @return
	 */
	@ApiOperation(value = "订单删除", notes = "订单删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="orderId",value="订单ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult delOrder(@RequestParam("orderId") Integer orderId,HttpSession session)  {
		boolean dm = orderService.delOrder(orderId);
		return ResultUtil.getSR(dm);
	}
	/**
	 * 订单浏览数量
	 * @return
	 */
	@ApiOperation(value = "订单数量", notes = "订单数量查询")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="type",value="类型，1VIP购买，2团购卡团购，3付费课程",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="accountId",value="下单人id外键",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="createDate",value="创建时间",dataType="date-time", paramType = "query"),
		  @ApiImplicitParam(name="updateDate",value="更新时间",dataType="date-time", paramType = "query"),
		  })
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int countAll(
			@RequestParam(value="type",required=false)Integer type,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="createDate",required=false)Date createDate,
			@RequestParam(value="updateDate",required=false)Date updateDate,
			HttpSession session)  {
		int count = orderService.countAll(type,accountId,createDate,updateDate);
		return count;
	}
	/**
	 * 订单单个加载
	 * @return
	 */
	@ApiOperation(value = "订单单个加载", notes = "订单单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="orderId",value="订单ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/{orderId}", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList loadOrder(@PathVariable("orderId") Integer orderId,HttpSession session)  {
		List<Order> list = new ArrayList<Order>();
		Order order = orderService.loadOrder(orderId);
			if(order!=null &&!order.equals("")){
				list.add(order);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				return ResultUtil.getSlefSRFailList(list);
			}
	}
	
}
