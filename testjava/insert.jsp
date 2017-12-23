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

<title>插入学生信息</title>

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
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		Connection conn = null;
		Statement stat = null;

		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://localhost:3306/mldn";
		String user = "root";
		String password = "muguotao";
		conn = DriverManager.getConnection(url, user, password);
		stat = conn.createStatement();
		String sql = "insert into student(id,name,age,gender,major)values("
				+ id + ",'" + name + "'," + age + ",'" + gender + "','"
				+ major + "')";
		int i = stat.executeUpdate(sql);
	%>

	<center>
		<%
			if (i != 0) {
				out.print("<br><h3>成功输入！</h3>");
			} else {
				out.print("<br><h3>输入失败！</h3>");
			}
		%>

		<br> <a href=submit.jsp>返回信息输入页面</a> <a href=layout.jsp>进入信息查询页面</a>
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
