<?php

namespace ProcessWire;

/**
 * PageGrid for ProcessWire
 * 
 * Copyright (C) 2022 by Jan Ploch
 * THIS IS A COMMERCIAL MODULE - DO NOT DISTRIBUTE
 */

class InputfieldPageGrid extends Inputfield
{


    public static function getModuleInfo()
    {
        return array(
            'title' => __('PageGrid Inputfield', __FILE__), // Module Title
            'summary' => __('Adds Inputfield for PageGrid', __FILE__), // Module Summary
            'version' => 001,
            'author' => 'Jan Ploch',
            'icon' => 'th',
            'permanent' => false,
            'requires' => array('FieldtypePageGrid'),
            'installs' => array('FieldtypePageGrid', 'ProcessPageGrid', 'PageGridFrontEdit'),
        );
    }

    /**
     * Array of Template objects used for each row
     *
     * @var array
     *
     */
    protected $rowTemplates = array();

    public function __construct()
    {
        // Custum Tab
        // https://processwire.com/talk/topic/15015-tabs-in-module-config-page/

        // load script for style tab
        $this->config->scripts->add($this->config->urls->InputfieldPageGrid . "wireTabs.js'");

        //hide settings from pagetable, that need to be there but not visible
        $this->config->styles->add($this->config->urls->InputfieldPageGrid . "fieldsettings.css");
    }

    public function init()
    {
        parent::init();
        // defaults
        $this->set('sortfields', '-date');
        $this->set('template_id', 0); // placeholder only 
        $this->set('hideTitleField', 0);
        $this->set('renderOptions', 'page');
        $this->set('pathToCSS', '');
        $this->set('hideStylePanel', 0);
        $this->set('customStyles', '');
        $this->set('fontColor', '');
        $this->set('bgColor', '');
        $this->set('pageTemplate', '');
        $this->set('fontPrivacy', 0);
        $this->set('fontNames', '');
    }

    public function ___render()
    {

        $user = wire('user');
        $this->config->styles->add($this->config->urls->InputfieldPageGrid . "css/main.css");

        // load js only for userusers and user with designer permission
        if ($user->isSuperuser() || $user->hasPermission('pagegrid-drag') || $user->hasPermission('pagegrid-resize') || $user->hasPermission('pagegrid-style-panel')) {
            $this->config->scripts->add($this->config->urls->InputfieldPageGrid . "js/main.js'");
        } else {
            $this->config->scripts->add($this->config->urls->InputfieldPageGrid . "js/editor.js'");
        }

        if ($this->pathToCSS) {
            $this->config->styles->add(wire('config')->urls->templates . $this->pathToCSS);
        }

        return $this->renderField();
    }

