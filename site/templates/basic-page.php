<?php

namespace ProcessWire;

//check if backend or frontend
if (isset($_GET['backend'])) {
    $backend = 1;
} else {
    $backend = 0;
}

//redirect only in frontend, needed for custom home page
if ($page->name == 'home' && !$page->homepage && !$backend) {
    $session->redirect('/');
}

//if profile is installed module might not be loaded, so force refresh modules
if (!$modules->isInstalled('InputfieldPageGrid')) {
    $modules->refresh();
}

?>

<pw-region id="stylesheets">
    <?= $modules->get('InputfieldPageGrid')->styles($page); ?>
</pw-region>

<pw-region pw-prepend="content">
    <?= $modules->get('InputfieldPageGrid')->renderGrid($page); ?>
</pw-region>

<pw-region id="scripts">
    <?= $modules->get('InputfieldPageGrid')->scripts($page); ?>
</pw-region>

<?php include("./_main.php"); ?>