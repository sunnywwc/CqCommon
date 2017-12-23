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
	    //String str = "wahah.leb#aishi";
        //String s = str.replaceAll("\\#|\\.", "he");
        //out.print(s);
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/mldn";
		String user = "root";
		String password = "123qweasd";
		conn = DriverManager.getConnection(url, user, password);
		stat = conn.createStatement();
		// stat.execute("insert into student(id,name,age,gender,major)values("+id+",'"+name+"',"+age+",'"+gender+"','"+major+"')"); 
		rs = stat.executeQuery("select * from student");
	%>
	<center>
		<br>
		<h2>学生信息</h2>
		<hr>
		<br>
		<h3>全部学生信息如下</h3>
		<!-- 	<form action="idselect.jsp" method="post">
	 		<h3>按学号查询:<input type="text" name="id"  value="" title="学号不能为空" ></input>
	    		<input type="submit" value="查询"/></h3> 
	    </form> -->
		<form action="majorselect.jsp" method="post">
			<h3>
				按专业查询： <select type="text" name="major">
					<option value="计算机">计算机</option>
					<option value="化工">化工</option>
					<option value="机械设计">机械设计</option>
					<option value="工商管理">工商管理</option>
					<option value="土木工程">土木工程</option>
				</select> <input type="submit" value="查询" />
			</h3>
		</form>
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
			%>
			<td><a href="delete.jsp?id=<%=rs.getInt("id")%>">删除</a>
			</td>
			<td><a href="update3.jsp?id=<%=rs.getInt("id")%>">修改</a>
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
		<input type="button" value="添加"
			onclick="window.location.href='submit.jsp'"> <input
			type="button" value="退出" onclick="window.location.href='login.jsp'">
		<br> <input type="button" value="管理登陆用户"
			onclick="window.location.href='layout_user.jsp'">
	</center>
</body>
</html>
