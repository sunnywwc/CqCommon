<?php
    $dbtype = 'mysql';
    $host = 'localhost';
    $db = 'test';
    $user = 'root';
    $psw = 'china0913';
    $dsn = $dbtype . ':host=' . $host . ';' . 'dbname=' . $db;

    try {
        $db = new PDO($dsn, $user, $psw, array(PDO::ATTR_PERSISTENT=>true));
        echo '连接成功<br>';
    } catch(Exception $e) {
        die('Connect Failed Message: ' . $e->getMessage());
        }
    
    $data = $db->prepare( 'SELECT * FROM users WHERE user = (:user) AND password = (:password) LIMIT 1;' );
    $data->bindParam( ':user', $user, PDO::PARAM_STR);
    $data->bindParam( ':password', $pass, PDO::PARAM_STR );
    $data->execute();
    $row = $data->fetch();
    if( ( $data->rowCount() == 1 ) && ( $account_locked == false ) ) {
		// Get users details
		$user1  = $row[ 'user' ];
    }

?>
