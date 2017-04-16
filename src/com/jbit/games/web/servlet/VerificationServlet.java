package com.jbit.games.web.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

/**
 * 锟斤拷证锟斤拷锟斤拷锟絪ervlet
 * @author Carry
 *
 */
public class VerificationServlet extends HttpServlet {
	
	 public static final char[] CHARS={'2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z'};
	 //锟斤拷锟斤拷锟斤拷锟斤拷址锟斤拷值洹ｏ拷锟斤拷胁锟斤拷锟�,o,1,I锟斤拷锟斤拷锟皆憋拷锟较碉拷锟街凤拷
	 
	 public static Random random=new Random(); //锟斤拷锟斤拷锟斤拷锟斤拷
	 
	 public static String getRandomString(){
	  
	  StringBuffer buffer=new StringBuffer();  //锟街凤拷锟斤拷
	  for(int i=0;i<4;i++)  //锟斤拷锟窖拷锟斤拷锟饺★拷址锟�
	  {
	   buffer.append(CHARS[random.nextInt(CHARS.length)]);  //每锟斤拷锟斤拷锟饺∫伙拷锟斤拷址锟�
	  }
	  return buffer.toString();
	 }
	 
	 public static Color getRandomColor(){
	  
	  return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
	 }
	 
	 
	 public static Color getReverseColor(Color c){
	  
	  return new Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue());
	 }

	public void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException {
		doPost(request,response);
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,IOException {
		/*System.out.println("****");*/
		
		 response.setContentType("image/jpeg");  //锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�   锟斤拷锟斤拷省锟斤拷
		  
		  String randomString=getRandomString();  //锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟街凤拷锟斤拷锟斤拷取锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷址锟�
		  
		  //锟斤拷锟街凤拷娲拷锟絊ession锟斤拷
		  request.getSession(true).setAttribute("randomString", randomString); 
		  
		  int width=100;  //图片锟斤拷锟�
		  int height=30;  //图片锟竭讹拷
		  
		  Color color=getRandomColor(); //锟斤拷取锟斤拷锟斤拷锟缴�  锟斤拷锟节憋拷锟斤拷色
		  Color reverse=getReverseColor(color);  //锟斤拷色   锟斤拷锟斤拷前锟斤拷色
		  
		  BufferedImage bi=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);       //锟斤拷锟斤拷一锟斤拷锟斤拷色图片
		  Graphics2D g=bi.createGraphics();  //锟斤拷取锟斤拷图锟斤拷锟斤拷
		  g.setFont(new Font(Font.SANS_SERIF,Font.BOLD,16));  //锟斤拷锟斤拷锟斤拷锟斤拷
		  g.setColor(color);   //锟斤拷锟斤拷锟斤拷色
		  g.fillRect(0, 0, width, height); //锟斤拷锟狡憋拷锟斤拷
		  g.setColor(reverse);  //锟斤拷锟斤拷锟斤拷色
		  g.drawString(randomString, 18, 20);  //锟斤拷锟斤拷锟斤拷锟斤拷址锟�
		  for(int i=0,n=random.nextInt(100);i<n;i++)  //锟斤拷锟斤拷锟揭伙拷俑锟斤拷锟斤拷锟斤拷锟�
		  {
		   g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1); //锟斤拷锟斤拷锟斤拷锟斤拷锟�
		  }
		  
		  ServletOutputStream out=response.getOutputStream();   //锟斤拷知锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟角伙拷取锟斤拷锟斤拷锟�
		  
		  JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(out);  //锟斤拷锟斤拷锟斤拷
		  encoder.encode(bi);    //锟斤拷图片锟斤拷锟叫憋拷锟斤拷
		  out.flush();    //锟斤拷锟斤拷锟斤拷突锟斤拷锟�
		  
		  /*System.out.println("%%%");*/
	}
}
