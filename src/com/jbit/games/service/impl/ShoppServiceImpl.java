package com.jbit.games.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jbit.games.dao.ShoppDao;
import com.jbit.games.entity.Shopp;
import com.jbit.games.service.ShoppService;
/**
 * 购物车相关
 * @author 李有卿
 * @version 1.0
 */
@Service("shoppService")
public class ShoppServiceImpl implements ShoppService {
	
	@Autowired
	private ShoppDao shoppDao;
	
	public void setShoppDao(ShoppDao shoppDao) {
		this.shoppDao = shoppDao;
	}
	@Transactional
	public void add(Shopp shopp) {
		shoppDao.add(shopp);
	}
	@Transactional
	public void delete(int id) {
		shoppDao.delete(id);
	}
	@Transactional
	public void update(Shopp shopp) {
		shoppDao.update(shopp);
	}
	
	public Shopp getShoppById(int id) {
		return shoppDao.getShoppById(id);
	}

	public List<Shopp> getAll(int userId) {
		return shoppDao.getAll(userId);
	}

}
