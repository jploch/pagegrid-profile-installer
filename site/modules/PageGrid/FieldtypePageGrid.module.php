<?php

namespace ProcessWire;

/**
 * PageGrid for ProcessWire
 * 
 * Copyright (C) 2022 by Jan Ploch
 * THIS IS A COMMERCIAL MODULE - DO NOT DISTRIBUTE
 */

class FieldtypePageGrid extends FieldtypeMulti implements Module, ConfigurableModule
{

  public static function getModuleInfo()
  {

    return array(
      'title' => __('PageGrid'), // Module Title
      'summary' => __('Commercial module that renders PageTable entries as CSS Grid and adds drag and drop functionality in admin', __FILE__), // Module summary
      'version' => 001,
      'author' => 'Jan Ploch',
      'icon' => 'th',
      'installs' => array('InputfieldPageGrid', 'ProcessPageGrid', 'PageGridFrontEdit'),
      'autoload' => 'template=admin',
      'permissions' => array(
        'pagegrid-process' => 'Allow PageGrid to process ajax calls',
        'page-pagegrid-edit' => 'Edit PageGrid items in modal',
        'pagegrid-drag' => 'Drag grid items',
        'pagegrid-resize' => 'Resize grid items',
        'pagegrid-style-panel' => 'Enable styling of PageGrid items',
        'pagegrid-add' => 'Use the sidebar to drag new items into the page (also needs pagegrid-drag permission to work)',
      ),
    );
  }

  public function install()
  {

    $fs = wire('fields');
    $adminPageUrl = wire('config')->url('admin');
    $adminPage = wire('pages')->get($adminPageUrl);

    // create page to hold items
    $p = wire('pages')->findOne("name=pg-items, template=pg_container, include=hidden");

    if ($p->id) {
      // page already exists

    } else {
      // page needs to be created
      $titleField = $fs->get('title');

      // fieldgroup for template
      $fg = new Fieldgroup();
      $fg->name = 'pg_container';
      $fg->add($titleField);
      $fg->save();

      $t = new Template();
      $t->name = 'pg_container';
      $t->fieldgroup = $fg; // add the field group
      // $t->flags = 8; // system template, to prevent use in backend, but also hides contaier permissions :(
      $t->noParents = -1; //allow one more (2 pages can use this template)
      $t->save();

      $p = new Page(); // create new page object
      $p->template = 'pg_container'; // set template
      $p->parent = $adminPage; // set the parent
      $p->name = 'pg-items'; // give it a name used in the url for the page
      $p->title = 'PageGrid Items'; // set page title (not neccessary but recommended)
      $p->addStatus(Page::statusHidden);
      $p->save();
    }
    // END create page to hold items  

    // create page to hold classes
    $p = wire('pages')->findOne("name=pg-classes, template=pg_container, include=hidden");

    if ($p->id) {
      // page already exists

    } else {
      $p = new Page(); // create new page object
      $p->template = 'pg_container'; // set template
      $p->parent = $adminPage; // set the parent
      $p->name = 'pg-classes'; // give it a name used in the url for the page
      $p->title = 'PageGrid Classes'; // set page title (not neccessary but recommended)
      $p->addStatus(Page::statusHidden);
      $p->save();
    }
    // END create page to hold classes  

    //create editor role

    //add permissions
    $erole = $this->roles->add("pagegrid-editor");
    $erole->addPermission("page-view");
    $erole->addPermission("page-edit");
    // $erole->addPermission("page-sort");
    $erole->addPermission("profile-edit");

    $permission = $this->permissions->add("pagegrid-edit-front");
    $permission->title = 'Use the front-end page editor';
    $permission->save();
    $erole->addPermission($permission->name);

    $permission = $this->permissions->add("pagegrid-process");
    $permission->title = 'Allow PageGrid to process ajax calls';
    $permission->save();
    $erole->addPermission($permission->name);

    $erole->save();

    $grole = $this->roles->get('guest');

    // add template permissions fpr pg container
    $etemplate = $this->templates->get("pg_container");

    $addRoles = $etemplate->get("addRoles");
    $addRoles[] = $erole->id;

    $editRoles = $etemplate->get("editRoles");
    $editRoles[] = $erole->id;

    $createRoles = $etemplate->get("createRoles");
    $createRoles[] = $erole->id;

    $etemplate->useRoles = 1;
    $etemplate->set("roles", array($grole->id, $erole->id));
    // $etemplate->set("addRoles", $addRoles);
    $etemplate->set("editRoles", $editRoles);
    // $etemplate->set("createRoles", $createRoles);
    $etemplate->save();

    $htemplate = $this->templates->get('home');
    if ($htemplate) {
      $editRoles = $htemplate->get("editRoles");
      $editRoles[] = $erole->id;
      $htemplate->set("editRoles", $editRoles);
      $htemplate->save();
    }

    //END create editor role

  }

