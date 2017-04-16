package com.jbit.games.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jbit.games.entity.Good;
import com.jbit.games.entity.User;
import com.jbit.games.service.GoodService;

@Controller
@RequestMapping("/good")
public class GoodController {
	
	@Autowired
	private GoodService goodService;

	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
	//前台主页加载的数据
	@RequestMapping("/getAll.htm")
	public String getAll(HttpServletRequest request,Map map){
		
		String name=request.getParameter("name");
		String lei=request.getParameter("goodClass");
		String pageIndexStr=request.getParameter("pageIndex");
		int pageIndex=1;
		if(pageIndexStr!=null&&!pageIndexStr.equals("")){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		List<Good> list = goodService.getGoodsByCondtion(name, lei, pageIndex);
		int totalPage=goodService.getTotalPage(name, lei);
		map.put("list", list);
		map.put("name", name);
		map.put("goodClass", lei);
		map.put("totalPage", totalPage);
		map.put("pageIndex", pageIndex);
		return "main";
	}
	//通过主键得到一个数据
	@RequestMapping("/getOne.htm")
	public String getOne(int goodId,Map map){
		Good good =goodService.getGoodById(goodId);
		map.put("good", good);
		return "detail";
	}
	//加载所有数据
	@RequestMapping("/data.htm")
	public void dataGrid(HttpServletRequest request,HttpServletResponse response ) throws IOException{
		response.setContentType("json");
		PrintWriter out = response.getWriter();
		
		Map<String, Object> map=new HashMap<String, Object>();
		String name=request.getParameter("name");
		String lei=request.getParameter("goodClass");//这次没用到
		String pageIndexStr=request.getParameter("page");
		int pageIndex=1;
		if(pageIndexStr!=null&&!pageIndexStr.equals("")){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		List<Good> list = goodService.getGoodsByCondtion(name, lei, pageIndex);
		map.put("total", goodService.getTotal(name, lei));
		map.put("rows", list);
		
		JSONObject jj=new JSONObject(map);
		out.print(jj);
	}
	//增加一个数据
	@RequestMapping("/add.htm")
	public void add(
			String goods_name,double goods_price,String goods_info,
			int goods_store,String goods_class ,@RequestParam(value="goods_image",required=false) MultipartFile file,
			HttpServletRequest request
			){

		String path=request.getSession().getServletContext().getRealPath("upload");
		String goods_image=new Date().getTime()+".jpg";
		
		File targetFile=new File(path, goods_image);
		
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Good good=new Good(0, goods_name, goods_price, goods_info, goods_store, "", 1, goods_image, 1, goods_class);
		
		goodService.add(good);
		
	}
	//删除一个数据
	@RequestMapping("/delete.htm")
	public void delete(String goods_id,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String result="删除失败！";
		try {
			String[] nos=goods_id.split(",");
			for (String string : nos) {
				goodService.delete(Integer.parseInt(string));
			}
			result="删除成功！";
		} catch (NumberFormatException e) {
		}
		out.print(result);
	}
	//更新一个数据
	@RequestMapping("/update.htm")
	public void update(int goods_id,String goods_name,double goods_price,int goods_store,
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		Good good = goodService.getGoodById(goods_id);
		try {
			good.setGoods_name(goods_name);
			good.setGoods_price(goods_price);
			good.setGoods_store(goods_store);
			goodService.update(good);
		} catch (Exception e) {
		}
		
	}				
}
