<?php

$target = "ifconfig && cd ~";
$regx = "/&|;|\||-|\$|\(|\)|`/i";
$target = preg_replace($regx, "", $target);

$target = trim($_REQUEST[ 'cmd' ]);

// Set blacklist
$substitutions = array(
    '&'  => '',
    ';'  => '',
    '| ' => '',
    '-'  => '',
    '$'  => '',
    '('  => '',
    ')'  => '',
    '`'  => '',
    '||' => '',
);


// Remove any of the charactars in the array (blacklist).
$target = str_replace( array_keys( $substitutions ), $substitutions, $target );

?>
