<%
String strcmd = "ifconfig && cd ~";

String str = "\\&|\\;|\\||\\-|\\$|\\(|\\)|\\`|\\||";
strcmd = strcmd.replaceAll(str,"");
out.print(strcmd);
%>

