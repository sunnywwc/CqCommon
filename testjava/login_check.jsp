<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>

</head>
<body>
	<center>
		<%!public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://localhost:3306/mldn";
	public static final String DBUSER = "root";
	public static final String DBPASS = "123qweasd";%>
		<%
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			Connection conn = null; //数据库连接
			PreparedStatement pstmt = null; //数据库预处理操作
			ResultSet rs = null; //查询要处理结果集
			boolean flag = false; //保存标记
			String username = null; //保存真实姓名
		%>
		<%
			try { //异常处理
		%>

		<%
			Class.forName(DBDRIVER);
				conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
				String sql = "select username from mldn where username=? and password1=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, request.getParameter("uname"));
				pstmt.setString(2, request.getParameter("password1"));
				rs = pstmt.executeQuery(); //查询
				if (rs.next()) { //如果有数据，则可以执行
					flag = true; //表示成功登录

					username = rs.getString(1);
				}
		%>
		<%
			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (Exception e) {
				}
			}
		%>
		<%
			if (flag) { //登录成功
		%>
		<jsp:forward page="layout.jsp">
			<jsp:param name="username" value="<%=username%>" />
		</jsp:forward>
		<%
			} else { //登录失败
		%>
		用户名或密码错误，请重新<a href="login.jsp">
			<h1>登陆</h1> </a>
		<%
			}
		%>
	</center>
</body>
</html>
