package com.nieyue.util;

import java.util.LinkedList;
import java.util.List;

/**
 * 返回状态工具
 * 包装 StateResult和StateResultList
 * @author yy
 *
 */
public class ResultUtil {

	public ResultUtil() {
		super();
	}
		/**
		 * 成功
		 * 
		 */
		public static StateResult getSuccess(){
			StateResult sr=new StateResult(200,"成功");
			return sr;
		}
		/**
		 * 普通失败
		 * 
		 */
		public static StateResult getFail(){
			StateResult sr=new StateResult(40000,"系统内部错误");
			return sr;
		}
		/**
		 * 常规获取返回状态
		 * @param bl 
		 */
		public static StateResult getSR(boolean bl){
			StateResult sr = ResultUtil.getSuccess();
			if(!bl){
			sr = ResultUtil.getFail();
			}
			return sr;
		}
		/**
		 * 自定义获取返回状态
		 * @param bl 
		 */
		public static StateResult getSlefSR(Integer code,String msg){
			StateResult sr = new StateResult(code,msg);
			return sr;
		}
		/**
		 * 自定义获取返回状态
		 * @param bl 
		 */
		public static StateResult getSlefSR(String code,String msg){
			StateResult sr = new StateResult(Integer.valueOf(code),msg);
			return sr;
		}
		/**
		 * 自定义获取返回状态
		 * @param bl 
		 */
		public static StateResultList getSlefSRSuccessList(List<?> list){
			StateResultList srl = new StateResultList(200,"成功",list);
			return srl;
		}
		/**
		 * 自定义获取返回状态
		 * @param bl 
		 */
		public static StateResultList getSlefSRFailList(List<?> list){
			StateResultList srl = new StateResultList(40000,"系统内部错误",list);
			return srl;
		}
		/**
		 * 自定义获取返回状态
		 * @param bl 
		 */
		public static StateResultList getSlefSRList(String code,String msg,List<?> list){
			StateResultList srl = new StateResultList(Integer.valueOf(code),msg,list);
			return srl;
		}
		public static void main(String[] args) {
			List<String> list=new LinkedList<String>();
			System.out.println(ResultUtil.getSlefSRFailList(list).toString());
			System.out.println(ResultUtil.getSlefSRFailList(list).equals(ResultUtil.getSlefSRFailList(list)));
			System.out.println(ResultUtil.getSlefSRFailList(list)==ResultUtil.getSlefSRFailList(list));
		}
	}

