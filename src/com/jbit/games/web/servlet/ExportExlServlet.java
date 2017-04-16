package com.jbit.games.web.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;

import com.jbit.games.entity.Order;
import com.jbit.games.entity.User;
import com.jbit.games.service.OrderService;
import com.jbit.games.service.impl.OrderServiceImpl;



import jxl.Workbook;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

public class ExportExlServlet extends HttpServlet {

	private WritableWorkbook wwb = null;
	private WritableSheet sheet = null;
	private WritableSheet sheetk = null;
	private WritableSheet sheeth = null;	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User o=(User) request.getSession().getAttribute("user");
		try {
			exportCheckOrgMember(request, response);
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		exportExcel(response, wwb, o.getUsername()+"订单明细表");		
	}	
	/**
	 * 导出数据处理
	 * @param checkOrgId
	 * @param orgName
	 * @param response
	 * @throws IOException
	 * @throws RowsExceededException
	 * @throws WriteException
	 */	
	private void exportCheckOrgMember(HttpServletRequest request, HttpServletResponse response)
			throws IOException, RowsExceededException, WriteException {
		
		/**
		 * 通过这种方式获取spring容器中的bean
		 */
		OrderService orderSer=SpringApplicationContextUtils.getBean(OrderService.class);

		//**************************************************************
		User user=(User) request.getSession().getAttribute("user");
		List<Order> list=orderSer.getAllByUserId(user.getUser_id());

		response.setContentType("application/ms-excel");
		String sheetName_ = user.getUsername() + "订单明细表";//文件名==》XX人员明细表
		String sheetName = new String(sheetName_.getBytes(),"iso8859-1");
		  
		response.addHeader("Content-Disposition", "attachment; filename="
				+ sheetName + ".xls");

		OutputStream os = response.getOutputStream();
		wwb = Workbook.createWorkbook(os);
		wwb.setProtected(false);

		//EXECL中的一个sheet
		sheetk = wwb.createSheet("订单明细", 0);

		//============设置execl表的一些属性===========
		WritableFont wf = new WritableFont(WritableFont.ARIAL, 13,
				WritableFont.BOLD, false);
		WritableCellFormat wcf = new WritableCellFormat(wf);
		WritableFont wf1 = new WritableFont(WritableFont.ARIAL, 13,
				WritableFont.NO_BOLD, false);
		WritableCellFormat wcf1 = new WritableCellFormat(wf1);
		wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
		wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
		wcf1.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);
		wcf1.setVerticalAlignment(VerticalAlignment.CENTRE);
		//============设置execl表的一些属性======END=====		
		sheetk.mergeCells(0, 0, 6, 0);
		sheetk.addCell(new Label(0, 0, "订单明细表", wcf));		
		//添加单元格  new Label(列位置，行位置，单元格内容，WritableCellFormat对象)
		//此处第二个参数1，代表第二行，上面合并的单元格是第一行
		sheetk.addCell(new Label(0, 1, "序号", wcf));
		sheetk.addCell(new Label(1, 1, "订单号", wcf));
		sheetk.addCell(new Label(2, 1, "收货人", wcf));
		sheetk.addCell(new Label(3, 1, "地址", wcf));
		sheetk.addCell(new Label(4, 1, "下单时间", wcf));
		sheetk.addCell(new Label(5, 1, "总价", wcf));
		sheetk.addCell(new Label(6, 1, "联系方式", wcf));				
		//循环数据，将数据填充到单元格内
		int t = 2;
		for (Order o:list) {
			sheetk.addCell(new Label(0, t, t+"", wcf1));
			sheetk.addCell(new Label(1, t, o.getOrder_id()+"", wcf1));
			sheetk.addCell(new Label(2, t, o.getUsername(), wcf1));
			sheetk.addCell(new Label(3, t, o.getAddress(), wcf1));
			sheetk.addCell(new Label(4, t, o.getOrder_time()+"", wcf1));
			sheetk.addCell(new Label(5, t, o.getOrder_total()+"", wcf1));
			sheetk.addCell(new Label(6, t, o.getTel()+"", wcf1));			
			t++;
		}
	}	
	/*
	 * 执行导出操作
	 */
	private void exportExcel(HttpServletResponse response,
			WritableWorkbook retValue, String filename) {
		response.setContentType("application/ms-excel");
		/*response.addHeader("Content-Disposition", "attachment; filename="
				+ filename + ".xls");*/
		System.out.println("**********");
		try {
			retValue.write();
			retValue.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		}
	}		
}
