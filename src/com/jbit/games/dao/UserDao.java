package com.jbit.games.dao;

import java.util.List;
import java.util.Map;

import com.jbit.games.entity.User;

public interface UserDao {
	public User hasUser(Map<String, String> map);
	public void add(User user);
	public User getUserByUsername(Map<String, String> map);
	public List<User> getAll(Map<String, Object> map1);
	public int getCount();
}
