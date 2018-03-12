package com.nieyue.exception;

import java.lang.reflect.UndeclaredThrowableException;

import org.springframework.validation.BindException;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import com.nieyue.util.ResultUtil;
import com.nieyue.util.StateResult;

/**
 * 统一异常处理
 * @author 聂跃
 * @date 2017年4月12日
 */
@RestControllerAdvice
public class MyExceptionAdvice {
	
	@ExceptionHandler(value=NotAnymoreException.class)
	@ResponseBody
	public StateResult notAnymoreExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(30000, "没有更多");
	}
	@ExceptionHandler(value=NotIsNotExistException.class)
	@ResponseBody
	public StateResult notIsNotExistExceptionHandler( NotIsNotExistException e) throws Exception {
		return ResultUtil.getSlefSR(30001, e.getTitle()+"不存在");
	}
	@ExceptionHandler(value=Exception.class)
	@ResponseBody
	public StateResult jsonExceptionHandler( Exception e) throws Exception {
	       return ResultUtil.getFail();
	    }
	@ExceptionHandler(value=AccountIsExistException.class)
	@ResponseBody
	public StateResult acountIsExistExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40001, "账户已存在");
	}
	@ExceptionHandler(value=VerifyCodeErrorException.class)
	@ResponseBody
	public StateResult verifyCodeErrorExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40002, "验证码错误");
	}
	@ExceptionHandler(value=AccountIsLoginException.class)
	@ResponseBody
	public StateResult acountIsLoginErrorHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40003, "账户已登录");
	}
	@ExceptionHandler(value=AccountIsNotLoginException.class)
	@ResponseBody
	public StateResult acountIsNotLoginExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40004, "账户没登录");
	}
	@ExceptionHandler(value=AccountIsNotExistException.class)
	@ResponseBody
	public StateResult acountIsNotExistExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40005, "账户不存在");
	}
	@ExceptionHandler(value=AccountNotAuthException.class)
	@ResponseBody
	public StateResult acountNotAuthExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40006, "账户没认证");
	}
	@ExceptionHandler(value=AccountAuthAuditException.class)
	@ResponseBody
	public StateResult acountAuthAuditExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40007, "账户认证审核中");
	}
	@ExceptionHandler(value=AccountAlreadyAuthException.class)
	@ResponseBody
	public StateResult acountAlreadyAuthExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40008, "账户已认证");
	}
	@ExceptionHandler(value=AccountPhoneException.class)
	@ResponseBody
	public StateResult acountPhoneExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40009, "手机号错误");
	}
	@ExceptionHandler(value=AccountPhoneIsExistException.class)
	@ResponseBody
	public StateResult acountPhoneIsExistExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40010, "手机号已存在");
	}
	@ExceptionHandler(value=AccountPhoneIsNotExistException.class)
	@ResponseBody
	public StateResult acountPhoneIsNotExistExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40011, "手机号不存在");
	}
	@ExceptionHandler(value=AccountMessageException.class)
	@ResponseBody
	public StateResult acountMessageExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40012, "手机短信发送异常，请重试");
	}
	@ExceptionHandler(value=AccountLockException.class)
	@ResponseBody
	public StateResult acountLockExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40013, "账户锁定");
	}
	@ExceptionHandler(value=AccountNotMasterIdException.class)
	@ResponseBody
	public StateResult ainanceMoneyNotEnoughExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(40014, "缺少邀请码");
	}
	@ExceptionHandler(value=FinanceMoneyNotEnoughException.class)
	@ResponseBody
	public StateResult financeMoneyNotEnoughExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(41000, "余额不足");
	}
	@ExceptionHandler(value=FinancePasswordException.class)
	@ResponseBody
	public StateResult financePasswordExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(41001, "交易密码错误");
	}
	@ExceptionHandler(value=BindException.class)
	@ResponseBody
	public StateResult paramsExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(50000, "参数绑定错误");
	}
	@ExceptionHandler(value=MissingServletRequestParameterException.class)
	@ResponseBody
	public StateResult requiredParamsExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(50001, "缺少参数");
	}
	@ExceptionHandler(value={MethodArgumentTypeMismatchException.class,NumberFormatException.class})
	@ResponseBody
	public StateResult paramsFormatExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(50002, "参数格式错误");
	}
	@ExceptionHandler(value={UndeclaredThrowableException.class,RequestLimitException.class})
	@ResponseBody
	public StateResult requestLimitExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(60000, "请求频次过快");
	}
	@ExceptionHandler(value={HttpMediaTypeNotAcceptableException.class,MySessionException.class})
	@ResponseBody
	public StateResult requestSessionExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(70000, "没有权限");
	}
	@ExceptionHandler(value={MyCertificateException.class})
	@ResponseBody
	public StateResult requestCertificateExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(80000, "没有服务认证");
	}
	@ExceptionHandler(value={PayException.class})
	@ResponseBody
	public StateResult payExceptionExceptionHandler( Exception e) throws Exception {
		return ResultUtil.getSlefSR(90001, "支付异常");
	}
	
}
