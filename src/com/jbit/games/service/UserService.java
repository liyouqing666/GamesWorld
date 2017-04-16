package com.jbit.games.service;

import java.util.Map;

import com.jbit.games.entity.User;

public interface UserService {
	public User hasUser(String username);
	public void add(User user);
	public Map<String, Object> getUserByUsername(String username,String password);
	public Map<String, Object> getAll(String pageStr, String rowsStr);
}
