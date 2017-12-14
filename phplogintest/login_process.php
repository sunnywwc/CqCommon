<?php
include_once("database.php");
print('wdasdasdas\n');
$username = $_POST['username'];
$pass = $_POST['passs'];
print("user:".$username);
print("password:".$pass);
$conn = get_connection();
//$conn = new mysqli("127.0.0.1", "root", "123qweasd", "phptest");
$sql = "select * from userinfo where user='$username' and pass='$pass'";
$result = $conn->query($sql);
if($result->num_rows > 0){
echo"<script>alert('login success');window.location.href='register.htm';</script>";
	
}
else {
	echo"<script>alert('login error');history.back();</script>";
	exit();
}
$conn->close();
?>
