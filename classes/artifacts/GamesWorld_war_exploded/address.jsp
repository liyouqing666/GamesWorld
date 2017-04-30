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
	<title>地址</title>
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



<div style="margin-top: 130px;color:#999999;margin-left: 240px;color:#ff33cc;">
	<fieldset >
		<span style="color:red;width: 500px;font-size: 20px;">用户信息确认</span>
		<hr style="width: 850px;margin-right: 370px;"/>
		<form class="form-horizontal" action="<%=path %>/order/updateAddress.htm" method="post">
			<div class="form-group">
				<label class="col-sm-2 control-label">收货人</label>
				<div class="col-sm-10">
					<input type="text" name="username" value="${order.username }" class="form-control" style="width: 450px;">
				</div>
			</div>
			<input type="hidden" name="order_id" value="${order.order_id }"/>
			<div class="form-group">
				<label class="col-sm-2 control-label">联系方式</label>
				<div class="col-sm-10">
					<input  type="text" name="tel" value="${order.tel }" class="form-control"  style="width: 450px;">	
				</div>
			</div>
		
			<div class="form-group">
				<label class="col-sm-2 control-label">收货地址</label>
				<div class="col-sm-10">
					<input type="text" name="address" value="${order.address }" class="form-control"  style="width: 450px;">	
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
					<input type="submit" class="form-control" placeholder="请输入您的收货地址" style="width: 450px;border-color: red;">	
				</div>
			</div>
		</form>
	</fieldset>	
</div>

<div style="margin: 100px auto 0px;">
	<footer id="footer">
		<div class="container" style="margin: 30px auto 0px;text-align: center;color: red;">
			<p>点卡销售 | 合作事宜 | 版权投诉</p>
			<p>河南ICP 备12345678. © 2016-2017 游戏大世界. Powered by Bootstrap.</p>
		</div>
	</footer>
</div>


<script type="text/javascript">
	
	
</script>

</body>
</html>