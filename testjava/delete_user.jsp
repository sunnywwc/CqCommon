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

<title>删除用户</title>

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
		String sql = "delete from mldn where userid=" + userid;
		int i = stat.executeUpdate(sql);
		if (i != 0) {
			out.print("<center><br><br><h3>删除成功！</h3></center>");
		} else {
			out.print("<center><h3>删除失败！</h3></center>");
		}
	%>
	<br>
	<br>
	<center>
		<a href=layout_user.jsp>返回登陆信息页面</a>
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
