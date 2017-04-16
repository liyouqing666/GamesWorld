package com.jbit.games.dao;

import java.util.List;

import com.jbit.games.entity.Shopp;

/**
 * 购物车相关
 *  @author 李有卿
 *	@version 1.0
 *
 */
public interface ShoppDao {
	public void add(Shopp shopp);//添加一个购物车
	
	public void delete(int id);//删除购物车
	
	public void update(Shopp shopp);//跟新购物车
	
	public Shopp getShoppById(int id);//通过id得到一个购物车
	
	public List<Shopp> getAll(int userId);//得到该用户下的所有购物车
	
}
