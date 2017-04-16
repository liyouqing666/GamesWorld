package com.jbit.games.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jbit.games.dao.UserDao;
import com.jbit.games.entity.User;
import com.jbit.games.service.UserService;
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public User hasUser(String username) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("username", username);
		return userDao.hasUser(map);
	}
	@Transactional
	public void add(User user) {
		userDao.add(user);
	}
	public Map<String, Object> getUserByUsername(String username
			,String password) {
		Map<String, Object> map=new HashMap<String, Object>();
		Map<String, String> map1=new HashMap<String, String>();
		map1.put("username", username);
		User user= userDao.getUserByUsername(map1);
		if(user==null){
			map.put("isLogin", false);
			map.put("errMessage", "用户名错误！");
		}else{
			if(password.equals(user.getPassword())){
				map.put("isLogin", true);
				map.put("user", user);
			}else{
				map.put("isLogin", false);
				map.put("errMessage", "密码错误！");
			}
		}
		return map;
	}
	public Map<String, Object> getAll(String pageStr, String rowsStr) {
		Map<String, Object> map=new HashMap<String, Object>();
		Map<String, Object> map1=new HashMap<String, Object>();
		int page=1;
		if (pageStr!=null&&!"".equals(pageStr)) {
			page=Integer.parseInt(pageStr);
		}
		int rows=1;
		if (rowsStr!=null&&!"".equals(rowsStr)) {
			rows=Integer.parseInt(rowsStr);
		}
		
		int firstResult=(page-1)*rows;
		
		map1.put("firstResult", firstResult);
		map1.put("maxResult", rows);
		List<User> list = userDao.getAll(map1);
		int count = userDao.getCount();
		
		map.put("total", count);
		map.put("rows", list);
		
		return map;

	}
}