    public function ___renderField()
    {
        // $pagesToRender = $this->attr('value');


        //new pages to render based on items parent
        $editID = (int) $this->wire('input')->get('id');
        if (!$editID && $this->wire('process') instanceof WirePageEditor) $editID = $this->wire('process')->getPage()->id;

        if ($editID) {
        } else {
            return false;
        }

        $itemsParent = $this->pages->get('pg-' . $editID);

        //check if old id exists for imported pages via import module
        $mainPage = $this->pages->get($editID);
        $oldEditID = $mainPage->meta()->pg_itemsPage;

        if (isset($oldEditID)) {

            // bd('Old id found:' . $oldEditID);
            // bd($editID);

            if ($oldEditID != $editID) {
                $itemsParentOld = $this->pages->get('pg-' . $oldEditID);
                if ($itemsParentOld->id && $itemsParent->id == 0) {
                    // bd('change name');
                    $itemsParentOld->name = 'pg-' . $editID;
                    $itemsParentOld->save();
                    $itemsParent = $itemsParentOld;
                }
            }
        }

        $mainPage->meta()->set('pg_itemsPage', $editID);

        //END check if old id exists for imported pages via import module

        if ($itemsParent->id) {
        } else {
            $itemsParent = new Page(); // create new page object
            $itemsParent->template = 'pg_container'; // set template
            $itemsParent->parent = 'pg-items'; // set the parent
            $itemsParent->name = 'pg-' . $editID; // give it a name used in the url for the page
            $itemsParent->title = $this->pages->get($editID)->title . ' items'; // set page title (not neccessary but recommended)
            $itemsParent->save();
        }

        // set field name to item meta, not needed, but convinient
        $pagesToRender = $itemsParent->find('');
        $itemsParent->meta()->set('pg_field', $this->name);

        foreach ($pagesToRender as $pgItem) {
            $pgItem->meta()->set('pg_field', $this->name);
        }
        // END set field name to item meta, not needed, but convinient

        //import old data
        // $pagesToRenderOld = $this->attr('value');

        // if ($pagesToRenderOld) {
        //     foreach ($pagesToRenderOld as $item) {
        //         $item->parent = $itemsParent;
        //         $item->save();
        //     }
        // }
        //import old data

        //END new pages to render based on items parent

        $moduleUrl = $this->config->urls->InputfieldPageGrid;
        $user = wire('user');
        $settings = '';
        $addItems = '';

        //make data available to js
        $globalPage = $this->pages->get('pg-classes');
        $dataGlobal = '';
        $globalPageData = [];
        $globalPageData[$globalPage->id] = [];

        foreach ($globalPage->find('') as $child) {
            $itemData = $child->meta()->pg_styles;
            if (isset($itemData)) {
                foreach ($itemData as $childData) {
                    if (isset($childData['id'])) {
                        $globalPageData[$globalPage->id][$child->name] = $childData;
                    }
                }
            }
        }

        //just get all data, this will work for nested items, as well as ref fields, performance?
        $pageItems = $this->pages->get('pg-items');
        $itemsArray = new PageArray();

        foreach ($pageItems->children() as $child) {
            $itemsArray->add($child);
            foreach ($child->find('') as $c) {
                $itemsArray->add($c);
            }
        }

        foreach ($itemsArray as $child) {
            $itemData = $child->meta()->pg_styles;
            if (isset($itemData)) {
                $globalPageData[$child->id] = $itemData;
            }
        }

        $globalPageData = json_encode($globalPageData);
        $dataGlobal = '<script>$(".pg-container").data("pg", ' . $globalPageData . ')</script>';
        //END make data available to js

        // get parent page
        $parentPageId = (int) wire('input')->get('id');
        if ($parentPageId == 'undefined' || $parentPageId == null) {
            $parentPageId = wire('page')->id;
        }
        $parentPage = $this->pages->get($parentPageId);

        if ($user->hasPermission('pagegrid-style-panel') && $this->hideStylePanel == 0) {
            include 'settings_page.php';

            $settings = '<div class="pg-settings pg-settings-content">' . $settings . '</div>';
        }

        // render the 'Add New' buttons for each template
        if ($user->hasPermission('pagegrid-add') && $user->hasPermission('pagegrid-drag')) {
            $editID = (int) $this->wire('input')->get('id');
            if (!$editID && $this->wire('process') instanceof WirePageEditor) $editID = $this->wire('process')->getPage()->id;
            $parentID = $itemsParent->id;
            $addItems = '<div class="pg-add-container"><div class="pg-add-content">';
            foreach ($this->rowTemplates as $template) {
                /** @var Template $template */

                // keep this line for future updates, makes it possible to add items via modal if link is clicked, maybe alternative for non super users oneday
                // $url = $this->wire('config')->urls->admin . "page/add/?modal=1&template_id=$template->id&parent_id=$parentID&context=PageGrid";

                if ($template->icon == '') {
                    $tIcon = '<div class="pg-iconletter">' . substr($template->getLabel(), 0, 1) . '</div>';
                } else {
                    $tIcon = wireIconMarkup($template->icon);
                }

                $addItems .= '<div class="pg-add ' . $template->name . '" data-parent-id="' . $parentID . '" data-template-id="' . $template->id . '" template="' . $template->name . '">' . $tIcon . '<span class="ui-button-text">' . $template->getLabel() . '</span></div>';
            }
            $addItems .= '</div></div>';
        }
        // END render the 'Add New' buttons for each template

        $renderMarkup = '<div class="pg-topnav uk-navbar-center">
        <i class="pg-item-list-button pg-topnav-margin-big fa fw fa-list-ul on" title="Item List"></i>
        <i class="pg-undo fa fa-fw fa-reply" data-name="fa-reply" title="Undo" style="cursor: pointer;"></i><i class="pg-redo pg-topnav-margin fa fa-fw fa-share" data-name="fa-share" title="Redo" style="cursor: pointer;"></i>
        <div id="breakpoints-nav">
       <img src="' . $moduleUrl . '/img/phone-portrait-outline.svg" class="breakpoint-icon breakpoint-icon-s" value="@media (max-width: 640px)" breakpoint="s" title="Breakpoint Small">
       <img src="' . $moduleUrl . '/img/phone-landscape-outline.svg" class="breakpoint-icon breakpoint-icon-m" value="@media (max-width: 960px)" breakpoint="m" title="Breakpoint Medium">
       <img src="' . $moduleUrl . '/img/laptop-outline.svg" class="breakpoint-icon breakpoint-icon-base" value="@media (min-width: 640px)" breakpoint="base" title="Breakpoint Base">
       <img src="' . $moduleUrl . '/img/desktop-outline.svg" class="breakpoint-icon breakpoint-icon-l" value="@media (min-width: 1600px)" breakpoint="l" title="Breakpoint Large">
       </div></div>' . $settings . '<div class="pg-container" data-id="' . $this->pages->get('pg-classes')->id . '" data-field="' . $this->name . '" data-admin-url="' . $this->page->rootParent->url() . 'pagegrid/" data-cke-url="' . $this->config->urls->siteModules . '">' . $addItems . $dataGlobal;

        //render item header
        $headerToRender = $itemsParent->find('');
        $renderMarkup .= '<div id="pg-item-header">';
        foreach ($headerToRender as $item) {
            $renderMarkup .= $this->modules->get('InputfieldPageGrid')->renderHeader($item);

            // page ref
            $refField  = 0;
            $pgField = $this->name;

            foreach ($item->fields as $field) {
                if ($field->type instanceof FieldtypePage) {
                    $refField = $field->name;
                }
            }

            if ($refField) {

                // get ref page
                $refPages = $item->$refField;

                if ($refPages) {
                    // set to array if single object
                    if (!is_array($refPages)) $refPages = array($refPages);

                    if (count($refPages)) {
                        foreach ($refPages as $refPage) {
                            $renderMarkup .= $this->modules->get('InputfieldPageGrid')->renderHeader($refPage);
                            foreach ($refPage->find('') as $refChild) {
                                $renderMarkup .= $this->modules->get('InputfieldPageGrid')->renderHeader($refChild);
                            }
                        }
                    }
                }
            }
            // END page ref

            if ($this->config->ajax) {
                $renderMarkup .= $this->modules->get('InputfieldPageGrid')->renderItem($item);
            }
        }

        $renderMarkup .= '</div>';
        //END render item header

        if ($this->renderOptions == 'page') {
            //render whole page
            $renderMarkup .= '<iframe id="pg-iframe-canvas" src="' . wire('pages')->get($parentPageId)->url . '?backend=1" frameBorder="0" scrolling="yes" style="width:100%; max-height:calc(100vh - 200px); border:0;"></iframe>';
        } else {
            //render only blocks
            $renderMarkup .= '<iframe id="pg-iframe-canvas" src="' . $moduleUrl . 'frontend.php?backend=1&id=' . $parentPageId . '" frameBorder="0" scrolling="no" style="width:100%; height:100vh; min-height:300px; overflow:hidden; border:0;"></iframe>';
        }

        $renderMarkup .= '</div>';

        $data = wire('modules')->getConfig('FieldtypePageGrid');
        $licence_key = isset($data['lkey']) ? $data['lkey'] : '';
        $licence_url = isset($data['ldomain']) ? $data['ldomain'] : '';
        $gumroad_array = wire('modules')->get('FieldtypePageGrid')->gumroad_licence($licence_key, 'pagegrid', 0);
        $host = $_SERVER['HTTP_HOST'];
        $host_e = pathinfo(parse_url($host, PHP_URL_PATH), PATHINFO_EXTENSION);
        $validHost = false;
        $error = '<div style="padding:30px;"><h2>your PageGrid license is invalid :(</h2><br><a style="text-decoration:underline;" title="Got to settings" href="' . $this->config->urls->admin . 'module/edit?name=FieldtypePageGrid&collapse_info=1">Enter license key</a></div>';

        if ($host == $licence_url) {
            $validHost = true;
        }

        if (substr($host, 0, 9) == 'localhost') {
            $validHost = true;
            $gumroad_array = true;
        }

        if ($host_e == 'test') {
            $validHost = true;
            $gumroad_array = true;
        }

        if ($host_e == 'dev') {
            $validHost = true;
            $gumroad_array = true;
        }

        if ($gumroad_array && $validHost) {
            return $renderMarkup;
        } else {

            $gumroad_array = wire('modules')->get('FieldtypePageGrid')->gumroad_licence($licence_key, 'pagegrid', 1);

            if ($gumroad_array) {
                return $renderMarkup;
            } else {
                $data = wire('modules')->getConfig('FieldtypePageGrid');
                $data['lkey'] = '';
                wire('modules')->saveConfig('FieldtypePageGrid', $data);
                return $error;
            }
        }
    }

