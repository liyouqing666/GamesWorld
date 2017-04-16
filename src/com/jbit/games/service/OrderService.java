package com.jbit.games.service;

import java.util.List;
import java.util.Map;

import com.jbit.games.dao.Order2Dao;
import com.jbit.games.entity.Order;
import com.jbit.games.entity.Order2;
/**
 * 订单相关
 * @author 李有卿
 * @version 1.0
 */
public interface OrderService {
	public void add(Order order);//添加一个订单
	public void delete(int id);//删除一个订单
	public void update(Order order,int order_state);//更新一个订单
	
	public Order getById(int id);//通过id得到一个订单
	
	public List<Order> getAllByCondtion(String username,int order_id,int user_id,int pageIndex); //组合加分页
	
	public int getTotalPage(String username,int order_id,int user_id);//查询最大记录数
	
	public List<Order2> getAll2();//得到所有的二级订单
	
	public void add(Order2 order2);
	public List<Order> getAllByUserId(int userId);
	public void updateAddress(Order order);
	public Map<String, Object> getDataByPage(int id, int page, int rows);
}
