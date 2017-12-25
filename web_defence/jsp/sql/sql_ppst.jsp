<%@ page import="com.Database.*"%>  
<%@ page import="java.sql.*"%>  
<%

int id =3;
String sql ="select * from studentinfo where id=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setInt(1, id);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
    return;
}



String user = "admin";
String pwd = "123456";
String sql ="select * from studentinfo where user=? and pwd=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, user);
ps.setString(2, pwd);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
    return;
}
%>
