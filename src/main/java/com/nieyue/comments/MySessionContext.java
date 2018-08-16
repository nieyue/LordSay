package com.nieyue.comments;

import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

/**
 * 自定义sessioncontext
 * @author 聂跃
 * @date 2018年6月5日
 */
public class MySessionContext {
	//放session
	private static Map<String,HttpSession> mymap=new ConcurrentHashMap<>();   
	//剔除过期的session
	static {
		new Thread(new Runnable() {
			@Override
			public void run() {
				Set<Entry<String, HttpSession>> se;
				while(true){
					se = MySessionContext.getSessionList().entrySet();
				       for (Entry<String, HttpSession> entry : se) {
					HttpSession sessiontemp = entry.getValue();
					  try{
						  sessiontemp.getAttribute("account");						  
					  }catch(Exception e){
						   MySessionContext.DelSession(sessiontemp);
					  }
				    }
				}
				
			}
		}).start();
	}
	public static Map<String,HttpSession> getSessionList(){
		return mymap;
	}
	
	public  static void AddSession(HttpSession session) {    
	if (session != null) {    
	mymap.put(session.getId(), session);    
	}    
	}    
	    
	public  static void DelSession(HttpSession session) {    
	if (session != null) {    
	mymap.remove(session.getId());  
	//不需要也不能删除，不然有bug
	//session.invalidate();
	}    
	}    
	    
	public  static  HttpSession getSession(String session_id) {    
	if (session_id == null) return null;    
	return  mymap.get(session_id);    
	}   
}
