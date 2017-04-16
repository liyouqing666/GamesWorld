package com.jbit.games.dao;

import java.util.List;
import java.util.Map;

import com.jbit.games.entity.Order;

/**
 *  订单
 * @author 李有卿
 *	@version 1.0
 */
public interface OrderDao {
	public int add(Order order);//添加一个订单
	public void delete(int id);//删除一个订单
	public void update(Order order);//更新一个订单
	
	public List<Order> getAllByCondtion(Map<String, Object> map); //组合加分页
	
	public int getTotal(Map<String, Object> map);//查询最大记录数
	public Order getById(int id);
	public List<Order> getAllByUserId(int userId);
}
