<?php

$test1 = "\l";
$usr = "user\ ";
$pwd = "password";

$sqlcmd = "select * from table1 where user = \'user\' or \'1\'=\'1\'";

/*
if( eregi ("/=|\#|--|\.|\*|\\\|\'|\"|select|update|and|or|delete|insert|
trancate|char|into|substr|ascii|declare|exec
|count|master|into|drop|execute/i", $usr) )
{
    print('find it \\a\ ');
   // return;
}
else{
    print("not find");
}
print("mid ");
*/
$target = "ifconfig && cd ~";
$regx = "/&|;|\||-|\$|\(|\)|`/i";
$target1 = preg_replace($regx, "", $target);
print($target1);


?>