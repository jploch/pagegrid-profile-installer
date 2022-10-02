# --- WireDatabaseBackup {"time":"2022-10-02 17:31:19","user":"","dbName":"pgprofile0422","description":"","tables":[],"excludeTables":["pages_drafts","users","users_roles","user"],"excludeCreateTables":[],"excludeExportTables":["field_email","field_pass","caches","session_login_throttle","page_path_history"]}

DROP TABLE IF EXISTS `caches`;
CREATE TABLE `caches` (
  `name` varchar(250) NOT NULL,
  `data` mediumtext NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `field_admin_theme`;
CREATE TABLE `field_admin_theme` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_admin_theme` (`pages_id`, `data`) VALUES('41', '184');

DROP TABLE IF EXISTS `field_email`;
CREATE TABLE `field_email` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `field_pagegrid`;
CREATE TABLE `field_pagegrid` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pass`;
CREATE TABLE `field_pass` (
  `pages_id` int unsigned NOT NULL,
  `data` char(40) NOT NULL,
  `salt` char(32) NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;

DROP TABLE IF EXISTS `field_permissions`;
CREATE TABLE `field_permissions` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '32', '1');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('1142', '32', '1');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '34', '2');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '35', '3');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('37', '36', '0');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '36', '0');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('1142', '36', '0');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '50', '4');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '51', '5');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '52', '7');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '53', '8');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('1142', '53', '4');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('38', '54', '6');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('1142', '1143', '2');
INSERT INTO `field_permissions` (`pages_id`, `data`, `sort`) VALUES('1142', '1144', '3');

DROP TABLE IF EXISTS `field_pg_editor`;
CREATE TABLE `field_pg_editor` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_pg_editor` (`pages_id`, `data`) VALUES('1224', '<p>© 2022 BUILD WITH <a href=\"https://page-grid.com/\" target=\"_blank\">PAGEGRID</a></p>');
INSERT INTO `field_pg_editor` (`pages_id`, `data`) VALUES('1236', '<h1 class=\"pg-hover-none\">Hey, Thanks for using PAGEGRID!<br />\nThis is just some dummy content. Click twice to edit this text.&nbsp;</h1>');
INSERT INTO `field_pg_editor` (`pages_id`, `data`) VALUES('1237', '<p style=\"text-align: right;\"><a href=\"https://page-grid.com/docs/\" target=\"_blank\">HELP</a></p>');
INSERT INTO `field_pg_editor` (`pages_id`, `data`) VALUES('1238', '<h1>Hey, thanks for using PAGEGRID!<br />\nThis is just some dummy content. Click twice to edit this text.&nbsp;</h1>');

DROP TABLE IF EXISTS `field_pg_gallery`;
CREATE TABLE `field_pg_gallery` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_gallery_video`;
CREATE TABLE `field_pg_gallery_video` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_gallery_video_options`;
CREATE TABLE `field_pg_gallery_video_options` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_gallery_video_poster`;
CREATE TABLE `field_pg_gallery_video_poster` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_image`;
CREATE TABLE `field_pg_image` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_pg_image` (`pages_id`, `data`, `sort`, `description`, `modified`, `created`, `filedata`, `filesize`, `created_users_id`, `modified_users_id`, `width`, `height`, `ratio`) VALUES('1218', 'pagegrid-logo.svg', '0', '', '2022-09-30 10:30:53', '2022-09-30 10:30:53', '', '1772', '41', '41', '-100', '-100', '1.00');

DROP TABLE IF EXISTS `field_pg_image_link`;
CREATE TABLE `field_pg_image_link` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_image_link_external`;
CREATE TABLE `field_pg_image_link_external` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_map`;
CREATE TABLE `field_pg_map` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  `lat` float(10,6) NOT NULL DEFAULT '0.000000',
  `lng` float(10,6) NOT NULL DEFAULT '0.000000',
  `status` tinyint NOT NULL DEFAULT '0',
  `zoom` tinyint NOT NULL DEFAULT '0',
  `raw` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `latlng` (`lat`,`lng`),
  KEY `zoom` (`zoom`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_marker`;
CREATE TABLE `field_pg_marker` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_marker_label`;
CREATE TABLE `field_pg_marker_label` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_reference`;
CREATE TABLE `field_pg_reference` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_pg_reference` (`pages_id`, `data`, `sort`) VALUES('1229', '1217', '0');
INSERT INTO `field_pg_reference` (`pages_id`, `data`, `sort`) VALUES('1233', '1217', '0');
INSERT INTO `field_pg_reference` (`pages_id`, `data`, `sort`) VALUES('1230', '1223', '0');
INSERT INTO `field_pg_reference` (`pages_id`, `data`, `sort`) VALUES('1235', '1223', '0');

DROP TABLE IF EXISTS `field_pg_sequenz`;
CREATE TABLE `field_pg_sequenz` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_slider_autoplay`;
CREATE TABLE `field_pg_slider_autoplay` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_text`;
CREATE TABLE `field_pg_text` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_video`;
CREATE TABLE `field_pg_video` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_video_options`;
CREATE TABLE `field_pg_video_options` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_video_poster`;
CREATE TABLE `field_pg_video_poster` (
  `pages_id` int unsigned NOT NULL,
  `data` varchar(250) NOT NULL,
  `sort` int unsigned NOT NULL,
  `description` text NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `filedata` mediumtext,
  `filesize` int DEFAULT NULL,
  `created_users_id` int unsigned NOT NULL DEFAULT '0',
  `modified_users_id` int unsigned NOT NULL DEFAULT '0',
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `ratio` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `filesize` (`filesize`),
  KEY `width` (`width`),
  KEY `height` (`height`),
  KEY `ratio` (`ratio`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `filedata` (`filedata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_process`;
CREATE TABLE `field_process` (
  `pages_id` int NOT NULL DEFAULT '0',
  `data` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_process` (`pages_id`, `data`) VALUES('6', '17');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('3', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('8', '12');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('9', '14');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('10', '7');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('11', '47');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('16', '48');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('300', '104');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('21', '50');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('29', '66');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('23', '10');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('304', '138');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('31', '136');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('22', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('30', '68');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('303', '129');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('2', '87');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('302', '121');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('301', '109');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('28', '76');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1007', '150');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1010', '159');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1012', '161');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1051', '179');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1159', '221');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1150', '219');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('40', '37', '0');
INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('41', '37', '0');
INSERT INTO `field_roles` (`pages_id`, `data`, `sort`) VALUES('41', '38', '2');

