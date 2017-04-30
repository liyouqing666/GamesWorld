<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="description" content="jQuery-图片的放大镜显示效果" />
<meta name="description" content="张鑫旭web前端学习之css，jQuery学习实例页面" />
<meta name="keywords" content="张鑫旭,鑫空间-鑫生活,博客,web前端,css,jQuery,特效,图片放大镜效果,js插件,demo页面,学习," />
<meta name="author" content="张鑫旭,zhangxixnu" />
<title> 详情页</title>
<link rel="shortcut icon" href="http://www.zhangxinxu.com/zxx_ico.png" />
<link rel="stylesheet" href="<%=path %>/css/common.css" type="text/css" />
<style type="text/css">
img{max-width:none;}
.zxx_image_zoom_list{display:inline-block; width:1.2em; height:1.1em; text-align:center; font-size:128px;}
.zxx_image_zoom_list img.zxx_zoom_image{padding:3px; border:1px solid #cccccc; background:white; vertical-align:middle; position:relative;}
.zxx_image_zoom_list:hover,.zxx_image_zoom_list:hover img.zxx_zoom_image{border-color:#ff3300;}
.zxx_image_zoom_div{width:200px; height:200px; padding:3px; background:white; border:1px solid #cccccc; text-align:center; position:absolute; z-index:1000; left:0; top:0; overflow:hidden;}
</style>
<script type="text/javascript" src="<%=path %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path %>/js/jqzoom.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
	jQuery(document).ready(function(){
		$("img.zxx_zoom_image").jqueryzoom();
	});
</script>
</head>

<body style="background:#223240;">
	<div class="zxx_out_box" style="width: 600px;">
    	<div class="zxx_in_box">
        	<div class="zxx_header">
               	<img class="l" src="<%=path %>/img/logo.png" />
                <span class="zxx_author_time">by liyouqing 2016-10-10 12:10</span>
            </div>
            <h3 class="zxx_title">宝贝详情页</h3>
            <div style="margin-left: 90px;float: left;">
            
            	<a href="<%=path %>/upload/${good.goods_image}" class="zxx_image_zoom_list">
                    <img class="zxx_zoom_image" src="<%=path %>/upload/${good.goods_image}" width="140" height="170" />
                </a>
               
            </div>
           
            <div class="mt20 mb20" style="margin-top: 10px;float: left;margin-left: 100px;font-size: 15px;color:blue;">
				<p>商品名称：<br/>&nbsp;
					<span style="color:red;"> ${good.goods_name }</span>
				</p><br/>
				<p>商品库存：<br/>&nbsp;
					<span style="color:red;"> ${good.goods_store }</span>&nbsp;个
				</p><br/>
				<p>商品价格：<br/> &nbsp;
					<span style="color:red;">${good.goods_price }</span>&nbsp;元
				</p><br/>
				<p>商品简介：<br/>&nbsp;
				 	<span style="color:red;">${good.goods_info }</span>
				 </p><br/>
			</div>
			
			<div style="clear: both;margin-top: 130px;margin-left: 95px;font-size: 15px;">
				<a style="color:#ff6633;text-decoration: none;" href="<%=path%>/shopp/add.htm?goods_id=${good.goods_id}" >加入购物车</a>&nbsp;
				<a href="<%=path%>/order/add.htm?goods_id=${good.goods_id}" style="color:#ff6633;text-decoration: none;">点击购买</a>&nbsp;
				<a href="<%=path %>/good/getAll.htm" style="color:#ff6633;text-decoration: none;">返回主页</a>
			</div>
			
            <div style="margin: 100px auto 0px;clear: both;">
				<footer id="footer">
				<div class="container" style="margin: 60px auto 0px;text-align: center;color: red;">
					<p>点卡销售 | 合作事宜 | 版权投诉</p>
					<br/>
					<p>河南ICP 备12345678. © 2016-2017 游戏大世界. Powered by Bootstrap.</p>
				</div>
	</footer>
</div>
        </div>
    </div>
</body>
</html>
