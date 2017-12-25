<?php

$usr = $_POST['username'];
$pwd = $_POST['password'];

$key  = array('=','or','and','#',"-- ");
for ($i=1; $i<=5; $i++)
{
    if( strstr($usr, $key[$i]) || strtr($pwd, $key[i]) )
    {
        return;
    }
}

if( eregi ("/=|\#|--|\.|\*|\\\|\'|\"|select|update|and|or|delete|insert|
trancate|char|into|substr|ascii|declare|exec
|count|master|into|drop|execute/i", $usr) )
{
    print('find it \\a\ ');
   // return;
}

$username = substr($usr,0,12); //最大长度为12 
$password = substr($pwd,0,12); //最大长度为12 
$username = htmlspecialchars($usr);
$password = htmlspecialchars($pwd);

$id  = intval($_GET['id']); //数字类型直接转换


mysql_set_charset("GBK");  //设置数据库的字符集(不设置字符集，GBK的数据库下面的函数有漏洞)
$username = mysql_real_escape_string($usr);  
$password = mysql_real_escape_string($pwd);


?>