    public function renderGrid($mainPage)
    {
        $backend = 0;
        $statusClass = '';

        $parentPage = $mainPage;

        $itemsParent = $this->pages->get('pg-' . $mainPage->id);

        if ($itemsParent->id) {
            $pagesToRender = $itemsParent->children();
        } else {
            return;
        }

        foreach ($mainPage->fields as $field) {
            if ($field->type instanceof FieldtypePageGrid) {
                $pg = $field;
            }
        }

        if (strpos(wire('page')->url, wire('config')->urls->admin) === 0) {
            $backend = 1;
        }

        if (isset($_GET['backend'])) {
            $backend = 1;
        } else {
            $backend = 0;
        }

        $layout = "";

        //SETTINGS
        $settings = '';
        include 'settings_page.php';
        // include 'settings_site.php';

        $lang = wire('user')->language;
        $label = 'label';

        //       if ( wire( 'user' )->language->title != 'default' ) {
        // $label = "label{$lang}";
        // }

        // init inline editor
        $edit = $this->modules->get('PageFrontEdit');
        $edit->ready($parentPage);
        $parentPage->edit(true);

        // END inline editor

        foreach ($pagesToRender as $p) {
            $layout .= $this->renderItem($p);
        }

        if ($backend) {

            $statusClass = '';

            if ($this->user->hasPermission('pagegrid-drag')) {
                $statusClass .= 'pg-sortable';
            }

            $out = '<div id="' . $itemsParent->name . '" class="pg-wrapper pg-main pg-drop pg ' . $this->getCssClasses($itemsParent) . ' ' . $statusClass . '" data-id="' . $itemsParent->id . '" data-field="' . $pg->name . '">' . $layout . '</div>';
        } else {
            $out = '<div class="pg-wrapper pg pg-main ' . $this->getCssClasses($itemsParent) . '">' . $layout . '</div>';
        }

        return $out;
    }

