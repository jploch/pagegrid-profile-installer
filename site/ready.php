<?php

namespace ProcessWire;

if (!defined("PROCESSWIRE")) die();

/** @var Wire $wire */

/**
 * ProcessWire Bootstrap API Ready
 * ===============================
 * This ready.php file is called during ProcessWire bootstrap initialization process.
 * This occurs after the current page has been determined and the API is fully ready
 * to use, but before the current page has started rendering. This file receives a
 * copy of all ProcessWire API variables.
 *
 */

 //hook to change page path for frontend (needed for SEO, Sitemap)
$pages->addHookAfter('Page::path', function ($event) {
    $page = $event->object;
    $otherHome = wire("pages")->get('/home/');
    if (!wire("user")->isLoggedin() && $otherHome->id && $page === $otherHome) {
        $event->return = wire("pages")->get(1)->path;
    }
});
