package com.jbit.games.dao;

import java.util.List;
import java.util.Map;

import com.jbit.games.entity.Student;
/**
 * 测试ssm框架用
 * @author 李有卿
 * @version 1.0
 */
public interface StuDao {
	public List<Student> getAll();	//得到所有数据
	public void add(Student student);//添加一个数据 测试事务处理用
	public List<Map<String, Object>> getMap();
}
