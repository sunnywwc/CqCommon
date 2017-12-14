<?php 
$database_connection = null;
function get_connection(){
	$hostname = "127.0.0.1"; 
	$database = "phptest";
	$username = "root"; 
    $password = "123qweasd"; 
    print "wahaha\n";
	global $database_connection;
	$ret = new mysqli($hostname, $username, $password, $database); 
    if( $ret->connect_error)
    {
        die("connect error: " . $ret->connect_error);
    }
    else
    {
        print("connect success\n");
    }
    print "lebaishi\n";
    return $ret; 
    //mysql_query("set names 'gbk'");
	//mysql_select_db($database, $database_connection) or die(mysql_error());
}
?>
