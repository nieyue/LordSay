package com.nieyue.comments;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * 自定义session监听器
 * @author 聂跃
 * @date 2018年6月5日
 */
@WebListener
public class MySessionListener implements HttpSessionListener {
	/**
	 * 创建事件
	 */
	@Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
		//创建的时候放入
		// MySessionContext.AddSession(httpSessionEvent.getSession());
    }
    /**
	 * 销毁事件
	 */
	@Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        //销毁的时候删除
		//HttpSession session = httpSessionEvent.getSession();
       // MySessionContext.DelSession(session);
    }
	
}