    public function renderHeader($p)
    {

        $backend = 0;
        $layout = "";
        $user = wire('user');

        if (strpos(wire('page')->url, wire('config')->urls->admin) === 0) {
            $backend = 1;
        }

        // create header
        $activeClass = "pg-open";
        $statusClass = "";
        $layoutTitle = $p->template->label ? $p->template->label : $p->template->name;

        // $lock = $p->meta()->pg_lock;

        // if (isset($lock) == 0 || $lock == 2) {
        //     $lock = 2;
        //     $statusClass .= " pg-locked-modal";
        // }

        // if ($lock == 0) {
        //     $statusClass .= " pg-unlocked";
        // }

        // if ($lock == 1) {
        //     $statusClass .= " pg-locked";
        // }

        if ($p->editable() == 0 || $user->hasPermission('page-pagegrid-edit', $p) == 0) {
            return;
        }

        if ($user->hasPermission('page-add', $p)) {
            $statusClass .= " pg-permission-add";
        }

        if ($user->hasPermission('page-create', $p)) {
            $statusClass .= " pg-permission-create";
        }

        if ($user->hasPermission('page-delete', $p)) {
            $statusClass .= " pg-permission-delete";
        }

        if ($user->hasPermission('page-clone', $p) && $user->hasPermission('page-create', $p)) {
            $statusClass .= " pg-permission-clone";
        }

        if ($p->is(Page::statusUnpublished))
            $statusClass .= " pg-unpublished";
        if ($p->is(Page::statusHidden))
            $statusClass .= " pg-hidden";
        if ($p->is(Page::statusLocked))
            $statusClass .= " pg-locked";

        $layout .= '<span id="pg-item-header-' . $p->id . '" data-id="' . $p->id . '" class="pg-item-header' . $statusClass . '">';
        $layout .= '<span>' . $layoutTitle . '</span>';
        $layout .= '<a class="pg-edit" title="' . $this->_('Edit') . '" data-url="./?id=' . $p->id . '&amp;modal=1" href="#"><i class="fa fa-pencil"></i></a>';
        $layout .= '<a class="pg-clone" data-template="' . $p->template->name . '" data-parent="' . $p->parent()->id . '"><i class="fa fa-fw fa-clone" data-name="fa-clone" title="Clone"></i></a>';
        if ($user->isSuperuser()) {
            $layout .= '<a class="pg-lock" title="' . $this->_('Make editable') . '" href="#"><i class="fa fa-lock"></i><i class="fa fa-unlock"></i></a>';
        }
        $layout .= '<a class="pg-delete" title="' . $this->_('Mark for deletion') . '" href="#"><i class="fa fa-trash"></i></a>';
        $layout .= '</span>';
        return $layout;
    }

