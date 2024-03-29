<?php namespace ProcessWire;
if(!function_exists("renderSubnav")) {
  function renderSubnav( $pageItem ) {

    $out = '<ul id="nav-main" class="nav-main" data-class="nav-main">';
    foreach ( $pageItem->children() as $item ) {
        $out .= renderSubnavItem( $item );
    }
    $out .= '</ul>';
    return $out;
}
}
if(!function_exists("renderSubnavItem")) {
function renderSubnavItem( $item ) {
    $active = '';
    $subheadline = '';
    
    if ( wire('page')->id == $item->id ) {
        $active = 'nav-active';
    }
//  if($page->template->name !== 'home') {
//    if ( $page->parent()->id == $item->id || $page->parent()->parent()->id == $item->id) {
//        $active = ' active parent-active ';
//    }
//    }

    $out = '<li class="nav-'.$item->name.' nav-li nav-'.$item->name.'">';
    $out .= '<a href="'.$item->url().'" class="'.$active.' pg-style-panel">'.$item->title.'</a>';
    $out .= '</li>';
    return $out;

}
}
?>
