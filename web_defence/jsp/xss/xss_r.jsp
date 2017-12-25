<%
//<img src="" onerror="alert('xss')"/>
//String str = request.getParameter("name");
String str = "<sCriPt>alert(123)</scRipt>";

String str1 = "(?i)<(.*)s(.*)c(.*)r(.*)i(.*)p(.*)t>";
String strnew = str.replaceAll(str1,"ss");
//strnew = StringEscapeUtils.escapeHtml(strnew)；

out.print(strnew);
%>
