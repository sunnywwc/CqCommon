<?php

//<img src="" onerror="alert('xss')"/>

$name = preg_replace( '/<(.*)s(.*)c(.*)r(.*)i(.*)p(.*)t/i', '', $_GET[ 'name' ] );
$name = stripslashes( $_GET[ 'name' ] );
$name = mysqli_real_escape_string( $mysqlconnect, $_GET['name'] );
$name = htmlspecialchars( $_GET[ 'name' ] );

?>
