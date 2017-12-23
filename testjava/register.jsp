<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"">
    function validate2()
    {
    //var userid=document.forms[0].userid.value;
    var username=document.forms[0].username.value;
    var password1=document.forms[0].password1.value;
    /* if(id<=0){
    	alert("id不能为空，请输入id！");
    	return false;
    } */
    if(username.length<=0){
    	alert("用户名不能为空，请输入姓名！");
    	return false;
    }
    else if(password1<=0){
    	alert("请输入密码！");
    	return false;
    }
    else{
    	return true;
    }
    }
    </script>
</head>

<body>
	<br>
	<center>
		<h2>注册</h2>
		<hr>
		<form action="register_check.jsp" method="post" id="form"
			onSubmit="return validate2()">
			<!-- <h4>
				ID：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="text" name="userid" class="{required:true}"></input><br>
			</h4> -->
			<h4>
				用户名：<input type="text" name="username"></input><br>
			</h4>
			<h4>
				密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="password1"></input><br>
			</h4>
			<input type="submit" value="提交" />
		</form>
		<a href=login.jsp>返回登陆页面</a>
	</center>
</body>
</html>

