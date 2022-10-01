<?php namespace ProcessWire;
//bootstrap PW
include_once('../../../index.php');

$pId = intval( ($_GET["id"]) );
$p = wire( 'pages' )->get( $pId );

$p->edit(true);

?>

<html>

<head>
    <?= $modules->get( 'InputfieldPageGrid' )->styles($p) ?>
</head>

<bod>
    <?= $modules->get( 'InputfieldPageGrid' )->renderGrid($p) ?>
    <?= $modules->get( 'InputfieldPageGrid' )->scripts($p) ?>
</bod>


</html>
