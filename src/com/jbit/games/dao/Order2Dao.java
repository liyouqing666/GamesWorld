package com.jbit.games.dao;

import java.util.List;

import com.jbit.games.entity.Order2;

/**
 * 二级订单
 * @author 李有卿
 * @version 1.0
 */
public interface Order2Dao {
	public void add(Order2 order2);//添加一个
	public void delete(int order_id);//通过一级订单删除
	public List<Order2> getAll2();//得到所有的二级订单
}
