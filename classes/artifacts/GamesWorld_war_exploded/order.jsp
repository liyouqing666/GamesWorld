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
	<title>订单页</title>
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

<div style="margin-top: 100px;margin-left: 130px;color:#73f279;">
	<form action="<%=path %>/order/getAll.htm" method="post">
		<input type="hidden" name="pageIndex" value="${pageIndex }"/>
		订单号：<input name="order_id" value="${order_id }" style="color:#000000"/>
		购买者：<input name="username" value="${username }" style="color:#000000"/>
		<input type="submit" value="搜索" style="color:#000000"/>
		<a href="<%=path%>/ExportExlServlet">
			<input type="button" value="导出全部订单" style="float: right;margin-right: 130px;color:#000000"/>
		</a>
	</form>
	
</div>


<div style="color:red;margin-top: 20px;margin-bottom: 20px;margin-left: 130px;margin-right: 130px;" >
	<ul class="media-list" style="color:red;">
		<c:forEach var="order" items="${list }">
			<li class="meida">
				<div class="media-left" style="width: 300px;height: 150px;text-align:center;border: #999999 1px solid;padding: auto;color:blue;">
					<div style="margin-top: 50px;">
						订单<br/>
						${order.order_id }
					</div>
				</div>
				<div class="media-body" style="border: #999999 1px solid;">
					<p style="color:#cc33cc;font-size: 15px;">
						订单状态：<input type="text" value="${order.order_state }" style="width: 40px;height: 20px;color:#000000" disabled="disabled"/>&nbsp;
						<a href="<%=path%>/order/update.htm?order_id=${order.order_id }&order_state=5">
							<input type="button" value="确认收货" style="height: 25px;color:#000000"/>
						</a> &nbsp;
						<a href="javascript:if(confirm('是否确定删除？')){window.location.href='<%=path%>/order/delete.htm?order_id=${order.order_id }'}"> 
							<input type="button" value="删除订单" style="height: 25px;color:#000000"/>
						</a>
						订单时间：<span style="color:#fafafa"><fmt:formatDate value="${order.order_time }" pattern="yyyy-MM-dd HH:mm:ss"/></span>&nbsp;
						收货人：<span style="color:#fafafa">${order.username }</span>&nbsp;
						电话：<span style="color:#fafafa">${order.tel }</span>&nbsp;
						地址：<span style="color:#fafafa">${order.address }</span>&nbsp;
						总价：<span style="color:#fafafa">${order.order_total }</span>&nbsp;
						
					  </p>
					<c:forEach var="order2" items="${order2List }">
						<c:if test="${order2.order_id eq order.order_id }">
							<div class="meida" style="margin-left: 20px;">
								<div class="media-left">
									<img src="<%=path %>/upload/${order2.image}" alt="" class="media-object" width="100px" height="100px">
								</div>
								<div class="media-body" style="padding-top: 35px;">
									<p>  
										商品价格：<span style="color:#fafafa">${order2.price }</span>&nbsp;&nbsp;&nbsp;&nbsp;
										商品数量：<span style="color:#fafafa">${order2.num }</span>&nbsp;&nbsp;&nbsp;&nbsp;
										商品小计：<span style="color:#fafafa">${order2.total }</span>
									</p>
								</div>
							</div>
						</c:if>	
					</c:forEach>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>



<div style="text-align:center;">
	<ul class="pagination pagination-lg">
		<c:if test="${pageIndex>1 }">
		<li><a href="<%=path%>/order/getAll.htm?pageIndex=${pageIndex-1}&order_id=${order_id }&username=${username }">&laquo;</a></li>
		</c:if>
		<li class="active"><a href="<%=path%>/order/getAll.htm?pageIndex=${pageIndex}&order_id=${order_id }&username=${username }">${pageIndex}</a></li>
		<c:if test="${pageIndex<totalPage }">
		<li><a href="<%=path%>/order/getAll.htm?pageIndex=${pageIndex+1}&order_id=${order_id }&username=${username }">&raquo;</a></li>
		</c:if>
	</ul>
</div>

<div style="margin: 30px auto 0px;">
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