  public function uninstall()
  {
    $t = $this->templates->get('pg_container');
    $fg = $this->fieldgroups->get('pg_container');
    $p = wire('pages')->findOne("name=pg-items, include=hidden");
    $p2 = wire('pages')->findOne("name=pg-classes, include=hidden");

    if ($p->id && count($p->children()) == 0) {
      $p->delete();
    }

    if ($p2->id && count($p2->children()) == 0) {
      $p2->delete();
    }

    if ($t && $t->getNumPages() > 0) {
      $this->message("Can't delete template pg_container, because it's been used by some pages.");
    } else {
      $this->message("Remove PageGrid Page and Template");
      if ($t) {
        $t->flags = Template::flagSystemOverride; // remove flasg system template, to be able to delete
        $t->flags = 0; // remove flasg system template, to be able to delete
        $t->save();
        wire('templates')->delete($t);
      }
      if ($fg) {
        wire('fieldgroups')->delete($fg);
      }
    }

    //delete role
    if ($this->roles->get('pagegrid-editor')->id) {
      $this->roles->delete($this->roles->get('pagegrid-editor'));
    }
  }

  public function init()
  {
    // add user role as class to body
    $this->addHookAfter('AdminTheme::getExtraMarkup', function ($event) {
      $theme = $event->object;
      $user = $this->user;
      $theme->addBodyClass("template-{$this->pages->get((int) wire('input')->get('id'))->template}");
      foreach ($user->roles as $role) {
        $theme->addBodyClass("role-{$role->name}");
      }
      if (!$user->isSuperuser()) $theme->addBodyClass("role-nonsuperuser");
      $theme->addBodyClass("user-{$user->name}");
      if ($user->hasPermission('pagegrid-add')) {
        $theme->addBodyClass("permission-pagegrid-add");
      }

      //add active breakpoint classes
      $theme->addBodyClass('breakpoint-base');
    });
  }