DROP TABLE IF EXISTS `field_seo_canonical`;
CREATE TABLE `field_seo_canonical` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_seo_custom`;
CREATE TABLE `field_seo_custom` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_seo_description`;
CREATE TABLE `field_seo_description` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_seo_image`;
CREATE TABLE `field_seo_image` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_seo_keywords`;
CREATE TABLE `field_seo_keywords` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_seo_robots`;
CREATE TABLE `field_seo_robots` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_seo_tab`;
CREATE TABLE `field_seo_tab` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_seo_tab_end`;
CREATE TABLE `field_seo_tab_end` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_seo_title`;
CREATE TABLE `field_seo_title` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_title`;
CREATE TABLE `field_title` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(255)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_title` (`pages_id`, `data`) VALUES('11', 'Templates');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('16', 'Fields');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('22', 'Setup');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('3', 'Pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('6', 'Add Page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('8', 'Tree');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('9', 'Save Sort');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('10', 'Edit');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('21', 'Modules');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('29', 'Users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('30', 'Roles');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('2', 'Admin');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('7', 'Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('27', '404 Not Found');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('302', 'Insert Link');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('23', 'Login');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('304', 'Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('301', 'Empty Trash');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('300', 'Search');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('303', 'Insert Image');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('28', 'Access');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('31', 'Permissions');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('32', 'Edit pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('34', 'Delete pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('35', 'Move pages (change parent)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('36', 'View pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('50', 'Sort child pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('51', 'Change templates on pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('52', 'Administer users');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('53', 'User can update profile/password');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('54', 'Lock or unlock a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1', 'Website');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1006', 'Use Page Lister');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1007', 'Find');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1010', 'Recent');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1011', 'Can see recently edited pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1012', 'Logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1013', 'Can view system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1014', 'Can manage system logs');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1051', 'DB Backups');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1052', 'Manage database backups (recommended for superuser only)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1145', 'Edit PageGrid items in modal');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1146', 'Drag grid items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1147', 'Resize grid items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1148', 'Enable styling of PageGrid items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1149', 'Use the sidebar to drag new items into the page (also needs pagegrid-drag permission to work)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1144', 'Allow PageGrid to process ajax calls');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1140', 'PageGrid Items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1141', 'PageGrid Classes');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1143', 'Use the front-end page editor');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1159', 'Upgrades');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1222', 'footer items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1220', 'a');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1221', 'footer');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1166', '404 Not Found items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1150', 'PageGrid Process');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1216', 'header items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1223', 'footer-group');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1217', 'header-group');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1218', 'pg-image-1218');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1202', 'pg-template');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1238', 'pg-editor-1238');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1224', 'pg-editor-1224');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1203', 'pg-template items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1235', 'pg_reference-1235');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1234', 'pg_group-1234');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1233', 'pg_reference-1233');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1237', 'pg-editor-1237');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1249', 'Trigger database backup when a user logs in or logs out (CronjobDatabaseBackup)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1236', 'pg-editor-1236');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1232', 'Home items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1231', 'Home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1219', 'pg-navigation-1219');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1230', 'pg-reference-1230');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1229', 'pg-reference-1229');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1228', 'body');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1215', 'header');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1212', 'pg-main');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1213', 'pg-group-1213');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1214', 'container');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('123', 'pg_editor');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('106', 'pg_container');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('107', 'pg_gallery');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('108', 'pg_gallery_video');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('109', 'pg_group');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('110', 'pg_image');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('111', 'pg_map');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('112', 'pg_marker');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('113', 'pg_navigation');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('114', 'pg_reference');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('115', 'pg_sequenz');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('116', 'pg_slider');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('117', 'pg_spacer');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('118', 'pg_text');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('119', 'pg_video');

