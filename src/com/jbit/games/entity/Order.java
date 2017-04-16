package com.jbit.games.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Order {
	private int order_id;
	private int order_num;
	private int order_state;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date order_time;
	private double order_total;
	
	private String username;
	private String tel;
	private String address;
	private int user_id;

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getOrder_state() {
		return order_state;
	}

	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}

	public Date getOrder_time() {
		return order_time;
	}

	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}

	public double getOrder_total() {
		return order_total;
	}

	public void setOrder_total(double order_total) {
		this.order_total = order_total;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public Order(int order_id, int order_num, int order_state, Date order_time,
			double order_total, String username, String tel, String address,
			int user_id) {
		super();
		this.order_id = order_id;
		this.order_num = order_num;
		this.order_state = order_state;
		this.order_time = order_time;
		this.order_total = order_total;
		this.username = username;
		this.tel = tel;
		this.address = address;
		this.user_id = user_id;
	}

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
