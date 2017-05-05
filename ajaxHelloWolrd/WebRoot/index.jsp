<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>AJAX测试</title>
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="keywords" content="AJAX">
	<meta http-equiv="content-type" content="text/html;charset='utf-8'">
	<script type="text/javascript">
		var req;
		function blurMethod(){
			var userFiled = document.getElementById("username");
			var url = "RegisterServlet?"+userFiled.name+"=" + escape(userFiled.value);
			if(window.XMLHttpRequest){
				req = new XMLHttpRequest();
			}else if(window.ActiveXObject){
				req = new ActiveXObject();
			}
			req.open("get", url, true);
			req.onreadystatechange = callback;
			req.send(null);			
		}
		function callback(){
			if(req.readyState==4){
				if(req.status==200){
					document.getElementById("uResp").innerHTML = req.responseText;
				}
			}
		}
		
	</script>
  </head>
  <body>
	<form action="RegisterServlet" method="post">
	<table align="center">
		<tr><td>账号：</td><td><input id="username" type="text" name="username" onblur="blurMethod()"/></td><td><font color="red"><div id="uResp"></div></font></td></tr>
		<tr><td>密码：</td><td><input type="password" name="password1" /></td></tr>
		<tr><td>密码：</td><td><input type="password" name="password2" /></td></tr>
		<tr><th colspan="2"><input type="submit" value="注册"></th></tr>
	</table>
	</form>
  </body>
</html>
