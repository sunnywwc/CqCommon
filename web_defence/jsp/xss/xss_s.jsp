<%@ page import = "org.apache.commons.lang.StringEscapeUtils“ pageEncoding="UTF-8"%>
<%
String str = "<sCriPt>alert(123)</scRipt>";

String str1 = "(?i)<(.*)s(.*)c(.*)r(.*)i(.*)p(.*)t>";
String strnew = str.replaceAll(str1,"ss");
//strnew = StringEscapeUtils.escapeHtml(strnew)；
str = str.replace("\"", "&quot;");
str = str.replace("&", "&amp;");
str = str.replace("<", "&lt;");
str = str.replace(">", "&gt;");
str = str.replace(" ", "&nbsp;");
out.print(strnew);
%>  