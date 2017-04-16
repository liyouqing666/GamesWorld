<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyUI/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/easyUI/themes/icon.css">
	
	
	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery.easyui.min.js"></script>
	
	<script type="text/javascript">
	
		function ye(title){
			if ($('#tt').tabs('exists', title)){
				$('#tt').tabs('select', title);
			}
		}
		
		$(function(){
			$("#tt").tabs({
				onSelect:function(title,num){
					if(num==0){
						$("#ying").hide();
						$("#ying").slideDown(4000);
					}
					
					if(num==1){
						$("#aa").datagrid({
							url:"<%=path%>/good/data.htm",
							pagination:true,
							fitColumns:true,
							pageNumber:1,
							pageSize:12,
							pageList:[12],
							toolbar:[{
								iconCls: 'icon-help',
								handler: function(){
									alert("不好意思，什么也帮不到你！");
								}
							},'-',{
								text: '添加',  
					            iconCls: 'icon-add',  
					            handler: function() {
					            	$("#add").show();
					            	$("#add").dialog({
					            		title:"添加",
					            		height:250,
					            		width:300
					            	});
					            	$("#subs").click(function(){
					            		$("#add").dialog("close");
					            		$("#tijiao").get(0).submit();
					            		alert("SUCESS");
					            		$("#aa").datagrid("reload");
				            			$("#subs").unbind("click");
					            	});
					            }
							},'-',{
								text: '删除',  
					            iconCls: 'icon-remove',  
					            handler: function(){
					            	var selectedRows = $("#aa").datagrid("getSelections");
					            	if(selectedRows!=""){
					            		if(confirm("是否确定删除？")){
					            			var no="";
						                 	for(var i=0;i<selectedRows.length;i++){
						                 		if(i==0){
						                 			no=no+selectedRows[i].goods_id;
						                 		}else{
						                 			no=no+","+selectedRows[i].goods_id;
						                 		}
						                 	}
						                 	
						                 	$.post("good/delete.htm",{"goods_id":no},function(data){
						                		alert(data);
						                		//刷新数据
						                		$("#aa").datagrid("reload");
						                	});
						                 	
					            		}
					            	}else{
					            		alert("请您先选择要删除的数据！");
					            	}
					            }
							},'-',{
								text: '修改',  
					            iconCls: 'icon-edit',  
					            handler: function() {
					            	var selectedRow = $("#aa").datagrid("getSelected");
					            	if(selectedRow!=null){
					            		$("#ids").val(selectedRow.goods_id);
						            	$("#names").val(selectedRow.goods_name);
						            	$("#prices").val(selectedRow.goods_price);
						            	$("#stores").val(selectedRow.goods_store);
					            		$("#update").show();
						            	$("#update").dialog({
						            		title:"修改",
						            		height:250,
						            		width:300
						            	});
						            	$("#xiu").click(function(){
						            		$("#update").dialog("close");
						            		$("#xiugai").get(0).submit();
						            		alert("SUCESS");
						            		$("#aa").datagrid("reload");
					            			$("#xiu").unbind("click");
						            	});
					            	}else{
					            		alert("请您先选择数据！");
					            	}
					            	
					            }
							},'-',{
								title:"查询",
								iconCls: 'icon-search',
								handler: function(){
									$("#cha").show();
									$("#cha").dialog({
					                	title:"查询",
					                	height:150,
					                	width:300
					             	 });
									$("#chaxun").click(function(){
										$("#cha").dialog("close"); 
										var name = $('#shuju').val();
										$("#aa").datagrid("load",{name:name});
									});
								}
							}],
							
							columns:[[    
						      {field:'ck',checkbox:true},    
					          {field:'goods_id',title:'商品编号',width:60,align:'center'},    
					          {field:'goods_name',title:'商品名称',width:60,align:'center'},    
					          {field:'goods_price',title:'商品价格',width:60,align:'center'} ,   
					          {field:'goods_store',title:'商品库存',width:60,align:'center'}    
							]] ,
									
							loadMsg:"正在努力加载数据.....",
							rownumbers:true
						});
					}
					if(title=='订单管理'){
						$("#bb").datagrid({
							url:"order/data.htm",
							pagination:true,
							fitColumns:true,
							pageNumber:1,
							pageSize:5,
							pageList:[12],
							toolbar:[{
								iconCls: 'icon-help',
								handler: function(){
									alert("不好意思，什么也帮不到你！");
								}
							},'-',{
								text: '修改',  
					            iconCls: 'icon-edit',  
					            handler: function() {
					            	var selectedRow = $("#bb").datagrid("getSelected");
					            	if(selectedRow!=null){
					            		$("#ids1").val(selectedRow.order_id);
						            	$("#states1").val(selectedRow.order_state);
						            	$("#update1").show();
					            		$("#update1").dialog({
						            		title:"修改",
						            		height:130,
						            		width:300
						            	});
						            	$("#xiu1").click(function(){
						            		$("#update1").dialog("close");
						            		$("#xiugai1").get(0).submit();
						            		alert("SUCESS");
						            		$("#bb").datagrid("reload");
					            			$("#xiu1").unbind("click");
						            	});
					            	}else{
					            		alert("请您先选择数据！");
					            	}
					            }
							},'-',{
								title:"查询",
								iconCls: 'icon-search',
								handler: function(){
									$("#cha1").show();
									$("#cha1").dialog({
					                	title:"查询",
					                	height:120,
					                	width:300
					             	 });
									$("#chaxun1").click(function(){
										$("#cha1").dialog("close"); 
										var order_id = $("#shuju1").val();
										$("#bb").datagrid("load",{order_id:order_id});
									});
								}
								
							}],
							
							columns:[[    
						      {field:'ck',checkbox:true},    
					          {field:'order_id',title:'订单编号',width:60,align:'center'},    
					          {field:'order_state',title:'订单状态',width:60,align:'center'},    
					          //{field:'order_time',title:'订单时间',width:60,align:'center'} ,   
					          {field:'username',title:'下单人',width:60,align:'center'},    
					          {field:'tel',title:'电话',width:60,align:'center'},    
					          {field:'address',title:'地址',width:60,align:'center'}    
							]] ,
									
							loadMsg:"正在努力加载数据.....",
							rownumbers:true
						});
					}
					if(title=='用户管理'){
						$("#cc").datagrid({
						url:"user/getAll.htm",
						pagination:true,
						fitColumns:true,
						pageNumber:1,
						pageSize:5,
						pageList:[10],
						
						toolbar:[{
							iconCls: 'icon-help',
							handler: function(){
								alert("不好意思，什么也帮不到你！");
							}
						},'-',{
							text: '修改',  
				            iconCls: 'icon-edit', 
							handler: function(){
								alert("不好意思，什么也帮不到你！");
							}
						},'-',{
							text: '删除',  
				            iconCls: 'icon-remove',
				            handler: function(){
								alert("不好意思，什么也帮不到你！");
							}
						},'-',{
							title:"查询",
							iconCls: 'icon-search',
							handler: function(){
								alert("不好意思，什么也帮不到你！");
							}
						}],
						columns:[[    
					      {field:'ck',checkbox:true},    
				          {field:'user_id',title:'用户编号',width:100},    
				          {field:'username',title:'用户名',width:100},    
				          {field:'tel',title:'电话`',width:100},    
				           
						]] ,
								
						loadMsg:"正在努力加载数据.....",
						rownumbers:true
					  });
					}

				}
			});
		
		});
		 function mytime(){
			 var today=new Date();
			 var year=today.getFullYear();
			 var month=today.getMonth()+1;
			 var wee=today.getDay();
			 var week;
			 switch(wee){
			 		case 0:week="星期日";break;case 1:week="星期一";break;case 2:week="星期二";break;case 3:week="星期三";break;case 4:week="星期四";break;case 5:week="星期五";break;case 6:week="星期六";break;
			 }
			 var ri=today.getDate();
			 var hh=today.getHours();
			 var xia;
			 if(parseInt(hh)>12){
				 xia="PM";
			 }else{
				 xia="AM";
			 }
			 var mm=today.getMinutes();
			 var ss=today.getSeconds();
			document.getElementById("mytime").innerHTML="<span>&nbsp;&nbsp;&nbsp;"+year+"-"+month+"-"+ri+" "+hh+":"+mm+":"+ss+"</span>";	
		}
		setInterval("mytime()",1000);
	</script>
  </head>
  
  <body style="background-color: #223240">
  	 <!-- layout布局 -->
  	 <div class="easyui-layout" style="height: 500px;width: 900px;margin-left: 220px;margin-top: 50px;">	
	    <div data-options="region:'west',title:'菜单选择',split:true" style="width:230px;padding-top: 40px;padding-left: 20px;">
	    	<ul style="font-size: 18px;">
	    		<li><a href="javascript:ye('欢迎页')">欢迎页</a></li>
	    		<br/>
	    		<li><a href="javascript:ye('商品管理')">商品管理</a></li>
	    		<br/>
	    		<li><a href="javascript:ye('订单管理')">订单管理</a></li>
	    		<br/>
	    		<li><a href="javascript:ye('用户管理')">用户管理</a></li>
	    		<br/>
	    		<li><a href="<%=path%>/user/zhuxiao.htm">退出系统</a></li>
	    	</ul>
	    </div>   
	    <div data-options="region:'center',title:'操作页面'" style="padding:5px;background:#eee;">
	    
	    <!-- easyui选项卡 -->
	    <div id="tt" class="easyui-tabs" style="width:650px;height:450px;">   
	    	<!-- 欢迎页 -->
	    	<div  title="欢迎页">
		    	<div id="ying" style="margin-top: 130px;margin-left: 150px;display: none;" >
		    		<span style="font-size: 30px;color:red;">欢迎您来到后台管理页面!</span><br/><br/>
		    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="mytime" style="font-size: 25px;color:blue;"></span>
		    	</div>
		    </div>
	    	<!-- 商品管理 -->
	    	<div id="aaa" title="商品管理">
		    	<table  id="aa" style="display: none;">
		    	</table>
		    </div>	
	    	<!-- 订单管理 -->
	    	<div id="aaa" title="订单管理">
		    	<table id="bb" style="display: none;">
		    	</table>
	    	</div>
	    	<!-- 用户管理 -->
	    	<div id="aaa" title="用户管理">
		    	<table id="cc" style="display: none;">
		    	</table>
	    	</div>
	   </div> 
	   <!-- 添加商品操作-->
	   <div id="add" style="display: none;padding-left: 20px;padding-top: 20px;">
			<form id="tijiao" target="rame" action="<%=path %>/good/add.htm" method="post" enctype="multipart/form-data">
				商品名称：<input name="goods_name"/><br/>
				商品价格：<input name="goods_price"/><br/>
				商品详情：<input name="goods_info"/><br/>
				商品库存：<input name="goods_store"/><br/>
				商品类别：<input name="goods_class"/><br/>
				上传图片：<input type="file" name="goods_image"/><br/>
				<input type="button" id="subs" value="添加"/>
			</form>
	   </div>
	  
	   <!-- 修改商品操作 -->
	   <div id="update" style="display: none;padding-left: 20px;padding-top: 20px;">
			<form id="xiugai" target="rame" action="<%=path %>/good/update.htm" method="post">
				<input type="hidden" id="ids" name="goods_id"/>
				商品名称：<input id="names" name="goods_name"/><br/>
				商品价格：<input id="prices" name="goods_price"/><br/>
				商品库存：<input id="stores" name="goods_store"/><br/>
				<input type="button" id="xiu" value="修改"/>
			</form>
	   </div>
	   <!-- 商品模糊查询  -->
	   <div id="cha" style="display: none;padding-left: 20px;padding-top: 25px;">
	   		请输入名字：<input id="shuju" name="name"/><input type="button" value="查询" id="chaxun">
	   </div>
	   
	   <!-- 订单修改操作 -->
	   <div id="update1" style="display: none;padding-left: 20px;padding-top: 20px;">
			<form id="xiugai1" target="rame" action="<%=path %>/order/update.htm" method="post">
				<input type="hidden" id="ids1" name="order_id"/>
				订单状态：<input id="states1" name="order_state"/><br/>
				<input type="button" id="xiu1" value="修改"/>
			</form>
	   </div>
	   
	   <!-- 订单模糊查询  -->
	   <div id="cha1" style="display: none;padding-left: 20px;padding-top: 25px;">
	   		请输入订单编号：<input id="shuju1" name="name"/><input type="button" value="查询" id="chaxun1">
	   </div>
	   
	   <!-- 隐藏的iframe实现无刷新文件上传 -->
	   <iframe name="rame" style="display: none;"></iframe>	
	   
	 </div> 
   </div>    
</body>
</html>




