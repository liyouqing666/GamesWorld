package com.jbit.games.test;

import java.util.List;
import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jbit.games.entity.Order;
import com.jbit.games.entity.Shopp;
import com.jbit.games.service.OrderService;
import com.jbit.games.service.ShoppService;
import com.jbit.games.service.StuService;

public class Test2 {

	/**
	 * @param args
	 */
	public static void main1(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		OrderService ser=(OrderService) ac.getBean("orderService");
		Order a=new Order();
		ser.add(a);
		System.out.println(a.getOrder_id()+"**********************");
		System.setProperty("", "");
	}
	/*
	 * 测试map能不能接受来自数据库的值
	 */
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		StuService stus=(StuService) ac.getBean("stuService");
		List<Map<String, Object>> aa = stus.getMap();
		for (Map<String, Object> map : aa) {
			System.out.println(map);
		}
		
	}

}
