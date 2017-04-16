package com.jbit.games.service;

import java.util.List;
import java.util.Map;

import com.jbit.games.entity.Good;
/**
 * 商品相关
 * @author 李有卿
 * @version 1.0
 */
public interface GoodService {
	public void add(Good good);//添加一个
	public void delete(int id);//删除一个
	public void update(Good good);//更新
	public Good getGoodById(int id);//得到一个
	/**
	 * 组合分页查询
	 */
	public List<Good> getGoodsByCondtion(String name,String lei,int pageIndex);
	/**
	 * 得到总记录数
	 */
	public int getTotalPage(String name,String lei);
	public int getTotal(String name, String lei);
}
