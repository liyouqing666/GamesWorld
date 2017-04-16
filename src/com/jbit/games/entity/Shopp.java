package com.jbit.games.entity;

public class Shopp {
	private int shopp_id;
	private int goods_id;
	private int shopp_num;
	private double shopp_price;
	private double shopp_total;
	private String shopp_image;
	private int userId;
	public int getShopp_id() {
		return shopp_id;
	}
	public void setShopp_id(int shopp_id) {
		this.shopp_id = shopp_id;
	}
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getShopp_num() {
		return shopp_num;
	}
	public void setShopp_num(int shopp_num) {
		this.shopp_num = shopp_num;
	}
	public double getShopp_price() {
		return shopp_price;
	}
	public void setShopp_price(double shopp_price) {
		this.shopp_price = shopp_price;
	}
	public double getShopp_total() {
		return shopp_total;
	}
	public void setShopp_total(double shopp_total) {
		this.shopp_total = shopp_total;
	}
	public String getShopp_image() {
		return shopp_image;
	}
	public void setShopp_image(String shopp_image) {
		this.shopp_image = shopp_image;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Shopp(int shopp_id, int goods_id, int shopp_num, double shopp_price,
			double shopp_total, String shopp_image, int userId) {
		super();
		this.shopp_id = shopp_id;
		this.goods_id = goods_id;
		this.shopp_num = shopp_num;
		this.shopp_price = shopp_price;
		this.shopp_total = shopp_total;
		this.shopp_image = shopp_image;
		this.userId = userId;
	}
	public Shopp() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
