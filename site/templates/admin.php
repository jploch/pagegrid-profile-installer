<?php

namespace ProcessWire;

/**
 * Admin template just loads the admin application controller, 
 * and admin is just an application built on top of ProcessWire. 
 *
 * This demonstrates how you can use ProcessWire as a front-end 
 * to another application. 
 *
 * Feel free to hook admin-specific functionality from this file, 
 * but remember to leave the require() statement below at the end.
 * 
 */

//custom js for admin
// $config->scripts->append($config->urls->templates."admin/admin.js");

$this->addHookAfter('Session::loginSuccess', null, function ($event) {

  // set email with valid domain name to forgot passwort module, to enable reset password
  $fpw = $this->modules->get("ProcessForgotPassword");

  if (isset($fpw)) {
    $host = $_SERVER['HTTP_HOST'];
    $data = wire('modules')->getConfig('ProcessForgotPassword');
    $data['emailFrom'] = 'PWAdmin@' . $host;
    wire('modules')->saveConfig('ProcessForgotPassword', $data);
  }

  //force admin theme after login
  if (!$this->modules->isInstalled('AdminThemeCanvas')) {
    $this->modules->refresh();
  }

  if ($this->modules->isInstalled('AdminThemeCanvas')) {
    $user = $event->user;
    $user->admin_theme = 'AdminThemeCanvas';
    $user->save();
  }
  //END force admin theme after login

});

//Customise CKEditor toolbar per role for regular ckeditor
$this->addHookBefore('Field(inputfieldClass=InputfieldCKEditor)::getInputfield', function (HookEvent $event) {

  $field = $event->object;
  // Define toolbar for a particular role
  if ($this->user->name == 'editor')
    $field->toolbar = 'Styles, -, Bold, Italic, -, RemoveFormat
NumberedList, BulletedList, -, Blockquote
JustifyLeft, JustifyCenter, JustifyRight
PWLink, Unlink, Anchor
PWImage';
});
//END Customise CKEditor toolbar per role for regular ckeditor

//Customise CKEditor toolbar per role for pagegrid inline edit ckeditor
$this->addHookBefore('ProcessPageEdit::execute', function ($e) {

  $field = wire('fields')->get('pg_editor');

  if ($this->user->name == 'editor')
    $field->toolbar = 'Styles, -, Bold, Italic, -, RemoveFormat
NumberedList, BulletedList
JustifyLeft, JustifyCenter, JustifyRight
PWLink, Unlink';
});
//END Customise CKEditor toolbar per role for pagegrid inline edit ckeditor



//Leave at the end (needed for PW)
require($config->paths->adminTemplates . 'controller.php');
