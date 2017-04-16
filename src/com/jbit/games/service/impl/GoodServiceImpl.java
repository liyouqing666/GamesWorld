package com.jbit.games.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jbit.games.dao.GoodDao;
import com.jbit.games.entity.Good;
import com.jbit.games.service.GoodService;
/**
 * 商品相关
 * @author 李有卿
 * @version 1.0
 */
@Service("goodService")
public class GoodServiceImpl implements GoodService {

	@Autowired
	private GoodDao goodDao;
	
	public void setGoodDao(GoodDao goodDao) {
		this.goodDao = goodDao;
	}
	@Transactional
	public void add(Good good) {
		goodDao.add(good);
	}
	@Transactional
	public void delete(int id) {
		goodDao.delete(id);
	}
	@Transactional
	public void update(Good good) {
		goodDao.update(good);
	}

	public Good getGoodById(int id) {
		return goodDao.getGoodById(id);
	}

	public List<Good> getGoodsByCondtion(String name, String lei, int pageIndex) {
		List<Good> list=new ArrayList<Good>();
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		if(name!=null&&!name.equals("")){
			map.put("goods_name", "%"+name+"%");
		}
		if(lei!=null&&!lei.equals("")){
			map.put("goods_class", lei);
		}
		map.put("startRow", (pageIndex-1)*12);
		map.put("endRow", pageIndex*12);
		
		list=goodDao.getGoodsByCondtion(map);
		
		return list;
	}

	public int getTotalPage(String name, String lei) {
		Map<String, Object> map=new HashMap<String, Object>();
		
		if(name!=null&&!name.equals("")){
			map.put("goods_name", name);
		}
		if(lei!=null&&!lei.equals("")){
			map.put("goods_class", lei);
		}
		
		return goodDao.getTotal(map)%12==0?goodDao.getTotal(map)/12:goodDao.getTotal(map)/12+1;
	}
	public int getTotal(String name, String lei) {
		Map<String, Object> map=new HashMap<String, Object>();
		
		if(name!=null&&!name.equals("")){
			map.put("goods_name", name);
		}
		if(lei!=null&&!lei.equals("")){
			map.put("goods_class", lei);
		}
		
		return goodDao.getTotal(map);
	}
}
