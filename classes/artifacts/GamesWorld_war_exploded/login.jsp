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
	<title>登录</title>
	<link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=path %>/css/style.css">
	<script src="<%=path %>/js/jquery.min.js"></script>
	<script src="<%=path %>/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function changeImg(){
			var a = document.getElementById("imgs");
			a.innerHTML = '<img align="middle" src="VerificationServlet?t='
				+ new Date()+ '" /> ';
		}
		function ae(){
			var a=$("#a1").val();
			$("#names").html("");
			if(a==""){
				$("#names").html("不能为空!");
				return false;
			}
			return true;
		}
		function ai(){
			var a=$("#a2").val();
			$("#passwords").html("");
			if(a==""){
				$("#passwords").html("不能为空!");
				return false;
			}
			return true;
		}
		function yanzheng(){
			var a=$("#a3").val();
			$("#ao").html("");
			if(a==""){
				$("#ao").html("不能为空!");
				return false;
			}else{
				var isok=false;
				$.ajax({
		    		url:"a.htm",
		    		type:"post",
		    		async:false,
		    		data:{aa:a},
		    		success:function(result){
		    			if(result=='a'){
		    				$("#ao").html("验证码跟下面不一样！");
		    			}else{
		    				$("#ao").html("");
		    				isok=true;
		    			}
		    		}
		    	});
		    	return isok;
			}
		}
		function alls(){
			if(yanzheng()&&ai()&&ae()){
				return true;
			}else{
				return false;
			}
			
		}
		
	</script>
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
		
	</div>
</nav>



<div style="margin-top: 130px;color:#999999;margin-left: 240px;color:#ff33cc;">
	<fieldset >
		<span style="color:red;width: 500px;font-size: 20px;">用户登录/&nbsp;如果您是新用户，请&nbsp;<a href="<%=path%>/register.jsp">注册</a></span>
		<hr style="width: 850px;margin-right: 370px;"/>
		
		<form class="form-horizontal" action="<%=path %>/user/login.htm" method="post" onsubmit="return alls()">
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" onblur="ae()" id="a1" name="username"  class="form-control" style="width: 450px;">
					<span id="names"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input id="a2" onblur="ai()" type="password" name="password"   class="form-control"  style="width: 450px;">	
					<span id="passwords"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">验证码</label>
				<div class="col-sm-10">
					<input id="a3"   type="text" name="yanzhengma" id="yanzhengma" onblur="yanzheng()"  class="form-control"  style="width: 450px;">	
					<span id="ao"></span>
				</div>
			</div>
			<div class="form-group" style="margin-left: 210px;" >
				<span id="imgs">	<img align="middle"  src="<%=path %>/VerificationServlet" /></span>
           				 <a href="javascript:changeImg()" ">&nbsp;看不清？换一张</a>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
					<input type="submit" value="登录" class="form-control"  style="width: 450px;border-color: red;">	
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