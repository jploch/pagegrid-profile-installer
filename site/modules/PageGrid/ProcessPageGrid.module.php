<?php

/**
 * PageGrid for ProcessWire
 * 
 * Copyright (C) 2022 by Jan Ploch
 * THIS IS A COMMERCIAL MODULE - DO NOT DISTRIBUTE
 */

class ProcessPageGrid extends Process
{

    public static function getModuleinfo()
    {
        return [
            'title' => 'PageGrid Process',
            'summary' => 'Process Module for PageGrid',
            'href' => 'https://processwire.com/talk/topic/17709-how-to-create-custom-admin-pages-aka-processmodules-yes-its-that-simple/',
            'author' => 'Jan Ploch',
            'icon' => 'th',
            'requires' => array('FieldtypePageGrid'),
            'installs' => array('FieldtypePageGrid', 'InputfieldPageGrid', 'PageGridFrontEdit'),
            'version' => 1,

            // page that you want created to execute this module
            'page' => [
                'name' => 'pagegrid', // your page will be online at /youradmin/setup/customadmin/
                'parent' => 'admin',
                'title' => 'PageGrid Process',
                'status' => 'hidden'
            ],

            'permission' => 'pagegrid-process',
        ];
    }

    // all PW vars in modules must have $this-> before, example: $this->page or wire( 'page' )

