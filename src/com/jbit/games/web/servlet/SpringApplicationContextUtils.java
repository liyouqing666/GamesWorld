package com.jbit.games.web.servlet;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class SpringApplicationContextUtils implements ApplicationContextAware {
	
	private static ApplicationContext context;
	
	@Override  
	public void setApplicationContext(ApplicationContext arg0)	throws BeansException{
		    context=arg0;
	}
	
	public static <T> T getBean(Class<T> cls) {
        return    context.getBean(cls);
	}
	
}
