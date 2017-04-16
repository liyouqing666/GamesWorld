package com.jbit.games.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jbit.games.dao.StuDao;
import com.jbit.games.entity.Student;
import com.jbit.games.service.StuService;

@Controller
@RequestMapping("/stu")
public class StuController {
	@Autowired
	private StuService stuService;
	public void setStuService(StuService stuService) {
		this.stuService = stuService;
	}
	@RequestMapping("/getAll.htm")
	public String getAll(Model model){
		model.addAttribute("list",stuService.getAll());
		return "index";
	}
	@RequestMapping("/toadd.htm")
	public String toadd(Model model){
		model.addAttribute("student",new Student());
		return "test";
	}
	/**
	 * 文件上传
	 * 
	 */
	@RequestMapping("/add.htm")
	public String add(@RequestParam(value="fs",required=false) MultipartFile file,
			HttpServletRequest request, Student student){
		String path=request.getSession().getServletContext().getRealPath("upload");
		String fileName=new Date().getTime()+".jpg";
		File targetFile=new File(path, fileName);
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		student.setName(fileName);
		stuService.add(student);
		return "redirect:/stu/getAll.htm";
	}
	/**
	 * 多文件上传 已经测试完成！
	 * 
	 */
	@RequestMapping("/add_more.htm")
	public String add_more(@RequestParam(value="fs",required=false) MultipartFile[] files,
			HttpServletRequest request, Student student){
		String path=request.getSession().getServletContext().getRealPath("upload");				
		try {
			if(files!=null){
				for(int i=0;i<files.length;i++){
					if(files[i]!=null){
						String fileName=new Date().getTime()+"&"+Math.random()*10000+".jpg";
						File targetFile=new File(path, fileName);
						files[i].transferTo(targetFile);
						System.out.println(files[i]+"****"+fileName);
					}
				}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "index";
	}		
}
