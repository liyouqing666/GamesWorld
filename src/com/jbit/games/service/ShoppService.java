package com.jbit.games.service;

import java.util.List;

import com.jbit.games.entity.Shopp;
/**
 * 购物车相关
 * @author 李有卿
 * @version 1.0
 */
public interface ShoppService {
	public void add(Shopp shopp);//添加一个商品
	
	public void delete(int id); //删除一个
	
	public void update(Shopp shopp);//更新
	
	public Shopp getShoppById(int id);//得到一个
	
	public List<Shopp> getAll(int userId);//得到所有
}