    public function ___execute()
    {

        //        $this->error( "processing ajax" );
        $this->log->save("pagegrid", "processing ajax...");

        if (!$this->config->ajax) {
            $this->error("error non ajax!");

            $this->log->save("pagegrid", "error non ajax!");
            return ("Request must be via AJAX");
        }

        $pageId = isset($_POST['pageId']) ? $this->sanitizer->int($_POST['pageId']) : '';
        $parentId = isset($_POST['parentId']) ? $this->sanitizer->int($_POST['parentId']) : '';
        $templateId = isset($_POST['templateId']) ? $this->sanitizer->text($_POST['templateId']) : '';
        $pgField = isset($_POST['pgField']) ? $this->sanitizer->text($_POST['pgField']) : '';
        $field_name = isset($_POST['field_name']) ? $_POST['field_name'] : '';
        $clone = isset($_POST['clone']) ? $_POST['clone'] : '';
        $removeId = isset($_POST['removeId']) ? $this->sanitizer->text($_POST['removeId']) : '';
        $mainPageId = isset($_POST['mainPageId']) ? $this->sanitizer->int($_POST['mainPageId']) : '';
        $data = isset($_POST['data']) ? $_POST['data'] : '';
        $type = isset($_POST['type']) ? $_POST['type'] : '';

        $this->log->save("pagegrid", "type: " . $type);

        // lock/unlock page
        if ($type === 'lock') {
            $data = json_decode($data, true);

            if (isset($pageId) && $pageId != 0) {
                $settingsPage = $this->pages->get($pageId);
            } else {
                return false;
            }

            if ($data == 1) {
                // bd('totalLock');
                $settingsPage->addStatus(Page::statusLocked);
            } else {
                $settingsPage->removeStatus(Page::statusLocked);
            }

            $settingsPage->meta()->set('pg_lock', $data);
            $settingsPage->save();
        }

        // save item settings
        if ($type === 'save') {

            if (empty($data)) {
                return false;
            }
            if (isset($pageId) && $pageId != 0) {
                $settingsPage = $this->pages->get($pageId);
            } else {
                return false;
            }

            // get data 
            $dataItem = json_decode($data, true);

            //create page for class if not already
            if ($settingsPage->name == 'pg-classes') {

                $className = $dataItem['cssClass'];
                $parentID = $settingsPage->id;
                $settingsPage = $this->pages->findOne("name=$className, template=pg_container, include=all, has_parent=$parentID");

                // bd($settingsPage->name);

                if ($settingsPage->id) {
                    // bd('class exists');
                } else {
                    // bd('create new class');
                    $settingsPage = new Page(); // create new page object
                    $settingsPage->template = 'pg_container'; // set template
                    $settingsPage->parent = 'pg-classes'; // set the parent
                    $settingsPage->name = $className; // give it a name used in the url for the page
                    $settingsPage->title = $className; // set page title (not neccessary but recommended)
                    // $settingsPage->addStatus(Page::statusHidden);
                    $settingsPage->save();
                }
            }

            $dataArray = $settingsPage->meta()->pg_styles;

            if (isset($dataArray) == 0) {
                $dataArray = [];
            }

            $dataArray[$dataItem['id']] = $dataItem;

            //save data to page meta
            $settingsPage->meta()->set('pg_styles', $dataArray);
            $settingsPage->meta()->set('pg_field', $pgField);
            $settingsPage->meta()->set('pg_page', $mainPageId);

            // bd($settingsPage);

            // bd('save:');
            // bd($settingsPage->meta()->pg_styles);
        }
        // END save item settings

        // change parent
        if (!empty($_POST['newParent'])) {

            // bd('parent change');

            $p = $this->pages->get($_POST['pageId']);
            $newParent = $this->pages->get($_POST['newParent']);
            $p->of(false);
            $p->parent = $newParent;
            $p->save();

            return;
        }
        // END change parent

        // change sort order of groups, sort must be pipe seperated string
        if (!empty($_POST['sort'])) {

            $sort = $_POST['sort'];
            $ids = explode('|', $sort);
            $i = 0;

            foreach ($ids as $id) {
                $i++;
                $p = $this->pages->get($id);
                $this->pages->sort($p->parent, true);
                // re-build sort values for children of $page, removing duplicates and gaps
                $this->pages->sort($p, $i);
            }

            return;
        }
        // END change sort order of groups

        if ($type === 'delete' && !empty($removeId)) {
            $p = $this->pages->get($removeId);
            $p->trash();
            $this->log->save("pagegrid", "page removed: " . $removeId);
            return;
        }

        if ($type === 'clone' && !empty($_POST['pageId'])) {

            $markupHeader = '';

            $p = $this->pages->get($pageId);
            $newPages = array();
            $clone = $this->pages->clone($p);

            $templateName = str_replace('_', '-', $p->template->name);
            $clone->setAndSave('name', $templateName . '-' . $clone->id);
            $clone->setAndSave('title', $templateName . '-' . $clone->id);
            $newPages[$p->name] = $clone->name;

            //add header and css for clone
            $markupHeader = $this->modules->get('InputfieldPageGrid')->renderHeader($clone);
            $css = $this->modules->get('InputfieldPageGrid')->renderStyles($clone);

            // rename children, for unique ID and add child header
            foreach ($clone->find('') as $cloneChild) {
                $oldName = $cloneChild->name;
                $templateName = str_replace('_', '-', $cloneChild->template->name);
                $cloneChild->setAndSave('name', $templateName . '-' . $cloneChild->id);
                $cloneChild->setAndSave('title', $templateName . '-' . $cloneChild->id);
                $newPages[$oldName] = $cloneChild->name;
                $markupHeader .= $this->modules->get('InputfieldPageGrid')->renderHeader($cloneChild);
                $css .= $this->modules->get('InputfieldPageGrid')->renderStyles($cloneChild);
            }


            $response = array(
                'markupHeader' => $markupHeader,
                'markup' => $this->modules->get('InputfieldPageGrid')->renderItem($clone),
                'css' => $css,
                'newPages' => $newPages
            );

            //            return( json_encode( $newPages ) );

            return (json_encode($response));
        }

        if ($type === 'add') {

            // create new page
            $p = new Page();
            $template =  $this->templates->get($templateId);
            $parent = $this->pages->get($parentId);

            // bd($parent);

            $p->template = $template->name;
            $p->parent = $parent;

            $p->save();
            $p->setOutputFormatting(false);

            $p->save();

            $insertAfter = $this->sanitizer->int($_POST['insertAfter']);

            if (isset($insertAfter) && $insertAfter != 0) {
                $afterP = $this->pages->get($insertAfter);
                $this->pages->insertBefore($p, $afterP);
            }

            // set title after save to get unique id
            $templateName = str_replace('_', '-', $template->name);
            $p->setAndSave('title', $templateName . '-' . $p->id);
            $p->setAndSave('name', $templateName . '-' . $p->id);

            // prefil inline fields with dummy content
            $PageFrontEditData = wire('modules')->getConfig('PageGridFrontEdit');
            $placeholder = $this->sanitizer->text($PageFrontEditData['placeholderText']);

            if (isset($PageFrontEditData['inlineEditFields'])) {
                $PageFrontEditFields = $PageFrontEditData['inlineEditFields'];
                foreach ($PageFrontEditFields as $fieldId) {
                    $field = wire('fields')->get($fieldId);
                    if ($p->template->hasField($field)) {
                        if ($field->inputfieldClass == 'InputfieldCKEditor') {
                            $p->setAndSave($field->name, '<p>' . $placeholder . '</p>');
                        } else {
                            $p->setAndSave($field->name, $placeholder);
                        }
                    }
                }
            }
            //END prefil inline fields with dummy content


            $response = array(
                'newPageClass' =>  $p->title,
                'markupHeader' =>  $this->modules->get('InputfieldPageGrid')->renderHeader($p),
                'markup' => $this->modules->get('InputfieldPageGrid')->renderItem($p)
            );

            return (json_encode($response));
        }

        // handel uploads
        if ($type === 'upload' && !empty($pageId)) {

            $p = $this->pages->get($pageId);

            if ($p->hasField($field_name)) {
                $fileField = $p->$field_name;
            }

            if ($fileField) {
                $fileField->deleteAll();
                $filePath = (string) $fileField->path();
            }

            if (!($fileField)) {
                // add custom path
                $filePage = $this->pages->get($pageId);
                $filePath = $filePage->filesManager->path;
                $fileRelativePath = $filePage->filesUrl();
            }

            $u = new WireUpload('preview_name');
            $u->setMaxFiles(1);
            $u->setOverwrite(false);
            //            $filePath = ( string ) $fileField->path();
            $u->setDestinationPath($filePath);

            $u->setValidExtensions(array('jpg', 'jpeg', 'gif', 'png', 'svg', 'mp4'));
            foreach ($u->execute() as $filename) {

                if ($fileField) {
                    $fileField->add($filename);
                } else {
                    if (move_uploaded_file($filename, $filePath)) {
                        return $fileRelativePath . $filename;
                    } else {
                        return $fileRelativePath . $filename;
                    }
                }
            }

            $this->log->save("pagegrid", $filePath);

            $p->save();
        }
        //excude end
    }

