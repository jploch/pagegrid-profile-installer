<?php

namespace ProcessWire;


// GLOBAL SITE STYLE SETTINGS
// saves to database

// hide title in backend
$f = $this('modules')->get('InputfieldCheckbox');
$f->attr('name', 'hideTitleField');
$f->label = $this->_('Hide title');
$f->description = $this->_('Hide field title in page editor');
$f->attr('value', $this->hideTitleField);
if ($this->hideTitleField) {
    $f->attr('checked', 'checked');
}
$inputfields->append($f);

// renderOptions
$f = $this->modules->get('InputfieldSelect');
$f->set('name', __('renderOptions'));
$f->label = $this->_("Iframe Render Options");
$f->description = $this->_('Render whole page or just block templates (page is default)');
$f->addOption("page", "page");
$f->addOption("blocks", "blocks");
$f->attr('value', $this->renderOptions);
$f->columnWidth('50');
$inputfields->append($f);

$f = $this('modules')->get('InputfieldText');
$f->attr('name', 'pathToCSS');
$f->attr('value', $this->pathToCSS);
$f->label = $this->_('Load custom CSS file in backend (useful when rendering blocks)');
$f->description = $this->_('Path is relative to your template folder.');
// $f->notes = $this->_( 'useful when rendering unly blocks or when you want diffrent stlyling in admin than in frontend' );
$f->columnWidth('50');
$inputfields->append($f);

// force 'blocks/' as path, maybe optional in future?
// $f = $this('modules')->get('InputfieldHidden');
// $f->attr('name', 'pathToTemplates');
// // $f->attr( 'value', $this->pathToTemplates );
// $f->attr('value', 'blocks/');
// $f->label = $this->_('Path to Templates');
// $f->description = $this->_('If you use a delegated template approach, please provide your path to the templates (relative to templates directory).');
// $f->notes = $this->_('default is "blocks/"');
// $inputfields->append($f);

// Hide Style Panel
$f = $this('modules')->get('InputfieldCheckbox');
$f->attr('name', 'hideStylePanel');
$f->label = $this->_('Hide Style Panel');
$f->description = $this->_('Hide the style panel for all users (including superusers) in the page editor and use manual CSS code to style your elements.');
$f->attr('value', $this->hideStylePanel);
if ($this->hideStylePanel) {
    $f->attr('checked', 'checked');
}
$inputfields->append($f);

// page grid template
$f = $this('modules')->get("InputfieldPageListSelect");
$f->name = "pageTemplate";
$f->label = __("Grid Template Pages");
$f->description = __("Choose a page you want to use as a template, when creating new pages.");
//foreach ( $this( 'pages' ) as $page ) $f->addOption( $page->name );
$f->attr('value', $this->pageTemplate);
//$f->notes = __( 'some note ).');
//$f->columnWidth = 50;
$inputfields->append($f);
// END page grid template


//files upload fields

// $fieldset = $this->wire('modules')->get('InputfieldFieldset');
// $fieldset->label = $this->_('Enable inline editing');
// $fieldset->attr('id+name', 'inlineSettings');

// $fields = array();

// foreach ($this->wire('fields') as $field) {
//     if (!$field->type instanceof FieldtypeFile)
//         continue;
//     $fields[$field->name] = $field;
// }

// uksort($fields, 'strnatcasecmp');


// $f = $this->wire('modules')->get('InputfieldCheckboxes');
// $f->name = 'inlineEditFieldsUpload';
// $f->icon = 'image';
// $f->label = $this->_('Files');
// $f->description = $this->editHelpText;
// $f->optionColumns = 3;
// $values = (isset($this->hasField->data['inlineEditFieldsUpload'])) ? $this->hasField->data['inlineEditFieldsUpload'] : [];
// foreach ($fields as $field) {
//     $label = $field->name;
//     if ($label == 'title')
//         $label .= ' ' . $this->_('(not recommended)');
//     $value = $field->id;
//     $checked = (in_array($value, $values)) ? 'checked' : '';
//     //            $f->addOption($field->id, $label);
//     $f->addOption($field->id, $label, ['checked' => $checked]);
// }

// $fieldset->add($f);
// $inputfields->append($fieldset);

//END image upload fields

// STYLE SETTINGS ---------------------------------------------------------------
$tab = new InputfieldWrapper();
$tab->attr('id', 'site_styles');
$tab->attr('title', 'Style Settings');
$tab->attr('class', 'WireTab');
$tab->attr('class', 'site_styles');

//custom styles
$f = $this('modules')->get('InputfieldTextArea');
$f->collapsed(1);
$f->attr('name', 'customStyles');
$f->attr('value', $this->customStyles);
$f->label = $this->_('Custom Styles');
$f->rows = 20;
$f->columnWidth('100');
$tab->append($f);

// typography
$fieldsetTypography = $this->modules->get('InputfieldFieldset');
$fieldsetTypography->label = $this->_('Typography');
$fieldsetTypography->collapsed(1);

// google font DVGO option
$f = $this('modules')->get('InputfieldCheckbox');
$f->attr('name', 'fontPrivacy');
$f->label = $this->_('Google Fonts');
$f->checkboxLabel = $this->_('Privacy friendly Google Fonts');
$f->description = $this->_("Check this option to request Google Fonts from BunnyCDN instead of the Google server. The BunnyCDN has logging disabled, and will not logg any user information. [More informtion](https://github.com/coollabsio/fonts)");
$f->attr('value', $this->fontPrivacy);
if ($this->fontPrivacy) {
    $f->attr('checked', 'checked');
}
$fieldsetTypography->append($f);

//custom font
$f = $this('modules')->get('InputfieldText');
$f->attr('name', 'fontNames');
$f->attr('value', $this->fontNames);
$f->description = $this->_('Comma seperated list of font file names (e.g. font1.woff, font2.woff)');
$f->notes = $this->_('place fonts in /site/template/fonts/');
$f->label = $this->_('Fonts');
$f->columnWidth('100');
$fieldsetTypography->append($f);

$tab->append($fieldsetTypography);

// colors
$fieldsetColor = $this->modules->get('InputfieldFieldset');
$fieldsetColor->label = $this->_('Colors');
$fieldsetColor->description = $this->_('Comma seperated list of hex values, eg. #FFFFFF, #000000');
$fieldsetColor->collapsed(1);

$f = $this('modules')->get('InputfieldText');
$f->attr('name', 'fontColor');
$f->attr('value', $this->fontColor);
$f->label = $this->_('Default Font Colors');
$f->columnWidth('50');
$fieldsetColor->append($f);

$f = $this('modules')->get('InputfieldText');
$f->attr('name', 'bgColor');
$f->attr('value', $this->bgColor);
$f->label = $this->_('Default Background Colors');
$f->columnWidth('50');
$fieldsetColor->append($f);

$tab->append($fieldsetColor);

// ------
$inputfields->add($tab);

// END SETTINGS ------
