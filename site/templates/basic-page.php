<?php namespace ProcessWire;

//redirect only in frontend
if ( $page->name == 'home' && !$page->homepage && !$pagegrid->isBackend() ) {
    $session->redirect( '/' );
}

//if profile is installed module might not be loaded, so force refresh modules
if (!$modules->isInstalled('InputfieldPageGrid')) {
    $modules->refresh();
}

?>

<!--template styles auto load js files with same name as template-->
<pw-region id="stylesheets">
    <?= $pagegrid->styles($page); ?>
</pw-region>

<pw-region pw-prepend="content">
    <?= $pagegrid->renderGrid( $page ); ?>
</pw-region>

<!--template scripts auto load js files with same name as template-->
<pw-region id="scripts">
    <?= $pagegrid->scripts( $page ); ?>
</pw-region>

<?php include( "./_main.php" ); ?>