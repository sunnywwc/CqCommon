<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<title>用户登陆</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"">
    function validate1()
    {
    var uname=document.forms[0].uname.value;
    var password=document.forms[0].password1.value;
    if(uname.length<=0){
    	alert("用户名不能为空，请输入用户名！");
    	return false;
    }
    else if(password1.length<=0){
    	alert("密码不能为空，请输入密码！");
    	return false;
    }
    else{
    	return true;
    }
    	//document.getElementById("form").submit();
    }
    </script>
</head>
<body>
	<center>
		<form action="login_check.jsp" id="form" method="post"
			onSubmit="return validate1()">
			<table border="1">
				<h1>
					<font color="#00876">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录操作</font>
					<h1>
						<hr>
						<tr>
							<td>登录名：</td>
							<td><input type="text" name="uname">
							</td>
						</tr>

						<tr>
							<td>密&nbsp;&nbsp;&nbsp码：</td>
							<td><input type="password1" name="password1">
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="登录"> <input
								type="reset" value="重置">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="注册"
								onclick="window.location.href='register.jsp'"></td>
						</tr>
			</table>
		</form>
	</center>
</body>
</html>
