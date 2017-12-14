<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 

<?php
   
 
@session_start();


	if(strtoupper($_POST["yzzm"])!=strtoupper($_SESSION["code"]))
	{
	echo"<script>alert('验证码输入错误！');history.back();</script>";
	exit();

	}
	include_once("database.php");
    $email= $_POST["email"];
	$nickname= $_POST["nickname"];
	$pass= $_POST["passs"];
	get_connection();
	
	$sql = "select * from users where email='$email'";
	$resultSet = mysql_query($sql);
 	get_connection();
    $result_set = mysql_query($sql);
    if(mysql_num_rows($result_set)>0)
	{
   

	echo"<script>alert('该邮箱已被占用！');history.back();</script>";
	exit();
	
   }
		
		
	
else{
	
	    $sql = "insert into users values(null,'$email','$nickname','$pass')";
		mysql_query($sql);
       
	    $userID = mysql_insert_id();
        $userSQL = "select * from users where user_id=$userID";
        $userResult = mysql_query($userSQL);
        if($user = mysql_fetch_array($userResult)){
	       echo"<script>alert('注册成功！');window.location.href='login.htm';</script>";
	   
         }
		 else{
	         echo"<script>alert('注册失败！');history.back();</script>";
	       exit();
	   
              }
        closeConnection();
		
			
		
}

?>
