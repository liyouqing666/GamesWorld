package com.jbit.games.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jbit.games.entity.Good;
import com.jbit.games.entity.Shopp;
import com.jbit.games.entity.User;
import com.jbit.games.service.GoodService;
import com.jbit.games.service.ShoppService;

@Controller
@RequestMapping("/shopp")
public class ShoppController {
	
	@Autowired
	private ShoppService shoppService;
	@Autowired
	private GoodService goodService;
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
	public void setShoppService(ShoppService shoppService) {
		this.shoppService = shoppService;
	}
	
	
	@RequestMapping("/add.htm")
	public String add(HttpServletRequest request ,Map map){
		
		String name=request.getParameter("name");
		String lei=request.getParameter("goodClass");
		String pageIndexStr=request.getParameter("pageIndex");
		int goods_id=Integer.parseInt(request.getParameter("goods_id"));
		int pageIndex=1;
		if(pageIndexStr!=null&&!pageIndexStr.equals("")){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		List<Good> list = goodService.getGoodsByCondtion(name, lei, pageIndex);
		int totalPage=goodService.getTotalPage(name, lei);
		
		Good good = goodService.getGoodById(goods_id);
		User user=(User) request.getSession().getAttribute("user");
		
		Shopp shopp=new Shopp(0, goods_id, 1, good.getGoods_price(), good.getGoods_price(), good.getGoods_image(),user.getUser_id());
		
		shoppService.add(shopp);
		
		map.put("list", list);
		map.put("name", name);
		map.put("goodClass", lei);
		map.put("totalPage", totalPage);
		map.put("pageIndex", pageIndex);
		return "main";
	}
	@RequestMapping("/getAll.htm")
	public String car(Map map,HttpServletRequest request){
		User user=(User) request.getSession().getAttribute("user");
		List<Shopp> list = shoppService.getAll(user.getUser_id());
		map.put("list", list);
		return "car";
	}
	@RequestMapping("/deletes.htm")
	public String delete(int carId,Map map){
		shoppService.delete(carId);
		return "redirect:/shopp/getAll.htm";
	}
	
}
