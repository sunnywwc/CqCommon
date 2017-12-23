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

<title>登陆信息修改</title>

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
		String userid = request.getParameter("userid");
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://localhost:3306/mldn";
		String user = "root";
		String password = "muguotao";
		conn = DriverManager.getConnection(url, user, password);
		stat = conn.createStatement();
		rs = stat.executeQuery("select * from mldn where userid=" + userid
				+ "");
	%>
	<center>
		<br>
		<h2>用户修改</h2>
		<hr>
		<br>
		<h3>用户原信息如下</h3>
		<table width="300" border="100" cellSpacing=1
			style="font-size: 15pt; border: dashed 1pt">
			<tr>
				<td>用户名</td>
				<td>密码</td>
			</tr>
			<%
				while (rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getString("username") + "</td>");
					out.print("<td>" + rs.getString("password1") + "</td>");
					out.print("</tr>");
			%>
		</table>
		<form action="edit2.jsp" method="post">
			<h4>
				ID：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="text" name="userid" value="<%=rs.getInt("userid")%>"
					title="ID不能改变"></input><br>
			</h4>
			<h4>
				用户名：<input type="text" name="username" title="用户名不能为空"></input><br>
			</h4>
			<h4>
				密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="password1"
					title="密码不能为空"></input><br>
			</h4>
			<input type="submit" value="修改" />
		</form>
		<br>
		<h3>
			<a href=layout_user.jsp>返回登陆信息页面</a>
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