  public function ready()
  {

    $this->addHookBefore('Pages::cloned', function (HookEvent $event) {
      // set this var for page added hook, to disable copy from page template feature
      $this->clonePage = true;
    });

    $this->addHookAfter('Pages::cloneReady', function (HookEvent $event) {
      // set this var for page added hook, to disable copy from page template feature
      $this->clonePage = true;
    });

    $this->addHookAfter('Pages::cloned', function (HookEvent $event) {
      static $clonedIDs = array();

      $this->clonePage = true;

      $pages = $event->wire('pages');
      $page = $event->arguments(0);
      $copy = $event->arguments(1);


      foreach ($copy->template->fieldgroup as $field) {

        if (!$field->type instanceof FieldtypePageGrid) continue;
        $itemsParent = $pages->get('pg-' . $page->id);
        if ($itemsParent->id) {
          $cloneItemsParent = $pages->clone($itemsParent);
          $cloneItemsParent->setAndSave('name', 'pg-' . $copy->id);
          $cloneItemsParent->setAndSave('title', $copy->title . ' items');

          foreach ($cloneItemsParent->find('') as $clone) {
            $newName = $clone->template->name . '-' . $clone->id;
            // bd($newName);
            $clone->setAndSave('name', $newName);
            $clone->setAndSave('title', $newName);
          }
        }
      }
    });

    //handle title change of main page to reflect on items parent
    $this->addHookBefore('Page::changed(0:title)', function ($event) {

      $pages = $event->wire('pages');
      $page = $event->object;
      $newValue = $event->arguments(2);
      $itemsParent = $pages->get('pg-' . $page->id);

      if ($itemsParent->id) {
        $itemsParent->setAndSave('title', $newValue);
      }
    });

    $this->addHookAfter('Pages::delete', function (HookEvent $event) {
      $pages = $event->wire('pages');
      $page = $event->arguments(0);
      foreach ($page->template->fieldgroup as $field) {
        if (!$field->type instanceof FieldtypePageGrid) continue;
        $itemsParent = $pages->get('pg-' . $page->id);
        if ($itemsParent->id) {
          $itemsParent->delete(true); // true allown to delete children too
          $this->message("PageGrid items for " . $page->id . " removed");
        }
      }
    });


    //hide template pages for nonSuper users
    $this->addHookAfter('Page(name=pg-template)::listable', function ($event) {
      $page = $event->object;
      $user = $event->wire('user');
      if ($user->isSuperuser() == 0) {
        foreach ($page->fields as $f) {
          if ($f->type instanceof FieldtypePageGrid) {
            $event->return = false;
          }
        }
      }
    });

    // page template feature and auto publish
    $this->addHookAfter('Pages::added', function (HookEvent $event) {
      $page = $event->arguments(0);
      $pages = $event->wire('pages');

      // auto puplish pagetable items or pages without title
      if (!$page->title) {
        $page->title = $page->name;
        $page->removeStatus('unpublished');
        $page->save();
      }
      // END auto puplish pagetable items or pages without title

      // COPY FROM TEMPLATE -------------------------------------------

      //if clone return
      // bd($this->clonePage);

      if ($this->clonePage) {
        return false;
      }

      foreach ($page->fields as $f) {

        if ($f->type instanceof FieldtypePageGrid) {

          $pg = $f;
          $table_template_ids = $pg->template_id;
          $table_templates = $event->wire('templates')->find(['id' => $table_template_ids]);

          foreach ($table_templates as $table_template) {
            // return if added page is nested group to prevent endless loop
            if ($page->template->name == $table_template->name) {
              return false;
            }
          }

          // get the field in context of this template
          // $t = $page->template;
          // $f = $t->fieldgroup->getField($pg->name, $useFieldgroupContext = true);

          // if (isset($f->pageTemplate) && $f->pageTemplate !== '' && $f->pageTemplate != 0) {

          $childPages = $page->parent()->children('include=all');
          $pageTemplate = $childPages->findOne('name=pg-template, include=all');

          if ($pageTemplate->id) {
          } else {
            $pageTemplate = $pages->findOne('name=pg-template, include=all');
          }

          // $pageTemplate = $page->closest('name=pg-template');

          // bd($pageTemplate);

          // return;

          if ($pageTemplate->id) {

            $page1ID = $pageTemplate->id;
            $page1 = $pageTemplate;
            $page1Items = $pages->get('pg-' . $page1ID);
            $pageID = $page->id;
            $pageOldItems = $pages->get('pg-' . $pageID);

            //there is an old page already 
            if ($pageOldItems->id) {
              return false;
            }

            // $page1 is page containing pageGrid you want to copy from, defined in field settings
            if ($page1Items->id) {
              $cloneItemsParent = $pages->clone($page1Items);
              $cloneItemsParent->setAndSave('name', 'pg-' . $page->id);
              $cloneItemsParent->setAndSave('title', $page->title . ' items');

              foreach ($cloneItemsParent->find('') as $clone) {
                $newName = $clone->template->name . '-' . $clone->id;
                $clone->setAndSave('name', $newName);
                $clone->setAndSave('title', $newName);
              }
              $this->message('New page created based on: ' . $page1->name);
            }
          }
          // END COPY FROM TEMPLATE -------------------------------------------


          //break the loop when work is done
          break;
        }
      }
    });

    // autopuplish pages with one template and 'pg-autotitle' set as childNameFormat (automatically set in fieldtype)
    $this->addHookAfter("Pages::save", function (HookEvent $event) {
      // remove statusTemp (flash icon on page)
      $page = $event->arguments(0);
      if ($page->title == 'pg-autotitle') {
        $event->arguments(0)->status = 1;
        $templateName = str_replace('_', '-', $page->template->name);
        $page->of(false);
        $page->set('title', $templateName . '-' . $page->id);
        $page->set('name', $templateName . '-' . $page->id);
        $page->removeStatus('unpublished');
        $page->save();
      }
    });

    // add function to load children inside modal when no other fields, function gets called from js when needed
    $this->addHookAfter("ProcessPageEdit::buildForm", function (HookEvent $event) {
      if ($this->process != 'ProcessPageEdit') return;
      $this->ppe = $event->object;
      $this->form = $event->return;
      $page = $this->ppe->getPage();

      if (count($page->fields) > 1) return;

      $this->form->appendMarkup = "
      <script>
      function loadChildrenTab() {
        $('#_ProcessPageEditChildren').trigger('click');
      }
  </script>
";
    });
  }

  /**
   * Get the Inputfield used for input by PageTable
   * 
   * @param Page $page
   * @param Field $field
   * @return Inputfield
   * 
   */
  public function getInputfield(Page $page, Field $field)
  {
    /** @var InputfieldPageTable $inputfield */
    $inputfield = $this->modules->get('InputfieldPageGrid');

    if ($field->hideTitleField) {
      $inputfield->addClass('hide-field-title', 'wrapClass');
    }

    return $inputfield;
  }


