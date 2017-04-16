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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  	<a href="<%=path %>/stu/toadd.htm">添加</a><br/>
    <table cellpadding="0" cellspacing="0" border="1px">
    	<c:forEach var="a" items="${list }">
    		<tr>
    			<td>${a.name }</td>
    			<td style="width: 50px">${a.age }</td>
    			<td style="width: 50px">${a.gender }</td>
    		<tr>
    	</c:forEach>
    </table>
    
    
    
  </body>
</html>








