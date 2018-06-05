package com.nieyue.comments;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

/**
 * 自定义sessioncontext
 * @author 聂跃
 * @date 2018年6月5日
 */
public class MySessionContext {
	private static Map<String,HttpSession> mymap=new HashMap<>();    
	
	public static Map<String,HttpSession> getSessionList(){
		return mymap;
	}
	
	public synchronized static void AddSession(HttpSession session) {    
	if (session != null) {    
	mymap.put(session.getId(), session);    
	}    
	}    
	    
	public synchronized static void DelSession(HttpSession session) {    
	if (session != null) {    
	mymap.remove(session.getId());  
	session.invalidate();
	}    
	}    
	    
	public synchronized static  HttpSession getSession(String session_id) {    
	if (session_id == null) return null;    
	return  mymap.get(session_id);    
	}   
}
