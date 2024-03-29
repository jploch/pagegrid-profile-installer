<?php namespace ProcessWire; ?>

<!DOCTYPE html>
<html lang='de'>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Resource-type" content="Document" />
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Title, SEO Meta, needs field site_title on home template -->
    <title>
        <?php if ($page->seo) { 
      $out = '';
        $out = $page->seo->title.' - '.$pages->get('/')->title; 
        } else { 
        $out = $page->title.' - '.$pages->get('/')->title; 
        }
    if( $page->id == 1 && $page->seo) {
      $out = $pages->get('/')->title;
    }
    echo $out;
       ?>
    </title>
    <?php if ($page->seo) { echo $page->seo->render;} ?>


    <!--css-->
    <link rel="stylesheet" type="text/css" href="<?php echo $config->urls->templates?>css/main.css" />

    <!--template specific css    -->
    <pw-region id="stylesheets"></pw-region>

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="<?php echo $config->urls->templates?>img/favicon.png">
    <link rel="apple-touch-icon" href="<?php echo $config->urls->templates?>img/favicon.png" />

</head>


<body class="page-body frontend <?php echo $page->name; ?> <?php echo $page->template->name; ?>">

    <!--  main Content -->
    <main id="content"> </main>

    <!--scripts-->
    <pw-region id="scripts"></pw-region>

</body>

</html>
