<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>学生信息</title>

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
		String id = request.getParameter("id");
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://localhost:3306/mldn";
		String user = "root";
		String password = "muguotao";
		conn = DriverManager.getConnection(url, user, password);
		stat = conn.createStatement();
		rs = stat.executeQuery("select * from student where id=" + id + "");
	%>
	<center>
		<br>
		<h2>信息修改</h2>
		<hr>
		<br>
		<h3>学生原信息如下</h3>
		<table width="450" border="100" cellSpacing=1
			style="font-size: 15pt; border: dashed 1pt">
			<tr>
				<td>学号</td>
				<td>姓名</td>
				<td>年龄</td>
				<td>性别</td>
				<td>专业</td>
			</tr>
			<%
				while (rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getInt("id") + "</td>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getInt("age") + "</td>");
					out.print("<td>" + rs.getString("gender") + "</td>");
					out.print("<td>" + rs.getString("major") + "</td>");
					out.print("</tr>");
			%>
		</table>
		<form action="update2.jsp" method="post">
			<h4>
				学号：<input type="text" name="id" value="<%=rs.getInt("id")%>"
					title="学号不能改变"></input><br>
			</h4>
			<h4>
				姓名：<input type="text" name="name" title="姓名不能为空"></input><br>
			</h4>
			<h4>
				年龄：<input type="text" name="age" title="年龄不能为空"></input><br>
			</h4>
			<h4>
				专业：<input type="text" name="major" title="专业不能为空"></input><br>
			</h4>
			<h4>
				性别：<input type="radio" name="gender" value="男">男 <input
					type="radio" name="gender" value="女">女<br>
			</h4>
			<input type="submit" value="修改" />
		</form>
		<br>
		<h3>
			<a href=layout.jsp>返回查询页面</a>
		</h3>
		<%
			}
		%>
		<%
			if (rs != null) {
				rs.close();
			}

			if (stat != null) {
				stat.close();
			}
			if (conn != null) {
				conn.close();
			}
		%>
	</center>
</body>
</html>
