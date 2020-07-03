<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax搜索框提示</title>
<script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
<!-- 
		ajax之搜索框关键字提示语
		功能需求：
			用户在搜索框中输入关键字，然后搜索框下出现下拉选项，提示关键字的提示语。
			用户可以用鼠标进行提示语的选择，也可以使用键盘的上下键进行选择
		技术分析：
			ajax+servlet+jsp+mybatis
		思路：
			1、创建搜索界面(搜索框和搜索按钮和提示语div)	
			2、给搜索框添加onkeyup事件，键盘弹起时发送ajax请求
			请求当前用户输入的信息对应的提示语数据
			3、将提示语数据填充到搜索框下的div中
				用户单击任意键都会发生ajax请求：
					用按键code值来判断
			4、实现使用鼠标选择提示语
			5、实现使用键盘的↑↓键选择提示语
			6、实现鼠标和键盘的联动操作
			7、将显示提示语的div进行隐藏，当有提示语的时候显示隐藏的div
			完善：
				设置延迟发送，减小服务器压力
				window.setTimeout(fn,time)
				window.clearTimeout(name)
				
				event在火狐中使用window.event获取不到
				在function中加入形参event进行赋值，参照代码
				
		数据库设计：
			创建表：存储常见的搜索关键字数据
				关键字：id
				关键字数据：title
				说明：remark
			sql:
				查询以用户数据当前的搜索框数据开头的关键字
				select * from data where title like 'a%'
				
 -->
<script type="text/javascript">
	//声明全局计数器
	var count = 0;
	//声明全局延迟器
	var id = null;
	$(function(){
		//先隐藏提示语框
		$("#data").css("display","none");
		$("#search").keyup(function(event){		
			//声明正则表达式判断空格
			var reg = /^\s+$/g;
			//获取event对象
			var eve = window.event || event;
			//获取用户当前按下的键盘值
			var code = eve.keyCode;
			//alert(code); 
			//获取当前搜索框的值
			var val = $("#search").val();
			if(code>=65&code<=90 ||code==8 || code==32){//用短路&两个都要达到要求
				//判断文本框中是否为空,和空格
				if(val=="" || reg.test(val)){
					$("#data").css("display","none");
					return;
				}
				
				
			//关掉之前的ajax延迟请求
			window.clearTimeout(id);
			//开始一个新的延迟
			 id=window.setTimeout(function(){
					//进行ajax请求
					$.ajax({
						type: "post",
						   url: "SearchServlet",
						   data: "title="+val+"&method=select",
						   success: function(data){
							   //alert(data);
							   //转换成对象
							   eval("var data="+data);
							   //获取div对象
							   var div = $("#data");
							   div.empty();//清空原有内容
							   //显示隐藏的div
							   if(val.length>0){//表示数据库有该字母开头的数据
								   div.css("display","");  
							   }						   
							   //填充
							   for (var i = 0; i < data.length; i++) {
								div.append("<div style='padding:5px;height:17px;' class='datadav'>"+data[i].title+"</div>");
							}
							 //给提示语添加鼠标悬停效果
								$(".datadav").mouseover(function(){
									//清空所有div背景颜色
									$(".datadav").css("background-color","");
									//将当前选择的div颜色变成灰色
									$(this).css("background-color","gray");
									//进行鼠标和键盘的联动，把当前的角标赋值给计数器
									count=$(this).index()+1;
								})
							//给提示语加单击事件，赋值给文本框
								$(".datadav").click(function(){						
									$("#search").val($(this).html());
									//隐藏提示语
									$(".datadav").css("display","none");
								})
						   }
					});	
				},500);
				
			}
			
			//判断用户点击的是否是键盘↓键
			if(val!=""&&code==40){
				if(count>=$("#data div").length){
					count=0;
				}
				count=count+1;
				//清空所有div背景颜色
				$(".datadav").css("background-color","");
				//选中的变成灰色
				var div = $(".datadav:nth-child("+count+")");
				div.css("background-color","gray");
				$("#search").val(div.html());
			}
			//判断用户点击的是否是键盘↑键
			if(val!=""&&code==38){
				if(count<=1){
					count=$("#data div").length+1;
				}
				count=count-1;
				//清空所有div背景颜色
				$(".datadav").css("background-color","");
				//选中的变成灰色
				var div = $(".datadav:nth-child("+count+")");
				div.css("background-color","gray");
				$("#search").val(div.html());
				
			}
		})
		
	})
</script>
</head> 
<body>
	<div id="container" style="width: 500px;margin: auto;">
		<div id="sdiv" style="width: 750px;margin: auto; margin-top: 200px;">
			<input type="search" name="search" id="search" value="" style="width: 400px;height: 30px;"/>
			<input type="button" value="搜索" style="height: 30px;width: 100px;"/>		
		</div>
		<div id="data" style="width: 398px; border: 1px solid; border-top:none;"></div>
	</div>
</body>
</html>