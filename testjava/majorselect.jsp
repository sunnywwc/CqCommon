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

<title>按学号条件查询</title>

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
		String major = request.getParameter("major");
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		Class.forName("org.gjt.mm.mysql.Driver");
		String url = "jdbc:mysql://localhost:3306/mldn?useUnicode=true&characterEncoding=UTF-8";
		String user = "root";
		String password = "123qweasd";
		conn = DriverManager.getConnection(url, user, password);
		stat = conn.createStatement();
                //major = "23";
		rs = stat.executeQuery("select * from student where major='"
				+ major + "'");
	%>
	<center>
		<br>
		<h2>符合条件的信息列表</h2>
		<hr>
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
                                if(!rs.next())
				{
				  out.print("<h4>不存在"+major+"此条件的信息！</h4>");
				}
				else			
				{
				    while (rs.next()) {
					out.print("<tr>");
					out.print("<td>" + rs.getInt("id") + "</td>");
					out.print("<td>" + rs.getString("name") + "</td>");
					out.print("<td>" + rs.getInt("age") + "</td>");
					out.print("<td>" + rs.getString("gender") + "</td>");
					out.print("<td>" + rs.getString("major") + "</td>");
					out.print("</tr>");
					}
				}
				if (rs == null) {
					out.print("<h4>不存在"+major+"此条件的信息！</h4>");
				}
			%>
		</table>
		<br> <br>
		<h4>
			<a href=layout.jsp>返回查询页面</a>
		</h4>
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
