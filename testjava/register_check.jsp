<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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

<title>注册信息</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>
	<%
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		//String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		Connection conn = null;
		Statement stat = null;

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/mldn";
		String user = "root";
		String password = "123qweasd";
		conn = DriverManager.getConnection(url, user, password);
		stat = conn.createStatement();
		String sql = "insert into mldn(username,password1)values('" + username + "','" + password1 + "')";
		int i = stat.executeUpdate(sql);
	%>

	<center>
		<%
			if (i != 0) {
				out.print("<br><h3>注册成功！</h3>");
			} else {
		%>
		<a href=register.jsp>输入错误，请重新注册</a>
		<%
			}
		%>

		<br> <a href=login.jsp>登陆</a>
	</center>
	<%
		if (stat != null) {
			stat.close();
		}
		if (conn != null) {
			conn.close();
		}
	%>
</body>
</html>
