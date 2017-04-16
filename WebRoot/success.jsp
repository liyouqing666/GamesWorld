<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>用户信息确认</title>
	<link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path %>/css/style.css">
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
</head>
<body  style="background:#223240">


<nav class="navbar navbar-default navbar-fixed-top" style="background:#223240">
	<div class="container" style="margin: 1px auto;">
		<div class="navbar-header">
			<a href="#" class="navbar-brand logo"><img src="<%=path %>/img/logo.png" alt="游戏大世界"></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse">
			
			<ul class="nav navbar-nav navbar-right">
				<form action="<%=path %>/good/getAll.htm" class="navbar-form navbar-right">
					<div class="input-group">
						<input type="text" name="name" class="form-control" value="${name }">
						<input type="hidden" name="pageIndex" class="form-control" value="1">
						<input type="hidden" name="goodClass" class="form-control" value="${goodClass }">
						<div class="input-group-btn">
							<button class="btn btn-default">搜索</button>
						</div>
					</div>
				</form>
				<li ><a href="<%=path %>/good/getAll.htm"><span class="glyphicon glyphicon-home"></span>首页</a></li>				
				<li><a href="<%=path %>/shopp/getAll.htm"><span class="glyphicon "></span>购物车</a></li>
				<li class="active"><a href="<%=path %>/order/getAll.htm"><span class="glyphicon "></span>订单</a></li>
				<li><a href="<%=path%>/user/zhuxiao.htm"><span class="glyphicon "></span>注销</a></li>

			</ul>	
		</div>
	</div>
</nav>


<div id="cc"  class="progress" style="margin-top: 250px;height: 40px;width: 700px;margin-left: 330px;font-size: 20px;">
	
	<div id="bb" class="progress-bar progress-bar-danger progress-bar-striped active" 
	style="width: 0%;color: #ffffff;font-size: 25px;line-height: 10px;">购买结算中！！！</div>
	
</div>

<div id="dd" style="width: 500px;height: 70px;border: 1px red solid;margin-left: 430px;margin-top: 100px;
	text-align: center;display: none;
"><br/>
	<p style="line-height: 20px;color:#ffff00;font-size:27px;">恭喜您，购物成功，欢迎您下次光临！</p>
</div>




<script type="text/javascript">
		
		setInterval("a1()", 400);
		function a1(){
			$("#bb").attr("style","width:20%;")
		}
		setInterval("a2()", 800);
		function a2(){
			$("#bb").attr("style","width:40%;")
		}	
		setInterval("a3()", 1200);
		function a3(){
			$("#bb").attr("style","width:60%;")
		}
		setInterval("a4()", 1600);
		function a4(){
			$("#bb").attr("style","width:80%;")
		}
		setInterval("a5()", 2000);
		function a5(){
			$("#bb").attr("style","width:100%;")
		}
		
		setInterval("aa()", 2500);
		function aa(){
			
				$("#cc").attr("style","background-color: #223240;")
				$("#dd").attr("style","width: 500px;height: 70px;border: 1px red solid;margin-left: 420px;margin-top: 250px;text-align: center;position: absolute;");
				
		}
		setInterval("cc()", 3500);
		function cc(){
			window.location.href="<%=path%>/good/getAll.htm";
		}
</script>

</body>
</html>