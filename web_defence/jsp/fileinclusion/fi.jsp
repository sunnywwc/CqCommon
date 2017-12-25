<%

String file1 = request.getParameter("name");

String strnew = file1.replaceAll("http://"," ");
strnew = file1.replaceAll("https://"," ");

if（ 
     !file1.equals("inculde.php" && !file1.equals("file1.php") && 
     !file1.equals("file2.php") && !file1.equals("file3.php") 
   )
   {
       out.print("not find");
   }

%>
