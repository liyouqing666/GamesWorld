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
	<title>注册</title>
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
		
		function checkname(){
			//alert();
	
		    $("#aaa").html("");
			var name=$("#name").val();
			var len=name.length;
			if(name == "") {
		         $("#aaa").html("用户名不能为空");
		         return false;
		    }
		    
		    if (isNaN(name)==false) {
				$("#aaa").html("用户名不能是纯数字,请重新输入!!");
				return false;
			}
			if (len<3||len>16) {
				$("#aaa").html("用户名必须3-16位,请重新输入!!");
				return false;
			}else{
		    	
		    	$("#aaa").html("");
		    	var isok=false;
		    	$.ajax({
		    		url:"user/ajaxll.htm",
		    		type:"post",
		    		async:false,
		    		data:{username:name},
		    		success:function(result){
		    			if(result=='a'){
		    				$("#aaa").html("用户名已存在");
		    				
		    			}else{
		    				
		    				$("#bbb").html("用户名可以使用");
		    				isok=true;
		    			}
		    		}
		    	});
		    	return isok;
		    }
		}
		/* 密码验证 */
		function checkPassword(){
		
		var password=$("input[name=password]").val();
			var len=password.length;
			if (isNaN(password)==false) {
				$("#b").html("密码不能是纯数字,请重新输入!!");
				return false;
			}
			if (len<6||len>16) {
				$("#b").html("用户名必须6-16位,请重新输入!!");
				return false;
			}
			
			$("#b").html("");
			return true;
		}
		
		/* 密码重复验证 */
		function checkRepassword(){
			var repassword=$("input[name=repassword]").val();
			var password=$("input[name=password]").val();
			if (repassword!=password) {
				$("#c").html("两次输入的密码不一致,请重新输入!!");
				return false;
			}
			$("#c").html("");
			return true;
		
		
			
		
		}
		/* 昵称验证 */
		function checkNickname(){
			var nickname=$("input[name=nickname]").val();
			var len=nickname.length;
			if (len==0) {
				$("#d").html("昵称不能为空!!");
				return false;
			}
			if (isNaN(nickname)==false) {
			
				$("#d").html("昵称不能是纯数字,请重新输入!!");
				return false;
			}
			
			$("#d").html("");
			return true;
		
		}
		/* 邮箱验证 */
		function checkEmail(){
			var email=$("input[name=email]").val();
			var reg=/^\w+@\w+(\.[a-zA-z]{2,3}){1,2}$/;
			
			if (reg.test(email)==false) {
				$("#e").html("你输入的邮箱格式不正确,请重新输入---->格式(13733899544@163.com)!!");
				return false;
			}
			$("#e").html("");
			return true;
		}
		
		/* 地址验证 */
		function checkAddress(){
			var address=$("input[name=address]").val();
			var len=address.length;
			if (isNaN(address)==false) {
				$("#f").html("地址不能是纯数字,请重新输入!!");
				return false;
			}
			if (len<6) {
				$("#f").html("地址大于必须6位,请重新输入!!");
				return false;
			}
			$("#f").html("");
			return true;
		
		}
		/* tel验证 */
		
		function checkTel(){
			var tel=$("input[name=tel]").val();
			var len=tel.length;
			if (isNaN(tel)==true) {
				$("#g").html("tel 只能是纯数字,请重新输入!!");
				return false;
			}
			if (len<6) {
				$("#g").html("tel大于必须6位,请重新输入!!");
				return false;
			}
			$("#g").html("");
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
		function chick(){
			if (yanzheng()&&checkname()&&checkPassword()&&checkRepassword()&&checkNickname()&&checkEmail()&&checkAddress()&&checkTel()) {
				return true;
			}
			return false;
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
		<span style="color:red;width: 500px;font-size: 20px;">新用户注册/&nbsp;老用户，请&nbsp;<a href="<%=path%>/">登录</a></span>
		<hr style="width: 850px;margin-right: 370px;"/>
		<form class="form-horizontal" action="<%=path %>/user/register.htm" method="post" onsubmit="return chick()">
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-10">
					<input type="text" id="name" onblur="checkname()" name="username"  class="form-control" style="width: 450px;">
					<span id="aaa" style="color:red;"></span>
					<span id="bbb" style="color:blue;"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input  type="password" onblur="checkPassword()" name="password"  class="form-control"  style="width: 450px;">	
					<span id="b" style="color:red;"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-10">
					<input  type="password" onblur="checkRepassword()" name="repassword"  class="form-control"  style="width: 450px;">	
					<span id="c" style="color:red;"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">昵称</label>
				<div class="col-sm-10">
					<input  type="text" onblur="checkNickname()" name="nickname"  class="form-control"  style="width: 450px;">	
					<span id="d" style="color:red;"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-10">
					<input  type="text" onblur="checkEmail()" name="email"  class="form-control"  style="width: 450px;">	
					<span id="e" style="color:red;"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">地址</label>
				<div class="col-sm-10">
					<input  type="text" onblur="checkAddress()" name="address"  class="form-control"  style="width: 450px;">	
					<span id="f" style="color:red;"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">tel</label>
				<div class="col-sm-10">
					<input  type="text" onblur="checkTel()" name="tel"  class="form-control"  style="width: 450px;">	
					<span id="g" style="color:red;"></span>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">验证码</label>
				<div class="col-sm-10">
					<input id="a3"  type="text"   name="yanzhengma" id="yanzhengma" onblur="yanzheng()"  class="form-control"  style="width: 450px;">	
					<span id="ao" style="color:red;" ></span>
				</div>
			</div>
			<div class="form-group" style="margin-left: 210px;" >
				<span id="imgs">	<img align="middle"  src="<%=path %>/VerificationServlet" /></span>
           				 <a href="javascript:changeImg()" ">&nbsp;看不清？换一张</a>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-10">
					<input type="submit" value="注册" class="form-control"  style="width: 450px;border-color: red;">	
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