DROP TABLE IF EXISTS `fieldgroups_fields`;
CREATE TABLE `fieldgroups_fields` (
  `fieldgroups_id` int unsigned NOT NULL DEFAULT '0',
  `fields_id` int unsigned NOT NULL DEFAULT '0',
  `sort` int unsigned NOT NULL DEFAULT '0',
  `data` text,
  PRIMARY KEY (`fieldgroups_id`,`fields_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '2', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('2', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '100', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '97', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('123', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('107', '101', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '102', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '103', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('108', '104', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('109', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '105', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '106', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('110', '107', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('111', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('111', '108', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('112', '109', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('112', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('112', '110', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('113', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('114', '111', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('115', '112', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('116', '113', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('117', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('118', '114', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '115', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '116', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '117', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('123', '121', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '122', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '124', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '125', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '126', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '127', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '130', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '129', '8', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '128', '9', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '123', '10', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '122', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '124', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '125', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '126', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '127', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '130', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '129', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '128', '8', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '123', '9', NULL);

DROP TABLE IF EXISTS `fields`;
CREATE TABLE `fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `name` varchar(250) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `label` varchar(250) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3;

INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('1', 'FieldtypePageTitle', 'title', '13', 'Title', '{\"required\":1,\"textformatters\":[\"TextformatterEntities\"],\"size\":0,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('2', 'FieldtypeModule', 'process', '25', 'Process', '{\"description\":\"The process that is executed on this page. Since this is mostly used by ProcessWire internally, it is recommended that you don\'t change the value of this unless adding your own pages in the admin.\",\"collapsed\":1,\"required\":1,\"moduleTypes\":[\"Process\"],\"permanent\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('3', 'FieldtypePassword', 'pass', '24', 'Set Password', '{\"collapsed\":1,\"size\":50,\"maxlength\":128}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('5', 'FieldtypePage', 'permissions', '24', 'Permissions', '{\"derefAsPage\":0,\"parent_id\":31,\"labelFieldName\":\"title\",\"inputfield\":\"InputfieldCheckboxes\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('4', 'FieldtypePage', 'roles', '24', 'Roles', '{\"derefAsPage\":0,\"parent_id\":30,\"labelFieldName\":\"name\",\"inputfield\":\"InputfieldCheckboxes\",\"description\":\"User will inherit the permissions assigned to each role. You may assign multiple roles to a user. When accessing a page, the user will only inherit permissions from the roles that are also assigned to the page\'s template.\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('92', 'FieldtypeEmail', 'email', '9', 'E-Mail Address', '{\"size\":70,\"maxlength\":255}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('97', 'FieldtypeModule', 'admin_theme', '8', 'Admin Theme', '{\"moduleTypes\":[\"AdminTheme\"],\"labelField\":\"title\",\"inputfieldClass\":\"InputfieldRadios\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('122', 'FieldtypeFieldsetTabOpen', 'seo_tab', '0', 'SEO', '{\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('123', 'FieldtypeFieldsetClose', 'seo_tab_END', '0', 'Close an open fieldset', '{\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('124', 'FieldtypeText', 'seo_title', '0', 'Title', '{\"description\":\"A good length for a title is 60 characters.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('100', 'FieldtypePageGrid', 'pagegrid', '0', 'Pagegrid', '{\"template_id\":[69,64,56,65,53,54,57,58,61,62,55,63,59,60],\"collapsed\":0,\"pageTemplate\":0,\"hideTitleField\":1,\"fontPrivacy\":1,\"renderOptions\":\"page\",\"icon\":\"th\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('101', 'FieldtypeImage', 'pg_gallery', '0', 'Gallery', '{\"tags\":\"PageGrid\",\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":2}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('102', 'FieldtypeFile', 'pg_gallery_video', '0', 'Gallery Video', '{\"tags\":\"PageGrid\",\"extensions\":\"mp4\",\"maxFiles\":1,\"outputFormat\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('103', 'FieldtypeImage', 'pg_gallery_video_poster', '0', 'Preview Image', '{\"tags\":\"PageGrid\",\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('104', 'FieldtypeText', 'pg_gallery_video_options', '0', 'Options', '{\"tags\":\"PageGrid\",\"notes\":\"example: autoplay muted loop\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('105', 'FieldtypeImage', 'pg_image', '0', 'Image', '{\"tags\":\"PageGrid\",\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":2}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('106', 'FieldtypePage', 'pg_image_link', '0', 'Link', '{\"tags\":\"PageGrid\",\"inputfield\":\"InputfieldPageListSelect\",\"derefAsPage\":1,\"parent_id\":1,\"labelFieldName\":\"title\",\"contentType\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('107', 'FieldtypeText', 'pg_image_link_external', '0', 'Externer Link', '{\"tags\":\"PageGrid\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('108', 'FieldtypeLeafletMapMarker', 'pg_map', '0', 'Map', '{\"tags\":\"PageGrid\",\"schemaVersion\":2,\"defaultLat\":\"53.550341\",\"defaultLng\":\"10.000654\",\"defaultProvider\":\"Stamen.Toner\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('109', 'FieldtypeText', 'pg_marker_label', '0', 'Marker Label', '{\"tags\":\"PageGrid\",\"textformatters\":[\"TextformatterEntities\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('110', 'FieldtypeTextarea', 'pg_marker', '0', 'Marker', '{\"tags\":\"PageGrid\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('111', 'FieldtypePage', 'pg_reference', '0', 'Reference', '{\"tags\":\"PageGrid\",\"inputfield\":\"InputfieldPageListSelect\",\"derefAsPage\":1,\"parent_id\":1140,\"labelFieldName\":\"title\",\"contentType\":1,\"collapsed\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('112', 'FieldtypeImage', 'pg_sequenz', '0', 'Sequenz', '{\"tags\":\"PageGrid\",\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":0,\"outputFormat\":0,\"overwrite\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('113', 'FieldtypeTextarea', 'pg_slider_autoplay', '0', 'Autoplay', '{\"tags\":\"PageGrid\",\"note\":\"False, or number for milliseconds\",\"inputfieldClass\":\"InputfieldText\",\"contentType\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('114', 'FieldtypeTextarea', 'pg_text', '0', 'Text', '{\"tags\":\"PageGrid\",\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('115', 'FieldtypeFile', 'pg_video', '0', 'Video', '{\"tags\":\"PageGrid\",\"extensions\":\"mp4\",\"maxFiles\":1,\"outputFormat\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('116', 'FieldtypeImage', 'pg_video_poster', '0', 'Preview Image', '{\"tags\":\"PageGrid\",\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('117', 'FieldtypeText', 'pg_video_options', '0', 'Options', '{\"tags\":\"PageGrid\",\"notes\":\"example: autoplay muted loop\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('121', 'FieldtypeTextarea', 'pg_editor', '0', 'Editor', '{\"tags\":\"PageGrid\",\"inputfieldClass\":\"InputfieldCKEditor\",\"contentType\":1,\"htmlOptions\":[2],\"inlineMode\":1,\"useACF\":1,\"usePurifier\":0,\"toolbar\":\"Styles, Bold, Italic, RemoveFormat, JustifyLeft, JustifyCenter, JustifyRight, JustifyBlock\\nNumberedList, BulletedList, Blockquote\\nPWLink, Unlink, Anchor\\nPWImage, Table, HorizontalRule, SpecialChar\\nScayt, Sourcedialog, Loremipsum, ckeditorfa\",\"stylesSet\":\"mystyles:\\/site\\/templates\\/blocks\\/pg_editor_styles.js\",\"collapsed\":0,\"minlength\":0,\"maxlength\":0,\"showCount\":0,\"rows\":5,\"formatTags\":\"p;h1;h2;h3;h4;h5;h6;pre;address\",\"extraPlugins\":[\"ckeditorfa\",\"loremipsum\",\"pwimage\",\"pwlink\",\"sourcedialog\"],\"removePlugins\":\"image,magicline\",\"textformatters\":[\"TextformatterVideoEmbed\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('125', 'FieldtypeText', 'seo_keywords', '0', 'Keywords', '{\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('126', 'FieldtypeText', 'seo_description', '0', 'Description', '{\"description\":\"A good length for a description is 160 characters.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('127', 'FieldtypeText', 'seo_image', '0', 'Image', '{\"description\":\"Please enter the URL (including &quot;http:\\/\\/...&quot;) to a preview image.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('128', 'FieldtypeText', 'seo_canonical', '0', 'Canonical Link', '{\"notes\":\"The URL should include &quot;http:\\/\\/...&quot;.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('129', 'FieldtypeTextarea', 'seo_custom', '0', 'Custom', '{\"description\":\"If you want to add other meta tags, you can do it here.\",\"notes\":\"Please use this schema: name := content. One tag per line. Special characters are only allowed in the content part and get converted to HTML.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('130', 'FieldtypeText', 'seo_robots', '0', 'Robots', '{\"description\":\"The robots settings will tell search engine which data they are allowed to include\\/index.\",\"notes\":\"This overwrites the module&#039;s global setting for this page.\",\"tags\":\"seo\"}');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb3;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('244', 'BlocksEditor', '10', '', '2022-09-12 12:38:25');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('30', 'InputfieldForm', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('6', 'FieldtypeFile', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('7', 'ProcessPageEdit', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('10', 'ProcessLogin', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('12', 'ProcessPageList', '0', '{\"pageLabelField\":\"title\",\"paginationLimit\":25,\"limit\":50}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('121', 'ProcessPageEditLink', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('14', 'ProcessPageSort', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('15', 'InputfieldPageListSelect', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('117', 'JqueryUI', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('17', 'ProcessPageAdd', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('125', 'SessionLoginThrottle', '11', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('122', 'InputfieldPassword', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('25', 'InputfieldAsmSelect', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('116', 'JqueryCore', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('108', 'InputfieldURL', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('32', 'InputfieldSubmit', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('34', 'InputfieldText', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('35', 'InputfieldTextarea', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('36', 'InputfieldSelect', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('37', 'InputfieldCheckbox', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('38', 'InputfieldCheckboxes', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('39', 'InputfieldRadios', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('40', 'InputfieldHidden', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('41', 'InputfieldName', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('43', 'InputfieldSelectMultiple', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('45', 'JqueryWireTabs', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('47', 'ProcessTemplate', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('48', 'ProcessField', '32', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('50', 'ProcessModule', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('114', 'PagePermissions', '3', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('97', 'FieldtypeCheckbox', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('115', 'PageRender', '3', '{\"clearCache\":1}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('55', 'InputfieldFile', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('56', 'InputfieldImage', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('57', 'FieldtypeImage', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('60', 'InputfieldPage', '0', '{\"inputfieldClasses\":[\"InputfieldSelect\",\"InputfieldSelectMultiple\",\"InputfieldCheckboxes\",\"InputfieldRadios\",\"InputfieldAsmSelect\",\"InputfieldPageListSelect\",\"InputfieldPageListSelectMultiple\",\"InputfieldPageAutocomplete\"]}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('61', 'TextformatterEntities', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('66', 'ProcessUser', '0', '{\"showFields\":[\"name\",\"email\",\"roles\"]}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('67', 'MarkupAdminDataTable', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('68', 'ProcessRole', '0', '{\"showFields\":[\"name\"]}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('76', 'ProcessList', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('78', 'InputfieldFieldset', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('79', 'InputfieldMarkup', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('80', 'InputfieldEmail', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('89', 'FieldtypeFloat', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('83', 'ProcessPageView', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('84', 'FieldtypeInteger', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('85', 'InputfieldInteger', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('86', 'InputfieldPageName', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('87', 'ProcessHome', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('90', 'InputfieldFloat', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('94', 'InputfieldDatetime', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('98', 'MarkupPagerNav', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('129', 'ProcessPageEditImageSelect', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('103', 'JqueryTableSorter', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('104', 'ProcessPageSearch', '1', '{\"searchFields\":\"title\",\"displayField\":\"title path\"}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('105', 'FieldtypeFieldsetOpen', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('106', 'FieldtypeFieldsetClose', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('107', 'FieldtypeFieldsetTabOpen', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('109', 'ProcessPageTrash', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('111', 'FieldtypePageTitle', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('112', 'InputfieldPageTitle', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('113', 'MarkupPageArray', '3', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('131', 'InputfieldButton', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('133', 'FieldtypePassword', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('134', 'ProcessPageType', '33', '{\"showFields\":[]}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('135', 'FieldtypeURL', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('136', 'ProcessPermission', '1', '{\"showFields\":[\"name\",\"title\"]}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('137', 'InputfieldPageListSelectMultiple', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('138', 'ProcessProfile', '1', '{\"profileFields\":[\"pass\",\"email\",\"admin_theme\",\"admin_theme\"]}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":20,\"coreVersion\":\"3.0.200\"}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('148', 'AdminThemeDefault', '10', '{\"colors\":\"classic\"}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('149', 'InputfieldSelector', '42', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('150', 'ProcessPageLister', '32', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('151', 'JqueryMagnific', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('155', 'InputfieldCKEditor', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('156', 'MarkupHTMLPurifier', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('163', 'PageGridBlocks', '10', '', '2022-09-08 16:55:11');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('159', 'ProcessRecentPages', '1', '', '2022-09-08 16:38:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('160', 'AdminThemeUikit', '10', '', '2022-09-08 16:38:17');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('161', 'ProcessLogger', '1', '', '2022-09-08 16:38:20');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('162', 'InputfieldIcon', '0', '', '2022-09-08 16:38:20');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('179', 'ProcessDatabaseBackups', '1', '', '2022-09-09 12:07:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('169', 'InputfieldTextTags', '0', '', '2022-09-08 16:56:21');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('170', 'PageFrontEdit', '2', '', '2022-09-08 16:57:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('220', 'PageGridFrontEdit', '2', '{\"inlineEditFields\":[121,110,114],\"inlineEditFieldsUpload\":[101,102,105,115],\"buttonLocation\":\"auto\",\"buttonType\":\"auto\",\"placeholderText\":\"Click twice to edit this text\"}', '2022-09-09 12:35:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('185', 'ProcessForgotPassword', '1', '{\"emailFrom\":\"PWAdmin@pagegrid.test\"}', '2022-09-09 12:25:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('184', 'AdminThemeCanvas', '10', '{\"useAsLogin\":1,\"userAvatar\":\"icon.user-circle\",\"userLabel\":\"{Name}\",\"logoURL\":\"\",\"logoAction\":\"0\",\"layout\":\"\",\"noGrid\":\"0\",\"maxWidth\":1600,\"groupNotices\":\"1\",\"cssURL\":\"\",\"inputSize\":\"m\",\"noBorderTypes\":[],\"offsetTypes\":[],\"nav-icons\":\"nav-show-icons\",\"hide-title\":1,\"hide-bookmarks\":1,\"breadcrump\":\"breadcrumb-with-title\"}', '2022-09-09 12:25:27');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('217', 'FieldtypePageGrid', '11', '{\"lkey\":\"\",\"ldomain\":\"\"}', '2022-09-09 12:35:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('218', 'InputfieldPageGrid', '0', '', '2022-09-09 12:35:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('219', 'ProcessPageGrid', '1', '', '2022-09-09 12:35:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('221', 'ProcessWireUpgrade', '1', '', '2022-09-09 15:19:40');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('222', 'ProcessWireUpgradeCheck', '11', '', '2022-09-09 15:19:40');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('224', 'BlocksGallery', '10', '', '2022-09-10 14:22:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('225', 'FileValidatorSvgSanitizer', '0', '', '2022-09-10 14:22:55');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('226', 'BlocksGalleryVideo', '10', '', '2022-09-10 14:23:03');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('227', 'BlocksGroup', '10', '', '2022-09-10 14:23:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('228', 'BlocksImage', '10', '', '2022-09-10 14:23:10');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('229', 'BlocksMap', '10', '', '2022-09-10 14:23:16');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('230', 'FieldtypeLeafletMapMarker', '1', '', '2022-09-10 14:23:18');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('231', 'InputfieldLeafletMapMarker', '0', '', '2022-09-10 14:23:18');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('232', 'BlocksMarker', '10', '', '2022-09-10 14:23:21');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('233', 'BlocksNavigation', '10', '', '2022-09-10 14:23:25');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('234', 'BlocksReference', '10', '', '2022-09-10 14:23:31');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('235', 'BlocksSequenz', '10', '', '2022-09-10 14:23:44');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('236', 'BlocksSlider', '10', '', '2022-09-10 14:23:48');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('237', 'BlocksSpacer', '10', '', '2022-09-10 14:23:51');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('238', 'BlocksText', '10', '', '2022-09-10 14:23:54');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('239', 'BlocksVideo', '10', '', '2022-09-10 14:23:57');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('242', 'InputfieldPageAutocomplete', '0', '', '2022-09-12 11:53:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('248', 'MarkupSitemap', '3', '', '2022-09-30 15:06:33');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('247', 'TextformatterVideoEmbed', '1', '', '2022-09-30 15:02:05');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('249', 'TextformatterMarkdownExtra', '1', '', '2022-09-30 15:06:34');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('250', 'ImageCropRatios', '10', '{\"default_aspect_ratios\":\"-\\n4:3\\n3:2\\n1:1\\n2:1\\n16:9\\n1.85:1\"}', '2022-09-30 15:06:54');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('251', 'MarkupSEO', '2', '{\"includeTemplates\":[\"home\",\"basic-page\"],\"author\":\"\",\"sitename\":\"\",\"useParents\":\"\",\"title\":\"\",\"titleSmart\":[\"title\"],\"keywords\":\"\",\"keywordsSmart\":[],\"description\":\"\",\"descriptionSmart\":[],\"image\":\"\",\"imageSmart\":[],\"titleFormat\":\"\",\"canonicalProtocol\":\"auto\",\"custom\":\"\",\"robots\":[],\"hardLimit\":1,\"titleLimit\":60,\"descriptionLimit\":160,\"includeGenerator\":1,\"includeOpenGraph\":1,\"includeTwitter\":1,\"twitterUsername\":\"\",\"method\":\"manual\",\"addWhitespace\":1,\"googleAnalytics\":\"\",\"googleAnalyticsAnonymizeIP\":\"\",\"piwikAnalyticsUrl\":\"\",\"piwikAnalyticsIDSite\":\"\"}', '2022-09-30 15:07:20');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('254', 'LazyCron', '3', '', '2022-09-30 20:42:40');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('256', 'CronjobDatabaseBackup', '3', '{\"cycle\":\"loginTrigger\",\"backup_name\":\"\",\"backup_fileinfo\":\"\",\"max\":\"\",\"deadline\":\"1 month\",\"stopword\":\"protected\",\"field_storage_path\":\"\",\"backup_all\":1,\"tables\":{\"caches\":\"caches\",\"field_admin_theme\":\"field_admin_theme\",\"field_email\":\"field_email\",\"field_pagegrid\":\"field_pagegrid\",\"field_pass\":\"field_pass\",\"field_permissions\":\"field_permissions\",\"field_pg_editor\":\"field_pg_editor\",\"field_pg_gallery\":\"field_pg_gallery\",\"field_pg_gallery_video\":\"field_pg_gallery_video\",\"field_pg_gallery_video_options\":\"field_pg_gallery_video_options\",\"field_pg_gallery_video_poster\":\"field_pg_gallery_video_poster\",\"field_pg_image\":\"field_pg_image\",\"field_pg_image_link\":\"field_pg_image_link\",\"field_pg_image_link_external\":\"field_pg_image_link_external\",\"field_pg_map\":\"field_pg_map\",\"field_pg_marker\":\"field_pg_marker\",\"field_pg_marker_label\":\"field_pg_marker_label\",\"field_pg_reference\":\"field_pg_reference\",\"field_pg_sequenz\":\"field_pg_sequenz\",\"field_pg_slider_autoplay\":\"field_pg_slider_autoplay\",\"field_pg_text\":\"field_pg_text\",\"field_pg_video\":\"field_pg_video\",\"field_pg_video_options\":\"field_pg_video_options\",\"field_pg_video_poster\":\"field_pg_video_poster\",\"field_process\":\"field_process\",\"field_roles\":\"field_roles\",\"field_seo_canonical\":\"field_seo_canonical\",\"field_seo_custom\":\"field_seo_custom\",\"field_seo_description\":\"field_seo_description\",\"field_seo_image\":\"field_seo_image\",\"field_seo_keywords\":\"field_seo_keywords\",\"field_seo_robots\":\"field_seo_robots\",\"field_seo_tab\":\"field_seo_tab\",\"field_seo_tab_end\":\"field_seo_tab_end\",\"field_seo_title\":\"field_seo_title\",\"field_title\":\"field_title\",\"fieldgroups\":\"fieldgroups\",\"fieldgroups_fields\":\"fieldgroups_fields\",\"fields\":\"fields\",\"modules\":\"modules\",\"pages\":\"pages\",\"pages_access\":\"pages_access\",\"pages_meta\":\"pages_meta\",\"pages_parents\":\"pages_parents\",\"pages_sortfields\":\"pages_sortfields\",\"process_forgot_password\":\"process_forgot_password\",\"session_login_throttle\":\"session_login_throttle\",\"templates\":\"templates\",\"textformatter_video_embed\":\"textformatter_video_embed\"},\"tables_content\":{\"caches\":\"caches\",\"field_admin_theme\":\"field_admin_theme\",\"field_email\":\"field_email\",\"field_pagegrid\":\"field_pagegrid\",\"field_pass\":\"field_pass\",\"field_permissions\":\"field_permissions\",\"field_pg_editor\":\"field_pg_editor\",\"field_pg_gallery\":\"field_pg_gallery\",\"field_pg_gallery_video\":\"field_pg_gallery_video\",\"field_pg_gallery_video_options\":\"field_pg_gallery_video_options\",\"field_pg_gallery_video_poster\":\"field_pg_gallery_video_poster\",\"field_pg_image\":\"field_pg_image\",\"field_pg_image_link\":\"field_pg_image_link\",\"field_pg_image_link_external\":\"field_pg_image_link_external\",\"field_pg_map\":\"field_pg_map\",\"field_pg_marker\":\"field_pg_marker\",\"field_pg_marker_label\":\"field_pg_marker_label\",\"field_pg_reference\":\"field_pg_reference\",\"field_pg_sequenz\":\"field_pg_sequenz\",\"field_pg_slider_autoplay\":\"field_pg_slider_autoplay\",\"field_pg_text\":\"field_pg_text\",\"field_pg_video\":\"field_pg_video\",\"field_pg_video_options\":\"field_pg_video_options\",\"field_pg_video_poster\":\"field_pg_video_poster\",\"field_process\":\"field_process\",\"field_roles\":\"field_roles\",\"field_seo_canonical\":\"field_seo_canonical\",\"field_seo_custom\":\"field_seo_custom\",\"field_seo_description\":\"field_seo_description\",\"field_seo_image\":\"field_seo_image\",\"field_seo_keywords\":\"field_seo_keywords\",\"field_seo_robots\":\"field_seo_robots\",\"field_seo_tab\":\"field_seo_tab\",\"field_seo_tab_end\":\"field_seo_tab_end\",\"field_seo_title\":\"field_seo_title\",\"field_title\":\"field_title\",\"fieldgroups\":\"fieldgroups\",\"fieldgroups_fields\":\"fieldgroups_fields\",\"fields\":\"fields\",\"modules\":\"modules\",\"pages\":\"pages\",\"pages_access\":\"pages_access\",\"pages_meta\":\"pages_meta\",\"pages_parents\":\"pages_parents\",\"pages_sortfields\":\"pages_sortfields\",\"process_forgot_password\":\"process_forgot_password\",\"session_login_throttle\":\"session_login_throttle\",\"templates\":\"templates\",\"textformatter_video_embed\":\"textformatter_video_embed\"},\"auto_add_new_fields\":null,\"cleanup\":\"\"}', '2022-10-01 17:41:32');

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `templates_id` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `status` int unsigned NOT NULL DEFAULT '1',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_users_id` int unsigned NOT NULL DEFAULT '2',
  `created` timestamp NOT NULL DEFAULT '2015-12-18 06:09:00',
  `created_users_id` int unsigned NOT NULL DEFAULT '2',
  `published` datetime DEFAULT NULL,
  `sort` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_parent_id` (`name`,`parent_id`),
  KEY `parent_id` (`parent_id`),
  KEY `templates_id` (`templates_id`),
  KEY `modified` (`modified`),
  KEY `created` (`created`),
  KEY `status` (`status`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1257 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2022-09-30 15:08:55', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'admin', '1035', '2022-09-08 16:38:18', '40', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2022-09-08 16:38:23', '40', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2022-09-08 16:38:24', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2022-09-08 16:38:23', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('23', '2', '2', 'login', '1035', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('27', '1', '29', 'http404', '1035', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '3', '2022-09-08 16:37:59', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('28', '2', '2', 'access', '13', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('29', '28', '2', 'users', '29', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('30', '28', '2', 'roles', '29', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('31', '28', '2', 'permissions', '29', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('32', '31', '5', 'page-edit', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('34', '31', '5', 'page-delete', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('35', '31', '5', 'page-move', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('36', '31', '5', 'page-view', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('37', '30', '4', 'guest', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('38', '30', '4', 'superuser', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'admin', '1', '2022-10-02 15:27:42', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('40', '29', '3', 'guest', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('50', '31', '5', 'page-sort', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('51', '31', '5', 'page-template', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('52', '31', '5', 'user-admin', '25', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('53', '31', '5', 'profile-edit', '1', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '13');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('54', '31', '5', 'page-lock', '1', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('300', '3', '2', 'search', '1045', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('301', '3', '2', 'trash', '1047', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('302', '3', '2', 'link', '1041', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('303', '3', '2', 'image', '1041', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('304', '2', '2', 'profile', '1025', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1006', '31', '5', 'page-lister', '1', '2022-09-08 16:37:59', '40', '2022-09-08 16:37:59', '40', '2022-09-08 16:37:59', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1007', '3', '2', 'lister', '1', '2022-09-08 16:37:59', '40', '2022-09-08 16:37:59', '40', '2022-09-08 16:37:59', '9');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1010', '3', '2', 'recent-pages', '1', '2022-09-08 16:38:17', '40', '2022-09-08 16:38:17', '40', '2022-09-08 16:38:17', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1011', '31', '5', 'page-edit-recent', '1', '2022-09-08 16:38:17', '40', '2022-09-08 16:38:17', '40', '2022-09-08 16:38:17', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1012', '22', '2', 'logs', '1', '2022-09-08 16:38:20', '40', '2022-09-08 16:38:20', '40', '2022-09-08 16:38:20', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1013', '31', '5', 'logs-view', '1', '2022-09-08 16:38:20', '40', '2022-09-08 16:38:20', '40', '2022-09-08 16:38:20', '11');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1014', '31', '5', 'logs-edit', '1', '2022-09-08 16:38:20', '40', '2022-09-08 16:38:20', '40', '2022-09-08 16:38:20', '12');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1052', '31', '5', 'db-backup', '1', '2022-09-09 12:07:36', '41', '2022-09-09 12:07:36', '41', '2022-09-09 12:07:36', '14');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1051', '22', '2', 'db-backups', '1', '2022-09-09 12:07:36', '41', '2022-09-09 12:07:36', '41', '2022-09-09 12:07:36', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1144', '31', '5', 'pagegrid-process', '1', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '16');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1145', '31', '5', 'page-pagegrid-edit', '1', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '17');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1146', '31', '5', 'pagegrid-drag', '1', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '18');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1147', '31', '5', 'pagegrid-resize', '1', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '19');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1159', '22', '2', 'upgrades', '1', '2022-09-09 15:19:40', '41', '2022-09-09 15:19:40', '41', '2022-09-09 15:19:40', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1230', '1203', '60', 'pg-reference-1230', '1', '2022-09-30 19:13:27', '41', '2022-09-30 13:43:18', '41', '2022-09-30 13:43:18', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1141', '2', '52', 'pg-classes', '1025', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1142', '30', '4', 'pagegrid-editor', '1', '2022-09-13 16:44:18', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1143', '31', '5', 'pagegrid-edit-front', '1', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '15');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1148', '31', '5', 'pagegrid-style-panel', '1', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '20');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1149', '31', '5', 'pagegrid-add', '1', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1229', '1203', '60', 'pg-reference-1229', '1', '2022-09-30 19:13:27', '41', '2022-09-30 13:39:36', '41', '2022-09-30 13:39:36', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1166', '1140', '52', 'pg-27', '1', '2022-09-12 11:30:52', '41', '2022-09-12 11:30:52', '41', '2022-09-12 11:30:52', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1140', '2', '52', 'pg-items', '1025', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1228', '1141', '52', 'body', '1', '2022-09-30 13:38:23', '41', '2022-09-30 13:38:23', '41', '2022-09-30 13:38:23', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1150', '2', '2', 'pagegrid', '1024', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1219', '1217', '59', 'pg-navigation-1219', '1', '2022-10-02 16:38:08', '41', '2022-09-30 12:20:24', '41', '2022-09-30 12:20:24', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1220', '1141', '52', 'a', '1', '2022-09-30 12:31:16', '41', '2022-09-30 12:31:16', '41', '2022-09-30 12:31:16', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1221', '1202', '29', 'footer', '3073', '2022-09-30 13:46:35', '41', '2022-09-30 13:36:42', '41', NULL, '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1222', '1140', '52', 'pg-1221', '1', '2022-09-30 13:36:42', '41', '2022-09-30 11:36:42', '41', '2022-09-30 13:36:42', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1223', '1222', '55', 'footer-group', '1', '2022-10-02 16:38:08', '41', '2022-09-30 11:36:42', '41', '2022-09-30 13:36:42', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1224', '1223', '69', 'pg-editor-1224', '1', '2022-10-02 16:38:08', '41', '2022-09-30 13:36:49', '41', '2022-09-30 13:36:49', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1203', '1140', '52', 'pg-1202', '1', '2022-09-30 09:58:35', '41', '2022-09-30 09:58:35', '41', '2022-09-30 09:58:35', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1202', '1', '29', 'pg-template', '2049', '2022-09-30 15:44:52', '41', '2022-09-30 09:58:35', '41', '2022-09-30 15:44:41', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1249', '31', '5', 'trigger-db-backup', '1', '2022-10-01 17:41:32', '41', '2022-10-01 17:41:32', '41', '2022-10-01 17:41:32', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1238', '1234', '69', 'pg-editor-1238', '1', '2022-10-02 16:38:08', '41', '2022-09-30 13:59:41', '41', '2022-09-30 13:59:41', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1237', '1223', '69', 'pg-editor-1237', '1', '2022-10-02 16:38:08', '41', '2022-09-30 13:55:31', '41', '2022-09-30 13:55:31', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1236', '1213', '69', 'pg-editor-1236', '1', '2022-09-30 19:13:27', '41', '2022-09-30 13:47:32', '41', '2022-09-30 13:47:32', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1235', '1232', '60', 'pg_reference-1235', '1', '2022-10-02 16:38:08', '41', '2022-09-30 11:46:54', '41', '2022-09-30 13:46:54', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1234', '1232', '55', 'pg_group-1234', '1', '2022-10-02 16:38:08', '41', '2022-09-30 11:46:54', '41', '2022-09-30 13:46:54', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1233', '1232', '60', 'pg_reference-1233', '1', '2022-10-02 16:38:08', '41', '2022-09-30 11:46:54', '41', '2022-09-30 13:46:54', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1232', '1140', '52', 'pg-1231', '1', '2022-09-30 13:46:54', '41', '2022-09-30 11:46:54', '41', '2022-09-30 13:46:54', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1231', '1', '29', 'home', '1', '2022-10-02 16:38:07', '41', '2022-09-30 13:46:54', '41', '2022-09-30 13:47:04', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1215', '1202', '29', 'header', '3073', '2022-09-30 13:46:18', '41', '2022-09-30 12:20:02', '41', NULL, '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1213', '1203', '55', 'pg-group-1213', '1', '2022-09-30 19:13:27', '41', '2022-09-30 12:16:01', '41', '2022-09-30 12:16:01', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1212', '1141', '52', 'pg-main', '1', '2022-09-30 12:15:39', '41', '2022-09-30 12:15:39', '41', '2022-09-30 12:15:39', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1214', '1141', '52', 'container', '1', '2022-09-30 12:16:09', '41', '2022-09-30 12:16:09', '41', '2022-09-30 12:16:09', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1216', '1140', '52', 'pg-1215', '1', '2022-09-30 12:20:02', '41', '2022-09-30 10:20:02', '41', '2022-09-30 12:20:02', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1217', '1216', '55', 'header-group', '1', '2022-10-02 16:38:08', '41', '2022-09-30 10:20:02', '41', '2022-09-30 12:20:02', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1218', '1217', '56', 'pg-image-1218', '1', '2022-10-02 16:38:08', '41', '2022-09-30 12:20:14', '41', '2022-09-30 12:20:14', '0');

DROP TABLE IF EXISTS `pages_access`;
CREATE TABLE `pages_access` (
  `pages_id` int NOT NULL,
  `templates_id` int NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pages_id`),
  KEY `templates_id` (`templates_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('37', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('38', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('32', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('34', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('35', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('36', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('50', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('51', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('52', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('53', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('54', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1006', '2', '2022-09-08 16:37:59');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1011', '2', '2022-09-08 16:38:17');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1013', '2', '2022-09-08 16:38:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1014', '2', '2022-09-08 16:38:20');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1148', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1052', '2', '2022-09-09 12:07:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1145', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1144', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1142', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1146', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1147', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1143', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1229', '52', '2022-09-30 13:39:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1141', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1140', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1149', '2', '2022-09-09 12:35:53');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1202', '1', '2022-09-30 09:58:35');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1233', '52', '2022-09-30 13:46:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1231', '1', '2022-09-30 13:46:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1223', '52', '2022-09-30 13:36:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1224', '52', '2022-09-30 13:36:49');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1230', '52', '2022-09-30 13:43:18');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1215', '1', '2022-09-30 12:20:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1249', '2', '2022-10-01 17:41:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1238', '52', '2022-09-30 13:59:41');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1237', '52', '2022-09-30 13:55:31');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1236', '52', '2022-09-30 13:47:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1235', '52', '2022-09-30 13:46:54');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1221', '1', '2022-09-30 13:36:42');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1219', '52', '2022-09-30 12:20:24');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1213', '52', '2022-09-30 12:16:01');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1218', '52', '2022-09-30 12:20:14');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1217', '52', '2022-09-30 12:20:02');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1234', '52', '2022-09-30 13:46:54');

DROP TABLE IF EXISTS `pages_meta`;
CREATE TABLE `pages_meta` (
  `source_id` int unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`source_id`,`name`),
  KEY `name` (`name`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('27', 'pg_itemsPage', '27');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1218', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":1,\"grid-row-start\":\"1\",\"grid-column-end\":\"span 2\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"},\"s\":{\"css\":{\"grid-column-start\":1,\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 8\",\"grid-row-end\":\"span auto\",\"align-self\":\"center\"},\"size\":\"@media (max-width: 640px)\",\"name\":\"s\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1218', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1218', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1219', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":3,\"grid-row-start\":1,\"grid-column-end\":\"span 10\",\"grid-row-end\":\"span 1\",\"display\":\"flex\",\"justify-content\":\"flex-end\",\"align-items\":\"center\",\"text-transform\":\"uppercase\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"},\"s\":{\"css\":{\"grid-column-start\":10,\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 3\",\"grid-row-end\":\"span auto\",\"align-self\":\"center\"},\"size\":\"@media (max-width: 640px)\",\"name\":\"s\"}}},\"a\":{\"id\":\"a\",\"cssClass\":\"\",\"tagName\":\"a\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"margin-right\":\"0px\",\"margin-left\":\"20px\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}},\"menu\":{\"id\":\"menu\",\"cssClass\":\"menu\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"s\":{\"css\":{\"background-color\":\"#ebebeb\"},\"size\":\"@media (max-width: 640px)\",\"name\":\"s\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1219', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1219', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1215', 'pg_itemsPage', '1215');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1220', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"a\",\"tagName\":\"a\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"color\":\"#000000\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1220', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1220', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1223', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1223', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1223', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":\"auto\",\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 0\",\"grid-row-end\":\"span span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}},\"cssClasses\":\"container \"}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1222', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1222', 'pg_page', '1222');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1222', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":[],\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}},\"page-body\":{\"id\":\"page-body\",\"cssClass\":\"page-body\",\"tagName\":\"body\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":[],\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1221', 'pg_itemsPage', '1221');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1224', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":1,\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 6\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"},\"s\":{\"css\":{\"grid-column-start\":1,\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 9\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (max-width: 640px)\",\"name\":\"s\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1224', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1224', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1228', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"body\",\"tagName\":\"body\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":[],\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1228', 'pg_field', '\"pg\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1228', 'pg_page', '1222');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1229', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":null,\"grid-row-start\":null,\"grid-column-end\":\"span 0\",\"grid-row-end\":\"span span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1229', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1229', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1230', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":1,\"grid-row-start\":2,\"grid-column-end\":\"span 0\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1230', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1230', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1233', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1233', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1233', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":null,\"grid-row-start\":null,\"grid-column-end\":\"span 0\",\"grid-row-end\":\"span span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1234', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1234', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1234', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":\"auto\",\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 0\",\"grid-row-end\":\"span span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}},\"cssClasses\":\"container \"}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1235', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1235', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1235', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":1,\"grid-row-start\":2,\"grid-column-end\":\"span 0\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1232', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1232', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1232', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":[],\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1231', 'pg_itemsPage', '1231');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1236', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":4,\"grid-row-start\":\"1\",\"grid-column-end\":\"span 6\",\"grid-row-end\":\"span auto\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1236', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1236', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1237', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":7,\"grid-row-start\":1,\"grid-column-end\":\"span 6\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"},\"s\":{\"css\":{\"grid-column-start\":10,\"grid-row-start\":\"1\",\"grid-column-end\":\"span 3\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (max-width: 640px)\",\"name\":\"s\"}}},\"a\":{\"id\":\"a\",\"cssClass\":\"\",\"tagName\":\"a\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":[],\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1237', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1237', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1238', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":4,\"grid-row-start\":1,\"grid-column-end\":\"span 6\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1238', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1238', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1166', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1202', 'pg_itemsPage', '1202');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1217', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1217', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":\"auto\",\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 0\",\"grid-row-end\":\"span span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}},\"cssClasses\":\"container \"}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1217', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1216', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":[],\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1214', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1214', 'pg_page', '1251');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1216', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1216', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1214', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"container\",\"cssClasses\":\"container \",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"padding-left\":\"60px\",\"padding-right\":\"60px\",\"padding-top\":\"60px\",\"padding-bottom\":\"60px\",\"max-width\":\"1200px\",\"margin-left\":\"auto\",\"margin-right\":\"auto\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"},\"s\":{\"css\":{\"padding-left\":\"15px\",\"padding-right\":\"15px\",\"padding-top\":\"15px\",\"padding-bottom\":\"15px\",\"grid-column-start\":1,\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 10\",\"grid-row-end\":\"span auto\"},\"size\":\"@media (max-width: 640px)\",\"name\":\"s\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1213', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1213', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1212', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"pg-main\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"display\":\"block\",\"font-family\":\"Arial\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1212', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1212', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1203', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":[],\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1203', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1203', 'pg_page', '1203');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1213', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":\"auto\",\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 0\",\"grid-row-end\":\"span span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}},\"cssClasses\":\"container \"}}');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int unsigned NOT NULL,
  `parents_id` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1140', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1141', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1203', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1203', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1213', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1213', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1213', '1203');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1216', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1216', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1217', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1217', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1217', '1216');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1222', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1222', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1223', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1223', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1223', '1222');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1232', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1232', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1234', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1234', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1234', '1232');

DROP TABLE IF EXISTS `pages_sortfields`;
CREATE TABLE `pages_sortfields` (
  `pages_id` int unsigned NOT NULL DEFAULT '0',
  `sortfield` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`pages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `process_forgot_password`;
CREATE TABLE `process_forgot_password` (
  `id` int unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `token` char(32) NOT NULL,
  `ts` int unsigned NOT NULL,
  `ip` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `token` (`token`),
  KEY `ts` (`ts`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=ascii;


DROP TABLE IF EXISTS `session_login_throttle`;
CREATE TABLE `session_login_throttle` (
  `name` varchar(128) NOT NULL,
  `attempts` int unsigned NOT NULL DEFAULT '0',
  `last_attempt` int unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `fieldgroups_id` int unsigned NOT NULL DEFAULT '0',
  `flags` int NOT NULL DEFAULT '0',
  `cache_time` mediumint NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fieldgroups_id` (`fieldgroups_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb3;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1664562317,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"editRoles\":[1142],\"noParents\":1,\"childTemplates\":[29],\"slashUrls\":1,\"compile\":0,\"modified\":1664562317,\"ns\":\"ProcessWire\",\"_lazy\":1,\"roles\":[37,1142]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"slashUrls\":1,\"compile\":0,\"modified\":1664562317,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('69', 'pg_editor', '123', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-font title\",\"compile\":3,\"label\":\"Editor\",\"modified\":1664721488,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'pg_gallery_video', '108', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-video-camera title\",\"compile\":3,\"label\":\"Gallery Video\",\"modified\":1662812583}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('53', 'pg_gallery', '107', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-camera-retro title\",\"compile\":3,\"label\":\"Gallery\",\"modified\":1664532567,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'pg_container', '106', '0', '0', '{\"useRoles\":1,\"editRoles\":[1142],\"noParents\":-1,\"slashUrls\":1,\"compile\":3,\"modified\":1663076543,\"_lazy\":\"*\",\"roles\":[37,1142]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('55', 'pg_group', '109', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-folder-open title\",\"compile\":3,\"label\":\"Group\",\"modified\":1664721488,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('56', 'pg_image', '110', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-file-image-o title\",\"compile\":3,\"label\":\"Image\",\"modified\":1664721488,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('57', 'pg_map', '111', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-map title\",\"compile\":3,\"label\":\"Map\",\"modified\":1664543132,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('58', 'pg_marker', '112', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-map-pin title\",\"compile\":3,\"label\":\"Marker\",\"modified\":1662812601}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('59', 'pg_navigation', '113', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-bars title\",\"compile\":3,\"label\":\"Navigation\",\"modified\":1664721488,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('60', 'pg_reference', '114', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-link title\",\"compile\":3,\"label\":\"Reference\",\"modified\":1664721488,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('61', 'pg_sequenz', '115', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-film title\",\"compile\":3,\"label\":\"Sequenz\",\"modified\":1662812624}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('62', 'pg_slider', '116', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-ellipsis-h title\",\"compile\":3,\"label\":\"Slider\",\"modified\":1664532567,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('63', 'pg_spacer', '117', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-arrows-h title\",\"compile\":3,\"label\":\"Spacer\",\"modified\":1662812631}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('64', 'pg_text', '118', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-header title\",\"compile\":3,\"label\":\"Text\",\"modified\":1664532567,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('65', 'pg_video', '119', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-file-video-o title\",\"compile\":3,\"label\":\"Video\",\"modified\":1662812637}');

DROP TABLE IF EXISTS `textformatter_video_embed`;
CREATE TABLE `textformatter_video_embed` (
  `video_id` varchar(128) NOT NULL,
  `embed_code` varchar(1024) NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` text,
  PRIMARY KEY (`video_id`),
  KEY `created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":45,"numCreateTables":49,"numInserts":630,"numSeconds":0}