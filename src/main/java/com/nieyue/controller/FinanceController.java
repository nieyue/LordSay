package com.nieyue.controller;

import java.util.ArrayList;
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

import com.nieyue.bean.Finance;
import com.nieyue.bean.FinanceRecord;
import com.nieyue.service.AccountService;
import com.nieyue.service.FinanceRecordService;
import com.nieyue.service.FinanceService;
import com.nieyue.util.DateUtil;
import com.nieyue.util.MyDESutil;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResult;
import com.nieyue.util.StateResultList;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;


/**
 * 财务控制类
 * @author yy
 *
 */
@Api(tags={"finance"},value="财务",description="财务管理")
@RestController
@RequestMapping("/finance")
public class FinanceController {
	@Resource
	private FinanceService financeService;
	@Resource
	private FinanceRecordService financeRecordService;
	@Resource
	private AccountService accountService;
	
	/**
	 * 财务分页浏览
	 * @param orderName 商品排序数据库字段
	 * @param orderWay 商品排序方法 asc升序 desc降序
	 * @return
	 */
	@ApiOperation(value = "财务列表", notes = "财务分页浏览")
	@ApiImplicitParams({
	  @ApiImplicitParam(name="money",value="余额",dataType="double", paramType = "query"),
	  @ApiImplicitParam(name="accountId",value="账户ID",dataType="int", paramType = "query"),
	  @ApiImplicitParam(name="pageNum",value="页头数位",dataType="int", paramType = "query",defaultValue="1"),
	  @ApiImplicitParam(name="pageSize",value="每页数目",dataType="int", paramType = "query",defaultValue="10"),
	  @ApiImplicitParam(name="orderName",value="排序字段",dataType="string", paramType = "query",defaultValue="finance_id"),
	  @ApiImplicitParam(name="orderWay",value="排序方式",dataType="string", paramType = "query",defaultValue="desc")
	  })
	@RequestMapping(value = "/list", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList browsePagingFinance(
			@RequestParam(value="money",required=false)Double money,
			@RequestParam(value="accountId",required=false)Integer accountId,
			@RequestParam(value="pageNum",defaultValue="1",required=false)int pageNum,
			@RequestParam(value="pageSize",defaultValue="10",required=false) int pageSize,
			@RequestParam(value="orderName",required=false,defaultValue="finance_id") String orderName,
			@RequestParam(value="orderWay",required=false,defaultValue="desc") String orderWay,HttpSession session)  {
			List<Finance> list = new ArrayList<Finance>();
			list= financeService.browsePagingFinance(money,accountId,pageNum, pageSize, orderName, orderWay);
			if(list.size()>0){
				
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				return ResultUtil.getSlefSRFailList(list);
			}
	}
	/**
	 * 财务修改
	 * @return
	 */
	@ApiOperation(value = "财务修改", notes = "财务修改")
	@RequestMapping(value = "/update", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult updateFinance(@ModelAttribute Finance finance,HttpSession session)  {
		boolean um = financeService.updateFinance(finance);
		return ResultUtil.getSR(um);
	}
	/**
	 * 修改或增加交易密码
	 * @return
	 */
	@ApiOperation(value = "修改或增加交易密码", notes = "修改或增加交易密码")
	@ApiImplicitParams({
		@ApiImplicitParam(name="accountId",value="账户ID",dataType="int", paramType = "query",required=true),
		  @ApiImplicitParam(name="password",value="交易密码",dataType="string", paramType = "query",required=true),
		  })
	@RequestMapping(value = "/updatePassword", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList updatePassword(
			@RequestParam(value="accountId")Integer accountId,
			@RequestParam(value="password")Double password,
			HttpSession session)  {
		List<Finance> list=new ArrayList<>();
		List<Finance> fl = financeService.browsePagingFinance(null, accountId, 1, 1, "finance_id", "asc");
		if(fl.size()==1){
			Finance finance = fl.get(0);
			fl.get(0).setPassword(MyDESutil.getMD5(password));
			boolean um = financeService.updateFinance(finance);
			if(um){
				list.add(finance);
				return ResultUtil.getSlefSRSuccessList(list);
			}
		}
		return ResultUtil.getSlefSRFailList(list);
	}
	/**
	 * 充值
	 * @return 
	 */
	@ApiOperation(value = "充值", notes = "充值")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="accountId",value="账户ID",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="method",value="方式，1支付宝，2微信,3ios内购",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="money",value="金额",dataType="double", paramType = "query")
		  })
	@RequestMapping(value = "/recharge", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList rechargeFinance(
			@RequestParam(value="accountId")Integer accountId,
			@RequestParam(value="method")Integer method,
			@RequestParam(value="money")Double money,
			HttpSession session) {
		List<Finance> list=new ArrayList<Finance>();
		FinanceRecord fr=new FinanceRecord();
		fr.setAccountId(accountId);
		fr.setMethod(method);
		String transactionNumber = ((int) (Math.random()*9000)+1000)+DateUtil.getOrdersTime()+(accountId+10000);
		fr.setTransactionNumber(transactionNumber);
		fr.setType(1);//1是账户充值
		fr.setStatus(2);//充值直接成功
		boolean b = financeRecordService.addFinanceRecord(fr);
		if(b){
			List<Finance> fl = financeService.browsePagingFinance(null, accountId, 1, 1, "finance_id", "asc");
			if(fl.size()==1){
				Finance f = fl.get(0);
				f.setMoney(f.getMoney()+money);
				f.setRecharge(f.getRecharge()+money);
				b= financeService.updateFinance(f);
				if(b){
					list.add(f);
					return ResultUtil.getSlefSRSuccessList(list);
				}
			}
		}
		return ResultUtil.getSlefSRFailList(list);
	}
	/**
	 * 提现
	 * @return 
	 */
	@ApiOperation(value = "提现", notes = "提现")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="accountId",value="账户ID",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="method",value="方式，1支付宝，2微信,3ios内购",dataType="int", paramType = "query"),
		  @ApiImplicitParam(name="money",value="金额",dataType="double", paramType = "query")
		  })
	@RequestMapping(value = "/withdrawals", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList withdrawalsFinance(
			@RequestParam(value="accountId")Integer accountId,
			@RequestParam(value="method")Integer method,
			@RequestParam(value="money")Double money,
			HttpSession session) {
		List<Finance> list=new ArrayList<Finance>();
		List<Finance> fl = financeService.browsePagingFinance(null, accountId, 1, 1, "finance_id", "asc");
		boolean b=false;
		if(fl.size()==1){
			Finance f = fl.get(0);
			if(f.getMoney()-money<0){
				return ResultUtil.getSlefSRFailList(list);
			}
			f.setMoney(f.getMoney()-money);
			f.setRecharge(f.getWithdrawals()+money);
			b= financeService.updateFinance(f);
			if(b){
				FinanceRecord fr=new FinanceRecord();
				fr.setAccountId(accountId);
				fr.setMethod(method);
				String transactionNumber = ((int) (Math.random()*9000)+1000)+DateUtil.getOrdersTime()+(accountId+10000);
				fr.setTransactionNumber(transactionNumber);
				fr.setType(2);//2是账户提现
				fr.setStatus(1);//提现待处理，后台显示操作成功
				b = financeRecordService.addFinanceRecord(fr);
				if(b){
					list.add(f);
					return ResultUtil.getSlefSRSuccessList(list);
				}
			}
		}
		
		return ResultUtil.getSlefSRFailList(list);
	}
	/**
	 * 财务增加
	 * @return 
	 */
	@ApiOperation(value = "财务增加", notes = "财务增加")
	@RequestMapping(value = "/add", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult addFinance(@ModelAttribute Finance finance, HttpSession session) {
		boolean am = financeService.addFinance(finance);
		return ResultUtil.getSR(am);
	}
	/**
	 * 财务删除
	 * @return
	 */
	@ApiOperation(value = "财务删除", notes = "财务删除")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="financeId",value="财务ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/delete", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult delFinance(
			@RequestParam("financeId") Integer financeId,HttpSession session)  {
		boolean dm =financeService.delFinance(financeId);
		return ResultUtil.getSR(dm);
	}
	/**
	 * 财务浏览数量
	 * @return
	 */
	@ApiOperation(value = "财务数量", notes = "财务数量查询")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="money",value="余额",dataType="double", paramType = "query"),
		  @ApiImplicitParam(name="accountId",value="通知人id",dataType="int", paramType = "query")
		  })
	@RequestMapping(value = "/count", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int countAll(
			@RequestParam(value="money",required=false)Double money,
			@RequestParam(value="accountId",required=false)Integer accountId,HttpSession session)  {
		int count = financeService.countAll(money,accountId);
		return count;
	}
	/**
	 * 财务单个加载
	 * @return
	 */
	@ApiOperation(value = "财务单个加载", notes = "财务单个加载")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="financeId",value="财务ID",dataType="int", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/{financeId}", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList loadFinance(@PathVariable("financeId") Integer financeId,HttpSession session)  {
		List<Finance> list = new ArrayList<Finance>();
		Finance finance = financeService.loadFinance(financeId);
			if(finance!=null &&!finance.equals("")){
				list.add(finance);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				return ResultUtil.getSlefSRFailList(list);
			}
	}
	
}