    public function renderItem($p, $parent = null, $wrapper = true)
    {

        $parentPageId = (int) wire('input')->get('id');
        $user = wire('user');

        //on frontend $parentPageId is not defined, so set it again
        if ($parentPageId == 'undefined' || $parentPageId == null) {
            $parentPageId = wire('page')->id;
        }

        if (!empty($parent) && ($parent->id != 0)) {
            $parentPageId = $parent->id;
        }

        //force autonaming/puplishing for all children if only one template selected
        if (count($p->template->childTemplates) == 1) {
            $p->template->childNameFormat = 'pg-autotitle';
            $p->template->save();
        } else {
            $p->template->childNameFormat = '';
            $p->template->save();
        }
        //END force autonaming for all children if only one template selected

        //disable automatic prepending/appending of template file
        $p->template->noAppendTemplateFile = 1;
        $p->template->noPrependTemplateFile = 1;
        $p->template->appendFile = "";
        $p->template->prependFile = "";
        $p->template->save();
        //END automatic prepending/appending of template file

        $parentPage = wire('pages')->get($parentPageId);

        $backend = 0;

        if (strpos(wire('page')->url, wire('config')->urls->admin) === 0) {
            $backend = 1;
        }

        if (isset($_GET['backend'])) {
            $backend = 1;
        }

        $layout = '';
        $pg = $this->name;

        //get pagegrid fieldname and set config
        foreach ($parentPage->fields as $field) {
            if ($field->type instanceof FieldtypePageGrid) {

                // get the field in context of this template
                $pg = $field->name;
                //break the loop when work is done
                break;
            }
        }

        $layoutTitle = $p->template->label ? $p->template->label : $p->template->name;
        //            $layoutTitle = wireIconMarkup( $p->template->icon ) . ' ' . $p->title;
        $ext = "." . $this->config->templateExtension;
        $template_name = $p->template->altFilename ? basename($p->template->altFilename, $ext) : $p->template->name;
        // $templateFilename = $this->config->paths->templates . $pg->pathToTemplates . $template_name . $ext;
        $templateFilename = $this->config->paths->templates . 'blocks/' . $template_name . $ext;

        //if no template file return
        if (file_exists($templateFilename) == 0) {
            return false;
        }

        $parsedTemplate = new TemplateFile($templateFilename);
        $parsedTemplate->set("page", $p);
        $parsedTemplate->set("isAdmin", 1);
        $parsedTemplate->pageGrid = array('backend' => $backend, 'tag' => $this->getTagName($p->id, $parent));

        // force init inline editor markup
        if ($backend) {
            // hack: change name to reinit new children of groups after modal edit
            $oldName = $p->name;
            $p->setAndSave('name', $p->name . '-');
            $p->setAndSave('name', $oldName);

            $edit = $this->modules->get('PageGridFrontEdit');
            $edit->ready($p);
            $p->edit(true);
        }
        // END force init inline editor markup

        $imageUpload = '';
        $imageUploadEmpty = '';

        // insert uploader based on module PageGridEdit settings
        $PageGridFrontEdit = $this->modules->get('PageGridFrontEdit');

        if (isset($PageGridFrontEdit)) {

            if (isset($PageGridFrontEdit->inlineEditFieldsUpload)) {

                foreach ($PageGridFrontEdit->inlineEditFieldsUpload as $fieldId) {

                    $field = wire('fields')->get($fieldId);
                    if ($p->template->hasField($field)) {

                        if ($p->$field) {
                            $imageUploadEmpty = ' upload-notEmpty';
                        } else {
                            $imageUploadEmpty = ' upload-empty';
                        }

                        if ($p->$field == '') {
                            $imageUploadEmpty = ' upload-empty';
                        }

                        $imageUpload = '
                        <div class="setting pg-file-picker pg-file-picker-' . $field . ' pg-style-panel">
                          <div class="settings_wrap">
                            <div class="drop_target">
                              <div class="input_button"></div>
                                <input class="inputFile" type="file" data-field="' . $field . '" data-id="' . $p->id . '"/>
                                </div>
                            </div>
                        </div>
                        ';
                    }
                }
            }
        }
        //END insert uploader based on module PageGridEdit settings

        //Read item Settings
        $attributes = '';
        $nestedClasses = '';
        $groupMarkupOpen = '';
        $groupMarkupClose = '';

        // foreach ($p->meta()->pg_styles as $item) {
        //     $item['state'] = '';
        // }

        $itemData = $p->meta()->pg_styles;

        if (isset($itemData)) {
            if (isset($itemData['pgitem'])) {
                $PageGridItem = $itemData['pgitem'];

                if (isset($PageGridItem['attributes'])) {
                    $attributes = $PageGridItem['attributes'];
                    // bd($attributes);
                }
                if (isset($PageGridItem['children'])) {
                    $nestedClasses = 'pg pg-nested ';

                    if ($this->user->hasPermission('pagegrid-drag')) {
                        $nestedClasses .= 'pg-sortable ';
                    }

                    $groupMarkupOpen = '<div id="' . $p->name . '" class="pg ' . $this->getCssClasses($p, $parent) . '" data-id="' . $p->id . '" data-field="' . $pg->name . '">';
                    $groupMarkupClose = '</div>';
                }
            }
        }

        //end Read item Settings

        // add class for reffield
        $refField  = 0;

        foreach ($p->fields as $field) {
            if ($field->type instanceof FieldtypePage) {
                $refField = $field->name;
            }
        }

        if ($refField) {

            // get ref page and check if ist a pagegrid page
            $refPages = $p->$refField;

            if ($refPages) {
                // set to array if single object
                if (!is_array($refPages)) $refPages = array($refPages);

                foreach ($refPages as $refPage) {
                    if ($refPage->id) {
                        $refStyle = $refPage->meta()->pg_styles;
                        if (isset($refStyle)) {
                            $nestedClasses .= 'pg-ref ';
                        }
                    }
                }
            }
        }

        // END add class for reffield


        // END insert uploader
        $p->of(true);

        $statusClass = "";

        if ($p->editable() == 0) {
            $statusClass .= " pg-no-edit";
        }

        if ($user->hasPermission('page-pagegrid-edit', $p) == 0) {
            $statusClass .= " pg-no-edit";
        }

        if ($p->is(Page::statusUnpublished))
            $statusClass .= " pg-unpublished";
        if ($p->is(Page::statusHidden))
            $statusClass .= " pg-hidden";
        if ($p->is(Page::statusLocked))
            $statusClass .= " pg-locked";

        // add class for permisssions
        if (!($this->user->hasPermission('page-edit', $p))) {
            $statusClass .= " pg-locked";
        }

        if ($this->user->hasPermission('pagegrid-drag')) {

            $statusClass .= " pg-item-draggable";
        }

        if ($this->user->hasPermission('pagegrid-resize')) {

            $statusClass .= " pg-item-resizable";
        }

        if ($backend) {

            $parentPageId = (int) wire('input')->get('id');
            $pId = $p->id;

            $layout .= '<' . $this->getTagName($p->id, $parent) . ' id="' . $p->name . '" data-id="' . $p->id . '" class="' . $this->getCssClasses($p, $parent) . ' ' . $nestedClasses . $statusClass . $imageUploadEmpty . '" data-template="' . $p->template->name . '" data-field="' . $this->name . '" data-name="' . $p->name . '" ' . $attributes . '>';

            $layout .= $parsedTemplate->render() . $imageUpload;

            $layout .= '</' . $this->getTagName($p->id, $parent) . '>';

            if (!$wrapper) {
                $layout = $groupMarkupOpen . $parsedTemplate->render() . $groupMarkupClose . $imageUpload;
            }
        } else {
            $layout = '<' . $this->getTagName($p->id, $parent) . ' class="' . $nestedClasses . $this->getCssClasses($p, $parent) . '" ' . $attributes . '>' . $parsedTemplate->render() . '</' . $this->getTagName($p->id, $parent) . '>';

            if (!$wrapper) {
                $layout = $groupMarkupOpen . $parsedTemplate->render() . $groupMarkupClose;
            }
        }

        return $layout;
    }

    public function ___getConfigInputfields()
    {
        $inputfields = parent::___getConfigInputfields();
        include 'settings_site.php';
        return $inputfields;
    }

    // Methodes returns classnames and tagnames for rendering items in frontend + backend

    // get classes

    // get classes

