<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<title>游戏点卡销售主页</title>
	<link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path %>/css/style.css">
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
</head>
<body style="background:#223240" >
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
				<li class="active"><a href="<%=path %>/good/getAll.htm"><span class="glyphicon glyphicon-home"></span>首页</a></li>				
				<li><a href="<%=path %>/shopp/getAll.htm"><span class="glyphicon "></span>购物车</a></li>
				<li><a href="<%=path %>/order/getAll.htm"><span class="glyphicon "></span>订单</a></li>
				<li><a href="<%=path%>/user/zhuxiao.htm"><span class="glyphicon "></span>注销</a></li>
			</ul>	
		</div>
	</div>
</nav>

<div id="myCarousel" class="carousel slide" >
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>
	<div class="carousel-inner">
		<div class="item active" style="background:#223240">
			<img src="<%=path %>/img/a1.jpg" alt="第一张" width="960px" height="350px">
			<div class="carousel-caption">
				<h3>英雄联盟</h3>
				<p>大家都在lol</p>
			</div>
		</div>
		<div class="item" style="background:#223240">
			<img src="<%=path %>/img/a2.jpg" alt="第二张" width="960px" height="350px">
			<div class="carousel-caption">
				<h3>英魂之刃</h3>
				<p>我最爱的游戏</p>
			</div>
		</div>
		<div class="item" style="background:#223240">
			<img src="<%=path %>/img/a4.jpg" alt="第三张" width="960px" height="350px">
			<div class="carousel-caption">
				<h3>地下城与勇士</h3>
				<p>我不知道现在还有没有人玩</p>
			</div>
		</div>
		<div class="item" style="background:#223240">
			<img src="<%=path %>/img/a3.jpg" alt="第三张" width="960px" height="350px">
			<div class="carousel-caption">
				<h3>跑跑卡丁车</h3>
				<p>偶尔玩玩还挺好</p>
			</div>
		</div>
	</div>
	<a href="#myCarousel" data-slide="prev" class="carousel-control left">&lsaquo;</a>
	<a href="#myCarousel" data-slide="next" class="carousel-control right">&rsaquo;</a>
</div>


<div style="margin: 5px 5px;">
	<ul id="nav" class="nav nav-tabs">
			<li><a href="<%=path%>/good/getAll.htm?pageIndex=1&name=${name}">全部商品</a></li>
			<li><a href="<%=path%>/good/getAll.htm?goodClass=1&pageIndex=1&name=${name}">动作类游戏</a></li>
			<li><a href="<%=path%>/good/getAll.htm?goodClass=2&pageIndex=1&name=${name}">角色类游戏</a></li>
			<li><a href="<%=path%>/good/getAll.htm?goodClass=3&pageIndex=1&name=${name}">手机游戏</a></li>						
	</ul>
</div>


<div class="container" style="margin: 12px auto;background:#223240;">
	<div class="row">
	
		<c:forEach var="a" items="${list }">
			<div class="col-md-3 col-sm-4 col-xs-6">
				<div class="thumbnail" style="background-color:#666699;width: 280px;height: 380px;">
					<a href="<%=path%>/good/getOne.htm?goodId=${a.goods_id}">	
						<img  src="<%=path %>/upload/${a.goods_image }" width="300px" height="300px">
					</a>	
					<div class="caption">
						<h3>${a.goods_name }</h3>
						<p>${a.goods_info }</p>
						<p>
							<a style="color:red;" href="<%=path%>/order/add.htm?goods_id=${a.goods_id}" >点击购买</a> &nbsp;
							<a style="color:red;" href="<%=path%>/shopp/add.htm?pageIndex=${pageIndex}&name=${name}&goodClass=${goodClass}&goods_id=${a.goods_id}" >加入购物车</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>
</div>

<div style="text-align:center;">
	<ul class="pagination pagination-lg">
	
		<c:if test="${pageIndex>1}">
		<li><a href="<%=path%>/good/getAll.htm?pageIndex=${pageIndex-1}&name=${name}&goodClass=${goodClass}">&laquo;</a></li>
		</c:if>
		
		<li class="active"><a href="<%=path%>/good/getAll.htm?pageIndex=${pageIndex }&name=${name}&goodClass=${goodClass}">${pageIndex }</a></li>
		
		<c:if test="${pageIndex<totalPage}">
		<li><a href="<%=path%>/good/getAll.htm?pageIndex=${pageIndex+1}&name=${name}&goodClass=${goodClass}">&raquo;</a></li>
		</c:if>
		
	</ul>
</div>

<footer id="footer">
	<div class="container" style="margin: 10px auto;text-align: center;color: red;">
		<p>点卡销售 | 合作事宜 | 版权投诉</p>
		<p>河南ICP 备12345678. © 2016-2017 游戏大世界. Powered by Bootstrap.</p>
	</div>
</footer>

<script type="text/javascript">
	
	$(function () {

	//轮播自动播放
	$('#myCarousel').carousel({
		//自动4秒播放
		interval : 2000,
	});

	//设置垂直居中
	$('.carousel-control').css('line-height', $('.carousel-inner img').height() + 'px');
	$(window).resize(function () {
		var $height = $('.carousel-inner img').eq(0).height() || 
					  $('.carousel-inner img').eq(1).height() || 
					  $('.carousel-inner img').eq(2).height();
		$('.carousel-control').css('line-height', $height + 'px');
	});

});
	/* $('#nav a').on('click', function (e) {
		//阻止默认行为
		e.preventDefault();
		$(this).tab('show');
	}); */

	/* $('#nav a').on('show.bs.tab', function () {
		alert('调用前触发！');
	}); */
</script>

</body>
</html>