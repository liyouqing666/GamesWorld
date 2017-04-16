package com.jbit.games.dao;

import java.util.List;
import java.util.Map;

import com.jbit.games.entity.Good;

/**
 * 商品相关
 * @author 李有卿
 * @version 1.0
 */
public interface GoodDao {
	public void add(Good good);		//添加商品
	public void delete(int id);		//删除商品
	public void update(Good good);	//更新商品
	public Good getGoodById(int id);//通过id得到一个商品
	
	public List<Good> getGoodsByCondtion(Map<String, Object> map);//分页组合查询
	public int getTotal(Map<String, Object> map);	//得到该条件下的总页数
}
