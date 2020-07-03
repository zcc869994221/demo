<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax三级联动</title>
<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
<!-- 
		Ajax三级联动：
			功能需求：
				页面中有三个下拉框，省，市，县
				选择省，则显示省对应的市信息
				依次类推
			技术分析：
				ajax+servlet+jap+mybatis	
			思路：
				1、页面中有三个下拉框，省，市，区/县
				2、页面加载成功要发起ajax请求，把省的信息填充到省下拉框中
				3、选择省触发一个新的js函数，发起新的ajax请求，把市的信息填充
				4、选择市信息，效果同上
			数据库表region设计：
				地区id：id
				地区名：name
				地区上级id：pid
			sql语句：
				查询所有省信息
				select * from region where pid=0
				查询选择省的市信息（省为?）
				select * from region where pid=?
				

 -->
 <script type="text/javascript">
	$(function(){
		$.get("AreaServlet",{"pid":"100000","method":"select"},function(data){
			//用eval将json转为js数据
			eval("var areas="+data);
			//alert(areas[0].id);
			//将响应数据填充到省下拉框
			var sel = $("#sheng");
			sel.empty();//清空当前下拉框中的内容
			sel.append("<option value='-1'> </option>");
			for (var i = 0; i < areas.length; i++) {
				sel.append("<option value='"+areas[i].id+"'>"+areas[i].name+"</option>");
			}
		})
	
	//省下拉框value改变时
	$("#sheng").change(function(){
		var areaid = $("#sheng").val();
		
		$.ajax({
			   type: "post",
			   url: "AreaServlet",
			   data: "pid="+areaid+"&method=select",
			   success: function(data){
			     //成功后的处理
			     eval("var areas="+data);
				 var sel = $("#shi");
			     sel.empty();//清空当前下拉框中的内容
			     $("#xian").empty();
			     sel.append("<option value='-1'> </option>");
			     for (var i = 0; i < areas.length; i++) {
						sel.append("<option value='"+areas[i].id+"'>"+areas[i].name+"</option>");
					}
			   }
			});
	})
	
	//市下拉框value改变时
	$("#shi").change(function(){
		var areaid = $("#shi").val();
		
		$.ajax({
			   type: "post",
			   url: "AreaServlet",
			   data: "pid="+areaid+"&method=select",
			   success: function(data){
			     //成功后的处理
			     eval("var areas="+data);
				 var sel = $("#xian");
			     sel.empty();//清空当前下拉框中的内容
			     sel.append("<option value='-1'> </option>");
			     for (var i = 0; i < areas.length; i++) {
						sel.append("<option value='"+areas[i].id+"'>"+areas[i].name+"</option>");
					}
			   }
			});
	})
	})	
</script>
</head>
<body style="background-color: gray;">
	<div style="margin:auto; width: 750px; margin-top: 200px;">
	省：<select name="" id="sheng" style="width: 200px;height: 30px;"></select>
	市：<select name="" id="shi" style="width: 200px;height: 30px;"></select>
	区/县：<select name="" id="xian" style="width: 200px;height: 30px;"></select>
	</div>
</body>
</html>