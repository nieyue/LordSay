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

import com.nieyue.bean.FinanceRecord;
import com.nieyue.service.FinanceRecordService;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResult;
import com.nieyue.util.StateResultList;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;


/**
 * 财务记录控制类
 * @author yy
 *
 */
@Api(tags={"financeRecord"},value="财务记录",description="财务记录管理")
@RestController
@RequestMapping("/financeRecord")
public class FinanceRecordController {
	@Resource
	private FinanceRecordService financeRecordService;
	
	/**
	 * 财务记录分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "财务记录列表", notes = "财务记录分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="accountId",value="账户Id",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="createDate",value="创建时间",dataType="date-time", paramType = "query"),
	  @ApiImplicitParam(name="updateDate",value="更新时间",dataType="date-time", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="update_date"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList browsePagingFinanceRecord(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="createDate",required=false)Date createDate,
			@RequestParam(value="updateDate",required=false)Date updateDate,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="update_date") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay)  {
			List<FinanceRecord> list = new ArrayList<FinanceRecord>();
			list= financeRecordService.browsePagingFinanceRecord(accountId,createDate,updateDate,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				return ResultUtil.getSlefSRFailList(list);
			}
	}
	/**
	 * 财务记录修改
	 * @return
	 */
	@ApiOperation(value = "财务记录修改", notes = "财务记录修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult updateFinanceRecord(@ModelAttribute FinanceRecord financeRecord,HttpSession session)  {
		boolean um = financeRecordService.updateFinanceRecord(financeRecord);
		return ResultUtil.getSR(um);
	}
	/**
	 * 财务记录增加
	 * @return 
	 */
	@ApiOperation(value = "财务记录增加", notes = "财务记录增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult addFinanceRecord(@ModelAttribute FinanceRecord financeRecord, HttpSession session) {
		boolean am = financeRecordService.addFinanceRecord(financeRecord);
		return ResultUtil.getSR(am);
	}
	/**
	 * 财务记录删除
	 * @return
	 */
	@ApiOperation(value = "财务记录删除", notes = "财务记录删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="financeRecordId",value="财务记录ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult delFinanceRecord(@RequestParam("financeRecordId") Integer financeRecordId,HttpSession session)  {
		boolean dm = financeRecordService.delFinanceRecord(financeRecordId);
		return ResultUtil.getSR(dm);
	}
	/**
	 * 财务记录浏览数量
	 * @return
	 */
	@ApiOperation(value = "财务记录数量", notes = "财务记录数量查询")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="accountId",value="账户Id",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="createDate",value="创建时间",dataType="date-time", paramType = "query"),
		  @ApiImplicitParam(name="updateDate",value="更新时间",dataType="date-time", paramType = "query")
		  })
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int countAll(
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="createDate",required=false)Date createDate,
			@RequestParam(value="updateDate",required=false)Date updateDate,
			HttpSession session)  {
		int count = financeRecordService.countAll(accountId,createDate,updateDate);
		return count;
	}
	/**
	 * 财务记录单个加载
	 * @return
	 */
	@ApiOperation(value = "财务记录单个加载", notes = "财务记录单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="financeRecordId",value="财务记录ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/{financeRecordId}", method = {RequestMethod.GET,RequestMethod.POST})
	public  StateResultList loadFinanceRecord(@PathVariable("financeRecordId") Integer financeRecordId,HttpSession session)  {
		List<FinanceRecord> list = new ArrayList<FinanceRecord>();
		FinanceRecord financeRecord = financeRecordService.loadFinanceRecord(financeRecordId);
			if(financeRecord!=null &&!financeRecord.equals("")){
				list.add(financeRecord);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				return ResultUtil.getSlefSRFailList(list);
			}
	}
	
}