    public function getCssClasses($item, $parent = null, $options = null)
    {


        $itemData = $item->meta()->pg_styles;
        $defaultClasses = 'pg-item ' . $item->name . ' ' . $item->template;
        $cssClasses = '';
        $backend = 0;

        if (strpos(wire('page')->url, wire('config')->urls->admin) === 0) {
            $backend = 1;
        }

        if ($options == 'parentClasses') {

            $defaultClasses = ' pg ' . $item->name . ' ' . $item->template;

            if ($backend) {
                $defaultClasses .= ' ui-droppable';
            }
        }


        if (isset($itemData)) {

            if (isset($itemData['pgitem'])) {
                if (!(empty($itemData['pgitem']['cssClasses']))) {
                    $cssClasses = $itemData['pgitem']['cssClasses'] . ' ';
                    $cssClasses = preg_replace('/\s+/', ' ', $cssClasses);
                }
            }
        }


        if ($options == 'addedClasses') {
            $Classes = $cssClasses;
        } else {
            $Classes = $cssClasses . $defaultClasses;
        }

        return $Classes;
    }

    //get tag name

    public function getTagName($item, $parent = null)
    {

        $itemPage =  wire('pages')->get($item);
        $tagName = 'div';
        $itemData = $itemPage->meta()->pg_styles;

        if (isset($itemData)) {
            if (isset($itemData['pgitem'])) {
                $tagName = $itemData['pgitem']['tagName'];
            }
        }

        // fix for groups changing tagname
        if ($itemPage->template->name == 'pg_group') {
            $tagName = 'div';
        }

        // bd($tagName);

        return $tagName;
    }
    // END callable Methodes -------------------------------

    //add scripts with same name as block file

    public function scripts($mainPage)
    {
        $lastItem = null;
        $jsFiles = "";

        if ($mainPage->id) {
        } else {
            return;
        }

        $itemsParent = $this->pages->get('pg-' . $mainPage->id);

        if ($itemsParent->id) {
            // mainPage has pg field and items
            $items = $itemsParent->find('');
        } else {
            // mainPage has no pg field
            $items = $mainPage->find('');
            $items->add($mainPage);
        }

        // page ref
        $refField  = 0;

        foreach ($items as $item) {
            foreach ($item->fields as $field) {
                if ($field->type instanceof FieldtypePage) {
                    $refField = $field->name;
                }
            }

            if ($refField) {

                // get ref page
                $refPages = $item->$refField;

                if ($refPages) {
                    // set to array if single object
                    if (!is_array($refPages)) $refPages = array($refPages);

                    foreach ($refPages as $refPage) {
                        if ($refPage->id) {
                            $items->add($refPage);

                            foreach ($refPage->find('') as $refChild) {
                                $items->add($refChild);
                            }
                        }
                    }
                }
            }
        }

        // END page ref

        foreach ($items as $item) {
            $filename = wire('config')->paths->templates . 'blocks/' . $item->template->name . '.js';
            $filenameUrl = wire('config')->urls->templates . 'blocks/' . $item->template->name . '.js';

            if ($item->template->name !== $lastItem && file_exists($filename)) {
                $jsFiles .= '<script type="text/javascript" src="' . $filenameUrl . '"></script>';
                $lastItem = $item->template->name;
            }
        }

        echo $jsFiles;
    }

    public function renderStyles($p, $id = 0)
    {

        $css = '';
        $items = $p->meta()->pg_styles;
        $backend = 0;

        if ($id) {
            $items = [];
            $items[$id] = $p->meta()->pg_styles[$id];
        }

        if (isset($_GET['backend'])) {
            $backend = 1;
        }

        if (strpos(wire('page')->url, wire('config')->urls->admin) === 0) {
            $backend = 1;
        }

        if (isset($items) == 0) {
            return;
        }

        //if page is item container skip parent selector
        $rootEl = 0;
        if ($p->template->name == 'pg_container' && $p->parent()->name !== 'pg-classes') {
            $rootEl = 1;
        }
        //END if page is item container skip parent selector

        foreach ($items as $item) {


            if (isset($item['breakpoints']) == 0) {
                return;
            }

            //to be able to replace style tag in backend
            if ($backend) {

                $cssId = $item['id'];

                // if pgitem allways use page name
                // do not save page name in item to be able to change page name later
                if ($item['id'] == 'pgitem') {
                    $cssId = $p->name;
                    // $item['id'] = $p->name;
                } elseif ($item['id'] == 'pgitem:hover') {
                    $cssId = $p->name . ':hover';
                } else {
                    $cssId = $p->name . $item['id'];
                }

                $globalClass = '';
                if ($p->parent()->name == 'pg-classes') {
                    $globalClass = 'pg-global';
                    //add g- prfix for global classes to make unique id
                    $cssId = 'g-' . $cssId;
                }

                $css .= '<style class="pg-style pg-style-id-' . $cssId . ' ' . $globalClass . '">';
            }


            // add hover only if device supports it
            if (isset($item['state'])) {

                if ($item['state'] == 'hover') {
                    $css .= '@media (hover: hover), (-ms-high-contrast:none) { ';
                }

                //if set to none remove value (fix for older version)
                if ($item['state'] == 'none') {
                    $item['state'] = '';
                }
            }

            foreach ($item['breakpoints'] as $breakpoint) {

                //if no css continue to next
                if (empty($breakpoint['css'])) {
                    continue;
                }

                if (!($breakpoint['name'] == 'base') && !($breakpoint['name'] == 's') && $backend == 0) {
                    $css .= $breakpoint['size'] . '{ ';
                }

                if (!($breakpoint['name'] == 'base') && !($breakpoint['name'] == 's') && $backend) {
                    $css .= '.breakpoint-' . $breakpoint['name'] . ' ';
                }

                // breakpoint s is more specific
                if ($breakpoint['name'] == 's' && $backend == 0) {
                    $css .= $breakpoint['size'] . '{ html ';
                }

                if ($breakpoint['name'] == 's' && $backend) {
                    $css .= ' html .breakpoint-' . $breakpoint['name'] . ' ';
                }

                if (isset($item['cssClass'])) {

                    //if no cssClass use page name
                    if ($item['cssClass'] == '') {
                        $item['cssClass'] = $p->name;
                    }

                    if ($item['id'] == 'pgitem:hover') {
                        $item['cssClass'] = $p->name . ':hover';
                    }

                    //force parent class if class is not page name (subitem)
                    if ($item['id'] !== 'pgitem' && $item['id'] !== 'pgitem:hover' && $rootEl == 0) {
                        if ($item['id'] == strtolower($item['tagName']) || $item['id'] == strtolower($item['tagName']) . ':hover') {
                            $item['cssClass'] = $p->name . ' ' . $item['id'];
                        } else {
                            $item['cssClass'] = $p->name . ' .' . $item['id'];
                        }
                    }
                    //END force parent class if class is not page name (subitem)

                    if ($item['cssClass'] == strtolower($item['tagName'])) {
                        $css .= strtolower($item['tagName']) . '{ ';
                    } else {
                        $css .= '.' . $item['cssClass'] . '{ ';
                    }
                }

                foreach ($breakpoint['css'] as $style => $val) {
                    $css .= $style . ': ' . $val . '; ';
                }

                $css .= ' } ';

                if (!($breakpoint['name'] == 'base') && $backend == 0) {
                    $css .= ' } ';
                }
            }

            if (isset($item['state'])) {
                if ($item['state'] == 'hover') {
                    $css .= ' } ';
                }
            }

            //to be able to replace style tag in backend
            if ($backend) {
                $css .= '</style>';
            }
        }

        return $css;
    }

