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

<title>登陆信息</title>

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
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://localhost:3306/mldn";
		String user = "root";
		String password = "muguotao";
		conn = DriverManager.getConnection(url, user, password);
		stat = conn.createStatement();
		// stat.execute("insert into student(id,name,age,gender,major)values("+id+",'"+name+"',"+age+",'"+gender+"','"+major+"')"); 
		rs = stat.executeQuery("select * from mldn");
	%>
	<center>
		<br>
		<h2>登陆信息</h2>
		<hr>
		<br>
		<h3>所有用户</h3>
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
			%>
			<td><a href="delete_user.jsp?userid=<%=rs.getInt("userid")%>">删除</a>
			</td>
			<td><a href="edit.jsp?userid=<%=rs.getInt("userid")%>">修改</a>
			</td>
			<%
				out.print("</tr>");
				}
			%>
		</table>
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
		<input type="button" value="注册新用户"
			onclick="window.location.href='register.jsp'">
	</center>
</body>
</html>
