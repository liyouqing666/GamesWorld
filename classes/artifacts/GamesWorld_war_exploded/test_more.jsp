<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'test_more.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		function addjpg(){
			$("#yy").before("<div>文件：<input type='file' name='fs'/><input type='button' onclick='remove(this)' value='删除'><br/></div>");
		}
		function remove(it){
			$(it).parent().remove();
		}
	</script>
  </head>  
  <body> 
     <form  action="<%=path %>/stu/add_more.htm" 
   				method="post" enctype="multipart/form-data">
    		<div>文件：<input type="file" name="fs"/><input type="button" onclick="remove(this)" value="删除"><br/></div>
    		<input type="button" id="yy" onclick="addjpg()" value="添加一张图片"/><br>
			<input type="submit" value="上传图片" /> 	
    </form>
  </body>
</html>
