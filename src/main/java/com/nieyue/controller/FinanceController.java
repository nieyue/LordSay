package com.nieyue.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nieyue.bean.Account;
import com.nieyue.bean.Finance;
import com.nieyue.bean.Payment;
import com.nieyue.business.OrderBusiness;
import com.nieyue.exception.AccountAuthAuditException;
import com.nieyue.exception.AccountIsNotExistException;
import com.nieyue.exception.AccountNotAuthException;
import com.nieyue.exception.CommonRollbackException;
import com.nieyue.exception.FinancePasswordException;
import com.nieyue.exception.NotAnymoreException;
import com.nieyue.exception.NotIsNotExistException;
import com.nieyue.exception.PayException;
import com.nieyue.exception.VerifyCodeErrorException;
import com.nieyue.pay.AlipayUtil;
import com.nieyue.service.AccountService;
import com.nieyue.service.FinanceRecordService;
import com.nieyue.service.FinanceService;
import com.nieyue.service.WithdrawalsService;
import com.nieyue.util.MyDESutil;
import com.nieyue.util.ResultUtil;
import com.nieyue.util.SingletonHashMap;
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
	private WithdrawalsService withdrawalsService;
	@Resource
	private AccountService accountService;
	@Resource
	private OrderBusiness orderBusiness;
	@Resource
	private AlipayUtil alipayUtil;
	@Value("${myPugin.lordSayProjectDomainUrl}")
	private String lordSayProjectDomainUrl;
	
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
				throw new NotAnymoreException();//没有更多
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
	 * 管理员修改或增加交易密码
	 * @return
	 */
	@ApiOperation(value = "管理员修改或增加交易密码", notes = "管理员修改或增加交易密码")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="financeId",value="财务ID",dataType="int", paramType = "query",required=true),
		  @ApiImplicitParam(name="password",value="交易密码",dataType="string", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/updatePasswordByFinanceId", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResult adminUpdatePassword(
			@RequestParam(value="financeId")Integer financeId,
			@RequestParam(value="password")String password,
			HttpSession session)  {
		Finance f = financeService.loadFinance(financeId);
		f.setPassword(MyDESutil.getMD5(password));
		boolean um = financeService.updateFinance(f);
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
		  @ApiImplicitParam(name="validCode",value="短信验证码",dataType="string", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/updatePassword", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList updatePassword(
			@RequestParam(value="accountId")Integer accountId,
			@RequestParam(value="password")String password,
			@RequestParam(value="validCode") String validCode,
			HttpSession session)  {
		List<Finance> list=new ArrayList<>();
		Account account = accountService.loadAccount(accountId);
		if(account==null){
			throw new AccountIsNotExistException();
		}
		//手机验证码
		HashMap<String,Object> smap=  SingletonHashMap.getInstance();
		String vc = (String) smap.get("validCode"+account.getPhone());
		if(vc==null||!vc.equals(validCode)){
			throw new VerifyCodeErrorException();//验证码错误
		}
		List<Finance> fl = financeService.browsePagingFinance(null, accountId, 1, 1, "finance_id", "asc");
		if(fl.size()==1){
			Finance finance = fl.get(0);
			fl.get(0).setPassword(MyDESutil.getMD5(password));
			boolean um = financeService.updateFinance(finance);
			if(um){
				list.add(finance);
				//修改交易密码后，错误次数清空
				session.removeAttribute("passwordValidDate");
				session.removeAttribute("passwordValidNumber");
				return ResultUtil.getSlefSRSuccessList(list);
			}
		}
		return ResultUtil.getSlefSRFailList(list);
	}
	/**
	 *  交易密码验证
	 * @return
	 */
	@ApiOperation(value = "交易密码验证", notes = "交易密码验证")
	@RequestMapping(value = "/passwordValid", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList passwordValid(
			@RequestParam(value="accountId")Integer accountId,
			@RequestParam(value="password")String password,
			HttpSession session)  {
		List<Finance> list=new ArrayList<>();
		List<Finance> fl = financeService.browsePagingFinance(null, accountId, 1, 1, "finance_id", "asc");
		if(fl.size()==1){
			Finance finance = fl.get(0);
			if(StringUtils.isEmpty(finance.getPassword())){
				throw new CommonRollbackException("请设置交易密码");
			}
			//超次数不能使用
			if(session.getAttribute("passwordValidNumber")!=null
					&&(Integer) session.getAttribute("passwordValidNumber")>=5
					&&((Date) session.getAttribute("passwordValidDate")).after(new Date(new Date().getTime()-1000*30*60))
					){
				throw new CommonRollbackException("错误超过5次，请30分钟后重试或修改密码重试");//请求过快30分钟
			}
			if(finance.getPassword().equals(MyDESutil.getMD5(password))){
				return ResultUtil.getSlefSRSuccessList(list);
			}
			//错误之后记录错误时间和错误次数
			if(session.getAttribute("passwordValidDate")==null){//验证时间
				session.setAttribute("passwordValidDate", new Date());
				session.setAttribute("passwordValidNumber", 1);
			}else{
				Integer passwordValidNumber= (Integer) session.getAttribute("passwordValidNumber");
				session.setAttribute("passwordValidNumber", passwordValidNumber+1);
				if(passwordValidNumber>=5){
					//超过30分钟后再次错误
					session.setAttribute("passwordValidDate", new Date());
					session.setAttribute("passwordValidNumber", 1);
				}
			}
			
			throw new FinancePasswordException();//交易密码错误
		}
		return ResultUtil.getSlefSRFailList(list);
	}
	/**
	 *  支付宝充值回调
	 * @return
	 */
	@ApiOperation(value = "充值回调", notes = "充值回调")
	@RequestMapping(value = "/alipayRechargeNotifyUrl", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String alipayRechargeNotifyUrl(
			HttpServletRequest request,HttpSession session)  {
		String s = alipayUtil.getRechargeNotifyUrl(request);
		return s;
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
		Account a = accountService.loadAccount(accountId);
		List<Object> list=new ArrayList<Object>();
		if(a==null){
			throw new AccountIsNotExistException();	//账户不存在
		}
		if(a.getAuth()==null||a.getAuth()==0){//没认证
			throw new AccountNotAuthException();//账户未认证
		}
		if(a.getAuth()==1){//审核中
			throw new AccountAuthAuditException();//账户审核中
		}
		String result="";
		String transactionNumber = orderBusiness.getOrderNumber(accountId);
		Payment payment=new Payment();
		payment.setAccountId(accountId);
		payment.setBusinessType(4);//充值
		payment.setCreateDate(new Date());
		payment.setMoney(money);
		payment.setOrderNumber(transactionNumber);
		payment.setStatus(1);//默认已下单
		payment.setType(method);
		payment.setUpdateDate(new Date());
		payment.setSubject("充值");
		payment.setBody("充值");
		
		if(method==1){//支付宝
			payment.setNotifyUrl(lordSayProjectDomainUrl+"/finance/alipayRechargeNotifyUrl");
			//真实环境
			try {
				result=alipayUtil.getAppPayment(payment);
			} catch (UnsupportedEncodingException e) {
				throw new PayException();//支付异常
			}
			list.add(result);
			
			//测试环境
		/*	FinanceRecord fr=new FinanceRecord();
			fr.setAccountId(payment.getAccountId());
			fr.setMethod(payment.getType());//支付类型
			fr.setMoney(payment.getMoney());//金额
			fr.setTransactionNumber(payment.getOrderNumber());//订单号
			fr.setType(1);//1是账户充值
			fr.setStatus(2);//充值直接成功
			boolean b = financeRecordService.addFinanceRecord(fr);
			if(b){
				List<Finance> fl = financeService.browsePagingFinance(null, payment.getAccountId(), 1, 1, "finance_id", "asc");
				if(fl.size()==1){
					Finance f = fl.get(0);
					f.setMoney(f.getMoney()+payment.getMoney());
					f.setRecharge(f.getRecharge()+payment.getMoney());
					b= financeService.updateFinance(f);
					list.add(f);
					return ResultUtil.getSlefSRSuccessList(list);
				}
			}*/
		}else if(method==2){//微信
			list.add("暂未开通");
			return ResultUtil.getSlefSRFailList(list);
		}else if(method==4){//ios内购
			list.add("暂未开通");
			return ResultUtil.getSlefSRFailList(list);
		}
		return ResultUtil.getSlefSRSuccessList(list);
	}
	/**
	 * 提现
	 * @return 
	 */
	@ApiOperation(value = "提现", notes = "提现")
	@ApiImplicitParams({
		  @ApiImplicitParam(name="accountId",value="账户ID",dataType="int", paramType = "query",required=true),
		  @ApiImplicitParam(name="method",value="方式，1支付宝，2微信,3ios内购",dataType="int", paramType = "query",required=true),
		  @ApiImplicitParam(name="money",value="金额",dataType="double", paramType = "query",required=true),
		  @ApiImplicitParam(name="realname",value="真实姓名",dataType="string", paramType = "query",required=true),
		  @ApiImplicitParam(name="accountname",value="账户名称",dataType="string", paramType = "query",required=true),
		  @ApiImplicitParam(name="validCode",value="验证码",dataType="string", paramType = "query",required=true)
		  })
	@RequestMapping(value = "/withdrawals", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList withdrawalsFinance(
			@RequestParam(value="accountId")Integer accountId,
			@RequestParam(value="method")Integer method,
			@RequestParam(value="money")Double money,
			@RequestParam(value="realname")String realname,
			@RequestParam(value="accountname")String accountname,
			@RequestParam(value="validCode") String validCode,
			HttpSession session) {
		Account a = accountService.loadAccount(accountId);
		List<Finance> list=new ArrayList<Finance>();
		if(a==null){
			throw new AccountIsNotExistException();	//账户不存在
		}
		//手机验证码
		HashMap<String,Object> smap=  SingletonHashMap.getInstance();
		String vc = (String) smap.get("validCode"+a.getPhone());
		if(vc==null||!vc.equals(validCode)){
			throw new VerifyCodeErrorException();//验证码错误
		}
		if(a.getAuth()==null||a.getAuth()==0){//没认证
			throw new AccountNotAuthException();//账户未认证
		}
		if(a.getAuth()==1){//审核中
			throw new AccountAuthAuditException();//账户审核中
		}
		Finance f=financeService.withdrawals(accountId, method, money, realname, accountname);
		if(!ObjectUtils.isEmpty(f)){	
			list.add(f);
			return ResultUtil.getSlefSRSuccessList(list);
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
		  @ApiImplicitParam(name="financeId",value="财务ID",dataType="int", paramType = "path",required=true)
		  })
	@RequestMapping(value = "/{financeId}", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody StateResultList loadFinance(@PathVariable("financeId") Integer financeId,HttpSession session)  {
		List<Finance> list = new ArrayList<Finance>();
		Finance finance = financeService.loadFinance(financeId);
			if(finance!=null &&!finance.equals("")){
				list.add(finance);
				return ResultUtil.getSlefSRSuccessList(list);
			}else{
				throw new NotIsNotExistException("财务");//不存在
			}
	}
	
}
