<%@ page import = "java.util.regex.*" pageEncoding="UTF-8"%>
<%
//String sqlcmd = "select * from table1 where user = \'user\' or \'1\'=\'1\'";
String sqlstr = "\\=|\\#|\\--|\\'|\\*|\\:|\\\\|\\+";
//String test1 = "\l";
String regx1 = "(?:=)|(?:\\')|(?:\\+)";
String regx2 = "\\+|\\'|=";
String str1 = "whaha+lebaishi=111";

Pattern p = Pattern.compile(regx2,Pattern.CASE_INSENSITIVE); 
Matcher m = p.matcher(str1); 

while(m.find())
{
    out.print("find it");
    //return;
}

str1 = str1.replaceAll(regx2," ");
out.print(str1);


//out.print("not find\n");
%>