    /**
     * Save the page via Ajax for modal and update PageGrid
     * we don't use ProcessPageEdit::ajaxSave() as it doesn't seem to work with language fields
     * so we use some technic to build the form and process it like ProcessPageEdit does with a regular save
     *
     * @return json array with status of save with messages
     */
    public function executeAjaxSave()
    {

        if (count($_POST)) {

            // bd($_POST);

            $this->pageId = (int) $this->input->post("id");
            $this->pageContext = $this->pages->get($this->pageId);
            $this->pageContext->setTrackChanges(true); // not sure this is needed, what does it do? Leftover from AutoSave?

            $this->pageEdit = $this->modules->get("ProcessPageEdit");

            $form = $this->buildForm();
            $this->processInput($form);

            $this->pageContext->save();

            if (count($form->getErrors())) $errors = true;
            else $errors = false;

            $message = array();
            if (!$errors) {
                $message['error'] = false;
                $message['message'] = $this->_("Saved");
                // return json_encode($message);
            } else {
                $message['error'] = true;
                $message['message'] = $this->_("Saved but with errors...");
                // get errors for showing and clear them, so they don't stack (true)
                $message['errors'] = $form->getErrors(true);
                // return json_encode($message);
            }

            // return markup
            $p = $this->pageContext;
            if ($p->id) {

                //get parent markup to be able to show new children
                $parent = $p->parent();
                if ($parent->template->name !== 'pg_container' && $parent->template->name !== 'admin') {
                    $p = $parent;
                }

                $headerToRender = $p->find('');
                $renderMarkup = $this->modules->get('InputfieldPageGrid')->renderHeader($p);

                foreach ($headerToRender as $item) {
                    $renderMarkup .= $this->modules->get('InputfieldPageGrid')->renderHeader($item);
                };

                $response = array(
                    'newPageClass' =>  $p->name,
                    'markupHeader' =>  $renderMarkup,
                    'markup' => $this->modules->get('InputfieldPageGrid')->renderItem($p),
                    'message' => $message
                );

                // bd($response);

                return (json_encode($response));
            }
        }
    }

    /*
     * Borrowed from Fredi front end edit
     *
     * This method is simplified version of /wire/modules/process/ProcessPageEdit.module processInput() method
     *
     * First process the input, then loops through all the form fields, set page field values and finally saves the page
     *
     * If field is wrapper, then iterates (this case only with full page save)
     *
     */
    public function ___processInput(Inputfield $form, $level = 0)
    {

        $form->setTrackChanges(true);

        if (!$level) $form->processInput($this->input->post);

        // Loop all the elements on the form
        foreach ($form->children as $field) {
            // Process their values
            $field->setTrackChanges(true);

            if (wire('languages') && $field->useLanguages) {
                $v = $this->pageContext->get($field->name);
                if (is_object($v)) {
                    $v->setFromInputfield($field);
                    $this->pageContext->set($field->name, $v);
                    $this->pageContext->trackChange($field->name);
                }
            } else {
                // prevent page status being changed for autosave
                // or it will publish unpublished pages
                if ($field->name == "status") continue;
                $this->pageContext->set($field->name, $field->value);
            }

            if ($field instanceof InputfieldWrapper && count($field->getChildren())) $this->processInput($field, $level + 1);
        }
    }

    /**
     * build the form for saving
     * @return InputfieldWrapper the form with fields
     */
    public function buildForm()
    {
        $form = $this->modules->get('InputfieldForm');
        $form = $this->pageEdit->buildForm($form);
        return $form;
    }
}