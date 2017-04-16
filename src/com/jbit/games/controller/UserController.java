package com.jbit.games.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jbit.games.entity.User;
import com.jbit.games.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@RequestMapping("/user/login.htm")
	public String login(HttpServletRequest request,String username,String password,
			String yanzhengma,Map map){
		Map<String, Object> map1 = userService.getUserByUsername(username, password);
		
		String yanzheng1=(String) request.getSession().getAttribute("randomString");
		boolean is=(Boolean) map1.get("isLogin");
		String errMessage=(String) map1.get("errMessage");
		
		if(yanzhengma.equalsIgnoreCase(yanzheng1)&&is){
			User user=(User) map1.get("user");
			request.getSession().setAttribute("user", user);
			if(user.getRole()==1){
				return "redirect:/manage.jsp";
			}else{
				return "redirect:/good/getAll.htm";
			}
		}else{
			return "redirect:/login.jsp";
		}
	}
	@RequestMapping("/user/register.htm")
	public String register(HttpServletRequest request,
			String yanzhengma,String username,String password,String repassword,
			String nickname,String email,String address,int tel,
			Map map){
		
		String yanzheng1=(String) request.getSession().getAttribute("randomString");
		
		if(yanzhengma.equalsIgnoreCase(yanzheng1)){
			User user1=new User(0, username, repassword, nickname, email, 12, address, tel, 0);
			userService.add(user1);
			request.getSession().setAttribute("user", user1);
			return "redirect:/good/getAll.htm";
		}else{
			return "redirect:/register.jsp";
		}
	}

	//传统模式的ajax
	@RequestMapping(value="/user/ajaxll.htm")
	public void ajaxLL(HttpServletRequest request,HttpServletResponse responese)throws Exception{
		responese.setContentType("text/html");
		PrintWriter out = responese.getWriter();
		
		User user = userService.hasUser(request.getParameter("username"));
		if(user!=null){
			out.print("a");
		}else{
			out.print("b");
		}
	}
	
	
	@RequestMapping("/user/zhuxiao.htm")
	public String zhuxiao(HttpServletRequest request){
		request.getSession().removeAttribute("user");
		return "redirect:/login.jsp";
	}
	
	
	/**
	 * json测试
	 * 
	 */
	@RequestMapping("/a.htm")	
	public void gaga(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String a=request.getParameter("aa");
		
		String a1=(String) request.getSession().getAttribute("randomString");
		
		if(a.equalsIgnoreCase(a1)){
			out.print("bb");
			
		}else{
			out.print("a");
		}
		
	}
	@RequestMapping("/user/getAll.htm")
	public void getAll(HttpServletRequest request ,HttpServletResponse response,String page ,String rows){
		response.setContentType("json");
		try {
			PrintWriter out = response.getWriter();
			Map<String, Object> map = userService.getAll(page, rows);
			JSONObject jsonObject=new JSONObject(map);
			out.print(jsonObject);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	
}
