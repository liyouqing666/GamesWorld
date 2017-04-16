package com.jbit.games.entity;

public class Order2 {
	
	private int order2_id;
	private int order_id;
	private int num;
	private double price;
	private double total;
	private String image;
	
	public int getOrder2_id() {
		return order2_id;
	}
	public void setOrder2_id(int order2_id) {
		this.order2_id = order2_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Order2(int order2_id, int order_id, int num, double price,
			double total, String image) {
		super();
		this.order2_id = order2_id;
		this.order_id = order_id;
		this.num = num;
		this.price = price;
		this.total = total;
		this.image = image;
	}
	public Order2() {
		super();
		// TODO Auto-generated constructor stub
	}
}
