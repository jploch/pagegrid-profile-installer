<?php

namespace ProcessWire;

function renderStylesDefault($pgField)
{

  $backend = 0;

  if (isset($_GET['backend'])) {
    $backend = 1;
  }

  $defaultCss = '<style>';
  $defaultCss .= '*, *::before, *::after {
      box-sizing: border-box;
      -webkit-font-smoothing: antialiased;
      margin: 0;
      padding: 0;
    } ';

  $defaultCss .= 'p, h1, h2, h3, h4, h5, h6 {
  overflow-wrap: break-word;
  word-break: break-word;
  font-weight: normal;
    } ';

  //    $defaultCss .= 'html, body {
  //    height: 100%;
  //    } ';

  $defaultCss .= 'input, button, textarea, select {
      font: inherit;
    } ';

  $defaultCss .= '.pg-main, .pg_group {
      display: grid;
      margin: 0 auto;
      list-style: none;
      column-gap: 30px;
      row-gap: 30px;
      grid-template-columns: repeat(12, [col-start] 1fr);
      grid-template-rows: auto;
      grid-column-end: -1;
      grid-column-start: 1;
      grid-row-start: auto;
      width: 100%;
      height: auto;
      box-sizing: border-box;
      position: relative;
      overflow-wrap: break-word;
      word-break: break-word;
    } ';

    $defaultCss .= '.pg-item {
      grid-column-end: -1;
      grid-column-start: 1;
    } ';

  $defaultCss .= '.pg img, .pg picture, .pg video, .pg audio, .pg canvas, .pg svg, .pg figure {
      display: block;
      width: 100%;
      max-width: 100%;
    } ';

  // Small devices default ( landscape phones, 576px and up )
  $defaultCss .= ' @media (max-width: 640px) {
        html .pg-main,
        html .pg_group {
              column-gap: 15px;
              row-gap: 15px;
          }
          html .pg-item,
          html .breakpoint-s .pg-item {
            grid-column: 1/-1;
            /* grid-row-end: span 1;*/
            grid-row: auto;
            }
        } ';

  $defaultCss .= $pgField->customStyles;

  $defaultCss .= '</style>';

  // preconnect to google font or privacy friendly alternative
  //https://github.com/coollabsio/fonts
  if ($pgField->fontPrivacy) {
    $defaultCss .= '<link rel="preconnect" href="https://api.fonts.coollabs.io" crossorigin>';
  } else {
    $defaultCss .= '<link rel="preconnect" href="https://fonts.googleapis.com">';
    $defaultCss .= '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>';
  }

  // custom fonts ---------------------------------------
  $customFont = '';

  if ($pgField->fontNames) {

    //trimm white spaces
    $localFonts = str_replace(' ', '', $pgField->fontNames);
    $localFonts = explode(',', $localFonts);

    foreach ($localFonts as $font) {

      $fontExt = '.' . pathinfo($font, PATHINFO_EXTENSION);
      $fontName = str_replace($fontExt, '', $font);

      $fontFile = wire('config')->paths->templates . 'fonts/' . $font;
      if (file_exists($fontFile)) {

        $customFont .= '<style class="pg-custom-fonts">
    ';
        $customFont .= '@font-face {
font-display: swap;
    font-family: "' . $fontName . '";
    src: url("/site/templates/fonts/' . $font . '");
    font-weight: 400;
    font-style: normal;
    font-stretch: normal;
    }
    ;
    ';
        $customFont .= '

</style>';
      }
    }
  }


  return  $customFont . $defaultCss;
}
