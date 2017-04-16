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
	<title>购物车</title>
	<link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path %>/css/style.css">
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	function jian(i){
		var a=$(i).parent().find("input").val();
		if(a>1){
			$(i).parent().find("input").val(a-1);
		}else{
			if(confirm("是否要删除?")){
				window.location.href="<%=path %>/shopp/deletes.htm?carId="+$(i).parent().find("input").attr("name");
			};
		}
		 var totalPrice=0;
	     $('#ttables').find("input[name=\'more\']").each(function(){
	     	if($(this).get(0).checked==true){
	     	
	          var p= parseFloat($(this).parent().parent().find("span[name='p']").html());                          
	          var n = $(this).parent().parent().find("#num").val();
	          totalPrice=totalPrice+p*n;         
	     	}
	     });
    	$('#zongjia').html(totalPrice);
     	$('#zong').val(totalPrice);	
	}
	function jia(it){
		var a=$(it).parent().find("input").val();
		$(it).parent().find("input").val(a-1+2);
		 var totalPrice=0;
	     $('#ttables').find("input[name=\'more\']").each(function(){
	     	if($(this).get(0).checked==true){
	     	
	          var p= parseFloat($(this).parent().parent().find("span[name='p']").html());                          
	          var n = $(this).parent().parent().find("#num").val();
	          totalPrice=totalPrice+p*n;         
	     	}
	     });
    	$('#zongjia').html(totalPrice);
     	$('#zong').val(totalPrice);	
	}
	function quanxuan(){
		var a=$("#quan").get(0);
		if(a.checked==true){
			$("#ttables").find("input[name=\'more\']").each(function(){
				$(this).get(0).checked=true;
			});
		}else{
			$("#ttables").find("input[name=\'more\']").each(function(){
				$(this).get(0).checked=false;
			});
		}
		 var totalPrice=0;
	     $('#ttables').find("input[name=\'more\']").each(function(){
	     	if($(this).get(0).checked==true){
	     	
	          var p= parseFloat($(this).parent().parent().find("span[name='p']").html());                          
	          var n = $(this).parent().parent().find("#num").val();
	          totalPrice=totalPrice+p*n;         
	     	}
	     });
    	$('#zongjia').html(totalPrice);
     	$('#zong').val(totalPrice);	
	}
	
	function danxuan(){
		var totalPrice=0;
	     $('#ttables').find("input[name=\'more\']").each(function(){
	     	if($(this).get(0).checked==true){
	     	
	          var p= parseFloat($(this).parent().parent().find("span[name='p']").html());                          
	          var n = $(this).parent().parent().find("#num").val();
	          totalPrice=totalPrice+p*n;         
	     	}
	     });
    	$('#zongjia').html(totalPrice);
     	$('#zong').val(totalPrice);	
	}
	
	function xie(it){
		var a=$(it).val();
		if(a>=1||a==''){
	    }else{
        $(it).val(1)
        	alert("不好意思，不能输入非法数字！");
        }
		 var totalPrice=0;
	     $('#ttables').find("input[name=\'more\']").each(function(){
	     	if($(this).get(0).checked==true){
	          var p= parseFloat($(this).parent().parent().find("span[name='p']").html());                          
	          var n = $(this).parent().parent().find("#num").val();
	          totalPrice=totalPrice+p*n;         
	     	}
	     });
    	$('#zongjia').html(totalPrice);
     	$('#zong').val(totalPrice);	
	}
	function aa(){
		var a=$('#zong').val();
		if(a<=0){
			alert("不好意思，请您选择商品再购买！");
			return false;
		}
	}
</script>
</head>
<body  style="background:#223240" onload="quanxuan()">


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
				<li class="active"><a href="<%=path %>/shopp/getAll.htm"><span class="glyphicon "></span>购物车</a></li>
				<li><a href="<%=path %>/order/getAll.htm"><span class="glyphicon "></span>订单</a></li>
				<li><a href="<%=path%>/user/zhuxiao.htm"><span class="glyphicon "></span>注销</a></li>

			</ul>	
		</div>
	</div>
</nav>

<div class="panel panel-danger" style="margin:140px 80px 0px">
	<div class="panel-heading">
		<h3 class="panel-title">购物车</h3>
	</div>
	
	<form action="<%=path %>/order/addmore.htm" method="post" onsubmit="return aa()"> 
		<table class="table table-striped" style="background:#ff9999;aligin:center;" align="center" >
		
			<thead>
				<tr>
					<th>&nbsp;&nbsp;&nbsp;全选/全不选</th>
					<th>商品</th>
					<th>价格</th>
					<th>数量</th>
					<th>总价</th>
					<th>操作</th>
				</tr>
			</thead>
			
			<tbody id="ttables">
				<c:forEach var="car" items="${list }" >
					<tr>
						<td>
							<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" name="more" onclick="danxuan()"  value="${car.shopp_id }"/>
						</td>
						<td>
							<img src="<%=path %>/upload/${car.shopp_image }" style="width: 120px;height: 70px;"/>
						</td>
						
						<td>
							<br/>
							<span id="price" name="p">${car.shopp_price }</span>
						</td>
						<td><br/>
						
							<span onclick="jian(this)">
								<img src="<%=path %>/img/b1.png" />
							</span>
							
							<input id="num" type="text" onkeyup="xie(this)"  name="${car.shopp_id}" value="${car.shopp_num }" style="width:25px" />
							
							<span onclick="jia(this)">
								<img src="<%=path %>/img/b2.png"/>
							</span>	
							
						</td>
						<td><br/>
							<span id="xiaoji">${car.shopp_price*car.shopp_num }</span>
						</td>
						<td> <br/>
							<a href="javascript:if(confirm('是否确定删除？')){
								window.location.href='<%=path %>/shopp/deletes.htm?carId=${car.shopp_id}'
							}"><input type="button" value="删除"/> </a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			
			<thead>
				<tr style="aligin:center;color:blue">
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="quan" type="checkbox"  onclick="quanxuan()"/>
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td>
						总计：<span id="zongjia">3.0</span>￥&nbsp
						<input id="zong" type="hidden" value="3" name="zongjia" />
					</td>
					<td>
						<input type="submit" value="购买"/>
					</td>
				</tr>
			</thead>
		</table>
			
	</form>	
</div> 

<div style="margin: 30px auto 0px;">
	<footer id="footer">
		<div class="container" style="margin: 60px auto 0px;text-align: center;color: red;">
			<p>点卡销售 | 合作事宜 | 版权投诉</p>
			<p>河南ICP 备12345678. © 2016-2017 游戏大世界. Powered by Bootstrap.</p>
		</div>
	</footer>
</div>

</body>
</html>