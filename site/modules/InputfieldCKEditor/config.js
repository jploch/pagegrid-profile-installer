/**
 * CKEditor custom config file for ProcessWire
 * 
 * Use this file to specify additional config options to all CKEditor instances, 
 * except those that have field-specific config files, i.e. config-body.js for 
 * config specific to a field named "body". 
 * 
 */
/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

var skinUrl = "minimalist,/site/modules/InputfieldCKEditor/skins/minimalist/";
//if($('.pgrid-container').length) {
//  var skinUrl = "minimalist," + $('.pgrid-container').attr('data-cke-url') + "InputfieldCKEditor/skins/minimalist/";
//}

CKEDITOR.editorConfig = function (config) {
  // Define changes to default configuration here. For example:
  // config.uiColor = '#AADC6E';
  // Allow extra content (PW settings not working);
  config.allowedContent = true;
  config.extraAllowedContent = 'wbr(*)[*]{*};a(*)[*]{*};p(*)[*]{*};li(*)[*]{*};ul(*)[*]{*};span(*)[*]{*}';
  CKEDITOR.dtd.$removeEmpty.i = 0;
  // Allow extra content (PW settings not working);
  config.skin = skinUrl;

  //fontawesome configs
  // needs fontawesome styles in backend ckeditor fieldsettings: 
  //https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css
  config.extraPlugins = 'fontawesome';
  config.allowedContent = true;
  // allow i tags to be empty (for font awesome)
  CKEDITOR.dtd.$removeEmpty['i'] = false;
  CKEDITOR.dtd.$removeEmpty['span'] = false;

};
