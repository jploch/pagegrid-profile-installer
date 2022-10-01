<?php namespace ProcessWire;

$otherHome = $pages->get('/home/');
if ($otherHome->id) {
    $otherHome->homepage = true;
    echo $otherHome->render();
} else {
    echo '<h2>No Page with the name "home" was found. Please create a page and name it "home"</h2>';
}

?>