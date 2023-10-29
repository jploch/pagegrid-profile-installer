# --- WireDatabaseBackup {"time":"2023-10-10 16:27:23","user":"","dbName":"pgrid-profile","description":"","tables":[],"excludeTables":["pages_drafts","pages_roles","permissions","roles","roles_permissions","users","users_roles","user","role","permission"],"excludeCreateTables":[],"excludeExportTables":["field_roles","field_permissions","field_email","field_pass","caches","session_login_throttle","page_path_history"]}

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

DROP TABLE IF EXISTS `field_pg`;
CREATE TABLE `field_pg` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_blueprint_parent`;
CREATE TABLE `field_pg_blueprint_parent` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_datalist`;
CREATE TABLE `field_pg_datalist` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_datalist_date`;
CREATE TABLE `field_pg_datalist_date` (
  `pages_id` int unsigned NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_datalist_fields`;
CREATE TABLE `field_pg_datalist_fields` (
  `pages_id` int unsigned NOT NULL,
  `data` int unsigned NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_datalist_image`;
CREATE TABLE `field_pg_datalist_image` (
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


DROP TABLE IF EXISTS `field_pg_datalist_limit`;
CREATE TABLE `field_pg_datalist_limit` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_datalist_tab`;
CREATE TABLE `field_pg_datalist_tab` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_datalist_tab_end`;
CREATE TABLE `field_pg_datalist_tab_end` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_datalist_text`;
CREATE TABLE `field_pg_datalist_text` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_datalist_video`;
CREATE TABLE `field_pg_datalist_video` (
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


DROP TABLE IF EXISTS `field_pg_editor`;
CREATE TABLE `field_pg_editor` (
  `pages_id` int unsigned NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_pg_editor` (`pages_id`, `data`) VALUES('1298', '<p>Edit</p>');

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


DROP TABLE IF EXISTS `field_pg_iframe_ratio`;
CREATE TABLE `field_pg_iframe_ratio` (
  `pages_id` int unsigned NOT NULL,
  `data` int unsigned NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_iframe_thumbnail`;
CREATE TABLE `field_pg_iframe_thumbnail` (
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


DROP TABLE IF EXISTS `field_pg_iframe_title`;
CREATE TABLE `field_pg_iframe_title` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


DROP TABLE IF EXISTS `field_pg_iframe_url`;
CREATE TABLE `field_pg_iframe_url` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
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

INSERT INTO `field_pg_marker` (`pages_id`, `data`) VALUES('1295', '<p>Edit</p>');

DROP TABLE IF EXISTS `field_pg_marker_label`;
CREATE TABLE `field_pg_marker_label` (
  `pages_id` int unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`pages_id`),
  KEY `data_exact` (`data`(250)),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `field_pg_marker_label` (`pages_id`, `data`) VALUES('1294', '<p>Edit</p>');

DROP TABLE IF EXISTS `field_pg_reference`;
CREATE TABLE `field_pg_reference` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


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

INSERT INTO `field_pg_text` (`pages_id`, `data`) VALUES('1299', '<p>Edit</p>');
INSERT INTO `field_pg_text` (`pages_id`, `data`) VALUES('1301', 'Thanks for using PAGEGRID! This is just some dummy content. Click twice to edit this text or click the trash icon above it to delete it.<br /><br />You can add new items by dragging the icons on the left onto the page.');

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
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1302', '283');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1268', '261');
INSERT INTO `field_process` (`pages_id`, `data`) VALUES('1269', '262');

DROP TABLE IF EXISTS `field_roles`;
CREATE TABLE `field_roles` (
  `pages_id` int unsigned NOT NULL,
  `data` int NOT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`sort`),
  KEY `data` (`data`,`pages_id`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

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
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1265', 'Resize PAGEGRID items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1264', 'Drag PAGEGRID items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1261', 'Use the front-end page editor');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1262', 'Allow PAGEGRID to process ajax calls');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1263', 'Edit PAGEGRID items in modal');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1140', 'PageGrid Items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1141', 'PageGrid Classes');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1159', 'Upgrades');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1220', 'a');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1166', '404 Not Found items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1298', 'pg-dummy-pg_editor');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1302', 'Export Site Profile');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1299', 'pg-dummy-pg_text');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1296', 'Home items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1297', 'pg-group-1297');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1249', 'Trigger database backup when a user logs in or logs out (CronjobDatabaseBackup)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1295', 'pg-dummy-pg_marker');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1301', 'pg-text-1301');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1228', 'body');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1212', 'pg-main');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1214', 'container');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1266', 'Enable styling of PAGEGRID items');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1267', 'Use the sidebar to drag new items into the page (also needs pagegrid-drag permission to work)');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1268', 'PAGEGRID');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1269', 'Clone');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1270', 'Clone a page');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1271', 'Clone a tree of pages');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1280', 'Animations');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1281', 'Blueprints');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1282', 'Symbols');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1292', 'Home');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1294', 'pg-dummy-pg_marker_label');
INSERT INTO `field_title` (`pages_id`, `data`) VALUES('1293', 'PageGrid Dummies');

DROP TABLE IF EXISTS `fieldgroups`;
CREATE TABLE `fieldgroups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3;

INSERT INTO `fieldgroups` (`id`, `name`) VALUES('2', 'admin');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('3', 'user');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('4', 'role');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('5', 'permission');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('1', 'home');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('83', 'basic-page');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('129', 'pg_editor');
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
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('130', 'pg_text');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('119', 'pg_video');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('124', 'pg_blueprint');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('125', 'pg_datalist');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('126', 'pg_iframe');
INSERT INTO `fieldgroups` (`id`, `name`) VALUES('127', 'pg_prev_next');

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
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '3', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '4', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('4', '5', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('5', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '92', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '125', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('3', '97', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('129', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('106', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '124', '3', NULL);
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
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '148', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('130', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '115', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '116', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('119', '117', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('129', '147', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '126', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '127', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '130', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '129', '8', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '128', '9', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '122', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '124', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '125', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '126', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '127', '5', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '130', '6', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '129', '7', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '128', '8', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('1', '123', '9', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '131', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '122', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('83', '123', '10', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('124', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('124', '132', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('125', '133', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('125', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('125', '134', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('125', '135', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '143', '2', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '142', '1', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '1', '0', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '144', '3', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('126', '145', '4', NULL);
INSERT INTO `fieldgroups_fields` (`fieldgroups_id`, `fields_id`, `sort`, `data`) VALUES('127', '1', '0', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb3;

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
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('131', 'FieldtypePageGrid', 'pg', '0', 'pagegrid', '{\"icon\":\"th\",\"collapsed\":0,\"template_id\":[75,76,56,65,53,54,55,58,57,59,60,61,62,63,72,71,73]}');
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
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('115', 'FieldtypeFile', 'pg_video', '0', 'Video', '{\"tags\":\"PageGrid\",\"extensions\":\"mp4\",\"maxFiles\":1,\"outputFormat\":0,\"fileSchema\":14}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('116', 'FieldtypeImage', 'pg_video_poster', '0', 'Preview Image', '{\"tags\":\"PageGrid\",\"fileSchema\":270,\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('117', 'FieldtypeText', 'pg_video_options', '0', 'Options', '{\"tags\":\"PageGrid\",\"notes\":\"example: autoplay muted loop\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('147', 'FieldtypeTextarea', 'pg_editor', '0', 'Rich Text', '{\"tags\":\"PageGrid\",\"inputfieldClass\":\"InputfieldTinyMCE\",\"contentType\":1,\"htmlOptions\":[2],\"inlineMode\":1,\"features\":[\"toolbar\",\"stickybars\",\"spellcheck\",\"purifier\",\"pasteFilter\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('148', 'FieldtypeTextarea', 'pg_text', '0', 'Text', '{\"tags\":\"PageGrid\",\"inputfieldClass\":\"InputfieldTinyMCE\",\"contentType\":1,\"htmlOptions\":[2],\"inlineMode\":1,\"features\":[\"toolbar\",\"stickybars\",\"spellcheck\",\"purifier\",\"pasteFilter\"],\"toolbar\":\"pwlink\",\"plugins\":[\"link\",\"lists\",\"pwlink\"],\"settingsJSON\":\"{\\\"forced_root_block\\\": \\\"div\\\", \\\"newline_behavior\\\": \\\"linebreak\\\", \\\"valid_elements\\\": \\\"a[href|target=_blank],br\\\"}\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('125', 'FieldtypeText', 'seo_keywords', '0', 'Keywords', '{\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('126', 'FieldtypeText', 'seo_description', '0', 'Description', '{\"description\":\"A good length for a description is 160 characters.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('127', 'FieldtypeText', 'seo_image', '0', 'Image', '{\"description\":\"Please enter the URL (including &quot;http:\\/\\/...&quot;) to a preview image.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('128', 'FieldtypeText', 'seo_canonical', '0', 'Canonical Link', '{\"notes\":\"The URL should include &quot;http:\\/\\/...&quot;.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('129', 'FieldtypeTextarea', 'seo_custom', '0', 'Custom', '{\"description\":\"If you want to add other meta tags, you can do it here.\",\"notes\":\"Please use this schema: name := content. One tag per line. Special characters are only allowed in the content part and get converted to HTML.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('130', 'FieldtypeText', 'seo_robots', '0', 'Robots', '{\"description\":\"The robots settings will tell search engine which data they are allowed to include\\/index.\",\"notes\":\"This overwrites the module&#039;s global setting for this page.\",\"tags\":\"seo\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('132', 'FieldtypePage', 'pg_blueprint_parent', '0', 'Blueprint Settings', '{\"tags\":\"PageGrid\",\"description\":\"Select a parent page here if you want to add the content of this blueprint to new child pages automatically.\",\"inputfield\":\"InputfieldPageListSelect\",\"derefAsPage\":1,\"contentType\":1,\"collapsed\":1,\"icon\":\"cog\",\"labelFieldName\":\"title\",\"findPagesSelector\":\"template!=2\",\"appendMarkup\":\"<style>#wrap_Inputfield_pg_blueprint_parent .PageListTemplate_admin{display:none;}<\\/style>\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('133', 'FieldtypePage', 'pg_datalist', '0', 'Parent Page', '{\"tags\":\"PageGrid\",\"description\":\"The list will be generated from the children of the parent page you select here.\",\"inputfield\":\"InputfieldPageListSelect\",\"derefAsPage\":1,\"parent_id\":1,\"labelFieldName\":\"title\",\"contentType\":1}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('134', 'FieldtypeOptions', 'pg_datalist_fields', '0', 'Fields', '{\"tags\":\"PageGrid\",\"description\":\"Select the fields that each list item will display. Those fields will be added to the child template automatically.\",\"inputfieldClass\":\"InputfieldAsmSelect\",\"showIf\":\"pg_datalist!=0\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('135', 'FieldtypeInteger', 'pg_datalist_limit', '0', 'Number of list items', '{\"tags\":\"PageGrid\",\"description\":\"0 = show all\",\"inputType\":\"text\",\"showIf\":\"pg_datalist!=0\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('136', 'FieldtypeFieldsetTabOpen', 'pg_datalist_tab', '0', 'Datalist', '{\"tags\":\"PageGrid\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('137', 'FieldtypeFieldsetClose', 'pg_datalist_tab_END', '0', 'Datalist', '{\"tags\":\"PageGrid\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('138', 'FieldtypeDatetime', 'pg_datalist_date', '0', 'Date', '{\"tags\":\"PageGrid\",\"dateOutputFormat\":\"j.n.Y\",\"datepicker\":3,\"timeInputSelect\":0,\"dateInputFormat\":\"j.n.y\",\"inputType\":\"text\",\"htmlType\":\"date\",\"dateSelectFormat\":\"yMd\",\"contentType\":1,\"stripTags\":1,\"textformatters\":[\"TextformatterEntities\"],\"defaultToday\":1,\"size\":100}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('139', 'FieldtypeImage', 'pg_datalist_image', '0', 'Image', '{\"tags\":\"PageGrid\",\"fileSchema\":256,\"extensions\":\"gif jpg jpeg png svg\",\"maxFiles\":1,\"outputFormat\":2}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('140', 'FieldtypeFile', 'pg_datalist_video', '0', 'Video', '{\"tags\":\"PageGrid\",\"description\":\"when you upload an image and a video, the video is displayed and the image serves as a placeholder until the video is loaded.\",\"extensions\":\"mp4\",\"maxFiles\":1,\"outputFormat\":0}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('141', 'FieldtypeTextarea', 'pg_datalist_text', '0', 'Text', '{\"tags\":\"PageGrid\",\"inputfieldClass\":\"InputfieldTextarea\",\"contentType\":1,\"stripTags\":1,\"textformatters\":[\"TextformatterEntities\"]}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('142', 'FieldtypeText', 'pg_iframe_url', '0', 'Url', '{\"tags\":\"PageGrid\",\"description\":\"If you use a vimeo\\/youtube url, the title and thumbnail will be loaded automatically and saved to the database. Users who access your site from the frontend will not load external resources until the play button is clicked (privacy friendly and DSGVO conform).\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('143', 'FieldtypeImage', 'pg_iframe_thumbnail', '0', 'Thumbnail', '{\"tags\":\"PageGrid\",\"fileSchema\":256,\"description\":\"Leave empty to auto generate image from youtube\\/vimeo urls\",\"extensions\":\"gif jpg jpeg png\",\"maxFiles\":1,\"outputFormat\":2}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('144', 'FieldtypeText', 'pg_iframe_title', '0', 'Title', '{\"tags\":\"PageGrid\",\"description\":\"Leave empty to auto generate title from youtube\\/vimeo urls\"}');
INSERT INTO `fields` (`id`, `type`, `name`, `flags`, `label`, `data`) VALUES('145', 'FieldtypeOptions', 'pg_iframe_ratio', '0', 'Ratio', '{\"tags\":\"PageGrid\",\"inputfieldClass\":\"InputfieldSelect\"}');

DROP TABLE IF EXISTS `fieldtype_options`;
CREATE TABLE `fieldtype_options` (
  `fields_id` int unsigned NOT NULL,
  `option_id` int unsigned NOT NULL,
  `title` text,
  `value` varchar(250) DEFAULT NULL,
  `sort` int unsigned NOT NULL,
  PRIMARY KEY (`fields_id`,`option_id`),
  UNIQUE KEY `title` (`title`(250),`fields_id`),
  KEY `value` (`value`,`fields_id`),
  KEY `sort` (`sort`,`fields_id`),
  FULLTEXT KEY `title_ft` (`title`),
  FULLTEXT KEY `value_ft` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('134', '1', 'Title', 'title', '0');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('134', '2', 'Date', 'date', '1');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('134', '3', 'Image/Video', 'image', '2');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('134', '4', 'Text', 'text', '3');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('145', '1', '1:1', '1:1', '0');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('145', '2', '16:9', '16:9', '1');
INSERT INTO `fieldtype_options` (`fields_id`, `option_id`, `title`, `value`, `sort`) VALUES('145', '3', '4:3', '4:3', '2');

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `flags` int NOT NULL DEFAULT '0',
  `data` mediumtext NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class` (`class`)
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb3;

INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('1', 'FieldtypeTextarea', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('3', 'FieldtypeText', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('4', 'FieldtypePage', '3', '', '2022-09-08 16:37:59');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('27', 'FieldtypeModule', '1', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('28', 'FieldtypeDatetime', '0', '', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('29', 'FieldtypeEmail', '1', '', '2022-09-08 16:37:59');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('139', 'SystemUpdater', '1', '{\"systemVersion\":20,\"coreVersion\":\"3.0.229\"}', '2022-09-08 16:37:59');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('33', 'InputfieldWrapper', '0', '', '2023-01-16 12:09:03');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('170', 'PageFrontEdit', '2', '{\"inlineEditFields\":[141,147,110,109,148],\"inlineLimitPage\":\"0\"}', '2022-09-08 16:57:53');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('185', 'ProcessForgotPassword', '1', '{\"emailFrom\":\"PWAdmin@pg-test.test\"}', '2022-09-09 12:25:36');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('184', 'AdminThemeCanvas', '10', '{\"useAsLogin\":1,\"userAvatar\":\"icon.user-circle\",\"userLabel\":\"{Name}\",\"logoURL\":\"\",\"logoAction\":\"0\",\"layout\":\"\",\"noGrid\":\"0\",\"maxWidth\":1600,\"groupNotices\":\"1\",\"cssURL\":\"\",\"inputSize\":\"m\",\"noBorderTypes\":[],\"offsetTypes\":[],\"nav-icons\":\"nav-show-icons\",\"hide-title\":1,\"hide-bookmarks\":1,\"breadcrump\":\"breadcrumb-with-title\",\"breadcrumb\":\"breadcrumb-with-title\"}', '2022-09-09 12:25:27');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('259', 'FieldtypePageGrid', '11', '{\"interface\":[\"hideFieldTitle\",\"hidePageHeadline\",\"hideTitleField\",\"hideTabs\",\"hideSaveButton\"],\"interfaceDefault\":0,\"lKey\":\"\",\"collapsedState\":\"ModuleInfo,lKey,fieldSettings,customStyles,uninstall,\",\"stylePanel\":1,\"fontPrivacy\":1,\"deleteFonts\":\"\",\"uploadFonts\":[],\"fallbackFonts\":\"Helvetica, Arial, sans-serif\",\"fontColor\":\"\",\"bgColor\":\"\",\"inlineEditFields\":[141,147,110,109,148],\"inlineEditFieldsUpload\":[101,102,105,115],\"placeholderText\":\"Click twice to edit this text\",\"customStyles\":\"\",\"plugins\":[\"lazysizes\"],\"pluginsDefault\":0,\"placeholderText_121\":\"Click twice to edit this text\",\"placeholderText_110\":\"\",\"placeholderText_109\":\"\",\"placeholderText_114\":\"Click twice to edit this text\",\"inlineEditorFrontDisable\":1,\"placeholderText_146\":\"Click twice to edit this text\",\"placeholderText_147\":\"Click twice to edit this text\",\"placeholderText_148\":\"Click twice to edit this text\",\"placeholderText_141\":\"\"}', '2023-01-17 16:25:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('260', 'InputfieldPageGrid', '0', '', '2023-01-17 16:25:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('261', 'ProcessPageGrid', '1', '', '2023-01-17 16:25:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('262', 'ProcessPageClone', '11', '', '2023-01-17 16:25:47');
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
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('239', 'BlocksVideo', '10', '', '2022-09-10 14:23:57');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('242', 'InputfieldPageAutocomplete', '0', '', '2022-09-12 11:53:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('248', 'MarkupSitemap', '3', '', '2022-09-30 15:06:33');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('249', 'TextformatterMarkdownExtra', '1', '', '2022-09-30 15:06:34');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('250', 'ImageCropRatios', '10', '{\"default_aspect_ratios\":\"-\\n4:3\\n3:2\\n1:1\\n2:1\\n16:9\\n1.85:1\"}', '2022-09-30 15:06:54');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('251', 'MarkupSEO', '2', '{\"includeTemplates\":[\"home\",\"basic-page\"],\"author\":\"\",\"sitename\":\"\",\"useParents\":\"\",\"title\":\"\",\"titleSmart\":[\"title\"],\"keywords\":\"\",\"keywordsSmart\":[],\"description\":\"\",\"descriptionSmart\":[],\"image\":\"\",\"imageSmart\":[],\"titleFormat\":\"\",\"canonicalProtocol\":\"auto\",\"custom\":\"\",\"robots\":[],\"hardLimit\":1,\"titleLimit\":60,\"descriptionLimit\":160,\"includeGenerator\":1,\"includeOpenGraph\":1,\"includeTwitter\":1,\"twitterUsername\":\"\",\"method\":\"manual\",\"addWhitespace\":1,\"googleAnalytics\":\"\",\"googleAnalyticsAnonymizeIP\":\"\",\"piwikAnalyticsUrl\":\"\",\"piwikAnalyticsIDSite\":\"\"}', '2022-09-30 15:07:20');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('254', 'LazyCron', '3', '', '2022-09-30 20:42:40');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('256', 'CronjobDatabaseBackup', '3', '{\"cycle\":\"loginTrigger\",\"backup_name\":\"\",\"backup_fileinfo\":\"\",\"max\":\"\",\"deadline\":\"1 month\",\"stopword\":\"protected\",\"field_storage_path\":\"\",\"backup_all\":1,\"tables\":{\"caches\":\"caches\",\"field_admin_theme\":\"field_admin_theme\",\"field_email\":\"field_email\",\"field_pass\":\"field_pass\",\"field_permissions\":\"field_permissions\",\"field_pg_gallery\":\"field_pg_gallery\",\"field_pg_gallery_video\":\"field_pg_gallery_video\",\"field_pg_gallery_video_options\":\"field_pg_gallery_video_options\",\"field_pg_gallery_video_poster\":\"field_pg_gallery_video_poster\",\"field_pg_image\":\"field_pg_image\",\"field_pg_image_link\":\"field_pg_image_link\",\"field_pg_image_link_external\":\"field_pg_image_link_external\",\"field_pg_map\":\"field_pg_map\",\"field_pg_marker\":\"field_pg_marker\",\"field_pg_marker_label\":\"field_pg_marker_label\",\"field_pg_reference\":\"field_pg_reference\",\"field_pg_sequenz\":\"field_pg_sequenz\",\"field_pg_slider_autoplay\":\"field_pg_slider_autoplay\",\"field_pg_video\":\"field_pg_video\",\"field_pg_video_options\":\"field_pg_video_options\",\"field_pg_video_poster\":\"field_pg_video_poster\",\"field_process\":\"field_process\",\"field_roles\":\"field_roles\",\"field_seo_canonical\":\"field_seo_canonical\",\"field_seo_custom\":\"field_seo_custom\",\"field_seo_description\":\"field_seo_description\",\"field_seo_image\":\"field_seo_image\",\"field_seo_keywords\":\"field_seo_keywords\",\"field_seo_robots\":\"field_seo_robots\",\"field_seo_tab\":\"field_seo_tab\",\"field_seo_tab_end\":\"field_seo_tab_end\",\"field_seo_title\":\"field_seo_title\",\"field_title\":\"field_title\",\"fieldgroups\":\"fieldgroups\",\"fieldgroups_fields\":\"fieldgroups_fields\",\"fields\":\"fields\",\"modules\":\"modules\",\"pages\":\"pages\",\"pages_access\":\"pages_access\",\"pages_meta\":\"pages_meta\",\"pages_parents\":\"pages_parents\",\"pages_sortfields\":\"pages_sortfields\",\"process_forgot_password\":\"process_forgot_password\",\"session_login_throttle\":\"session_login_throttle\",\"templates\":\"templates\",\"textformatter_video_embed\":\"textformatter_video_embed\"},\"tables_content\":{\"caches\":\"caches\",\"field_admin_theme\":\"field_admin_theme\",\"field_email\":\"field_email\",\"field_pass\":\"field_pass\",\"field_permissions\":\"field_permissions\",\"field_pg_gallery\":\"field_pg_gallery\",\"field_pg_gallery_video\":\"field_pg_gallery_video\",\"field_pg_gallery_video_options\":\"field_pg_gallery_video_options\",\"field_pg_gallery_video_poster\":\"field_pg_gallery_video_poster\",\"field_pg_image\":\"field_pg_image\",\"field_pg_image_link\":\"field_pg_image_link\",\"field_pg_image_link_external\":\"field_pg_image_link_external\",\"field_pg_map\":\"field_pg_map\",\"field_pg_marker\":\"field_pg_marker\",\"field_pg_marker_label\":\"field_pg_marker_label\",\"field_pg_reference\":\"field_pg_reference\",\"field_pg_sequenz\":\"field_pg_sequenz\",\"field_pg_slider_autoplay\":\"field_pg_slider_autoplay\",\"field_pg_video\":\"field_pg_video\",\"field_pg_video_options\":\"field_pg_video_options\",\"field_pg_video_poster\":\"field_pg_video_poster\",\"field_process\":\"field_process\",\"field_roles\":\"field_roles\",\"field_seo_canonical\":\"field_seo_canonical\",\"field_seo_custom\":\"field_seo_custom\",\"field_seo_description\":\"field_seo_description\",\"field_seo_image\":\"field_seo_image\",\"field_seo_keywords\":\"field_seo_keywords\",\"field_seo_robots\":\"field_seo_robots\",\"field_seo_tab\":\"field_seo_tab\",\"field_seo_tab_end\":\"field_seo_tab_end\",\"field_seo_title\":\"field_seo_title\",\"field_title\":\"field_title\",\"fieldgroups\":\"fieldgroups\",\"fieldgroups_fields\":\"fieldgroups_fields\",\"fields\":\"fields\",\"modules\":\"modules\",\"pages\":\"pages\",\"pages_access\":\"pages_access\",\"pages_meta\":\"pages_meta\",\"pages_parents\":\"pages_parents\",\"pages_sortfields\":\"pages_sortfields\",\"process_forgot_password\":\"process_forgot_password\",\"session_login_throttle\":\"session_login_throttle\",\"templates\":\"templates\",\"textformatter_video_embed\":\"textformatter_video_embed\"},\"auto_add_new_fields\":null,\"cleanup\":\"\"}', '2022-10-01 17:41:32');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('257', 'InputfieldTinyMCE', '4', '{\"skin\":\"oxide\",\"skin_url\":\"\",\"content_css\":\"wire\",\"content_css_url\":\"\",\"extPluginOpts\":\"\",\"optionals\":[\"settingsJSON\",\"settingsJSON\"],\"headlines\":[\"h1\",\"h2\",\"h3\",\"h4\",\"h5\",\"h6\"],\"contextmenu\":\"default\",\"menubar\":\"default\",\"removed_menuitems\":\"default\",\"styleFormatsCSS\":\"\",\"invalid_styles\":\"default\",\"imageFields\":[],\"extraCSS\":\"\",\"pasteFilter\":\"default\",\"defaultsJSON\":\"\",\"defaultsFile\":\"\",\"debugMode\":0}', '2023-01-16 12:09:24');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('267', '.Modules.wire/modules/', '8192', 'Page/PageFrontEdit/PageFrontEdit.module\nLanguageSupport/FieldtypePageTitleLanguage.module\nLanguageSupport/LanguageSupportFields.module\nLanguageSupport/FieldtypeTextLanguage.module\nLanguageSupport/LanguageTabs.module\nLanguageSupport/FieldtypeTextareaLanguage.module\nLanguageSupport/LanguageSupport.module\nLanguageSupport/LanguageSupportPageNames.module\nLanguageSupport/ProcessLanguageTranslator.module\nLanguageSupport/ProcessLanguage.module\nTextformatter/TextformatterSmartypants/TextformatterSmartypants.module\nTextformatter/TextformatterMarkdownExtra/TextformatterMarkdownExtra.module\nTextformatter/TextformatterPstripper.module\nTextformatter/TextformatterStripTags.module\nTextformatter/TextformatterEntities.module\nTextformatter/TextformatterNewlineBR.module\nTextformatter/TextformatterNewlineUL.module\nPagePathHistory.module\nJquery/JqueryUI/JqueryUI.module\nJquery/JqueryTableSorter/JqueryTableSorter.module\nJquery/JqueryCore/JqueryCore.module\nJquery/JqueryWireTabs/JqueryWireTabs.module\nJquery/JqueryMagnific/JqueryMagnific.module\nLazyCron.module\nImage/ImageSizerEngineIMagick/ImageSizerEngineIMagick.module\nImage/ImageSizerEngineAnimatedGif/ImageSizerEngineAnimatedGif.module\nSystem/SystemUpdater/SystemUpdater.module\nSystem/SystemNotifications/SystemNotifications.module\nSystem/SystemNotifications/FieldtypeNotifications.module\nMarkup/MarkupCache.module\nMarkup/MarkupPageArray.module\nMarkup/MarkupHTMLPurifier/MarkupHTMLPurifier.module\nMarkup/MarkupPagerNav/MarkupPagerNav.module\nMarkup/MarkupPageFields.module\nMarkup/MarkupAdminDataTable/MarkupAdminDataTable.module\nMarkup/MarkupRSS.module\nPageRender.module\nFieldtype/FieldtypeImage/FieldtypeImage.module\nFieldtype/FieldtypeFieldsetOpen.module\nFieldtype/FieldtypeCache.module\nFieldtype/FieldtypeFile/FieldtypeFile.module\nFieldtype/FieldtypePage.module\nFieldtype/FieldtypeTextarea.module\nFieldtype/FieldtypePageTable.module\nFieldtype/FieldtypeModule.module\nFieldtype/FieldtypeRepeater/FieldtypeFieldsetPage.module\nFieldtype/FieldtypeRepeater/FieldtypeRepeater.module\nFieldtype/FieldtypeRepeater/InputfieldRepeater.module\nFieldtype/FieldtypePageTitle.module\nFieldtype/FieldtypeURL.module\nFieldtype/FieldtypeInteger.module\nFieldtype/FieldtypeDecimal.module\nFieldtype/FieldtypeFieldsetClose.module\nFieldtype/FieldtypeOptions/FieldtypeOptions.module\nFieldtype/FieldtypePassword.module\nFieldtype/FieldtypeCheckbox.module\nFieldtype/FieldtypeFloat.module\nFieldtype/FieldtypeSelector.module\nFieldtype/FieldtypeComments/FieldtypeComments.module\nFieldtype/FieldtypeComments/InputfieldCommentsAdmin.module\nFieldtype/FieldtypeComments/CommentFilterAkismet.module\nFieldtype/FieldtypeText.module\nFieldtype/FieldtypeFieldsetTabOpen.module\nFieldtype/FieldtypeToggle.module\nFieldtype/FieldtypeEmail.module\nFieldtype/FieldtypeDatetime.module\nAdminTheme/AdminThemeReno/AdminThemeReno.module\nAdminTheme/AdminThemeUikit/AdminThemeUikit.module\nAdminTheme/AdminThemeDefault/AdminThemeDefault.module\nPagePermissions.module\nInputfield/InputfieldInteger.module\nInputfield/InputfieldURL.module\nInputfield/InputfieldHidden.module\nInputfield/InputfieldPageTable/InputfieldPageTable.module\nInputfield/InputfieldFloat.module\nInputfield/InputfieldCheckboxes/InputfieldCheckboxes.module\nInputfield/InputfieldSelect.module\nInputfield/InputfieldFieldset.module\nInputfield/InputfieldImage/InputfieldImage.module\nInputfield/InputfieldTextarea.module\nInputfield/InputfieldFile/InputfieldFile.module\nInputfield/InputfieldToggle/InputfieldToggle.module\nInputfield/InputfieldButton.module\nInputfield/InputfieldAsmSelect/InputfieldAsmSelect.module\nInputfield/InputfieldPage/InputfieldPage.module\nInputfield/InputfieldEmail.module\nInputfield/InputfieldPageName/InputfieldPageName.module\nInputfield/InputfieldDatetime/InputfieldDatetime.module\nInputfield/InputfieldCKEditor/InputfieldCKEditor.module\nInputfield/InputfieldText/InputfieldText.module\nInputfield/InputfieldCheckbox/InputfieldCheckbox.module\nInputfield/InputfieldMarkup.module\nInputfield/InputfieldSelectMultiple.module\nInputfield/InputfieldIcon/InputfieldIcon.module\nInputfield/InputfieldRadios/InputfieldRadios.module\nInputfield/InputfieldPageTitle/InputfieldPageTitle.module\nInputfield/InputfieldPassword/InputfieldPassword.module\nInputfield/InputfieldPageAutocomplete/InputfieldPageAutocomplete.module\nInputfield/InputfieldSelector/InputfieldSelector.module\nInputfield/InputfieldSubmit/InputfieldSubmit.module\nInputfield/InputfieldTinyMCE/InputfieldTinyMCE.module.php\nInputfield/InputfieldTextTags/InputfieldTextTags.module\nInputfield/InputfieldForm.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelect.module\nInputfield/InputfieldPageListSelect/InputfieldPageListSelectMultiple.module\nInputfield/InputfieldName.module\nPagePaths.module\nFileCompilerTags.module\nProcess/ProcessModule/ProcessModule.module\nProcess/ProcessPageClone.module\nProcess/ProcessField/ProcessField.module\nProcess/ProcessPermission/ProcessPermission.module\nProcess/ProcessForgotPassword/ProcessForgotPassword.module\nProcess/ProcessPageEditLink/ProcessPageEditLink.module\nProcess/ProcessLogger/ProcessLogger.module\nProcess/ProcessPageLister/ProcessPageLister.module\nProcess/ProcessHome.module\nProcess/ProcessRole/ProcessRole.module\nProcess/ProcessPageView.module\nProcess/ProcessPageSearch/ProcessPageSearch.module\nProcess/ProcessPageList/ProcessPageList.module\nProcess/ProcessPageType/ProcessPageType.module\nProcess/ProcessPageEdit/ProcessPageEdit.module\nProcess/ProcessPageEditImageSelect/ProcessPageEditImageSelect.module\nProcess/ProcessCommentsManager/ProcessCommentsManager.module\nProcess/ProcessList.module\nProcess/ProcessPageSort.module\nProcess/ProcessUser/ProcessUser.module\nProcess/ProcessPagesExportImport/ProcessPagesExportImport.module\nProcess/ProcessLogin/ProcessLogin.module\nProcess/ProcessPageTrash.module\nProcess/ProcessRecentPages/ProcessRecentPages.module\nProcess/ProcessTemplate/ProcessTemplate.module\nProcess/ProcessPageAdd/ProcessPageAdd.module\nProcess/ProcessProfile/ProcessProfile.module\nSession/SessionLoginThrottle/SessionLoginThrottle.module\nSession/SessionHandlerDB/ProcessSessionDB.module\nSession/SessionHandlerDB/SessionHandlerDB.module', '2023-10-10 17:53:46');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('268', '.Modules.site/modules/', '8192', 'PageGridBlocks/BlocksVideo.module\nPageGridBlocks/BlocksMap.module\nPageGridBlocks/BlocksDatalist.module\nPageGridBlocks/BlocksIframe.module\nPageGridBlocks/BlocksSpacer.module\nPageGridBlocks/BlocksEditor.module\nPageGridBlocks/BlocksPrevNext.module\nPageGridBlocks/BlocksSequenz.module\nPageGridBlocks/BlocksMarker.module\nPageGridBlocks/BlocksReference.module\nPageGridBlocks/PageGridBlocks.module\nPageGridBlocks/BlocksGallery.module\nPageGridBlocks/BlocksGroup.module\nPageGridBlocks/BlocksGalleryVideo.module\nPageGridBlocks/BlocksText.module\nPageGridBlocks/BlocksNavigation.module\nPageGridBlocks/BlocksTextPlain.module\nPageGridBlocks/BlocksSlider.module\nPageGridBlocks/BlocksImage.module\nCronjobDatabaseBackup/CronjobDatabaseBackup.module\nProcessExportProfile/ProcessExportProfile.module\nProcessDatabaseBackups/ProcessDatabaseBackups.module\nAdminThemeCanvas/AdminThemeCanvas.module.php\nProcessWireUpgrade/ProcessWireUpgrade.module\nProcessWireUpgrade/ProcessWireUpgradeCheck.module\nFieldtypePageGrid/FieldtypePageGrid.module.php\nFieldtypePageGrid/InputfieldPageGrid.module.php\nFieldtypePageGrid/ProcessPageGrid.module.php\nMarkupSitemap/MarkupSitemap.module.php\nMarkupSEO/MarkupSEO.module\nProcessPagesExportImport/ProcessPagesExportImport.module\nImageCropRatios/ImageCropRatios.module\nFileValidatorSvgSanitizer/FileValidatorSvgSanitizer.module.php\nFieldtypeLeafletMapMarker/InputfieldLeafletMapMarker.module\nFieldtypeLeafletMapMarker/FieldtypeLeafletMapMarker.module\nFieldtypeLeafletMapMarker/MarkupAddInlineScript.module\nFieldtypeLeafletMapMarker/MarkupLeafletMap.module', '2023-10-10 17:53:46');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('269', '.Modules.info', '8192', '{\"170\":{\"name\":\"PageFrontEdit\",\"title\":\"Front-End Page Editor\",\"version\":6,\"icon\":\"cube\",\"autoload\":true,\"created\":1662656273,\"configurable\":\"PageFrontEditConfig.php\"},\"249\":{\"name\":\"TextformatterMarkdownExtra\",\"title\":\"Markdown\\/Parsedown Extra\",\"version\":180,\"singular\":1,\"created\":1664550394,\"configurable\":4},\"61\":{\"name\":\"TextformatterEntities\",\"title\":\"HTML Entity Encoder (htmlspecialchars)\",\"version\":100,\"created\":1662655079},\"117\":{\"name\":\"JqueryUI\",\"title\":\"jQuery UI\",\"version\":\"1.10.4\",\"singular\":true,\"created\":1662655079,\"permanent\":true},\"103\":{\"name\":\"JqueryTableSorter\",\"title\":\"jQuery Table Sorter Plugin\",\"version\":\"2.31.3\",\"singular\":1,\"created\":1662655079},\"116\":{\"name\":\"JqueryCore\",\"title\":\"jQuery Core\",\"version\":\"1.12.4\",\"singular\":true,\"created\":1662655079,\"permanent\":true},\"45\":{\"name\":\"JqueryWireTabs\",\"title\":\"jQuery Wire Tabs Plugin\",\"version\":110,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"151\":{\"name\":\"JqueryMagnific\",\"title\":\"jQuery Magnific Popup\",\"version\":\"1.1.0\",\"singular\":1,\"created\":1662655079},\"254\":{\"name\":\"LazyCron\",\"title\":\"Lazy Cron\",\"version\":103,\"autoload\":true,\"singular\":true,\"created\":1664570560},\"139\":{\"name\":\"SystemUpdater\",\"title\":\"System Updater\",\"version\":20,\"singular\":true,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"113\":{\"name\":\"MarkupPageArray\",\"title\":\"PageArray Markup\",\"version\":100,\"autoload\":true,\"singular\":true,\"created\":1662655079},\"156\":{\"name\":\"MarkupHTMLPurifier\",\"title\":\"HTML Purifier\",\"version\":497,\"created\":1662655079},\"98\":{\"name\":\"MarkupPagerNav\",\"title\":\"Pager (Pagination) Navigation\",\"version\":105,\"created\":1662655079},\"67\":{\"name\":\"MarkupAdminDataTable\",\"title\":\"Admin Data Table\",\"version\":107,\"created\":1662655079,\"permanent\":true},\"115\":{\"name\":\"PageRender\",\"title\":\"Page Render\",\"version\":105,\"autoload\":true,\"singular\":true,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"57\":{\"name\":\"FieldtypeImage\",\"title\":\"Images\",\"version\":102,\"created\":1662655079,\"configurable\":4,\"permanent\":true},\"105\":{\"name\":\"FieldtypeFieldsetOpen\",\"title\":\"Fieldset (Open)\",\"version\":101,\"singular\":1,\"created\":1662655079,\"permanent\":true},\"6\":{\"name\":\"FieldtypeFile\",\"title\":\"Files\",\"version\":107,\"created\":1662655079,\"configurable\":4,\"permanent\":true},\"4\":{\"name\":\"FieldtypePage\",\"title\":\"Page Reference\",\"version\":107,\"autoload\":true,\"singular\":true,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"1\":{\"name\":\"FieldtypeTextarea\",\"title\":\"Textarea\",\"version\":107,\"singular\":true,\"created\":1662655079,\"permanent\":true},\"27\":{\"name\":\"FieldtypeModule\",\"title\":\"Module Reference\",\"version\":102,\"singular\":true,\"created\":1662655079,\"permanent\":true},\"111\":{\"name\":\"FieldtypePageTitle\",\"title\":\"Page Title\",\"version\":100,\"singular\":true,\"created\":1662655079,\"permanent\":true},\"135\":{\"name\":\"FieldtypeURL\",\"title\":\"URL\",\"version\":101,\"singular\":1,\"created\":1662655079,\"permanent\":true},\"84\":{\"name\":\"FieldtypeInteger\",\"title\":\"Integer\",\"version\":102,\"created\":1662655079,\"permanent\":true},\"106\":{\"name\":\"FieldtypeFieldsetClose\",\"title\":\"Fieldset (Close)\",\"version\":100,\"singular\":true,\"created\":1662655079,\"permanent\":true},\"274\":{\"name\":\"FieldtypeOptions\",\"title\":\"Select Options\",\"version\":2,\"singular\":true,\"created\":1696960861},\"133\":{\"name\":\"FieldtypePassword\",\"title\":\"Password\",\"version\":101,\"singular\":true,\"created\":1662655079,\"permanent\":true},\"97\":{\"name\":\"FieldtypeCheckbox\",\"title\":\"Checkbox\",\"version\":101,\"singular\":1,\"created\":1662655079,\"permanent\":true},\"89\":{\"name\":\"FieldtypeFloat\",\"title\":\"Float\",\"version\":107,\"singular\":1,\"created\":1662655079,\"permanent\":true},\"3\":{\"name\":\"FieldtypeText\",\"title\":\"Text\",\"version\":102,\"singular\":true,\"created\":1662655079,\"permanent\":true},\"107\":{\"name\":\"FieldtypeFieldsetTabOpen\",\"title\":\"Fieldset in Tab (Open)\",\"version\":100,\"singular\":true,\"created\":1662655079,\"permanent\":true},\"29\":{\"name\":\"FieldtypeEmail\",\"title\":\"E-Mail\",\"version\":101,\"singular\":true,\"created\":1662655079},\"28\":{\"name\":\"FieldtypeDatetime\",\"title\":\"Datetime\",\"version\":105,\"created\":1662655079},\"160\":{\"name\":\"AdminThemeUikit\",\"title\":\"Uikit\",\"version\":33,\"autoload\":\"template=admin\",\"created\":1662655097,\"configurable\":4},\"148\":{\"name\":\"AdminThemeDefault\",\"title\":\"Default\",\"version\":14,\"autoload\":\"template=admin\",\"created\":1662655079,\"configurable\":19},\"114\":{\"name\":\"PagePermissions\",\"title\":\"Page Permissions\",\"version\":105,\"autoload\":true,\"singular\":true,\"created\":1662655079,\"permanent\":true},\"85\":{\"name\":\"InputfieldInteger\",\"title\":\"Integer\",\"version\":105,\"created\":1662655079,\"permanent\":true},\"108\":{\"name\":\"InputfieldURL\",\"title\":\"URL\",\"version\":103,\"created\":1662655079},\"40\":{\"name\":\"InputfieldHidden\",\"title\":\"Hidden\",\"version\":101,\"created\":1662655079,\"permanent\":true},\"90\":{\"name\":\"InputfieldFloat\",\"title\":\"Float\",\"version\":105,\"created\":1662655079,\"permanent\":true},\"38\":{\"name\":\"InputfieldCheckboxes\",\"title\":\"Checkboxes\",\"version\":108,\"created\":1662655079,\"permanent\":true},\"36\":{\"name\":\"InputfieldSelect\",\"title\":\"Select\",\"version\":102,\"created\":1662655079,\"permanent\":true},\"78\":{\"name\":\"InputfieldFieldset\",\"title\":\"Fieldset\",\"version\":101,\"created\":1662655079,\"permanent\":true},\"56\":{\"name\":\"InputfieldImage\",\"title\":\"Images\",\"version\":127,\"created\":1662655079,\"permanent\":true},\"35\":{\"name\":\"InputfieldTextarea\",\"title\":\"Textarea\",\"version\":103,\"created\":1662655079,\"permanent\":true},\"55\":{\"name\":\"InputfieldFile\",\"title\":\"Files\",\"version\":128,\"created\":1662655079,\"permanent\":true},\"279\":{\"name\":\"InputfieldToggle\",\"title\":\"Toggle\",\"version\":1,\"created\":1696961144},\"131\":{\"name\":\"InputfieldButton\",\"title\":\"Button\",\"version\":100,\"created\":1662655079,\"permanent\":true},\"25\":{\"name\":\"InputfieldAsmSelect\",\"title\":\"asmSelect\",\"version\":203,\"created\":1662655079,\"permanent\":true},\"60\":{\"name\":\"InputfieldPage\",\"title\":\"Page\",\"version\":108,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"80\":{\"name\":\"InputfieldEmail\",\"title\":\"Email\",\"version\":102,\"created\":1662655079},\"86\":{\"name\":\"InputfieldPageName\",\"title\":\"Page Name\",\"version\":106,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"94\":{\"name\":\"InputfieldDatetime\",\"title\":\"Datetime\",\"version\":107,\"created\":1662655079,\"permanent\":true},\"155\":{\"name\":\"InputfieldCKEditor\",\"title\":\"CKEditor\",\"version\":171,\"installs\":[\"MarkupHTMLPurifier\"],\"created\":1662655079},\"34\":{\"name\":\"InputfieldText\",\"title\":\"Text\",\"version\":106,\"created\":1662655079,\"permanent\":true},\"37\":{\"name\":\"InputfieldCheckbox\",\"title\":\"Checkbox\",\"version\":106,\"created\":1662655079,\"permanent\":true},\"79\":{\"name\":\"InputfieldMarkup\",\"title\":\"Markup\",\"version\":102,\"created\":1662655079,\"permanent\":true},\"43\":{\"name\":\"InputfieldSelectMultiple\",\"title\":\"Select Multiple\",\"version\":101,\"created\":1662655079,\"permanent\":true},\"162\":{\"name\":\"InputfieldIcon\",\"title\":\"Icon\",\"version\":3,\"created\":1662655100},\"39\":{\"name\":\"InputfieldRadios\",\"title\":\"Radio Buttons\",\"version\":106,\"created\":1662655079,\"permanent\":true},\"112\":{\"name\":\"InputfieldPageTitle\",\"title\":\"Page Title\",\"version\":102,\"created\":1662655079,\"permanent\":true},\"122\":{\"name\":\"InputfieldPassword\",\"title\":\"Password\",\"version\":102,\"created\":1662655079,\"permanent\":true},\"242\":{\"name\":\"InputfieldPageAutocomplete\",\"title\":\"Page Auto Complete\",\"version\":113,\"created\":1662983587},\"149\":{\"name\":\"InputfieldSelector\",\"title\":\"Selector\",\"version\":28,\"autoload\":\"template=admin\",\"created\":1662655079,\"configurable\":3,\"addFlag\":32},\"32\":{\"name\":\"InputfieldSubmit\",\"title\":\"Submit\",\"version\":103,\"created\":1662655079,\"permanent\":true},\"257\":{\"name\":\"InputfieldTinyMCE\",\"title\":\"TinyMCE\",\"version\":616,\"icon\":\"keyboard-o\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.200\"],\"MarkupHTMLPurifier\":[\">=\",0]},\"created\":1673870964,\"configurable\":4},\"169\":{\"name\":\"InputfieldTextTags\",\"title\":\"Text Tags\",\"version\":6,\"icon\":\"tags\",\"created\":1662656181},\"30\":{\"name\":\"InputfieldForm\",\"title\":\"Form\",\"version\":107,\"created\":1662655079,\"permanent\":true},\"15\":{\"name\":\"InputfieldPageListSelect\",\"title\":\"Page List Select\",\"version\":101,\"created\":1662655079,\"permanent\":true},\"137\":{\"name\":\"InputfieldPageListSelectMultiple\",\"title\":\"Page List Select Multiple\",\"version\":103,\"created\":1662655079,\"permanent\":true},\"41\":{\"name\":\"InputfieldName\",\"title\":\"Name\",\"version\":100,\"created\":1662655079,\"permanent\":true},\"50\":{\"name\":\"ProcessModule\",\"title\":\"Modules\",\"version\":120,\"permission\":\"module-admin\",\"created\":1662655079,\"permanent\":true,\"useNavJSON\":true,\"nav\":[{\"url\":\"?site#tab_site_modules\",\"label\":\"Site\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?site=1\"},{\"url\":\"?core#tab_core_modules\",\"label\":\"Core\",\"icon\":\"plug\",\"navJSON\":\"navJSON\\/?core=1\"},{\"url\":\"?configurable#tab_configurable_modules\",\"label\":\"Configure\",\"icon\":\"gear\",\"navJSON\":\"navJSON\\/?configurable=1\"},{\"url\":\"?install#tab_install_modules\",\"label\":\"Install\",\"icon\":\"sign-in\",\"navJSON\":\"navJSON\\/?install=1\"},{\"url\":\"?new#tab_new_modules\",\"label\":\"New\",\"icon\":\"plus\"},{\"url\":\"?reset=1\",\"label\":\"Refresh\",\"icon\":\"refresh\"}]},\"262\":{\"name\":\"ProcessPageClone\",\"title\":\"Page Clone\",\"version\":104,\"permission\":\"page-clone\",\"autoload\":\"template=admin\",\"singular\":true,\"created\":1673972747},\"48\":{\"name\":\"ProcessField\",\"title\":\"Fields\",\"version\":114,\"icon\":\"cube\",\"permission\":\"field-admin\",\"created\":1662655079,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"136\":{\"name\":\"ProcessPermission\",\"title\":\"Permissions\",\"version\":101,\"icon\":\"gear\",\"permission\":\"permission-admin\",\"singular\":1,\"created\":1662655079,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"185\":{\"name\":\"ProcessForgotPassword\",\"title\":\"Forgot Password\",\"version\":104,\"permission\":\"page-view\",\"singular\":1,\"created\":1662726336,\"configurable\":4},\"121\":{\"name\":\"ProcessPageEditLink\",\"title\":\"Page Edit Link\",\"version\":112,\"icon\":\"link\",\"permission\":\"page-edit\",\"singular\":1,\"created\":1662655079,\"configurable\":4,\"permanent\":true},\"161\":{\"name\":\"ProcessLogger\",\"title\":\"Logs\",\"version\":2,\"icon\":\"tree\",\"permission\":\"logs-view\",\"singular\":1,\"created\":1662655100,\"useNavJSON\":true},\"150\":{\"name\":\"ProcessPageLister\",\"title\":\"Lister\",\"version\":26,\"icon\":\"search\",\"permission\":\"page-lister\",\"created\":1662655079,\"configurable\":true,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"87\":{\"name\":\"ProcessHome\",\"title\":\"Admin Home\",\"version\":101,\"permission\":\"page-view\",\"created\":1662655079,\"permanent\":true},\"68\":{\"name\":\"ProcessRole\",\"title\":\"Roles\",\"version\":104,\"icon\":\"gears\",\"permission\":\"role-admin\",\"created\":1662655079,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"83\":{\"name\":\"ProcessPageView\",\"title\":\"Page View\",\"version\":106,\"permission\":\"page-view\",\"created\":1662655079,\"permanent\":true},\"104\":{\"name\":\"ProcessPageSearch\",\"title\":\"Page Search\",\"version\":108,\"permission\":\"page-edit\",\"singular\":1,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"12\":{\"name\":\"ProcessPageList\",\"title\":\"Page List\",\"version\":124,\"icon\":\"sitemap\",\"permission\":\"page-edit\",\"created\":1662655079,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"134\":{\"name\":\"ProcessPageType\",\"title\":\"Page Type\",\"version\":101,\"singular\":1,\"created\":1662655079,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true,\"addFlag\":32},\"7\":{\"name\":\"ProcessPageEdit\",\"title\":\"Page Edit\",\"version\":112,\"icon\":\"edit\",\"permission\":\"page-edit\",\"singular\":1,\"created\":1662655079,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"129\":{\"name\":\"ProcessPageEditImageSelect\",\"title\":\"Page Edit Image\",\"version\":121,\"permission\":\"page-edit\",\"singular\":1,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"76\":{\"name\":\"ProcessList\",\"title\":\"List\",\"version\":101,\"permission\":\"page-view\",\"created\":1662655079,\"permanent\":true},\"14\":{\"name\":\"ProcessPageSort\",\"title\":\"Page Sort and Move\",\"version\":100,\"permission\":\"page-edit\",\"created\":1662655079,\"permanent\":true},\"66\":{\"name\":\"ProcessUser\",\"title\":\"Users\",\"version\":107,\"icon\":\"group\",\"permission\":\"user-admin\",\"created\":1662655079,\"configurable\":\"ProcessUserConfig.php\",\"permanent\":true,\"useNavJSON\":true},\"10\":{\"name\":\"ProcessLogin\",\"title\":\"Login\",\"version\":109,\"permission\":\"page-view\",\"created\":1662655079,\"configurable\":4,\"permanent\":true},\"109\":{\"name\":\"ProcessPageTrash\",\"title\":\"Page Trash\",\"version\":103,\"singular\":1,\"created\":1662655079,\"permanent\":true},\"159\":{\"name\":\"ProcessRecentPages\",\"title\":\"Recent Pages\",\"version\":2,\"icon\":\"clock-o\",\"permission\":\"page-edit-recent\",\"singular\":1,\"created\":1662655097,\"useNavJSON\":true,\"nav\":[{\"url\":\"?edited=1\",\"label\":\"Edited\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?edited=1\"},{\"url\":\"?added=1\",\"label\":\"Created\",\"icon\":\"users\",\"navJSON\":\"navJSON\\/?added=1\"},{\"url\":\"?edited=1&me=1\",\"label\":\"Edited by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?edited=1&me=1\"},{\"url\":\"?added=1&me=1\",\"label\":\"Created by me\",\"icon\":\"user\",\"navJSON\":\"navJSON\\/?added=1&me=1\"},{\"url\":\"another\\/\",\"label\":\"Add another\",\"icon\":\"plus-circle\",\"navJSON\":\"anotherNavJSON\\/\"}]},\"47\":{\"name\":\"ProcessTemplate\",\"title\":\"Templates\",\"version\":114,\"icon\":\"cubes\",\"permission\":\"template-admin\",\"created\":1662655079,\"configurable\":4,\"permanent\":true,\"useNavJSON\":true},\"17\":{\"name\":\"ProcessPageAdd\",\"title\":\"Page Add\",\"version\":109,\"icon\":\"plus-circle\",\"permission\":\"page-edit\",\"created\":1662655079,\"configurable\":3,\"permanent\":true,\"useNavJSON\":true},\"138\":{\"name\":\"ProcessProfile\",\"title\":\"User Profile\",\"version\":105,\"permission\":\"profile-edit\",\"singular\":1,\"created\":1662655079,\"configurable\":3,\"permanent\":true},\"125\":{\"name\":\"SessionLoginThrottle\",\"title\":\"Session Login Throttle\",\"version\":103,\"autoload\":\"function\",\"singular\":true,\"created\":1662655079,\"configurable\":3},\"163\":{\"name\":\"PageGridBlocks\",\"title\":\"PageGridBlocks\",\"version\":7,\"autoload\":\"template=admin\",\"created\":1662656111},\"239\":{\"name\":\"BlocksVideo\",\"title\":\"Video Block\",\"version\":4,\"icon\":\"file-video-o\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819837},\"229\":{\"name\":\"BlocksMap\",\"title\":\"Map Block\",\"version\":1,\"icon\":\"map\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"FieldtypeLeafletMapMarker\"],\"autoload\":\"template=admin\",\"created\":1662819796},\"273\":{\"name\":\"BlocksDatalist\",\"title\":\"Datalist Block\",\"version\":4,\"icon\":\"list\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"FieldtypeOptions\"],\"autoload\":\"template=admin\",\"created\":1696960861},\"275\":{\"name\":\"BlocksIframe\",\"title\":\"Iframe Block\",\"version\":2,\"icon\":\"file-code-o\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1696960867},\"237\":{\"name\":\"BlocksSpacer\",\"title\":\"Spacer Block\",\"version\":1,\"icon\":\"arrows-h\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819831},\"281\":{\"name\":\"BlocksEditor\",\"title\":\"Rich Text Editor Block\",\"version\":6,\"icon\":\"text-height\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"InputfieldTinyMCE\"],\"autoload\":\"template=admin\",\"created\":1696961245},\"276\":{\"name\":\"BlocksPrevNext\",\"title\":\"Previous\\/Next Page\",\"version\":1,\"icon\":\"exchange\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1696960873},\"235\":{\"name\":\"BlocksSequenz\",\"title\":\"Image Sequenz\",\"version\":1,\"icon\":\"film\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819824},\"232\":{\"name\":\"BlocksMarker\",\"title\":\"Marker Block\",\"version\":1,\"icon\":\"map-pin\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819801},\"234\":{\"name\":\"BlocksReference\",\"title\":\"Reference Block\",\"version\":1,\"icon\":\"link\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819811},\"224\":{\"name\":\"BlocksGallery\",\"title\":\"Gallery Block\",\"version\":1,\"icon\":\"camera-retro\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"FileValidatorSvgSanitizer\"],\"autoload\":\"template=admin\",\"created\":1662819773},\"227\":{\"name\":\"BlocksGroup\",\"title\":\"Group Block\",\"version\":2,\"icon\":\"folder-open\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819787},\"226\":{\"name\":\"BlocksGalleryVideo\",\"title\":\"Gallery Video Block\",\"version\":1,\"icon\":\"video-camera\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819783},\"282\":{\"name\":\"BlocksText\",\"title\":\"Text Block (line breaks + links via TinyMCE)\",\"version\":6,\"icon\":\"font\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"InputfieldTinyMCE\"],\"autoload\":\"template=admin\",\"created\":1696961291},\"233\":{\"name\":\"BlocksNavigation\",\"title\":\"Navigation Block\",\"version\":1,\"icon\":\"bars\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819805},\"236\":{\"name\":\"BlocksSlider\",\"title\":\"Slider Block\",\"version\":1,\"icon\":\"ellipsis-h\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1662819828},\"228\":{\"name\":\"BlocksImage\",\"title\":\"Image Block\",\"version\":4,\"icon\":\"file-image-o\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"FileValidatorSvgSanitizer\"],\"autoload\":\"template=admin\",\"created\":1662819790},\"256\":{\"name\":\"CronjobDatabaseBackup\",\"title\":\"Cronjob Database Backup\",\"version\":124,\"icon\":\"database\",\"requiresVersions\":{\"LazyCron\":[\">=\",0],\"ProcessWire\":[\">=\",\"2.4.15\"]},\"autoload\":true,\"singular\":true,\"created\":1664646092,\"configurable\":true,\"namespace\":\"\\\\\",\"hreflicense\":\"http:\\/\\/www.gnu.org\\/licenses\\/gpl-3.0.html\"},\"179\":{\"name\":\"ProcessDatabaseBackups\",\"title\":\"Database Backups\",\"version\":6,\"icon\":\"database\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.62\"]},\"permission\":\"db-backup\",\"singular\":1,\"created\":1662725256,\"nav\":[{\"url\":\".\\/\",\"label\":\"View\",\"icon\":\"list\"},{\"url\":\"backup\\/\",\"label\":\"Backup\",\"icon\":\"plus-circle\"},{\"url\":\"upload\\/\",\"label\":\"Upload\",\"icon\":\"cloud-upload\"}]},\"184\":{\"name\":\"AdminThemeCanvas\",\"title\":\"Admin Theme Canvas\",\"version\":\"0.65\",\"icon\":\"paint-brush\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.100\"]},\"autoload\":\"template=admin\",\"created\":1662726327,\"configurable\":\"AdminThemeCanvasConfig.php\"},\"221\":{\"name\":\"ProcessWireUpgrade\",\"title\":\"Upgrades\",\"version\":11,\"icon\":\"coffee\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.0\"]},\"installs\":[\"ProcessWireUpgradeCheck\"],\"singular\":1,\"created\":1662736780},\"222\":{\"name\":\"ProcessWireUpgradeCheck\",\"title\":\"Upgrades Checker\",\"version\":9,\"icon\":\"coffee\",\"requiresVersions\":{\"ProcessWireUpgrade\":[\">=\",0]},\"autoload\":\"template=admin\",\"singular\":true,\"created\":1662736780,\"configurable\":\"ProcessWireUpgradeCheck.config.php\"},\"259\":{\"name\":\"FieldtypePageGrid\",\"title\":\"PAGEGRID\",\"version\":\"2.0.0.0\",\"icon\":\"th\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.210\"],\"PHP\":[\">=\",\"5.4.0\"]},\"installs\":[\"InputfieldPageGrid\",\"ProcessPageGrid\",\"PageFrontEdit\",\"ProcessPageClone\"],\"autoload\":\"template=admin\",\"singular\":true,\"created\":1673972747,\"configurable\":\"FieldtypePageGridConfig.php\"},\"260\":{\"name\":\"InputfieldPageGrid\",\"title\":\"PageGrid Inputfield\",\"version\":\"0.2.0\",\"icon\":\"th\",\"requiresVersions\":{\"FieldtypePageGrid\":[\">=\",0]},\"installs\":[\"FieldtypePageGrid\",\"ProcessPageGrid\",\"PageFrontEdit\",\"ProcessPageClone\"],\"created\":1673972747},\"261\":{\"name\":\"ProcessPageGrid\",\"title\":\"PageGrid Process\",\"version\":\"0.0.1\",\"icon\":\"th\",\"requiresVersions\":{\"FieldtypePageGrid\":[\">=\",0]},\"installs\":[\"FieldtypePageGrid\",\"InputfieldPageGrid\",\"PageFrontEdit\",\"ProcessPageClone\"],\"permission\":\"pagegrid-process\",\"singular\":1,\"created\":1673972747,\"namespace\":\"\\\\\",\"useNavJSON\":true},\"248\":{\"name\":\"MarkupSitemap\",\"title\":\"Sitemap\",\"version\":\"0.9.1\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.16\"],\"PHP\":[\">=\",\"7.4.0\"]},\"autoload\":true,\"singular\":true,\"created\":1664550393,\"configurable\":\"MarkupSitemapConfig.php\",\"namespace\":\"\\\\\",\"hrefsupport\":\"https:\\/\\/processwire.com\\/talk\\/topic\\/17068-markupsitemap\\/\",\"hreflicense\":\"https:\\/\\/gitlab.com\\/rockettpw\\/seo\\/markup-sitemap\\/-\\/blob\\/master\\/LICENSE.md\"},\"251\":{\"name\":\"MarkupSEO\",\"title\":\"SEO\",\"version\":\"0.8.7\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"2.4.0\"],\"PHP\":[\">=\",\"5.3.8\"]},\"autoload\":true,\"created\":1664550440,\"configurable\":true,\"namespace\":\"\\\\\"},\"250\":{\"name\":\"ImageCropRatios\",\"title\":\"Image Crop Ratios\",\"version\":\"0.1.2\",\"icon\":\"crop\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.0\"],\"PHP\":[\">=\",\"5.4.0\"]},\"autoload\":\"template=admin\",\"created\":1664550414,\"configurable\":4},\"225\":{\"name\":\"FileValidatorSvgSanitizer\",\"title\":\"SVG File Sanitizer\\/Validator\",\"version\":5,\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.148\"]},\"created\":1662819775,\"configurable\":\"FileValidatorSvgSanitizer.config.php\",\"validates\":[\"svg\"]},\"231\":{\"name\":\"InputfieldLeafletMapMarker\",\"title\":\"Leaflet Map Marker\",\"version\":\"3.0.4\",\"icon\":\"map-marker\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.0\"],\"FieldtypeLeafletMapMarker\":[\">=\",0]},\"created\":1662819798},\"230\":{\"name\":\"FieldtypeLeafletMapMarker\",\"title\":\"Leaflet Map Marker\",\"version\":\"3.0.4\",\"icon\":\"map-marker\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.0\"]},\"installs\":[\"InputfieldLeafletMapMarker\"],\"singular\":true,\"created\":1662819798},\"283\":{\"name\":\"ProcessExportProfile\",\"title\":\"Export Site Profile\",\"version\":401,\"icon\":\"truck\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.0\"]},\"singular\":true}}', '2023-10-10 17:53:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('270', '.ModulesVerbose.info', '8192', '{\"170\":{\"summary\":\"Enables front-end editing of page fields.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.0.6\",\"permissions\":{\"page-edit-front\":\"Use the front-end page editor\"},\"license\":\"MPL 2.0\"},\"249\":{\"summary\":\"Markdown\\/Parsedown extra lightweight markup language by Emanuil Rusev. Based on Markdown by John Gruber.\",\"core\":true,\"versionStr\":\"1.8.0\"},\"61\":{\"summary\":\"Entity encode ampersands, quotes (single and double) and greater-than\\/less-than signs using htmlspecialchars(str, ENT_QUOTES). It is recommended that you use this on all text\\/textarea fields except those using a rich text editor or a markup language like Markdown.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"117\":{\"summary\":\"jQuery UI as required by ProcessWire and plugins\",\"href\":\"https:\\/\\/ui.jquery.com\",\"core\":true,\"versionStr\":\"1.10.4\"},\"103\":{\"summary\":\"Provides a jQuery plugin for sorting tables.\",\"href\":\"https:\\/\\/mottie.github.io\\/tablesorter\\/\",\"core\":true,\"versionStr\":\"2.31.3\"},\"116\":{\"summary\":\"jQuery Core as required by ProcessWire Admin and plugins\",\"href\":\"https:\\/\\/jquery.com\",\"core\":true,\"versionStr\":\"1.12.4\"},\"45\":{\"summary\":\"Provides a jQuery plugin for generating tabs in ProcessWire.\",\"core\":true,\"versionStr\":\"1.1.0\"},\"151\":{\"summary\":\"Provides lightbox capability for image galleries. Replacement for FancyBox. Uses Magnific Popup by @dimsemenov.\",\"href\":\"https:\\/\\/github.com\\/dimsemenov\\/Magnific-Popup\\/\",\"core\":true,\"versionStr\":\"1.1.0\"},\"254\":{\"summary\":\"Provides hooks that are automatically executed at various intervals. It is called \'lazy\' because it\'s triggered by a pageview, so the interval is guaranteed to be at least the time requested, rather than exactly the time requested. This is fine for most cases, but you can make it not lazy by connecting this to a real CRON job. See the module file for details. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/lazy-cron\\/\",\"core\":true,\"versionStr\":\"1.0.3\"},\"139\":{\"summary\":\"Manages system versions and upgrades.\",\"core\":true,\"versionStr\":\"0.2.0\"},\"113\":{\"summary\":\"Adds renderPager() method to all PaginatedArray types, for easy pagination output. Plus a render() method to PageArray instances.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"156\":{\"summary\":\"Front-end to the HTML Purifier library.\",\"core\":true,\"versionStr\":\"4.9.7\"},\"98\":{\"summary\":\"Generates markup for pagination navigation\",\"core\":true,\"versionStr\":\"1.0.5\"},\"67\":{\"summary\":\"Generates markup for data tables used by ProcessWire admin\",\"core\":true,\"versionStr\":\"1.0.7\"},\"115\":{\"summary\":\"Adds a render method to Page and caches page output.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"57\":{\"summary\":\"Field that stores one or more GIF, JPG, or PNG images\",\"core\":true,\"versionStr\":\"1.0.2\"},\"105\":{\"summary\":\"Open a fieldset to group fields. Should be followed by a Fieldset (Close) after one or more fields.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"6\":{\"summary\":\"Field that stores one or more files\",\"core\":true,\"versionStr\":\"1.0.7\"},\"4\":{\"summary\":\"Field that stores one or more references to ProcessWire pages\",\"core\":true,\"versionStr\":\"1.0.7\"},\"1\":{\"summary\":\"Field that stores multiple lines of text\",\"core\":true,\"versionStr\":\"1.0.7\"},\"27\":{\"summary\":\"Field that stores a reference to another module\",\"core\":true,\"versionStr\":\"1.0.2\"},\"111\":{\"summary\":\"Field that stores a page title\",\"core\":true,\"versionStr\":\"1.0.0\"},\"135\":{\"summary\":\"Field that stores a URL\",\"core\":true,\"versionStr\":\"1.0.1\"},\"84\":{\"summary\":\"Field that stores an integer\",\"core\":true,\"versionStr\":\"1.0.2\"},\"106\":{\"summary\":\"Close a fieldset opened by FieldsetOpen. \",\"core\":true,\"versionStr\":\"1.0.0\"},\"274\":{\"summary\":\"Field that stores single and multi select options.\",\"core\":true,\"versionStr\":\"0.0.2\"},\"133\":{\"summary\":\"Field that stores a hashed and salted password\",\"core\":true,\"versionStr\":\"1.0.1\"},\"97\":{\"summary\":\"This Fieldtype stores an ON\\/OFF toggle via a single checkbox. The ON value is 1 and OFF value is 0.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"89\":{\"summary\":\"Field that stores a floating point number\",\"core\":true,\"versionStr\":\"1.0.7\"},\"3\":{\"summary\":\"Field that stores a single line of text\",\"core\":true,\"versionStr\":\"1.0.2\"},\"107\":{\"summary\":\"Open a fieldset to group fields. Same as Fieldset (Open) except that it displays in a tab instead.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"29\":{\"summary\":\"Field that stores an e-mail address\",\"core\":true,\"versionStr\":\"1.0.1\"},\"28\":{\"summary\":\"Field that stores a date and optionally time\",\"core\":true,\"versionStr\":\"1.0.5\"},\"160\":{\"summary\":\"Uikit v3 admin theme\",\"core\":true,\"versionStr\":\"0.3.3\"},\"148\":{\"summary\":\"Minimal admin theme that supports all ProcessWire features.\",\"core\":true,\"versionStr\":\"0.1.4\"},\"114\":{\"summary\":\"Adds various permission methods to Page objects that are used by Process modules.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"85\":{\"summary\":\"Integer (positive or negative)\",\"core\":true,\"versionStr\":\"1.0.5\"},\"108\":{\"summary\":\"URL in valid format\",\"core\":true,\"versionStr\":\"1.0.3\"},\"40\":{\"summary\":\"Hidden value in a form\",\"core\":true,\"versionStr\":\"1.0.1\"},\"90\":{\"summary\":\"Floating point number with precision\",\"core\":true,\"versionStr\":\"1.0.5\"},\"38\":{\"summary\":\"Multiple checkbox toggles\",\"core\":true,\"versionStr\":\"1.0.8\"},\"36\":{\"summary\":\"Selection of a single value from a select pulldown\",\"core\":true,\"versionStr\":\"1.0.2\"},\"78\":{\"summary\":\"Groups one or more fields together in a container\",\"core\":true,\"versionStr\":\"1.0.1\"},\"56\":{\"summary\":\"One or more image uploads (sortable)\",\"core\":true,\"versionStr\":\"1.2.7\"},\"35\":{\"summary\":\"Multiple lines of text\",\"core\":true,\"versionStr\":\"1.0.3\"},\"55\":{\"summary\":\"One or more file uploads (sortable)\",\"core\":true,\"versionStr\":\"1.2.8\"},\"279\":{\"summary\":\"A toggle providing similar input capability to a checkbox but much more configurable.\",\"core\":true,\"versionStr\":\"0.0.1\"},\"131\":{\"summary\":\"Form button element that you can optionally pass an href attribute to.\",\"core\":true,\"versionStr\":\"1.0.0\"},\"25\":{\"summary\":\"Multiple selection, progressive enhancement to select multiple\",\"core\":true,\"versionStr\":\"2.0.3\"},\"60\":{\"summary\":\"Select one or more pages\",\"core\":true,\"versionStr\":\"1.0.8\"},\"80\":{\"summary\":\"E-Mail address in valid format\",\"core\":true,\"versionStr\":\"1.0.2\"},\"86\":{\"summary\":\"Text input validated as a ProcessWire Page name field\",\"core\":true,\"versionStr\":\"1.0.6\"},\"94\":{\"summary\":\"Inputfield that accepts date and optionally time\",\"core\":true,\"versionStr\":\"1.0.7\"},\"155\":{\"summary\":\"CKEditor textarea rich text editor.\",\"core\":true,\"versionStr\":\"1.7.1\"},\"34\":{\"summary\":\"Single line of text\",\"core\":true,\"versionStr\":\"1.0.6\"},\"37\":{\"summary\":\"Single checkbox toggle\",\"core\":true,\"versionStr\":\"1.0.6\"},\"79\":{\"summary\":\"Contains any other markup and optionally child Inputfields\",\"core\":true,\"versionStr\":\"1.0.2\"},\"43\":{\"summary\":\"Select multiple items from a list\",\"core\":true,\"versionStr\":\"1.0.1\"},\"162\":{\"summary\":\"Select an icon\",\"core\":true,\"versionStr\":\"0.0.3\"},\"39\":{\"summary\":\"Radio buttons for selection of a single item\",\"core\":true,\"versionStr\":\"1.0.6\"},\"112\":{\"summary\":\"Handles input of Page Title and auto-generation of Page Name (when name is blank)\",\"core\":true,\"versionStr\":\"1.0.2\"},\"122\":{\"summary\":\"Password input with confirmation field that doesn&#039;t ever echo the input back.\",\"core\":true,\"versionStr\":\"1.0.2\"},\"242\":{\"summary\":\"Multiple Page selection using auto completion and sorting capability. Intended for use as an input field for Page reference fields.\",\"core\":true,\"versionStr\":\"1.1.3\"},\"149\":{\"summary\":\"Build a page finding selector visually.\",\"author\":\"Avoine + ProcessWire\",\"core\":true,\"versionStr\":\"0.2.8\"},\"32\":{\"summary\":\"Form submit button\",\"core\":true,\"versionStr\":\"1.0.3\"},\"257\":{\"summary\":\"TinyMCE rich text editor version 6.4.1.\",\"core\":true,\"versionStr\":\"6.1.6\"},\"169\":{\"summary\":\"Enables input of user entered tags or selection of predefined tags.\",\"core\":true,\"versionStr\":\"0.0.6\"},\"30\":{\"summary\":\"Contains one or more fields in a form\",\"core\":true,\"versionStr\":\"1.0.7\"},\"15\":{\"summary\":\"Selection of a single page from a ProcessWire page tree list\",\"core\":true,\"versionStr\":\"1.0.1\"},\"137\":{\"summary\":\"Selection of multiple pages from a ProcessWire page tree list\",\"core\":true,\"versionStr\":\"1.0.3\"},\"41\":{\"summary\":\"Text input validated as a ProcessWire name field\",\"core\":true,\"versionStr\":\"1.0.0\"},\"50\":{\"summary\":\"List, edit or install\\/uninstall modules\",\"core\":true,\"versionStr\":\"1.2.0\"},\"262\":{\"summary\":\"Provides ability to clone\\/copy\\/duplicate pages in the admin. Adds a &quot;copy&quot; option to all applicable pages in the PageList.\",\"core\":true,\"versionStr\":\"1.0.4\",\"permissions\":{\"page-clone\":\"Clone a page\",\"page-clone-tree\":\"Clone a tree of pages\"},\"page\":{\"name\":\"clone\",\"title\":\"Clone\",\"parent\":\"page\",\"status\":1024}},\"48\":{\"summary\":\"Edit individual fields that hold page data\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"fields\"},\"136\":{\"summary\":\"Manage system permissions\",\"core\":true,\"versionStr\":\"1.0.1\"},\"185\":{\"summary\":\"Provides password reset\\/email capability for the Login process.\",\"core\":true,\"versionStr\":\"1.0.4\"},\"121\":{\"summary\":\"Provides a link capability as used by some Fieldtype modules (like rich text editors).\",\"core\":true,\"versionStr\":\"1.1.2\"},\"161\":{\"summary\":\"View and manage system logs.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"logs-view\":\"Can view system logs\",\"logs-edit\":\"Can manage system logs\"},\"page\":{\"name\":\"logs\",\"parent\":\"setup\",\"title\":\"Logs\"}},\"150\":{\"summary\":\"Admin tool for finding and listing pages by any property.\",\"author\":\"Ryan Cramer\",\"core\":true,\"versionStr\":\"0.2.6\",\"permissions\":{\"page-lister\":\"Use Page Lister\"}},\"87\":{\"summary\":\"Acts as a placeholder Process for the admin root. Ensures proper flow control after login.\",\"core\":true,\"versionStr\":\"1.0.1\"},\"68\":{\"summary\":\"Manage user roles and what permissions are attached\",\"core\":true,\"versionStr\":\"1.0.4\"},\"83\":{\"summary\":\"All page views are routed through this Process\",\"core\":true,\"versionStr\":\"1.0.6\"},\"104\":{\"summary\":\"Provides a page search engine for admin use.\",\"core\":true,\"versionStr\":\"1.0.8\"},\"12\":{\"summary\":\"List pages in a hierarchical tree structure\",\"core\":true,\"versionStr\":\"1.2.4\"},\"134\":{\"summary\":\"List, Edit and Add pages of a specific type\",\"core\":true,\"versionStr\":\"1.0.1\"},\"7\":{\"summary\":\"Edit a Page\",\"core\":true,\"versionStr\":\"1.1.2\"},\"129\":{\"summary\":\"Provides image manipulation functions for image fields and rich text editors.\",\"core\":true,\"versionStr\":\"1.2.1\"},\"76\":{\"summary\":\"Lists the Process assigned to each child page of the current\",\"core\":true,\"versionStr\":\"1.0.1\"},\"14\":{\"summary\":\"Handles page sorting and moving for PageList\",\"core\":true,\"versionStr\":\"1.0.0\"},\"66\":{\"summary\":\"Manage system users\",\"core\":true,\"versionStr\":\"1.0.7\",\"searchable\":\"users\"},\"10\":{\"summary\":\"Login to ProcessWire\",\"core\":true,\"versionStr\":\"1.0.9\"},\"109\":{\"summary\":\"Handles emptying of Page trash\",\"core\":true,\"versionStr\":\"1.0.3\"},\"159\":{\"summary\":\"Shows a list of recently edited pages in your admin.\",\"author\":\"Ryan Cramer\",\"href\":\"http:\\/\\/modules.processwire.com\\/\",\"core\":true,\"versionStr\":\"0.0.2\",\"permissions\":{\"page-edit-recent\":\"Can see recently edited pages\"},\"page\":{\"name\":\"recent-pages\",\"parent\":\"page\",\"title\":\"Recent\"}},\"47\":{\"summary\":\"List and edit the templates that control page output\",\"core\":true,\"versionStr\":\"1.1.4\",\"searchable\":\"templates\"},\"17\":{\"summary\":\"Add a new page\",\"core\":true,\"versionStr\":\"1.0.9\"},\"138\":{\"summary\":\"Enables user to change their password, email address and other settings that you define.\",\"core\":true,\"versionStr\":\"1.0.5\"},\"125\":{\"summary\":\"Throttles login attempts to help prevent dictionary attacks.\",\"core\":true,\"versionStr\":\"1.0.3\"},\"163\":{\"summary\":\"Install and uninstall PageGrid Blocks\",\"author\":\"Jan Ploch\",\"href\":\"https:\\/\\/github.com\\/jploch\\/PageGridBlocks\",\"versionStr\":\"0.0.7\"},\"239\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.4\"},\"229\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"273\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.4\"},\"275\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.2\"},\"237\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"281\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.6\"},\"276\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"235\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"232\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"234\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"224\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"227\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.2\"},\"226\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"282\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.6\"},\"233\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"236\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\"},\"228\":{\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.4\"},\"256\":{\"summary\":\"Periodic automatic backup of the database. Set interval or trigger option in module settings.\",\"author\":\"kixe\",\"href\":\"https:\\/\\/processwire.com\\/talk\\/topic\\/8207-cronjob-database-backup\\/\",\"versionStr\":\"1.2.4\",\"permissions\":{\"trigger-db-backup\":\"Trigger database backup when a user logs in or logs out (CronjobDatabaseBackup)\"},\"license\":\"GNU-GPLv3\"},\"179\":{\"summary\":\"Create and\\/or restore database backups from ProcessWire admin.\",\"author\":\"Ryan Cramer\",\"versionStr\":\"0.0.6\",\"permissions\":{\"db-backup\":\"Manage database backups (recommended for superuser only)\"},\"page\":{\"name\":\"db-backups\",\"parent\":\"setup\",\"title\":\"DB Backups\"}},\"184\":{\"summary\":\"A minimal theme with optimised page editor UI, based on Uikit 3\",\"author\":\"Jan Ploch\",\"href\":\"https:\\/\\/github.com\\/jploch\\/AdminThemeCanvas\",\"versionStr\":\"0.65\"},\"221\":{\"summary\":\"Tool that helps you identify and install core and module upgrades.\",\"author\":\"Ryan Cramer\",\"versionStr\":\"0.1.1\"},\"222\":{\"summary\":\"Automatically checks for core and installed module upgrades at routine intervals.\",\"author\":\"Ryan Cramer\",\"versionStr\":\"0.0.9\"},\"259\":{\"summary\":\"Commercial page builder module that renders block templates and adds drag and drop functionality in admin.\",\"author\":\"Jan Ploch\",\"href\":\"https:\\/\\/page-grid.com\",\"versionStr\":\"2.0.0.0\",\"permissions\":{\"pagegrid-process\":\"Allow PAGEGRID to process ajax calls\",\"page-pagegrid-edit\":\"Edit PAGEGRID items in modal (applies to all editable templates)\",\"pagegrid-drag\":\"Drag PAGEGRID items\",\"pagegrid-resize\":\"Resize PAGEGRID items\",\"pagegrid-style-panel\":\"Enable styling of PAGEGRID items\",\"pagegrid-add\":\"Use the sidebar to drag new items into the page (also needs pagegrid-drag permission to work)\"}},\"260\":{\"summary\":\"Inputfield for FieldtypePageGrid\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.2.0\"},\"261\":{\"summary\":\"Process Module for FieldtypePageGrid\",\"author\":\"Jan Ploch\",\"versionStr\":\"0.0.1\",\"page\":{\"name\":\"pagegrid\",\"parent\":\"setup\",\"title\":\"PAGEGRID\"}},\"248\":{\"summary\":\"Renders a sitemap for your ProcessWire powered site. Supports multi-language, multi-site, and image sub-elements. Adapted from MarkupSitemapXML.\",\"author\":\"Mike Rockett\",\"href\":\"https:\\/\\/gitlab.com\\/rockettpw\\/seo\\/markup-sitemap\",\"versionStr\":\"0.9.1\",\"license\":\"ISC\"},\"251\":{\"summary\":\"The all-in-one SEO solution for ProcessWire.\",\"versionStr\":\"0.8.7\"},\"250\":{\"summary\":\"Allows preset aspect ratios to be defined per image field for the ProcessWire image crop tool.\",\"author\":\"Robin Sallis\",\"href\":\"https:\\/\\/github.com\\/Toutouwai\\/ImageCropRatios\",\"versionStr\":\"0.1.2\"},\"225\":{\"summary\":\"Validates and\\/or sanitizes uploaded SVG files.\",\"author\":\"Adrian and Ryan\",\"versionStr\":\"0.0.5\"},\"231\":{\"summary\":\"Provides input for the LeafletMapMarker Fieldtype\",\"versionStr\":\"3.0.4\"},\"230\":{\"summary\":\"Field that stores an address with latitude and longitude coordinates and has built-in geocoding capability with Leaflet Maps API.\",\"versionStr\":\"3.0.4\"},\"283\":{\"summary\":\"Create a site profile that can be used for a fresh install of ProcessWire.\",\"versionStr\":\"4.0.1\",\"page\":{\"name\":\"export-site-profile\",\"parent\":\"setup\"}}}', '2023-10-10 17:53:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('271', '.ModulesUninstalled.info', '8192', '{\"FieldtypePageTitleLanguage\":{\"name\":\"FieldtypePageTitleLanguage\",\"title\":\"Page Title (Multi-Language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"author\":\"Ryan Cramer\",\"summary\":\"Field that stores a page title in multiple languages. Use this only if you want title inputs created for ALL languages on ALL pages. Otherwise create separate languaged-named title fields, i.e. title_fr, title_es, title_fi, etc. \",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0],\"FieldtypeTextLanguage\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true},\"LanguageSupportFields\":{\"name\":\"LanguageSupportFields\",\"title\":\"Languages Support - Fields\",\"version\":101,\"versionStr\":\"1.0.1\",\"author\":\"Ryan Cramer\",\"summary\":\"Required to use multi-language fields.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"installs\":[\"FieldtypePageTitleLanguage\",\"FieldtypeTextareaLanguage\",\"FieldtypeTextLanguage\"],\"autoload\":true,\"singular\":true,\"created\":1695988000,\"installed\":false,\"core\":true},\"FieldtypeTextLanguage\":{\"name\":\"FieldtypeTextLanguage\",\"title\":\"Text (Multi-language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Field that stores a single line of text in multiple languages\",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true},\"LanguageTabs\":{\"name\":\"LanguageTabs\",\"title\":\"Languages Support - Tabs\",\"version\":117,\"versionStr\":\"1.1.7\",\"author\":\"adamspruijt, ryan, flipzoom\",\"summary\":\"Organizes multi-language fields into tabs for a cleaner easier to use interface.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"autoload\":\"template=admin\",\"singular\":true,\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true},\"FieldtypeTextareaLanguage\":{\"name\":\"FieldtypeTextareaLanguage\",\"title\":\"Textarea (Multi-language)\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Field that stores a multiple lines of text in multiple languages\",\"requiresVersions\":{\"LanguageSupportFields\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true},\"LanguageSupport\":{\"name\":\"LanguageSupport\",\"title\":\"Languages Support\",\"version\":103,\"versionStr\":\"1.0.3\",\"author\":\"Ryan Cramer\",\"summary\":\"ProcessWire multi-language support.\",\"installs\":[\"ProcessLanguage\",\"ProcessLanguageTranslator\"],\"autoload\":true,\"singular\":true,\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true,\"addFlag\":32},\"LanguageSupportPageNames\":{\"name\":\"LanguageSupportPageNames\",\"title\":\"Languages Support - Page Names\",\"version\":13,\"versionStr\":\"0.1.3\",\"author\":\"Ryan Cramer\",\"summary\":\"Required to use multi-language page names.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0],\"LanguageSupportFields\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessLanguageTranslator\":{\"name\":\"ProcessLanguageTranslator\",\"title\":\"Language Translator\",\"version\":103,\"versionStr\":\"1.0.3\",\"author\":\"Ryan Cramer\",\"summary\":\"Provides language translation capabilities for ProcessWire core and modules.\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessLanguage\":{\"name\":\"ProcessLanguage\",\"title\":\"Languages\",\"version\":103,\"versionStr\":\"1.0.3\",\"author\":\"Ryan Cramer\",\"summary\":\"Manage system languages\",\"icon\":\"language\",\"requiresVersions\":{\"LanguageSupport\":[\">=\",0]},\"permission\":\"lang-edit\",\"permissions\":{\"lang-edit\":\"Administer languages and static translation files\"},\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true,\"useNavJSON\":true},\"TextformatterSmartypants\":{\"name\":\"TextformatterSmartypants\",\"title\":\"SmartyPants Typographer\",\"version\":171,\"versionStr\":\"1.7.1\",\"summary\":\"Smart typography for web sites, by Michel Fortin based on SmartyPants by John Gruber. If combined with Markdown, it should be applied AFTER Markdown.\",\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true,\"url\":\"https:\\/\\/github.com\\/michelf\\/php-smartypants\"},\"TextformatterPstripper\":{\"name\":\"TextformatterPstripper\",\"title\":\"Paragraph Stripper\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips paragraph <p> tags that may have been applied by other text formatters before it. \",\"created\":1695988000,\"installed\":false,\"core\":true},\"TextformatterStripTags\":{\"name\":\"TextformatterStripTags\",\"title\":\"Strip Markup Tags\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Strips HTML\\/XHTML Markup Tags\",\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true},\"TextformatterNewlineBR\":{\"name\":\"TextformatterNewlineBR\",\"title\":\"Newlines to XHTML Line Breaks\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to XHTML line break <br \\/> tags. \",\"created\":1695988000,\"installed\":false,\"core\":true},\"TextformatterNewlineUL\":{\"name\":\"TextformatterNewlineUL\",\"title\":\"Newlines to Unordered List\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Converts newlines to <li> list items and surrounds in an <ul> unordered list. \",\"created\":1695988000,\"installed\":false,\"core\":true},\"PagePathHistory\":{\"name\":\"PagePathHistory\",\"title\":\"Page Path History\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"Keeps track of past URLs where pages have lived and automatically redirects (301 permanent) to the new location whenever the past URL is accessed.\",\"autoload\":true,\"singular\":true,\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true},\"ImageSizerEngineIMagick\":{\"name\":\"ImageSizerEngineIMagick\",\"title\":\"IMagick Image Sizer\",\"version\":3,\"versionStr\":\"0.0.3\",\"author\":\"Horst Nogajski\",\"summary\":\"Upgrades image manipulations to use PHP\'s ImageMagick library when possible.\",\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true},\"ImageSizerEngineAnimatedGif\":{\"name\":\"ImageSizerEngineAnimatedGif\",\"title\":\"Animated GIF Image Sizer\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Horst Nogajski\",\"summary\":\"Upgrades image manipulations for animated GIFs.\",\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true},\"SystemNotifications\":{\"name\":\"SystemNotifications\",\"title\":\"System Notifications\",\"version\":12,\"versionStr\":\"0.1.2\",\"summary\":\"Adds support for notifications in ProcessWire (currently in development)\",\"icon\":\"bell\",\"installs\":[\"FieldtypeNotifications\"],\"autoload\":true,\"created\":1695988000,\"installed\":false,\"configurable\":\"SystemNotificationsConfig.php\",\"core\":true},\"FieldtypeNotifications\":{\"name\":\"FieldtypeNotifications\",\"title\":\"Notifications\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Field that stores user notifications.\",\"requiresVersions\":{\"SystemNotifications\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true},\"MarkupCache\":{\"name\":\"MarkupCache\",\"title\":\"Markup Cache\",\"version\":101,\"versionStr\":\"1.0.1\",\"summary\":\"A simple way to cache segments of markup in your templates. \",\"href\":\"https:\\/\\/processwire.com\\/api\\/modules\\/markupcache\\/\",\"autoload\":true,\"singular\":true,\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true},\"MarkupPageFields\":{\"name\":\"MarkupPageFields\",\"title\":\"Markup Page Fields\",\"version\":100,\"versionStr\":\"1.0.0\",\"summary\":\"Adds $page->renderFields() and $page->images->render() methods that return basic markup for output during development and debugging.\",\"autoload\":true,\"singular\":true,\"created\":1695988000,\"installed\":false,\"core\":true,\"permanent\":true},\"MarkupRSS\":{\"name\":\"MarkupRSS\",\"title\":\"Markup RSS Feed\",\"version\":105,\"versionStr\":\"1.0.5\",\"summary\":\"Renders an RSS feed. Given a PageArray, renders an RSS feed of them.\",\"icon\":\"rss-square\",\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeCache\":{\"name\":\"FieldtypeCache\",\"title\":\"Cache\",\"version\":102,\"versionStr\":\"1.0.2\",\"summary\":\"Caches the values of other fields for fewer runtime queries. Can also be used to combine multiple text fields and have them all be searchable under the cached field name.\",\"created\":1695988000,\"installed\":false,\"core\":true},\"FieldtypePageTable\":{\"name\":\"FieldtypePageTable\",\"title\":\"ProFields: Page Table\",\"version\":8,\"versionStr\":\"0.0.8\",\"summary\":\"A fieldtype containing a group of editable pages.\",\"installs\":[\"InputfieldPageTable\"],\"autoload\":true,\"created\":1695988000,\"installed\":false,\"core\":true},\"FieldtypeFieldsetPage\":{\"name\":\"FieldtypeFieldsetPage\",\"title\":\"Fieldset (Page)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Fieldset with fields isolated to separate namespace (page), enabling re-use of fields.\",\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"autoload\":true,\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeRepeater\":{\"name\":\"FieldtypeRepeater\",\"title\":\"Repeater\",\"version\":112,\"versionStr\":\"1.1.2\",\"summary\":\"Maintains a collection of fields that are repeated for any number of times.\",\"installs\":[\"InputfieldRepeater\"],\"autoload\":true,\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true},\"InputfieldRepeater\":{\"name\":\"InputfieldRepeater\",\"title\":\"Repeater\",\"version\":111,\"versionStr\":\"1.1.1\",\"summary\":\"Repeats fields from another template. Provides the input for FieldtypeRepeater.\",\"requiresVersions\":{\"FieldtypeRepeater\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true},\"FieldtypeDecimal\":{\"name\":\"FieldtypeDecimal\",\"title\":\"Decimal\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Field that stores a decimal number\",\"created\":1695988000,\"installed\":false,\"core\":true},\"FieldtypeOptions\":{\"name\":\"FieldtypeOptions\",\"title\":\"Select Options\",\"version\":2,\"versionStr\":\"0.0.2\",\"summary\":\"Field that stores single and multi select options.\",\"created\":1695988000,\"installed\":false,\"core\":true},\"FieldtypeSelector\":{\"name\":\"FieldtypeSelector\",\"title\":\"Selector\",\"version\":13,\"versionStr\":\"0.1.3\",\"author\":\"Avoine + ProcessWire\",\"summary\":\"Build a page finding selector visually.\",\"created\":1695988000,\"installed\":false,\"core\":true},\"FieldtypeComments\":{\"name\":\"FieldtypeComments\",\"title\":\"Comments\",\"version\":110,\"versionStr\":\"1.1.0\",\"summary\":\"Field that stores user posted comments for a single Page\",\"installs\":[\"InputfieldCommentsAdmin\"],\"created\":1695988000,\"installed\":false,\"core\":true},\"InputfieldCommentsAdmin\":{\"name\":\"InputfieldCommentsAdmin\",\"title\":\"Comments Admin\",\"version\":104,\"versionStr\":\"1.0.4\",\"summary\":\"Provides an administrative interface for working with comments\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true},\"CommentFilterAkismet\":{\"name\":\"CommentFilterAkismet\",\"title\":\"Comment Filter: Akismet\",\"version\":200,\"versionStr\":\"2.0.0\",\"summary\":\"Uses the Akismet service to identify comment spam. Module plugin for the Comments Fieldtype.\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true},\"FieldtypeToggle\":{\"name\":\"FieldtypeToggle\",\"title\":\"Toggle (Yes\\/No)\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Configurable yes\\/no, on\\/off toggle alternative to a checkbox, plus optional \\u201cother\\u201d option.\",\"requiresVersions\":{\"InputfieldToggle\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true},\"AdminThemeReno\":{\"name\":\"AdminThemeReno\",\"title\":\"Reno\",\"version\":17,\"versionStr\":\"0.1.7\",\"author\":\"Tom Reno (Renobird)\",\"summary\":\"Admin theme for ProcessWire 2.5+ by Tom Reno (Renobird)\",\"requiresVersions\":{\"AdminThemeDefault\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true},\"InputfieldPageTable\":{\"name\":\"InputfieldPageTable\",\"title\":\"ProFields: Page Table\",\"version\":14,\"versionStr\":\"0.1.4\",\"summary\":\"Inputfield to accompany FieldtypePageTable\",\"requiresVersions\":{\"FieldtypePageTable\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true},\"InputfieldToggle\":{\"name\":\"InputfieldToggle\",\"title\":\"Toggle\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"A toggle providing similar input capability to a checkbox but much more configurable.\",\"created\":1695988000,\"installed\":false,\"core\":true},\"PagePaths\":{\"name\":\"PagePaths\",\"title\":\"Page Paths\",\"version\":4,\"versionStr\":\"0.0.4\",\"summary\":\"Enables page paths\\/urls to be queryable by selectors. Also offers potential for improved load performance. Builds an index at install (may take time on a large site).\",\"autoload\":true,\"singular\":true,\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true},\"FileCompilerTags\":{\"name\":\"FileCompilerTags\",\"title\":\"Tags File Compiler\",\"version\":1,\"versionStr\":\"0.0.1\",\"summary\":\"Enables {var} or {var.property} variables in markup sections of a file. Can be used with any API variable.\",\"created\":1695988000,\"installed\":false,\"configurable\":4,\"core\":true},\"ProcessCommentsManager\":{\"name\":\"ProcessCommentsManager\",\"title\":\"Comments\",\"version\":12,\"versionStr\":\"0.1.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Manage comments in your site outside of the page editor.\",\"icon\":\"comments\",\"requiresVersions\":{\"FieldtypeComments\":[\">=\",0]},\"permission\":\"comments-manager\",\"permissions\":{\"comments-manager\":\"Use the comments manager\"},\"created\":1695988000,\"installed\":false,\"searchable\":\"comments\",\"core\":true,\"page\":{\"name\":\"comments\",\"parent\":\"setup\",\"title\":\"Comments\"},\"nav\":[{\"url\":\"?go=approved\",\"label\":\"Approved\"},{\"url\":\"?go=pending\",\"label\":\"Pending\"},{\"url\":\"?go=spam\",\"label\":\"Spam\"},{\"url\":\"?go=all\",\"label\":\"All\"}]},\"ProcessPagesExportImport\":{\"name\":\"ProcessPagesExportImport\",\"title\":\"Pages Export\\/Import\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Ryan Cramer, Jan Ploch\",\"summary\":\"Enables exporting and importing of pages. Supports $page->meta() data\",\"icon\":\"paper-plane-o\",\"permission\":\"page-edit-export\",\"created\":1696952901,\"installed\":false,\"core\":true,\"page\":{\"name\":\"export-import\",\"parent\":\"page\",\"title\":\"Export\\/Import\"}},\"ProcessSessionDB\":{\"name\":\"ProcessSessionDB\",\"title\":\"Sessions\",\"version\":5,\"versionStr\":\"0.0.5\",\"summary\":\"Enables you to browse active database sessions.\",\"icon\":\"dashboard\",\"requiresVersions\":{\"SessionHandlerDB\":[\">=\",0]},\"created\":1695988000,\"installed\":false,\"core\":true,\"page\":{\"name\":\"sessions-db\",\"parent\":\"access\",\"title\":\"Sessions\"}},\"SessionHandlerDB\":{\"name\":\"SessionHandlerDB\",\"title\":\"Session Handler Database\",\"version\":6,\"versionStr\":\"0.0.6\",\"summary\":\"Installing this module makes ProcessWire store sessions in the database rather than the file system. Note that this module will log you out after install or uninstall.\",\"installs\":[\"ProcessSessionDB\"],\"created\":1695988000,\"installed\":false,\"configurable\":3,\"core\":true},\"BlocksDatalist\":{\"name\":\"BlocksDatalist\",\"title\":\"Datalist Block\",\"version\":4,\"versionStr\":\"0.0.4\",\"author\":\"Jan Ploch\",\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"icon\":\"list\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"FieldtypeOptions\"],\"autoload\":\"template=admin\",\"created\":1696865960,\"installed\":false},\"BlocksIframe\":{\"name\":\"BlocksIframe\",\"title\":\"Iframe Block\",\"version\":2,\"versionStr\":\"0.0.2\",\"author\":\"Jan Ploch\",\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"icon\":\"file-code-o\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1696865960,\"installed\":false},\"BlocksPrevNext\":{\"name\":\"BlocksPrevNext\",\"title\":\"Previous\\/Next Page\",\"version\":1,\"versionStr\":\"0.0.1\",\"author\":\"Jan Ploch\",\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"icon\":\"exchange\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1696865960,\"installed\":false},\"BlocksTextPlain\":{\"name\":\"BlocksTextPlain\",\"title\":\"Plain Text Block (no HTML)\",\"version\":6,\"versionStr\":\"0.0.6\",\"author\":\"Jan Ploch\",\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"icon\":\"i-cursor\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"autoload\":\"template=admin\",\"created\":1696865960,\"installed\":false},\"CookieManagementBanner\":{\"name\":\"CookieManagementBanner\",\"title\":\"Cookie Management Banner\",\"version\":\"0.4.3\",\"versionStr\":\"0.4.3\",\"author\":\"Adrian Jones, Oliver Walker, David Miller, and Roland Toth\",\"summary\":\"Cookie management banner allows users to manage tracking cookies.\",\"href\":\"https:\\/\\/processwire.com\\/talk\\/topic\\/19525-cookie-management-banner\\/\",\"autoload\":true,\"singular\":true,\"created\":1696952901,\"installed\":false,\"configurable\":\"CookieManagementBanner.config.php\",\"namespace\":\"\\\\\"},\"MarkupAddInlineScript\":{\"name\":\"MarkupAddInlineScript\",\"title\":\"Inline Scripts\",\"version\":\"3.0.2\",\"versionStr\":\"3.0.2\",\"summary\":\"adds inline script before <\\/body>\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.0\"],\"MarkupLeafletMap\":[\">=\",0]},\"autoload\":true,\"singular\":true,\"created\":1696954980,\"installed\":false,\"Author\":\"gebeer\"},\"MarkupLeafletMap\":{\"name\":\"MarkupLeafletMap\",\"title\":\"LeafletMap Markup\",\"version\":\"3.0.2\",\"versionStr\":\"3.0.2\",\"summary\":\"Renders Leaflet Maps for the LealetMapMarker Fieldtype\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.0\"],\"FieldtypeLeafletMapMarker\":[\">=\",0]},\"installs\":[\"MarkupAddInlineScript\"],\"created\":1696954980,\"installed\":false},\"BlocksEditor\":{\"name\":\"BlocksEditor\",\"title\":\"Rich Text Editor Block\",\"version\":6,\"versionStr\":\"0.0.6\",\"author\":\"Jan Ploch\",\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"icon\":\"text-height\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"InputfieldTinyMCE\"],\"autoload\":\"template=admin\",\"created\":1696865960,\"installed\":false},\"BlocksText\":{\"name\":\"BlocksText\",\"title\":\"Text Block (line breaks + links via TinyMCE)\",\"version\":6,\"versionStr\":\"0.0.6\",\"author\":\"Jan Ploch\",\"summary\":\"Installs Template and Fields for a PageGrid Block\",\"icon\":\"font\",\"requiresVersions\":{\"PageGridBlocks\":[\">=\",0]},\"installs\":[\"InputfieldTinyMCE\"],\"autoload\":\"template=admin\",\"created\":1696865960,\"installed\":false},\"TextformatterVideoEmbed\":{\"name\":\"TextformatterVideoEmbed\",\"title\":\"Video embed for YouTube (and Vimeo)\",\"version\":202,\"versionStr\":\"2.0.2\",\"author\":\"Ryan Cramer\",\"summary\":\"Enter a full YouTube (or Vimeo) URL by itself in any paragraph (example: https:\\/\\/youtu.be\\/Wl4XiYadV_k) and this will automatically convert it to an embedded video. This formatter is intended to be run on trusted input. Recommended for use with CKEditor textarea fields.\",\"href\":\"https:\\/\\/processwire.com\\/modules\\/textformatter-video-embed\\/\",\"requiresVersions\":{\"ProcessWire\":[\">=\",\"3.0.148\"]},\"created\":1696952901,\"installed\":false,\"configurable\":3}}', '2023-10-10 17:53:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('272', '.ModulesVersions.info', '8192', '{\"179\":5,\"231\":\"3.0.3\"}', '2023-10-10 17:53:47');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('273', 'BlocksDatalist', '10', '', '2023-10-10 18:01:01');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('274', 'FieldtypeOptions', '1', '', '2023-10-10 18:01:01');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('275', 'BlocksIframe', '10', '', '2023-10-10 18:01:07');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('276', 'BlocksPrevNext', '10', '', '2023-10-10 18:01:13');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('279', 'InputfieldToggle', '0', '', '2023-10-10 18:05:44');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('281', 'BlocksEditor', '10', '', '2023-10-10 18:07:25');
INSERT INTO `modules` (`id`, `class`, `flags`, `data`, `created`) VALUES('282', 'BlocksText', '10', '', '2023-10-10 18:08:11');

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
) ENGINE=MyISAM AUTO_INCREMENT=1303 DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1', '0', '1', 'home', '9', '2022-09-30 15:08:55', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('2', '1', '2', 'admin', '1035', '2023-10-10 17:53:47', '40', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('3', '2', '2', 'page', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('6', '3', '2', 'add', '21', '2022-09-08 16:38:23', '40', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('7', '1', '2', 'trash', '1039', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '8');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('8', '3', '2', 'list', '21', '2022-09-08 16:38:24', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('9', '3', '2', 'sort', '1047', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('10', '3', '2', 'edit', '1045', '2022-09-08 16:38:23', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('11', '22', '2', 'template', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('16', '22', '2', 'field', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('21', '2', '2', 'module', '21', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('22', '2', '2', 'setup', '21', '2023-01-16 12:11:28', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '1');
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
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('41', '29', '3', 'admin', '1', '2023-10-10 17:53:56', '41', '2022-09-08 16:37:59', '41', '2022-09-08 16:37:59', '0');
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
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1264', '31', '5', 'pagegrid-drag', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '19');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1263', '31', '5', 'page-pagegrid-edit', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '18');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1262', '31', '5', 'pagegrid-process', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '17');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1159', '22', '2', 'upgrades', '1', '2022-09-09 15:19:40', '41', '2022-09-09 15:19:40', '41', '2022-09-09 15:19:40', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1141', '1268', '52', 'pg-classes', '1025', '2023-10-10 18:26:20', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '7');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1265', '31', '5', 'pagegrid-resize', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '20');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1261', '31', '5', 'page-edit-front', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '16');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1260', '30', '4', 'pagegrid-editor', '1', '2023-10-10 18:26:20', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1166', '1140', '52', 'pg-27', '1', '2022-09-12 11:30:52', '41', '2022-09-12 11:30:52', '41', '2022-09-12 11:30:52', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1140', '1268', '52', 'pg-items', '1025', '2023-10-10 18:26:20', '41', '2022-09-09 12:35:53', '41', '2022-09-09 12:35:53', '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1228', '1141', '52', 'body', '1', '2022-09-30 13:38:23', '41', '2022-09-30 13:38:23', '41', '2022-09-30 13:38:23', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1220', '1141', '52', 'a', '1', '2022-09-30 12:31:16', '41', '2022-09-30 12:31:16', '41', '2022-09-30 12:31:16', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1249', '31', '5', 'trigger-db-backup', '1', '2022-10-01 17:41:32', '41', '2022-10-01 17:41:32', '41', '2022-10-01 17:41:32', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1301', '1297', '76', 'pg-text-1301', '1', '2023-10-10 18:19:16', '41', '2023-10-10 18:12:26', '41', '2023-10-10 18:12:26', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1298', '1293', '75', 'pg-dummy-147', '3073', '2023-10-10 18:11:32', '41', '2023-10-10 18:11:32', '41', NULL, '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1299', '1293', '76', 'pg-dummy-148', '3073', '2023-10-10 18:11:32', '41', '2023-10-10 18:11:32', '41', NULL, '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1212', '1141', '52', 'pg-main', '1', '2022-09-30 12:15:39', '41', '2022-09-30 12:15:39', '41', '2022-09-30 12:15:39', '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1214', '1141', '52', 'container', '1', '2022-09-30 12:16:09', '41', '2022-09-30 12:16:09', '41', '2022-09-30 12:16:09', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1266', '31', '5', 'pagegrid-style-panel', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '21');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1267', '31', '5', 'pagegrid-add', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '22');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1268', '22', '2', 'pagegrid', '1', '2023-10-10 17:53:56', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '5');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1269', '3', '2', 'clone', '1024', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '10');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1270', '31', '5', 'page-clone', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '23');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1271', '31', '5', 'page-clone-tree', '1', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '41', '2023-01-17 16:25:47', '24');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1280', '1268', '52', 'pg-animations', '1025', '2023-10-10 17:53:47', '40', '2023-10-10 17:53:47', '40', '2023-10-10 17:53:47', '2');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1281', '1268', '52', 'pg-blueprints', '1', '2023-10-10 17:53:47', '40', '2023-10-10 17:53:47', '40', '2023-10-10 17:53:47', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1282', '1268', '52', 'pg-symbols', '1', '2023-10-10 17:53:47', '40', '2023-10-10 17:53:47', '40', '2023-10-10 17:53:47', '4');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1292', '1', '29', 'home', '1', '2023-10-10 18:12:08', '41', '2023-10-10 18:10:36', '41', '2023-10-10 18:12:08', '3');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1293', '2', '52', 'pg-dummies', '3073', '2023-10-10 18:10:36', '41', '2023-10-10 18:10:36', '41', NULL, '6');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1294', '1293', '58', 'pg-dummy-109', '3073', '2023-10-10 18:10:36', '41', '2023-10-10 18:10:36', '41', NULL, '0');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1295', '1293', '58', 'pg-dummy-110', '3073', '2023-10-10 18:10:36', '41', '2023-10-10 18:10:36', '41', NULL, '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1296', '1140', '52', 'pg-1292', '1', '2023-10-10 18:10:36', '41', '2023-10-10 18:10:36', '41', '2023-10-10 18:10:36', '1');
INSERT INTO `pages` (`id`, `parent_id`, `templates_id`, `name`, `status`, `modified`, `modified_users_id`, `created`, `created_users_id`, `published`, `sort`) VALUES('1297', '1296', '55', 'pg-group-1297', '1', '2023-10-10 18:10:44', '41', '2023-10-10 18:10:44', '41', '2023-10-10 18:10:44', '0');

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
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1261', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1052', '2', '2022-09-09 12:07:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1264', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1265', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1266', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1263', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1262', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1295', '52', '2023-10-10 18:10:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1294', '52', '2023-10-10 18:10:36');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1260', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1301', '52', '2023-10-10 18:12:26');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1299', '52', '2023-10-10 18:11:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1249', '2', '2022-10-01 17:41:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1298', '52', '2023-10-10 18:11:32');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1297', '52', '2023-10-10 18:10:44');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1267', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1270', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1271', '2', '2023-01-17 16:25:47');
INSERT INTO `pages_access` (`pages_id`, `templates_id`, `ts`) VALUES('1292', '1', '2023-10-10 18:10:36');

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
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1220', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"a\",\"tagName\":\"a\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"color\":\"#000000\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1220', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1220', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1228', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"body\",\"tagName\":\"body\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":[],\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1228', 'pg_field', '\"pg\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1228', 'pg_page', '1222');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1292', 'pg_itemsPage', '1292');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1297', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"div\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":\"auto\",\"grid-row-start\":\"auto\",\"grid-column-end\":\"-1\",\"grid-row-end\":\"auto\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}},\"cssClasses\":\"container \"}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1297', 'pg_page', '1296');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1301', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"\",\"tagName\":\"h2\",\"breakpoints\":{\"base\":{\"css\":{\"grid-column-start\":\"4\",\"grid-row-start\":\"1\",\"grid-column-end\":\"span 6\",\"grid-row-end\":\"span 1\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1301', 'pg_page', '1296');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1166', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1214', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1214', 'pg_page', '1232');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1214', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"container\",\"cssClasses\":\"container \",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"padding-left\":\"60px\",\"padding-right\":\"60px\",\"padding-top\":\"60px\",\"padding-bottom\":\"60px\",\"margin-left\":\"auto\",\"margin-right\":\"auto\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"},\"s\":{\"css\":{\"padding-left\":\"15px\",\"padding-right\":\"15px\",\"padding-top\":\"15px\",\"padding-bottom\":\"15px\",\"grid-column-start\":1,\"grid-row-start\":\"auto\",\"grid-column-end\":\"span 10\",\"grid-row-end\":\"span auto\"},\"size\":\"@media (max-width: 640px)\",\"name\":\"s\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1212', 'pg_styles', '{\"pgitem\":{\"id\":\"pgitem\",\"cssClass\":\"pg-main\",\"tagName\":\"div\",\"state\":\"\",\"breakpoints\":{\"base\":{\"css\":{\"display\":\"block\",\"font-family\":\"Arial\"},\"size\":\"@media (min-width: 640px)\",\"name\":\"base\"}}}}');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1212', 'pg_field', '\"pagegrid\"');
INSERT INTO `pages_meta` (`source_id`, `name`, `data`) VALUES('1212', 'pg_page', '1232');

DROP TABLE IF EXISTS `pages_parents`;
CREATE TABLE `pages_parents` (
  `pages_id` int unsigned NOT NULL,
  `parents_id` int unsigned NOT NULL,
  PRIMARY KEY (`pages_id`,`parents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('2', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('3', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('7', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('22', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('28', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('29', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('30', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '1');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('31', '28');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1140', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1140', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1140', '1268');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1141', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1141', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1141', '1268');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1268', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1268', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1293', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1296', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1296', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1296', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1296', '1268');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1297', '2');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1297', '22');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1297', '1140');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1297', '1268');
INSERT INTO `pages_parents` (`pages_id`, `parents_id`) VALUES('1297', '1296');

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
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3;

INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('2', 'admin', '2', '8', '0', '{\"useRoles\":1,\"parentTemplates\":[2],\"allowPageNum\":1,\"redirectLogin\":23,\"slashUrls\":1,\"noGlobal\":1,\"compile\":3,\"modified\":1696952901,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('3', 'user', '3', '8', '0', '{\"useRoles\":1,\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"User\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('4', 'role', '4', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"pageClass\":\"Role\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('5', 'permission', '5', '8', '0', '{\"noChildren\":1,\"parentTemplates\":[2],\"slashUrls\":1,\"guestSearchable\":1,\"pageClass\":\"Permission\",\"noGlobal\":1,\"noMove\":1,\"noTrash\":1,\"noSettings\":1,\"noChangeTemplate\":1,\"nameContentTab\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('1', 'home', '1', '0', '0', '{\"useRoles\":1,\"editRoles\":[1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260],\"noParents\":1,\"childTemplates\":[29],\"slashUrls\":1,\"compile\":0,\"modified\":1696955179,\"ns\":\"ProcessWire\",\"_lazy\":1,\"roles\":[37,1260]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('29', 'basic-page', '83', '0', '0', '{\"slashUrls\":1,\"compile\":0,\"modified\":1696952901,\"ns\":\"ProcessWire\",\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('75', 'pg_editor', '129', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-text-height title\",\"compile\":3,\"label\":\"Rich Text\",\"tags\":\"pagegrid\",\"modified\":1696954296,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('54', 'pg_gallery_video', '108', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-video-camera title\",\"compile\":3,\"label\":\"Gallery Video\",\"modified\":1662812583}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('53', 'pg_gallery', '107', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-camera-retro title\",\"compile\":3,\"label\":\"Gallery\",\"modified\":1664532567,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('52', 'pg_container', '106', '0', '0', '{\"useRoles\":1,\"editRoles\":[1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260,1260],\"noParents\":-1,\"slashUrls\":1,\"compile\":3,\"modified\":1696955179,\"_lazy\":\"*\",\"roles\":[37,1260]}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('55', 'pg_group', '109', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-folder-open title\",\"compile\":3,\"label\":\"Group\",\"tags\":\"pagegrid\",\"modified\":1696955039,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('56', 'pg_image', '110', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-file-image-o title\",\"compile\":3,\"label\":\"Image\",\"tags\":\"pagegrid\",\"modified\":1696953465,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('57', 'pg_map', '111', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-map title\",\"compile\":3,\"label\":\"Map\",\"modified\":1664543132,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('58', 'pg_marker', '112', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-map-pin title\",\"compile\":3,\"label\":\"Marker\",\"modified\":1662812601}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('59', 'pg_navigation', '113', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-bars title\",\"compile\":3,\"label\":\"Navigation\",\"tags\":\"pagegrid\",\"modified\":1696953465,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('60', 'pg_reference', '114', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-link title\",\"compile\":3,\"label\":\"Reference\",\"tags\":\"pagegrid\",\"modified\":1696953505,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('61', 'pg_sequenz', '115', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-film title\",\"compile\":3,\"label\":\"Sequenz\",\"modified\":1662812624}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('62', 'pg_slider', '116', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-ellipsis-h title\",\"compile\":3,\"label\":\"Slider\",\"modified\":1664532567,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1,\"_lazy\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('63', 'pg_spacer', '117', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-arrows-h title\",\"compile\":3,\"label\":\"Spacer\",\"modified\":1662812631}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('76', 'pg_text', '130', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-font title\",\"compile\":3,\"label\":\"Text\",\"tags\":\"pagegrid\",\"modified\":1696955039,\"noPrependTemplateFile\":1,\"noAppendTemplateFile\":1}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('65', 'pg_video', '119', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-file-video-o title\",\"compile\":3,\"label\":\"Video\",\"modified\":1662812637}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('70', 'pg_blueprint', '124', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-th title\",\"compile\":3,\"tags\":\"pagegrid\",\"modified\":1696953231,\"ns\":\"ProcessWire\"}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('71', 'pg_datalist', '125', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-list title\",\"compile\":3,\"label\":\"Datalist\",\"modified\":1696953661}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('72', 'pg_iframe', '126', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-file-code-o title\",\"compile\":3,\"label\":\"Iframe\",\"modified\":1696953667}');
INSERT INTO `templates` (`id`, `name`, `fieldgroups_id`, `flags`, `cache_time`, `data`) VALUES('73', 'pg_prev_next', '127', '0', '0', '{\"slashUrls\":1,\"pageLabelField\":\"fa-exchange title\",\"compile\":3,\"label\":\"Previous\\/Next\",\"modified\":1696953673}');

UPDATE pages SET created_users_id=41, modified_users_id=41, created=NOW(), modified=NOW();

# --- /WireDatabaseBackup {"numTables":57,"numCreateTables":63,"numInserts":590,"numSeconds":0}