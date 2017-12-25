<%@ page import = "java.util.regex.*" pageEncoding="UTF-8"%>
<%
String sqlcmd = "select * from table1 where user = \'user\' or \'1\'=\'1\'";
String sqlstr = "\\=|\\#|\\--|\\'|\\*|\\:|\\\\|\\+";
Pattern p = Pattern.compile(sqlstr,Pattern.CASE_INSENSITIVE);    
Matcher m = p.matcher(sqlcmd); 
while(m.find())
{
    out.print("find it\n");
    return;
}
out.print("not find\n");
%>
