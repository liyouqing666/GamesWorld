package com.jbit.games.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.aop.support.AopUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.jbit.games.dao.StuDao;
import com.jbit.games.entity.Student;
import com.jbit.games.service.StuService;
@Service("stuService")

public class StuServiceImpl implements StuService {
	@Autowired
	private StuDao stuDao;
	public void setStuDao(StuDao stuDao) {
		this.stuDao = stuDao;
	}
	@Transactional(propagation=Propagation.REQUIRED)
	public void add(Student student) {
			
		stuDao.add(new Student(0, "ni", "a", 1));//这个是正常数据
		System.out.println("xxxxxxx*********************");
		stuDao.add(student);//这个让它报异常
		
		//service中的方法不能添加异常处理 否则 事务就不能回滚
	}

	public List<Student> getAll() {
		return stuDao.getAll();
	}
	@Override
	public List<Map<String, Object>> getMap() {
		return stuDao.getMap();
	}

}