  public function ___getConfigInputfields(Field $field)
  {

    $inputfields = parent::___getConfigInputfields($field);

    /** @var InputfieldAsmSelect $f */
    $f = $this->wire('modules')->get('InputfieldAsmSelect');
    $f->attr('name', 'template_id');
    $f->label = $this->_('Select one or more templates for items');
    foreach ($this->wire('templates') as $template) {
      if ($template->flags & Template::flagSystem) continue;
      $filename = wire('config')->paths->templates . 'blocks/' . $template->name . '.php';
      if (file_exists($filename)) {
        $f->addOption($template->id, $template->name);
      }
    }
    $value = $field->get('template_id');
    if (!is_array($value)) $value = $value ? array($value) : array();
    $f->attr('value', $value);
    $f->required = true;
    $f->description = $this->_('The template files must be placed in site/templates/blocks/ folder before you can select them here. These are the templates that will be used by pages managed from this field'); // Templates selection description
    // $f->notes = $this->_('Please hit Save after selecting a template and the remaining configuration on the Input tab will contain more context.'); // Templates selection notes 
    $inputfields->add($f);

    return $inputfields;
  }

  // module config in module page
  public function getModuleConfigInputfields(array $data)
  {

    $licence_key = isset($data['lkey']) ? $data['lkey'] : '';
    $licence_url = isset($data['ldomain']) ? $data['ldomain'] : '';
    $gumroad_array = $this->gumroad_licence($licence_key, 'pagegrid', 0);
    $host = $_SERVER['HTTP_HOST'];
    $host_e = pathinfo(parse_url($host, PHP_URL_PATH), PATHINFO_EXTENSION);
    $validateNote = "License is invalid :(";
    $validHost = false;

    if ($host == $licence_url) {
      $validHost = true;
    }

    if (substr($host, 0, 9) == 'localhost') {
      $validHost = true;
    }

    if ($host_e == 'test') {
      $validHost = true;
    }

    if ($host_e == 'dev') {
      $validHost = true;
    }

    if (!$validHost && $gumroad_array) {
      //count 
      $gumroad_array = $this->gumroad_licence($licence_key, 'pagegrid', 1);

      if (!$gumroad_array) {
        //            $data['lkey'] = '';
        $data['ldomain'] = 'invalid';
        $validateNote = "License is already in use!";
      } else {
        $data['ldomain'] = $host;
        wire('modules')->saveConfig('FieldtypePageGrid', $data);
        $validHost = true;
      }
    }

    if (isset($licence_key) && $gumroad_array && $validHost) {
      $validateNote = "License is valid!";
    }

    $wrapper = new InputfieldWrapper();

    $f = $this('modules')->get('InputfieldText');
    $f->value = isset($data['lkey']) ? $data['lkey'] : '';
    $f->attr('name', 'lkey');
    $f->label = $this->_('License Key');
    $f->description = $this->_('Please enter your PageGrid License Key.');
    $f->notes = $validateNote;
    $f->icon = 'key';
    $f->columnWidth('100');
    $wrapper->add($f);

    $f = $this('modules')->get('InputfieldHidden');
    $f->value = isset($data['ldomain']) ? $data['ldomain'] : '';
    $f->attr('name', 'ldomain');
    $f->label = $this->_('License Url');
    $wrapper->add($f);

    return $wrapper;
  }

  protected function gumroad_licence($licence_key, $permalink = '', $uses_count = 0)
  {
    $curl = curl_init();

    //  bd($permalink);

    $post_data = array(
      'product_permalink' => $permalink,
      'license_key' => $licence_key,
      'increment_uses_count' => ($uses_count) ? 'true' : 'false'
    );

    $url = "https://api.gumroad.com/v2/licenses/verify";

    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $post_data);

    $result = curl_exec($curl);

    $array = json_decode($result, true);

    if ($array['success'] === true) {

      $varant = $array['purchase']['variants'];
      $uses = $array['uses'];

      if (isset($varant)) {

        if ($varant == '(Single)' && $uses > 1 && $uses_count) {
          return false;
        }

        if ($varant == '(Studio)' && $uses > 3 && $uses_count) {
          return false;
        }

        if ($varant == '(Pro)' && $uses > 10 && $uses_count) {
          return false;
        }

      }

      return $array;
    } else {
      return false;
    }

    curl_close($curl);
  }


  // add deafult template context settings, this can also be done in admin with override tab in field settings
  //  public function ___getConfigAllowContext(Field $f) {
  //		$a = parent::___getConfigAllowContext($f);
  //		$a[] = 'template_id';
  //        $a[] = 'pageTemplate';
  //		return $a;
  //	}

}