    public function fonts($p, $pgField = 0)
    {

        $items = json_encode($p->meta()->pg_styles);
        $items = json_decode($items, false); //convert to object
        $fonts = '';
        $font = '';

        if (isset($items) == 0) {
            return;
        }

        foreach ($items as $item) {

            if (isset($item->breakpoints) == 0) {
                return;
            }

            foreach ($item->breakpoints as $breakpoint) {
                foreach ($breakpoint->css as $style => $val) {
                    if ($style == 'font-family') {

                        $fontWeight = '';
                        $fontStyle = '';

                        foreach ($breakpoint->css as $style2 => $fvariant) {
                            if ($style2 == 'font-weight') {
                                $fontWeight = ':wght@' . $fvariant;
                            } else {
                                $fontWeight = ':wght@400';
                            }
                            if ($style2 == 'font-style') {
                                $fontStyle = $fvariant;
                            }
                        }

                        // get local fonts
                        $localFontNames = '';
                        if ($pgField) {
                            if ($pgField->fontNames) {
                                $localFonts = str_replace(' ', '', $pgField->fontNames);
                                $localFonts = explode(',', $localFonts);

                                foreach ($localFonts as $localFont) {
                                    $fontExt = '.' . pathinfo($localFont, PATHINFO_EXTENSION);
                                    $localFontNames .= str_replace($fontExt, '', $localFont) . ',';
                                }
                            }
                        }

                        // skip google font loading for these fonts
                        $systemFontsString = 'Arial,Helvetica+Neue,Courier+New,Times+New+Roman,Comic+Sans+MS,Verdana,Impact,' . $localFontNames;
                        $systemFontsString = trim($systemFontsString);
                        $systemFonts = explode(',', $systemFontsString);

                        // $fontName = strstr( $val, ',', true );
                        $fontName = preg_replace('/\s+/', '+', $val);
                        $fontName = str_replace('"', "", $fontName);

                        if ($fontName !== '') {
                            $font = $fontName . $fontWeight . $fontStyle;
                        }

                        foreach ($systemFonts as $systemFont) {
                            if ($fontName == $systemFont) {
                                $font = "";
                            }
                        }

                        if ($fonts !== '' && $font !== '' && strpos($val, ',') == false) {
                            $fonts .= '|';
                        }

                        //add font only if it is single value and has no comma list
                        if (strpos($val, ',') == false) {
                            $fonts .= $font;
                        }
                    }
                }
            }
        }

        $googleFonts = '';

        if ($fonts !== '') {
            // load Google font or privacy friendly alternative
            // https://github.com/coollabsio/fonts
            if ($pgField->fontPrivacy) {
                $googleFonts = '<link rel="stylesheet" type="text/css" href="https://api.fonts.coollabs.io/css2?family=' . $fonts . '&display=swap">';
            } else {
                $googleFonts = '<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=' . $fonts . '&display=swap">';
            }
        }

        return $googleFonts;
    }

