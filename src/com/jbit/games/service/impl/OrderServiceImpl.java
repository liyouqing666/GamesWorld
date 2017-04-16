package com.jbit.games.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jbit.games.dao.Order2Dao;
import com.jbit.games.dao.OrderDao;
import com.jbit.games.entity.Order;
import com.jbit.games.entity.Order2;
import com.jbit.games.service.OrderService;
@Service("orderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	@Autowired
	private Order2Dao order2Dao;
	public void setOrder2Dao(Order2Dao order2Dao) {
		this.order2Dao = order2Dao;
	}
	
	@Transactional
	public void add(Order order) {
		int id=orderDao.add(order);
	}
	@Transactional
	public void delete(int id) {
		
		order2Dao.delete(id);
		orderDao.delete(id);
		
	}
	@Transactional
	public void update(Order order,int order_state) {
		order.setOrder_state(order_state);
		orderDao.update(order);
	}
	@Transactional
	public void updateAddress(Order order){
		orderDao.update(order);
	}
	
	public List<Order> getAllByCondtion(String username,int order_id,int user_id,int pageIndex) {
		List<Order> list=new ArrayList<Order>();
		Map<String, Object> map=new HashMap<String, Object>();
		if(username!=null&&!username.equals("")){
			
			map.put("username", "%"+username+"%");
		}
		if(order_id!=0){
			
			map.put("order_id", order_id);
		}
		if(user_id!=0){
			map.put("user_id", user_id);
		}
		map.put("startRow", (pageIndex-1)*6);
		map.put("endRow", pageIndex*6);
		list=orderDao.getAllByCondtion(map);
		return list;
	}

	public int getTotalPage(String username,int order_id,int user_id) {
		Map<String, Object> map=new HashMap<String, Object>();
		if(username!=null&&!username.equals("")){
			map.put("username", username);
		}
		if(order_id!=0){
			map.put("order_id", order_id);
		}
		if(user_id!=0){
			map.put("user_id", user_id);
		}
		return orderDao.getTotal(map)%6==0?orderDao.getTotal(map)/6:orderDao.getTotal(map)/6+1;
	}

	public List<Order2> getAll2() {
		return order2Dao.getAll2();
	}
	
	public void add(Order2 order2) {
		order2Dao.add(order2);
	}

	public Order getById(int id) {
		return orderDao.getById(id);
	}

	public List<Order> getAllByUserId(int userId) {
		return orderDao.getAllByUserId(userId);
	}

	public Map<String, Object> getDataByPage(int   id, int page, int rows) {
		Map<String, Object> map=new HashMap<String, Object>();
		
		Map<String, Object> map1=new HashMap<String, Object>();
		if(id!=0){
			map1.put("order_id", id);
		}
		
		map1.put("startRow", (page-1)*rows);
		map1.put("endRow", page*rows);
		List<Order> list = orderDao.getAllByCondtion(map1);
		
		int total=orderDao.getTotal(map1);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}

}
