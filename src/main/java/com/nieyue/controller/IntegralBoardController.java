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

import com.nieyue.bean.IntegralBoard;
import com.nieyue.service.IntegralBoardService;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResult;
import com.nieyue.util.StateResultList;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;


/**
 * 积分榜控制类
 * @author yy
 *
 */
@Api(tags={"integralBoard"},value="积分榜",description="积分榜管理")
@RestController
@RequestMapping("/integralBoard")
public class IntegralBoardController {
	@Resource
	private IntegralBoardService integralBoardService;
	
	/**
	 * 积分榜分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "积分榜列表", notes = "积分榜分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="type",value="类型,1个人，2团队",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="timeType",value="时间类型,1周，2月，3总",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="accountId",value="账户Id",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="createDate",value="创建时间",dataType="date-time", paramType = "query"),
	  @ApiImplicitParam(name="updateDate",value="更新时间",dataType="date-time", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList browsePagingIntegralBoard(
			@RequestParam(value="type",required=false)Integer type,
			@RequestParam(value="timeType",required=false)Integer timeType,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="createDate",required=false)Date createDate,
			@RequestParam(value="updateDate",required=false)Date updateDate,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<IntegralBoard> list = new ArrayList<IntegralBoard>();
			list= integralBoardService.browsePagingIntegralBoard(type,timeType,accountId,createDate,updateDate,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				return ResultUtil.getSlefSRFailList(list);
			}
	}
	/**
	 * 积分榜修改
	 * @return
	 */
	@ApiOperation(value = "积分榜修改", notes = "积分榜修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult updateIntegralBoard(@ModelAttribute IntegralBoard integralBoard,HttpSession session)  {
		boolean um = integralBoardService.updateIntegralBoard(integralBoard);
		return ResultUtil.getSR(um);
	}
	/**
	 * 积分榜增加
	 * @return 
	 */
	@ApiOperation(value = "积分榜增加", notes = "积分榜增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult addIntegralBoard(@ModelAttribute IntegralBoard integralBoard, HttpSession session) {
		boolean am = integralBoardService.addIntegralBoard(integralBoard);
		return ResultUtil.getSR(am);
	}
	/**
	 * 积分榜删除
	 * @return
	 */
	@ApiOperation(value = "积分榜删除", notes = "积分榜删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="integralBoardId",value="积分榜ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult delIntegralBoard(@RequestParam("integralBoardId") Integer integralBoardId,HttpSession session)  {
		boolean dm = integralBoardService.delIntegralBoard(integralBoardId);
		return ResultUtil.getSR(dm);
	}
	/**
	 * 积分榜浏览数量
	 * @return
	 */
	@ApiOperation(value = "积分榜数量", notes = "积分榜数量查询")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="type",value="类型,1个人，2团队",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="timeType",value="时间类型,1周，2月，3总",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="accountId",value="账户Id",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="createDate",value="创建时间",dataType="date-time", paramType = "query"),
		  @ApiImplicitParam(name="updateDate",value="更新时间",dataType="date-time", paramType = "query")
		  })
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int countAll(
			@RequestParam(value="type",required=false)Integer type,
			@RequestParam(value="timeType",required=false)Integer timeType,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="createDate",required=false)Date createDate,
			@RequestParam(value="updateDate",required=false)Date updateDate,
			HttpSession session)  {
		int count = integralBoardService.countAll(type,timeType,accountId,createDate,updateDate);
		return count;
	}
	/**
	 * 积分榜单个加载
	 * @return
	 */
	@ApiOperation(value = "积分榜单个加载", notes = "积分榜单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="integralBoardId",value="积分榜ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/{integralBoardId}", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList loadIntegralBoard(@PathVariable("integralBoardId") Integer integralBoardId,HttpSession session)  {
		List<IntegralBoard> list = new ArrayList<IntegralBoard>();
		IntegralBoard integralBoard = integralBoardService.loadIntegralBoard(integralBoardId);
			if(integralBoard!=null &&!integralBoard.equals("")){
				list.add(integralBoard);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				return ResultUtil.getSlefSRFailList(list);
			}
	}
	
}
