package com.jbit.games.entity;

public class Good {
	
	private int goods_id;
	private String goods_name;
	private Double goods_price;
	private String goods_info;
	private int goods_store;
	private String goods_evaluate;
	private int goods_score;
	private String goods_image;
	private int goods_state;
	private String goods_class;
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public Double getGoods_price() {
		return goods_price;
	}
	public void setGoods_price(Double goods_price) {
		this.goods_price = goods_price;
	}
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}
	public int getGoods_store() {
		return goods_store;
	}
	public void setGoods_store(int goods_store) {
		this.goods_store = goods_store;
	}
	public String getGoods_evaluate() {
		return goods_evaluate;
	}
	public void setGoods_evaluate(String goods_evaluate) {
		this.goods_evaluate = goods_evaluate;
	}
	public int getGoods_score() {
		return goods_score;
	}
	public void setGoods_score(int goods_score) {
		this.goods_score = goods_score;
	}
	public String getGoods_image() {
		return goods_image;
	}
	public void setGoods_image(String goods_image) {
		this.goods_image = goods_image;
	}
	public int getGoods_state() {
		return goods_state;
	}
	public void setGoods_state(int goods_state) {
		this.goods_state = goods_state;
	}
	public String getGoods_class() {
		return goods_class;
	}
	public void setGoods_class(String goods_class) {
		this.goods_class = goods_class;
	}
	public Good(int goods_id, String goods_name, Double goods_price,
			String goods_info, int goods_store, String goods_evaluate,
			int goods_score, String goods_image, int goods_state,
			String goods_class) {
		super();
		this.goods_id = goods_id;
		this.goods_name = goods_name;
		this.goods_price = goods_price;
		this.goods_info = goods_info;
		this.goods_store = goods_store;
		this.goods_evaluate = goods_evaluate;
		this.goods_score = goods_score;
		this.goods_image = goods_image;
		this.goods_state = goods_state;
		this.goods_class = goods_class;
	}
	public Good() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
