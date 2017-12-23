<?php
//<img src="" onerror="alert('xss')"/>

$name = preg_replace( '/<(.*)s(.*)c(.*)r(.*)i(.*)p(.*)t/i', '', $_GET[ 'name' ] );
$name = htmlspecialchars( $_GET[ 'name' ] );

?>