    public function styles($mainPage, $fieldName = 0, $loadGlobalClasses = 1, $loadFiles = 1, $loadFonts = 1)
    {

        // bd($mainPage);
        $itemCss = '';
        $cssBackend = '';
        $backend = 0;
        $lastItem = 0;
        $cssTemplates = '';
        $defaults = '';
        $fonts = '';
        $cssMainPage = '';
        $pgField = 0;

        // page array to hold items to load files
        $itemsArray = new PageArray();

        if ($mainPage->id) {
        } else {
            return;
        }

        $itemsParent = $this->pages->get('pg-' . $mainPage->id);

        if ($itemsParent->id) {
            // mainPage has pg field and items
            $items = $itemsParent->find('');
        } else {
            // mainPage has no field and items
            $items = $mainPage->find('');
        }

        if (isset($_GET['backend'])) {
            $backend = 1;
        }

        //load backend css only if rendering page with pg field
        if ($backend && $itemsParent->id) {
            $cssBackendUrl = wire('config')->urls->InputfieldPageGrid . "css/main.css";
            $cssBackend = '<link rel="stylesheet" type="text/css" href="' . $cssBackendUrl . '">';
        }

        //add global page for custom classes
        if ($loadGlobalClasses) {
            $globalClasses = $this->pages->get('pg-classes');

            foreach ($globalClasses->find('') as $class) {
                $itemsArray->add($class);
            }
        }

        // render wrapper styles 
        $cssMainPage = $this->renderStyles($mainPage);

        //render defaults if mainpage has pg field and field name not set
        if ($fieldName == 0) {
            //get pg field name
            $mainPageTemplate = $mainPage->template;

            //get pagegrid fieldname and set config
            foreach ($mainPage->fields as $field) {
                if ($field->type instanceof FieldtypePageGrid) {

                    // get the field in context of this template
                    $pgField = $mainPageTemplate->fieldgroup->getField($field->name, $useFieldgroupContext = true);

                    include 'pg-style.php';
                    $defaults = renderStylesDefault($pgField);

                    //break the loop when work is done
                    break;
                }
            }
        }

        // if no page with field found check if field name is set to load defaults
        if ($fieldName) {
            $pgField = wire('fields')->get($fieldName);
            if ($pgField->id) {
                if ($pgField->type instanceof FieldtypePageGrid) {
                    include 'pg-style.php';
                    $defaults = renderStylesDefault($pgField);
                }
            }
        }
        // END render wrapper styles and defaults if mainpage is defined

        //add parent container styles
        if ($itemsParent->id) {
            $itemsArray->add($itemsParent);
        } else {
            $itemsArray->add($mainPage);
        }

        foreach ($items as $item) {

            $itemsArray->add($item);

            // handle reference fields
            $refField  = 0;

            foreach ($item->fields as $field) {
                if ($field->type instanceof FieldtypePage) {
                    $refField = $field->name;
                }
            }

            if ($refField) {

                // get ref page
                $refPages = $item->$refField;

                if ($refPages) {
                    // set to array if single object
                    if (!is_array($refPages)) $refPages = array($refPages);

                    if (count($refPages)) {
                        foreach ($refPages as $refPage) {
                            if ($refPage->id) {
                                $itemsArray->add($refPage);
                                foreach ($refPage->find('') as $refChild) {
                                    $itemsArray->add($refChild);
                                }
                            }
                        }
                    }
                }
            }
            // END handle reference fields

        }

        foreach ($itemsArray as $item) {

            //load template file children
            if ($loadFiles) {
                $filename = wire('config')->paths->templates . 'blocks/' . $item->template->name . '.css';
                $filenameUrl = wire('config')->urls->templates . 'blocks/' . $item->template->name . '.css';

                if ($item->template->name !== $lastItem && file_exists($filename)) {
                    $cssTemplates .= '
    <link rel="stylesheet" type="text/css" href="' . $filenameUrl . '">';
                    $lastItem = $item->template->name;
                }
            }

            //render item css
            $itemCss .= $this->renderStyles($item);

            //render google fonts
            if ($loadFonts) {
                $fonts .= $this->fonts($item, $pgField);
            }
        }

        //backend already returns multiple style tags for easy replacement
        if (!$backend) {
            $itemCss = '<style class="pg-style pg-style-items">' . $cssMainPage . $itemCss . '</style>';
        } else {
            $itemCss = $cssMainPage . $itemCss;
        }

        return $cssTemplates . $cssBackend . $defaults . $fonts . $itemCss;
    }



    public function renderOptions($options = null)
    {
        $renderOptions = '';
        $backend = 0;

        if (strpos(wire('page')->url, wire('config')->urls->admin) === 0 || isset($_GET['backend'])) {
            $backend = 1;
        }

        if ($backend) {

            if (isset($options["children"])) {
                $renderOptions = 'data-pg-children';
            }

            if (isset($options["tag"]) && isset($options["pageId"])) {

                if (isset(wire('config')->pgRef)) {
                    $parent = wire('config')->pgRef;
                    $tag = $this->getTagName($options["pageId"], $parent);
                } else {
                    $tag = $this->getTagName($options["pageId"]);
                }

                if ($tag == 'div' || $tag == 'DIV') {
                    $renderOptions .= 'data-pg-tagName="h2" data-pg-tags="h1 h2 h3 h4 h5 h6 p"';
                }
            }
            // needs span instead of div to work inside p tags
            echo '<span class="pg-data"' . $renderOptions . '></span>';
        }
    }


    /**
     * Set a property to this Inputfield
     * 
     * @param string $key
     * @param mixed $value
     * @return $this
     *
     */
    public function set($key, $value)
    {
        if ($key == 'template_id' && $value) {
            // convert template_id to $this->rowTemplates array
            if (!is_array($value)) $value = array($value);
            foreach ($value as $id) {
                $template = $this->wire('templates')->get($id);
                if ($template) $this->rowTemplates[$id] = $template;
            }
            return $this;
        } else {
            return parent::set($key, $value);
        }
    }
}
