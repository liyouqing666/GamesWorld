package com.jbit.games.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jbit.games.dao.OrderDao;
import com.jbit.games.entity.Student;
import com.jbit.games.service.StuService;

public class Test {

	/**
	 * 测试事务管理用
	 * @author 李有卿
	 */
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		StuService ser=(StuService) ac.getBean("stuService");
		
		try {
			ser.add(new Student(0, "9999", "88888888888888888888888888888888", 1));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("test********************************");
		}
	}
}
