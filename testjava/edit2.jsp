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
		request.setCharacterEncoding("UTF-8");
		String userid1 = request.getParameter("userid");
		String username1 = request.getParameter("username");
		String password11 = request.getParameter("password1");
		Connection conn = null;
		Statement stat = null;
		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://localhost:3306/mldn";
		String user = "root";
		String password = "muguotao";
		conn = DriverManager.getConnection(url, user, password);
		stat = conn.createStatement();
		stat.execute("update mldn set username='"
				+ username1 + "',password1='" + password11
				+ "' where userid=" + userid1 + "");
		ResultSet rs = stat.executeQuery("select * from mldn where userid="
				+ userid1 + "");
	%>
	<center>
		<br>
		<h3>修改成功！</h3>
		<br>

		<h3>修改后的信息为：</h3>
		<hr>
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
				}
			%>
		</table>
		<br> <br>
		<h3>
			<a href=layout_user.jsp>返回登陆信息页面</a>
		</h3>
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
