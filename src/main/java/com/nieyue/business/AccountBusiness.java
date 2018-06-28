package com.nieyue.business;

import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;

import com.nieyue.bean.Account;
import com.nieyue.comments.MySessionContext;
import com.nieyue.exception.CommonRollbackException;
/**
 * 团购等级业务
 * @author 聂跃
 * @date 2017年8月19日
 */
@Configuration
public class AccountBusiness {
	
	/**
	 * 根据账户id删除session
	 * @param accountId 账户id
	 */
	public void delSession(Integer accountId){
		//遍历所有session。删除当前的人的
	       Set<Entry<String, HttpSession>> se = MySessionContext.getSessionList().entrySet();
	       List<HttpSession> list=new ArrayList<>();
	       for (Entry<String, HttpSession> entry : se) {
 		  HttpSession sessiontemp = entry.getValue();
 		   Object accountobj = sessiontemp.getAttribute("account");
 		  if(accountobj==null){
 			  continue;
 		  }else{ 			  
 		   Account account = (Account)accountobj;
	 		  if(account!=null&&account.getAccountId().equals(accountId)){
	 			 list.add(sessiontemp);
	 			  //MySessionContext.DelSession(sessiontemp);
	 		  }
 		  }
	       }
	       if(list.size()>0){
	    	   for (HttpSession httpSession : list) {
	    		   MySessionContext.DelSession(httpSession);				
	    	   }
	       }
	}
	/**
	 * 根据账户id判断是否登录
	 * @param accountId 账户id
	 */
	public void islogin(Integer accountId){
		//判断当前账户是否已经登录
		 Set<Entry<String, HttpSession>> se = MySessionContext.getSessionList().entrySet();
	       for (Entry<String, HttpSession> entry : se) {
		  HttpSession sessiontemp = entry.getValue();
		  Account account = (Account) sessiontemp.getAttribute("account");
		  if(account!=null&&account.getAccountId().equals(accountId)){
			  throw new CommonRollbackException("该账户已登录其他设备，请退出其他设备后再试");
		  }
	     }
	}
	
}
