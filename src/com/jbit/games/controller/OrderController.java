package com.jbit.games.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jbit.games.dao.Order2Dao;
import com.jbit.games.entity.Good;
import com.jbit.games.entity.Order;
import com.jbit.games.entity.Order2;
import com.jbit.games.entity.Shopp;
import com.jbit.games.entity.User;
import com.jbit.games.service.GoodService;
import com.jbit.games.service.OrderService;
import com.jbit.games.service.ShoppService;

@Controller
@RequestMapping("/order")

public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private GoodService goodService;
	@Autowired
	private ShoppService shoppService;
	
	public void setShoppService(ShoppService shoppService) {
		this.shoppService = shoppService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
	@RequestMapping("/add.htm")
	public String add(HttpServletRequest request, Map map){
		int goods_id=Integer.parseInt(request.getParameter("goods_id"));
		Good good=goodService.getGoodById(goods_id);
		User user=(User) request.getSession().getAttribute("user");
		Order order=new Order(0, 1, 1, new Date(), good.getGoods_price(),
				user.getNickname(), user.getTel()+"", user.getAddress(),user.getUser_id());
		orderService.add(order);
		Order2 order2=new Order2(0, order.getOrder_id(), 1, good.getGoods_price(),
				good.getGoods_price(), good.getGoods_image());
		orderService.add(order2);
		map.put("order", order);
		return "address";
	}
	@RequestMapping("/getAll.htm")
	public String getAll(HttpServletRequest request ,Map map){
		User user=(User) request.getSession().getAttribute("user");
		String pageIndexStr=request.getParameter("pageIndex");
		int pageIndex=1;
		if(pageIndexStr!=null&&!pageIndexStr.equals("")){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		String username=request.getParameter("username");
		if(username==null||username.equals("")){
			username=null;
		}
		String order_idStr=request.getParameter("order_id");
		int order_id=0;
		if(order_idStr!=null&&!order_idStr.equals("")){
			order_id=Integer.parseInt(order_idStr);
		}
		List<Order> list = orderService.getAllByCondtion(username, order_id, user.getUser_id(), pageIndex);
		
		int totalPage=orderService.getTotalPage(username, order_id,user.getUser_id());
		
		List<Order2> order2List = orderService.getAll2();
		
		map.put("list", list);
		map.put("username", username);
		map.put("order_id", order_idStr);
		map.put("pageIndex", pageIndex);
		map.put("totalPage", totalPage);
		map.put("order2List", order2List);
		
		return "order";
	}
	
	@RequestMapping("/delete.htm")
	public String delete(int order_id,Map map){
		orderService.delete(order_id);
		return "redirect:/order/getAll.htm";
	}
	@RequestMapping("/update.htm")
	public String update(int order_id,int order_state,Map map){
		orderService.update(orderService.getById(order_id),order_state);
		return "redirect:/order/getAll.htm";
	}
	@RequestMapping("/updateAddress.htm")
	public String address(int order_id,String username,String tel,String address,Map map){
		Order order=orderService.getById(order_id);
		order.setUsername(username);
		order.setTel(tel);
		order.setAddress(address);
		orderService.updateAddress(order);
		return "success";
	}
	
	
	@RequestMapping("/addmore.htm")
	public String addmore(HttpServletRequest request ,Map map){
		String[] carIdStrS = request.getParameterValues("more");
		String zong=request.getParameter("zongjia");
		
		User user=(User) request.getSession().getAttribute("user");
		
		Order order=new Order(0, 1, 1, new Date(), Integer.parseInt(zong),
				user.getNickname(), user.getTel()+"", user.getAddress(),user.getUser_id());
		orderService.add(order);
		
		for (String s : carIdStrS) {
			int g=Integer.parseInt(s);
			Shopp shopp= shoppService.getShoppById(g);
			Order2 order2=new Order2(0, order.getOrder_id(), 
					Integer.parseInt(request.getParameter(shopp.getShopp_id()+"")),
					shopp.getShopp_price(),
					Integer.parseInt(request.getParameter(shopp.getShopp_id()+""))*shopp.getShopp_price(), 
					shopp.getShopp_image());
			orderService.add(order2);
			shoppService.delete(g);
		}
		map.put("order", order);
		return "address";
	}
	@RequestMapping("/data.htm")
	public void getDeptByPage(String order_id,int page,int rows,HttpServletRequest request,HttpServletResponse response)
			throws IOException{
		response.setContentType("json");
		PrintWriter out = response.getWriter();
		int id=0;
		if(order_id!=null&&!order_id.equals("")){
			id=Integer.parseInt(order_id);
		}
		Map<String, Object> map=orderService.getDataByPage(id, page, rows);
		
		JSONObject b=new JSONObject(map);
		
		out.print(b);
	}
	
	
}
