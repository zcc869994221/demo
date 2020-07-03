<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function text() {
	window.location.href="MyServlet"
}

function textAjax() {
	var ajax;
	if(window.XMLHttpRequest){
		ajax = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		ajax = new ActiveXObject("Msxm12.XMLHTTP");
	}
	
	//声明事件监听
	ajax.onreadystatechange = function(){
		
		if(ajax.readyState == 4){
			if(ajax.status==200){
				var data = ajax.responseText;
				var div = document.getElementById("showdiv");
				div.innerHTML=data;
			}		
		}
	}
	
	ajax.open("get","MyServlet",true);
	ajax.send(null);
	alert("aaaa");
}
</script>
</head>
<body>
<p>我的ajax</p>
<hr>
<input type="button" value="测试非ajax" onclick="text()"/>
<input type="button" value="测试ajax" onclick="textAjax()" />
<div id="showdiv" style="width: 200px;height: 200px;border: solid 1px;"></div>
</body>
</html>