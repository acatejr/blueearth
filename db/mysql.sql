-- phpMyAdmin SQL Dump
-- version 3.1.4-rc2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 14, 2010 at 09:28 PM
-- Server version: 5.1.32
-- PHP Version: 5.2.9-1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `blueearth`
--

-- --------------------------------------------------------

--
-- Table structure for table `agencies`
--

CREATE TABLE IF NOT EXISTS `agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` varchar(11) DEFAULT NULL,
  `created_on` date NOT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `fax` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `agencies`
--

INSERT INTO `agencies` (`id`, `name`, `address`, `city`, `state`, `zipcode`, `created_on`, `locked`, `phone`, `fax`) VALUES
(1, 'Helena Chemicals', '101 West Carey Road', 'Brawley', 'CA', '92227', '2010-02-02', 0, '760-344-6400', ''),
(2, 'John Deere', '', '', '', '', '2010-02-08', 0, '', ''),
(3, 'Western Farm Services', '', '', '', '', '2010-02-08', 0, '', ''),
(4, 'Blue Earth Imaging', '5265 S. Renewal Ln.', 'Tucson', 'AZ', '85747', '2010-02-08', 0, '520-247-5134', '520-838-8083'),
(5, 'Indian Springs', '', '', '', '', '2010-02-08', 0, '', ''),
(6, 'Salton City', '', '', 'CA', '', '2010-02-08', 0, '', ''),
(7, 'Heritage Palms', '', '', 'CA', '', '2010-02-08', 0, '', ''),
(8, 'La Quinta', '', '', 'CA', '', '2010-02-08', 0, '', ''),
(9, 'IID', '', '', 'CA', '', '2010-02-08', 0, '', ''),
(10, 'Central Valley Water District', '', '', 'CA', '', '2010-02-08', 0, '', ''),
(11, 'Marriot', '', '', 'CA', '', '2010-02-08', 0, '', ''),
(12, 'Kalin Farms', '', 'CA', '', '', '2010-02-08', 0, '', ''),
(13, 'Oceano Produce', '', '', 'CA', '', '2010-02-08', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `aircraft`
--

CREATE TABLE IF NOT EXISTS `aircraft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `aircraft`
--

INSERT INTO `aircraft` (`id`, `name`) VALUES
(1, '1976 Cessna Cardinal 177');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_message`
--

CREATE TABLE IF NOT EXISTS `auth_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add message', 4, 'add_message'),
(11, 'Can change message', 4, 'change_message'),
(12, 'Can delete message', 4, 'delete_message'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add log entry', 8, 'add_logentry'),
(23, 'Can change log entry', 8, 'change_logentry'),
(24, 'Can delete log entry', 8, 'delete_logentry'),
(25, 'Can add agency', 9, 'add_agency'),
(26, 'Can change agency', 9, 'change_agency'),
(27, 'Can delete agency', 9, 'delete_agency'),
(28, 'Can add person type', 10, 'add_persontype'),
(29, 'Can change person type', 10, 'change_persontype'),
(30, 'Can delete person type', 10, 'delete_persontype'),
(31, 'Can add person', 11, 'add_person'),
(32, 'Can change person', 11, 'change_person'),
(33, 'Can delete person', 11, 'delete_person'),
(34, 'Can add crop type', 12, 'add_croptype'),
(35, 'Can change crop type', 12, 'change_croptype'),
(36, 'Can delete crop type', 12, 'delete_croptype'),
(37, 'Can add image type', 13, 'add_imagetype'),
(38, 'Can change image type', 13, 'change_imagetype'),
(39, 'Can delete image type', 13, 'delete_imagetype'),
(40, 'Can add air craft', 14, 'add_aircraft'),
(41, 'Can change air craft', 14, 'change_aircraft'),
(42, 'Can delete air craft', 14, 'delete_aircraft'),
(43, 'Can add camera', 15, 'add_camera'),
(44, 'Can change camera', 15, 'change_camera'),
(45, 'Can delete camera', 15, 'delete_camera'),
(46, 'Can add server', 16, 'add_server'),
(47, 'Can change server', 16, 'change_server'),
(48, 'Can delete server', 16, 'delete_server'),
(49, 'Can add property', 17, 'add_property'),
(50, 'Can change property', 17, 'change_property'),
(51, 'Can delete property', 17, 'delete_property'),
(52, 'Can add image', 18, 'add_image'),
(53, 'Can change image', 18, 'change_image'),
(54, 'Can delete image', 18, 'delete_image');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'acatejr', 'Averill', 'Cate, Jr', 'acatejr@gmail.com', 'sha1$e7799$63dd55f452a5d286c19f3ef1050843c63dc75062', 1, 1, 1, '2010-02-12 11:15:57', '2010-01-13 16:13:23'),
(2, 'kkoller', 'Kevin', 'Koller', 'kevindavidkoller@gmail.com', 'sha1$78971$016f24072743ecaa9cc637cc1855b982d5d96a2c', 1, 1, 1, '2010-02-12 08:12:21', '2010-02-12 08:12:21'),
(3, 'akoller', 'Aaron', 'Koller', 'aaronkoller@gmail.com', 'sha1$7e1d1$70af6729dbe45feaadb9151f5d87e1d9ea983928', 1, 1, 1, '2010-02-12 08:13:45', '2010-02-12 08:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `camera`
--

CREATE TABLE IF NOT EXISTS `camera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `camera`
--


-- --------------------------------------------------------

--
-- Table structure for table `croptype`
--

CREATE TABLE IF NOT EXISTS `croptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `croptype`
--

INSERT INTO `croptype` (`id`, `name`) VALUES
(1, 'Alfalfa'),
(2, 'Citrus'),
(3, 'Cotton'),
(4, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2010-02-08 11:53:30', 1, 9, '2', 'John Deere', 1, ''),
(2, '2010-02-08 11:55:19', 1, 9, '3', 'Western Farm Services', 1, ''),
(3, '2010-02-08 11:56:43', 1, 9, '4', 'Blue Earth Imaging', 1, ''),
(4, '2010-02-08 11:57:50', 1, 11, '1', 'hguest', 3, ''),
(5, '2010-02-08 11:57:50', 1, 11, '3', 'tcustomer', 3, ''),
(6, '2010-02-08 11:57:50', 1, 11, '4', 'hagent', 3, ''),
(7, '2010-02-08 11:58:22', 1, 11, '2', 'helena', 2, 'Changed username.'),
(8, '2010-02-08 12:05:54', 1, 11, '5', 'aalcocer', 1, ''),
(9, '2010-02-08 12:06:33', 1, 9, '5', 'Indian Springs', 1, ''),
(10, '2010-02-08 12:06:44', 1, 11, '5', 'aalcocer', 2, 'Changed agency.'),
(11, '2010-02-08 12:07:27', 1, 9, '6', 'Salton City', 1, ''),
(12, '2010-02-08 12:07:57', 1, 11, '6', 'scuser', 1, ''),
(13, '2010-02-08 12:09:07', 1, 9, '7', 'Heritage Palms', 1, ''),
(14, '2010-02-08 12:09:35', 1, 11, '7', 'hpuser', 1, ''),
(15, '2010-02-08 12:10:07', 1, 9, '8', 'La Quinta', 1, ''),
(16, '2010-02-08 12:10:35', 1, 11, '8', 'lquser', 1, ''),
(17, '2010-02-08 12:11:22', 1, 11, '9', 'rholleschau', 1, ''),
(18, '2010-02-08 12:12:51', 1, 9, '9', 'IID', 1, ''),
(19, '2010-02-08 12:13:08', 1, 11, '10', 'iiduser', 1, ''),
(20, '2010-02-08 12:13:35', 1, 9, '10', 'Central Valley Water District', 1, ''),
(21, '2010-02-08 12:14:02', 1, 11, '11', 'cvwduser', 1, ''),
(22, '2010-02-08 12:14:32', 1, 9, '11', 'Marriot', 1, ''),
(23, '2010-02-08 12:14:53', 1, 11, '12', 'muser', 1, ''),
(24, '2010-02-08 12:16:18', 1, 11, '13', 'ssinclear', 1, ''),
(25, '2010-02-08 12:17:02', 1, 11, '14', 'aronq', 1, ''),
(26, '2010-02-08 12:17:46', 1, 11, '15', 'mosterakmp', 1, ''),
(27, '2010-02-08 12:18:19', 1, 9, '12', 'Kalin Farms', 1, ''),
(28, '2010-02-08 12:18:35', 1, 11, '16', 'akalin', 1, ''),
(29, '2010-02-08 12:19:17', 1, 11, '17', 'jcachen', 1, ''),
(30, '2010-02-08 12:19:42', 1, 9, '13', 'Oceano Produce', 1, ''),
(31, '2010-02-08 12:19:56', 1, 11, '18', 'opuser', 1, ''),
(32, '2010-02-08 12:20:18', 1, 11, '19', 'brucker', 1, ''),
(33, '2010-02-08 12:37:23', 1, 13, '5', 'Change Detection', 1, ''),
(34, '2010-02-08 12:37:37', 1, 13, '6', 'Color Variation', 1, ''),
(35, '2010-02-08 12:38:05', 1, 13, '7', 'Leaf Cover (FPAR)', 1, ''),
(36, '2010-02-10 15:52:24', 1, 11, '100', 'password', 1, ''),
(37, '2010-02-10 15:52:49', 1, 11, '100', 'password', 3, ''),
(38, '2010-02-12 08:12:21', 1, 3, '2', 'kkoller', 1, ''),
(39, '2010-02-12 08:12:52', 1, 3, '2', 'kkoller', 2, 'Changed password, first_name, last_name, email, is_staff and is_superuser.'),
(40, '2010-02-12 08:13:45', 1, 3, '3', 'akoller', 1, ''),
(41, '2010-02-12 08:14:04', 1, 3, '3', 'akoller', 2, 'Changed password, first_name, last_name, email, is_staff and is_superuser.'),
(42, '2010-02-12 08:14:46', 1, 11, '101', 'kkoller', 1, ''),
(43, '2010-02-12 08:15:15', 1, 11, '101', 'kkoller', 2, 'Changed password.'),
(44, '2010-02-12 08:15:36', 1, 11, '102', 'akoller', 1, ''),
(45, '2010-02-12 08:16:15', 1, 11, '102', 'akoller', 2, 'Changed password.'),
(46, '2010-02-12 12:12:23', 1, 11, '103', 'tuser', 1, ''),
(47, '2010-02-12 12:16:26', 1, 11, '103', 'tuser', 2, 'No fields changed.'),
(48, '2010-02-12 12:22:16', 1, 11, '103', 'tuser', 2, 'Changed password.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'message', 'auth', 'message'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'site', 'sites', 'site'),
(8, 'log entry', 'admin', 'logentry'),
(9, 'agency', 'blueearthapp', 'agency'),
(10, 'person type', 'blueearthapp', 'persontype'),
(11, 'person', 'blueearthapp', 'person'),
(12, 'crop type', 'blueearthapp', 'croptype'),
(13, 'image type', 'blueearthapp', 'imagetype'),
(14, 'air craft', 'blueearthapp', 'aircraft'),
(15, 'camera', 'blueearthapp', 'camera'),
(16, 'server', 'blueearthapp', 'server'),
(17, 'property', 'blueearthapp', 'property'),
(18, 'image', 'blueearthapp', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('402721f3d716e59332940ff1a1811993', 'gAJ9cQEuMWY5NmYxOTYwMzUzOTM0ZTk2N2JkNjgxODQ5OTY3Y2I=\n', '2010-02-26 08:25:18'),
('588d4b77d7363de0f51a8fce9c206fc8', 'gAJ9cQEoVQp0ZXN0Y29va2llcQJVBndvcmtlZHEDVQR1c2VycQRjYmx1ZWVhcnRoLmJsdWVlYXJ0\naGFwcC5tb2RlbHMKUGVyc29uCnEFKVJxBn1xByhVCHVzZXJuYW1lcQhYBgAAAGhlbGVuYXEJVQRj\naXR5cQpYAAAAAFUKZmlyc3RfbmFtZXELWAYAAABIZWxlbmFxDFUJbGFzdF9uYW1lcQ1YBAAAAFVz\nZXJxDlUDZmF4cQ9YAAAAAFUHdHlwZV9pZHEQigEDVQd6aXBjb2RlcRFYAAAAAFUJYWdlbmN5X2lk\ncRKKAQFVBWVtYWlscRNYAAAAAFUFcGhvbmVxFFgAAAAAVQVzdGF0ZXEVWAAAAABVCmNyZWF0ZWRf\nb25xFmNkYXRldGltZQpkYXRlCnEXVQQH2gIChVJxGFUHYWRkcmVzc3EZWAAAAABVBmxvY2tlZHEa\nSwBVCHBhc3N3b3JkcRtYKAAAADViYWE2MWU0YzliOTNmM2YwNjgyMjUwYjZjZjgzMzFiN2VlNjhm\nZDhxHFUCaWRxHYoBAnVidS41ODZkOGU2NmZkZGFlNmQwZjMwNDIzOGM1OWMyYWE3Mw==\n', '2010-02-25 22:04:36'),
('7f879519373de12ae16ae42b6e4d8b76', 'gAJ9cQEuMWY5NmYxOTYwMzUzOTM0ZTk2N2JkNjgxODQ5OTY3Y2I=\n', '2010-02-26 12:44:53'),
('941993ea881957eae9ff67c5e9667a99', 'gAJ9cQFVBHVzZXJxAmNibHVlZWFydGguYmx1ZWVhcnRoYXBwLm1vZGVscwpQZXJzb24KcQMpUnEE\nfXEFKFUIdXNlcm5hbWVxBlgGAAAAaGVsZW5hcQdVBGNpdHlxCFgAAAAAVQpmaXJzdF9uYW1lcQlY\nBgAAAEhlbGVuYXEKVQlsYXN0X25hbWVxC1gEAAAAVXNlcnEMVQNmYXhxDVgAAAAAVQd0eXBlX2lk\ncQ6KAQNVB3ppcGNvZGVxD1gAAAAAVQlhZ2VuY3lfaWRxEIoBAVUFZW1haWxxEVgAAAAAVQVwaG9u\nZXESWAAAAABVBXN0YXRlcRNYAAAAAFUKY3JlYXRlZF9vbnEUY2RhdGV0aW1lCmRhdGUKcRVVBAfa\nAgKFUnEWVQdhZGRyZXNzcRdYAAAAAFUGbG9ja2VkcRhLAFUIcGFzc3dvcmRxGVgIAAAAcGFzc3dv\ncmRxGlUCaWRxG4oBAnVicy5hMDk2NTczNDNlNGRhM2ZhMjA1NTA1MzIzOTE1NDkzMg==\n', '2010-02-24 09:38:28'),
('c26f71d6c345c710ce39a44faa09aee3', 'gAJ9cQEuMWY5NmYxOTYwMzUzOTM0ZTk2N2JkNjgxODQ5OTY3Y2I=\n', '2010-02-26 12:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `imagetypes_id` int(11) DEFAULT NULL,
  `capture_date` date DEFAULT NULL,
  `webserver_layer` varchar(200) DEFAULT NULL,
  `croptype_id` int(11) DEFAULT NULL,
  `flight_time` time DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `aircraft_id` int(11) DEFAULT NULL,
  `camera_id` int(11) DEFAULT NULL,
  `image_processing_version` varchar(50) DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `description` longtext,
  `locked` tinyint(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `croptype_id` (`croptype_id`),
  UNIQUE KEY `aircraft_id` (`aircraft_id`),
  UNIQUE KEY `camera_id` (`camera_id`),
  UNIQUE KEY `server_id` (`server_id`),
  KEY `image_property_id` (`property_id`),
  KEY `image_imagetypes_id` (`imagetypes_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1313 ;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `property_id`, `imagetypes_id`, `capture_date`, `webserver_layer`, `croptype_id`, `flight_time`, `resolution`, `aircraft_id`, `camera_id`, `image_processing_version`, `published_date`, `server_id`, `description`, `locked`, `name`) VALUES
(304, 29, 1, '2009-04-04', 'brandenberg1.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg1.ecw'),
(305, 29, 1, '2009-04-04', 'brandenberg2_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg2_rgb.ecw'),
(306, 25, 1, '2009-04-04', 'ivc_dogwood_67_rgb_georef_b.aux', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_rgb_georef_b.aux'),
(307, 25, 1, '2009-04-04', 'ivc_dogwood_67_rgb_georef_b.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_rgb_georef_b.ecw'),
(308, 25, 1, '2009-04-04', 'ivc_dogwood_67_rgb_georef_b.ers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_rgb_georef_b.ers'),
(309, 24, 1, '2009-04-04', 'kalin_trif_9_155-156_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_155-156_rgb.ecw'),
(310, 23, 1, '2009-04-04', 'malva_2-9_rgb_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_2-9_rgb_georef.ecw'),
(311, 22, 1, '2009-04-04', 'n-4_rgb_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n-4_rgb_georef.ecw'),
(312, 21, 1, '2009-04-04', 'niland_rgb_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'niland_rgb_georef.ecw'),
(314, 15, 1, '2009-04-04', 'pfw_rgb_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfw_rgb_georef.ecw'),
(315, 9, 1, '2009-04-04', 'qdm_rgb_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'qdm_rgb_georef.ecw'),
(316, 8, 1, '2009-04-04', 'rancho_dos_hermanos_rgb_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rancho_dos_hermanos_rgb_georef.ecw'),
(317, 7, 1, '2009-04-04', 'rbw_rgb_georef_03.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rbw_rgb_georef_03.ecw'),
(318, 6, 1, '2009-04-04', 'rubber_a_rgb_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_rgb_georef.ecw'),
(319, 4, 1, '2009-04-04', 'Salton_City_Pass_1_2_3_4_Georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'Salton_City_Pass_1_2_3_4_Georef_250.ecw'),
(322, 29, 1, '2009-04-04', 'brandenberg_1.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_1.ecw'),
(323, 29, 1, '2009-04-04', 'brandenberg_2_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_2_rgb_ir.ecw'),
(324, 25, 1, '2009-04-04', 'ivc_dogwood_67_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_rgb_ir.ecw'),
(325, 24, 1, '2009-04-04', 'kalin_trif_9_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_rgb_ir.ecw'),
(326, 23, 1, '2009-04-04', 'malva_2-9_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_2-9_rgb_ir.ecw'),
(327, 22, 1, '2009-04-04', 'n-4_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n-4_rgb_ir.ecw'),
(329, 9, 1, '2009-04-04', 'quatro_del_mar_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'quatro_del_mar_rgb_ir.ecw'),
(330, 8, 1, '2009-04-04', 'rancho_dos_hermanos_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rancho_dos_hermanos_rgb_ir.ecw'),
(331, 7, 1, '2009-04-04', 'rbw_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rbw_rgb_ir.ecw'),
(332, 6, 1, '2009-04-04', 'rubber_a_rgb_ir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_rgb_ir.ecw'),
(333, 20, 2, '2009-04-24', '0-8_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '0-8_cir_georef_250.ecw'),
(334, 30, 2, '2009-04-24', 'bojax_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_cir_georef_250.ecw'),
(335, 29, 2, '2009-04-24', 'brandenberg_1_cir_georef_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_1_cir_georef_125.ecw'),
(336, 29, 2, '2009-04-24', 'brandenberg_2_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_2_cir_georef_250.ecw'),
(337, 28, 2, '2009-04-24', 'church_ranch_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'church_ranch_4band_georef_250.ecw'),
(338, 27, 2, '2009-04-24', 'ecco_13e_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_cir_georef_250.ecw'),
(339, 26, 2, '2009-04-24', 'ecco_25e_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4band_georef_250.ecw'),
(340, 25, 2, '2009-04-24', 'ivc_dogwood_67_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_cir_georef_250.ecw'),
(341, 24, 2, '2009-04-24', 'kalin_trif_9_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_4band_georef_250.ecw'),
(342, 23, 2, '2009-04-24', 'malva_2-9_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_2-9_cir_georef_250.ecw'),
(343, 22, 2, '2009-04-24', 'n-4_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n-4_cir_georef_250.ecw'),
(344, 19, 2, '2009-04-24', 'ohmar_26_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_4band_georef_250.ecw'),
(345, 18, 2, '2009-04-24', 'osterkamp_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_cir_georef_250.ecw'),
(346, 15, 2, '2009-04-24', 'paramount_flowing_wells_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'paramount_flowing_wells_cir_georef_250.ecw'),
(347, 9, 2, '2009-04-24', 'quatro_del_mar_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'quatro_del_mar_cir_georef_250.ecw'),
(348, 8, 2, '2009-04-24', 'ranchos_dos_hermanos_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ranchos_dos_hermanos_cir_georef_250.ecw'),
(349, 7, 2, '2009-04-24', 'rbw_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rbw_cir_georef_250.ecw'),
(350, 6, 2, '2009-04-24', 'rubber_a_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_cir_georef_250.ecw'),
(351, 5, 2, '2009-04-24', 'rucker_1_4band_georef_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_4band_georef_125.ecw'),
(352, 3, 2, '2009-04-24', 'scheu_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'scheu_4band_georef_250.ecw'),
(353, 1, 2, '2009-04-24', 'three_flags_2_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_2_4band_georef_250.ecw'),
(354, 2, 2, '2009-04-24', 'three_flags_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_4band_georef_250.ecw'),
(355, 28, 3, '2009-04-24', 'church_ranch_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'church_ranch_ndvi_georef_250.ecw'),
(356, 26, 3, '2009-04-24', 'ecco_25e_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_ndvi_georef_250.ecw'),
(357, 24, 3, '2009-04-24', 'kalin_trif_9_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_ndvi_georef_250.ecw'),
(358, 19, 3, '2009-04-24', 'ohmar_26_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_ndvi_georef_250.ecw'),
(359, 5, 3, '2009-04-24', 'rucker_1_ndvi_georef_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_ndvi_georef_125.ecw'),
(360, 3, 3, '2009-04-24', 'scheu_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'scheu_ndvi_georef_250.ecw'),
(361, 1, 3, '2009-04-24', 'three_flags_2_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_2_ndvi_georef_250.ecw'),
(362, 2, 3, '2009-04-24', 'three_flags_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_ndvi_georef_250.ecw'),
(363, 30, 1, '2009-04-24', 'bojax_rgb_stitched_01_autosync_cropped_250_ak.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_rgb_stitched_01_autosync_cropped_250_ak.ecw'),
(364, 29, 1, '2009-04-24', 'brandenberg_1_rgb_stitched_autosync_cropped_ak.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_1_rgb_stitched_autosync_cropped_ak.ecw'),
(365, 29, 1, '2009-04-24', 'brandenberg_2_rgb_georef_125_cropped_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_2_rgb_georef_125_cropped_125.ecw'),
(366, 28, 1, '2009-04-24', 'church_ranch_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'church_ranch_4band_georef_250.ecw'),
(367, 27, 1, '2009-04-24', 'ecco_13e_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_rgb.ecw'),
(368, 27, 1, '2009-04-24', 'ecco_13e_rgb_stitched_georef_cropped_250_ak.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_rgb_stitched_georef_cropped_250_ak.ecw'),
(369, 26, 1, '2009-04-24', 'ecco_25e_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4band_georef_250.ecw'),
(370, 25, 1, '2009-04-24', 'ivc_dogwood_67.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67.ecw'),
(371, 24, 1, '2009-04-24', 'kalin_trif_9_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_4band_georef_250.ecw'),
(372, 24, 1, '2009-04-24', 'kalin_trif_9_rgb_autosync.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_rgb_autosync.ecw'),
(373, 23, 1, '2009-04-24', 'malva_2-9_rgb_stitched_georef_cropped.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_2-9_rgb_stitched_georef_cropped.ecw'),
(374, 22, 1, '2009-04-24', 'n-4_rgb_stitched_autosync_cropped_250_ak.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n-4_rgb_stitched_autosync_cropped_250_ak.ecw'),
(375, 20, 1, '2009-04-24', 'o-8_rgb_stitched_georef_250_01_cropped_250_ak.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'o-8_rgb_stitched_georef_250_01_cropped_250_ak.ecw'),
(376, 19, 1, '2009-04-24', 'ohmar_26_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_4band_georef_250.ecw'),
(377, 18, 1, '2009-04-24', 'osterkamp_rgb_sitched_autosync_cropped_250_01_ak.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_rgb_sitched_autosync_cropped_250_01_ak.ecw'),
(378, 9, 1, '2009-04-24', 'quatro_del_mar_rgb_georef_cropped_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'quatro_del_mar_rgb_georef_cropped_250.ecw'),
(379, 8, 1, '2009-04-24', 'rancho_dos_hermanos_rgb_stitched_autosync_cropped_01.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rancho_dos_hermanos_rgb_stitched_autosync_cropped_01.ecw'),
(380, 7, 1, '2009-04-24', 'rbw_rgb_georef250_cropped_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_rgb_georef250_cropped_250.ecw'),
(381, 6, 1, '2009-04-24', 'rubber_a.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a.ecw'),
(382, 5, 1, '2009-04-24', 'rucker_1_4band_georef_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_4band_georef_125.ecw'),
(383, 3, 1, '2009-04-24', 'scheu_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'scheu_4band_georef_250.ecw'),
(384, 1, 1, '2009-04-24', 'three_flags_2_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_2_4band_georef_250.ecw'),
(385, 2, 1, '2009-04-24', 'three_flags_4band_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_4band_georef_250.ecw'),
(386, 28, 1, '2009-04-24', 'church_ranch_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'church_ranch_4band_georef_250.tif'),
(387, 26, 1, '2009-04-24', 'ecco_25e_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4band_georef_250.tif'),
(388, 24, 1, '2009-04-24', 'kalin_trif_9_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_4band_georef_250.tif'),
(389, 19, 1, '2009-04-24', 'ohmar_26_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_4band_georef_250.tif'),
(390, 5, 1, '2009-04-24', 'rucker_1_4band_georef_125.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_4band_georef_125.tif'),
(391, 3, 1, '2009-04-24', 'scheu_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'scheu_4band_georef_250.tif'),
(392, 1, 1, '2009-04-24', 'three_flags_2_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_2_4band_georef_250.tif'),
(393, 2, 1, '2009-04-24', 'three_flags_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_4band_georef_250.tif'),
(394, 20, 2, '2009-05-08', '0-8_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '0-8_4band_georef_cir_250.ecw'),
(395, 31, 2, '2009-05-08', 'bishop_wistyeria_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_wistyeria_4band_georef_cir_250.ecw'),
(396, 30, 2, '2009-05-08', 'bojax_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_4band_georef_cir_250.ecw'),
(397, 29, 2, '2009-05-08', 'brandenberg_1_4band_georef_cir_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_1_4band_georef_cir_125.ecw'),
(398, 29, 2, '2009-05-08', 'brandenberg_2_4band_georef_cir_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_2_4band_georef_cir_125.ecw'),
(399, 28, 2, '2009-05-08', 'church_ranch_4band_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'church_ranch_4band_250.ecw'),
(400, 27, 2, '2009-05-08', 'ecco_13e_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_4band_georef_cir_250.ecw'),
(401, 26, 2, '2009-05-08', 'ecco_25e_4-band_cir_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4-band_cir_georef.ecw'),
(402, 25, 2, '2009-05-08', 'ivc_dogwood_67_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_4band_georef_cir_250.ecw'),
(403, 24, 2, '2009-05-08', 'kalin_trif_9_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_4band_georef_cir_250.ecw'),
(404, 23, 2, '2009-05-08', 'malva_2-9_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_2-9_cir_250.ecw'),
(405, 22, 2, '2009-05-08', 'n-4_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n-4_4band_georef_cir_250.ecw'),
(406, 19, 2, '2009-05-08', 'ohmar_26_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_4band_georef_cir_250.ecw'),
(407, 18, 2, '2009-05-08', 'osterkamp_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_4band_georef_cir_250.ecw'),
(408, 15, 2, '2009-05-08', 'paramount_flowing_wells_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'paramount_flowing_wells_4band_georef_cir_250.ecw'),
(409, 14, 2, '2009-05-08', 'pfister_home_ranch_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfister_home_ranch_4band_georef_cir_250.ecw'),
(410, 10, 2, '2009-05-08', 'pfister_sprinkler_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfister_sprinkler_4band_georef_cir_250.ecw'),
(411, 9, 2, '2009-05-08', 'quatro_del_mar_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'quatro_del_mar_4band_georef_cir_250.ecw'),
(412, 8, 2, '2009-05-08', 'rancho_dos_hermanos_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rancho_dos_hermanos_4band_georef_cir_250.ecw'),
(413, 7, 2, '2009-05-08', 'rbw_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_4band_georef_cir_250.ecw'),
(414, 6, 2, '2009-05-08', 'rubber_a_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_4band_georef_cir_250.ecw'),
(415, 5, 2, '2009-05-08', 'rucker_1_4band_georef_cir_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_4band_georef_cir_125.ecw'),
(416, 3, 2, '2009-05-08', 'scheu_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'scheu_4band_georef_cir_250.ecw'),
(417, 1, 2, '2009-05-08', 'three_flags_2_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_2_4band_georef_cir_250.ecw'),
(418, 2, 2, '2009-05-08', 'three_flags_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_4band_georef_cir_250.ecw'),
(419, 20, 3, '2009-05-08', '0-8_ndvi_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '0-8_ndvi_250.ecw'),
(420, 31, 3, '2009-05-08', 'bishop_wistyeria_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_wistyeria_ndvi_georef_250.ecw'),
(421, 30, 3, '2009-05-08', 'bojax_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_ndvi_georef_250.ecw'),
(422, 29, 3, '2009-05-08', 'brandenberg_1_ndvi_georef_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_1_ndvi_georef_125.ecw'),
(423, 29, 3, '2009-05-08', 'brandenberg_2_ndvi_georef_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_2_ndvi_georef_125.ecw'),
(424, 28, 3, '2009-05-08', 'church_ranch_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'church_ranch_ndvi_georef_250.ecw'),
(425, 27, 3, '2009-05-08', 'ecco_13e_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_ndvi_georef_250.ecw'),
(426, 26, 3, '2009-05-08', 'ecco_25e_4-band_ndvi_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4-band_ndvi_georef.ecw'),
(427, 25, 3, '2009-05-08', 'ivc_dogwood_67_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_ndvi_georef_250.ecw'),
(428, 24, 3, '2009-05-08', 'kalin_trif_9_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_ndvi_georef_250.ecw'),
(429, 23, 3, '2009-05-08', 'malva_2-9_ndvi_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_2-9_ndvi_250.ecw'),
(430, 22, 3, '2009-05-08', 'n-4_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n-4_ndvi_georef_250.ecw'),
(431, 19, 3, '2009-05-08', 'ohmar_26_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_ndvi_georef_250.ecw'),
(432, 18, 3, '2009-05-08', 'osterkamp_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_ndvi_georef_250.ecw'),
(433, 15, 3, '2009-05-08', 'paramount_flowing_wells_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'paramount_flowing_wells_ndvi_georef_250.ecw'),
(434, 14, 3, '2009-05-08', 'pfister_home_ranch_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfister_home_ranch_ndvi_georef_250.ecw'),
(435, 10, 3, '2009-05-08', 'pfister_sprinkler_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfister_sprinkler_ndvi_georef_250.ecw'),
(436, 9, 3, '2009-05-08', 'quatro_del_mar_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'quatro_del_mar_ndvi_georef_250.ecw'),
(437, 8, 3, '2009-05-08', 'rancho_dos_hermanos_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rancho_dos_hermanos_ndvi_georef_250.ecw'),
(438, 7, 3, '2009-05-08', 'rbw_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_ndvi_georef_250.ecw'),
(439, 6, 3, '2009-05-08', 'rubber_a_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_ndvi_georef_250.ecw'),
(440, 5, 3, '2009-05-08', 'rucker_1_ndvi_georef_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_ndvi_georef_125.ecw'),
(441, 3, 3, '2009-05-08', 'scheu_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'scheu_ndvi_georef_250.ecw'),
(442, 1, 3, '2009-05-08', 'three_flags_2_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_2_ndvi_georef_250.ecw'),
(443, 2, 3, '2009-05-08', 'three_flags_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_ndvi_georef_250.ecw'),
(444, 20, 1, '2009-05-08', '0-8_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '0-8_4-band_georef_rgb_250.ecw'),
(445, 31, 1, '2009-05-08', 'bishop_wistyeria_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_wistyeria_4-band_georef_rgb_250.ecw'),
(446, 30, 1, '2009-05-08', 'bojax_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_4-band_georef_rgb_250.ecw'),
(447, 29, 1, '2009-05-08', 'brandenberg_1_4band_georef_rgb_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_1_4band_georef_rgb_125.ecw'),
(448, 29, 1, '2009-05-08', 'brandenberg_2_4band_georef_rgb_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_2_4band_georef_rgb_125.ecw'),
(449, 28, 1, '2009-05-08', 'church_ranch_4band_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'church_ranch_4band_rgb_250.ecw'),
(450, 27, 1, '2009-05-08', 'ecco_13e_4band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_4band_georef_rgb_250.ecw'),
(451, 26, 1, '2009-05-08', 'ecco_25e_4-band_crgb_georef.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4-band_crgb_georef.ecw'),
(452, 25, 1, '2009-05-08', 'ivc_dogwood_67_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_4-band_georef_rgb_250.ecw'),
(453, 24, 1, '2009-05-08', 'kalin_trif_9_4band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_4band_georef_rgb_250.ecw'),
(454, 23, 1, '2009-05-08', 'malva_2-9_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_2-9_rgb_250.ecw'),
(455, 22, 1, '2009-05-08', 'n-4_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n-4_4-band_georef_rgb_250.ecw'),
(456, 19, 1, '2009-05-08', 'ohmar_26_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_4-band_georef_rgb_250.ecw'),
(457, 18, 1, '2009-05-08', 'osterkamp_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_4-band_georef_rgb_250.ecw'),
(458, 15, 1, '2009-05-08', 'paramount_flowing_wells_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'paramount_flowing_wells_4-band_georef_rgb_250.ecw'),
(459, 14, 1, '2009-05-08', 'pfister_home_ranch_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfister_home_ranch_4-band_georef_rgb_250.ecw'),
(460, 10, 1, '2009-05-08', 'pfister_sprinkler_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfister_sprinkler_4-band_georef_rgb_250.ecw'),
(461, 9, 1, '2009-05-08', 'quatro_del_mar_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'quatro_del_mar_4-band_georef_rgb_250.ecw'),
(462, 8, 1, '2009-05-08', 'rancho_dos_hermanos_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rancho_dos_hermanos_4-band_georef_rgb_250.ecw'),
(463, 7, 1, '2009-05-08', 'rbw_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_4-band_georef_rgb_250.ecw'),
(464, 6, 1, '2009-05-08', 'rubber_a_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_4-band_georef_rgb_250.ecw'),
(465, 5, 1, '2009-05-08', 'rucker_1_4-band_georef_rgb_125.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_4-band_georef_rgb_125.ecw'),
(466, 3, 1, '2009-05-08', 'scheu_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'scheu_4-band_georef_rgb_250.ecw'),
(467, 1, 1, '2009-05-08', 'three_flags_2_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_2_4-band_georef_rgb_250.ecw'),
(468, 2, 1, '2009-05-08', 'three_flags_4-band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_4-band_georef_rgb_250.ecw'),
(469, 20, 1, '2009-05-08', '0-8_4band_georef.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '0-8_4band_georef.tif'),
(470, 31, 1, '2009-05-08', 'bishop_wisteria_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_wisteria_4band_georef_250.tif'),
(471, 30, 1, '2009-05-08', 'bojax_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_4band_georef_250.tif'),
(472, 29, 1, '2009-05-08', 'brandenberg_1_4band_georef_125_01.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_1_4band_georef_125_01.tif'),
(473, 29, 1, '2009-05-08', 'brandenberg_2_4band_georef_125.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'brandenberg_2_4band_georef_125.tif'),
(474, 28, 1, '2009-05-08', 'church_ranch_4band_georef.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'church_ranch_4band_georef.tif'),
(475, 27, 1, '2009-05-08', 'ecco_13e_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_4band_georef_250.tif'),
(476, 26, 1, '2009-05-08', 'ecco_25e_4-band_georef.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4-band_georef.tif'),
(477, 25, 1, '2009-05-08', 'ivc_dogwood_67_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_4band_georef_250.tif'),
(478, 24, 1, '2009-05-08', 'Kain_Triff_9_4band.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Kain_Triff_9_4band.tif'),
(479, 23, 1, '2009-05-08', 'malva_2-9_4band_georef.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_2-9_4band_georef.tif'),
(480, 22, 1, '2009-05-08', 'n-4_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n-4_4band_georef_250.tif'),
(481, 19, 1, '2009-05-08', 'ohmar_26_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_4band_georef_250.tif'),
(482, 18, 1, '2009-05-08', 'osterkamp_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_4band_georef_250.tif'),
(483, 15, 1, '2009-05-08', 'paramount_flowing_wells_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'paramount_flowing_wells_4band_georef_250.tif'),
(484, 14, 1, '2009-05-08', 'pfister_home_ranch_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfister_home_ranch_4band_georef_250.tif'),
(485, 10, 1, '2009-05-08', 'pfister_sprinkler_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'pfister_sprinkler_4band_georef_250.tif'),
(486, 9, 1, '2009-05-08', 'quatro_del_mar_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'quatro_del_mar_4band_georef_250.tif'),
(487, 8, 1, '2009-05-08', 'ranchos_dos_hermanos_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ranchos_dos_hermanos_4band_georef_250.tif'),
(488, 7, 1, '2009-05-08', 'rbw_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_4band_georef_250.tif'),
(489, 6, 1, '2009-05-08', 'rubber_a_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_4band_georef_250.tif'),
(490, 5, 1, '2009-05-08', 'rucker_1_4band_georef_125.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_4band_georef_125.tif'),
(491, 3, 1, '2009-05-08', 'scheu_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'scheu_4band_georef_250.tif'),
(492, 1, 1, '2009-05-08', 'three_flags_2_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_2_4band_georef_250.tif'),
(493, 2, 1, '2009-05-08', 'three_flags_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_4band_georef_250.tif'),
(494, 31, 2, '2009-05-22', 'bishop_wisteryia_4band_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_wisteryia_4band_cir_georef_250.ecw'),
(495, 30, 2, '2009-05-22', 'bojax_4band_georef_cir_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_4band_georef_cir_250.ecw'),
(496, 26, 2, '2009-05-22', 'ecco_25e_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_cir_georef_250.ecw'),
(497, 27, 2, '2009-05-22', 'ecco13e_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco13e_cir_georef_250.ecw'),
(498, 25, 2, '2009-05-22', 'ivc_dogwood_67_4band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_4band_georef_250_cir.ecw'),
(499, 24, 2, '2009-05-22', 'kalin_trif_9_cir_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_cir_georef_250.ecw'),
(500, 23, 2, '2009-05-22', 'malva_29_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_29_10band_georef_250_cir.ecw'),
(501, 22, 2, '2009-05-22', 'n4_4band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n4_4band_georef_250_cir.ecw'),
(502, 20, 2, '2009-05-22', 'o-8_4band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'o-8_4band_georef_250_cir.ecw'),
(503, 19, 2, '2009-05-22', 'ohmar_26_4band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_4band_georef_250_cir.ecw'),
(504, 18, 2, '2009-05-22', 'osterkamp_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_10band_georef_250_cir.ecw'),
(505, 15, 2, '2009-05-22', 'parafw_4band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'parafw_4band_georef_250_cir.ecw'),
(506, 6, 2, '2009-05-22', 'rubber_a_4band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_4band_georef_250_cir.ecw'),
(507, 5, 2, '2009-05-22', 'rucker_1_10band_georef_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_10band_georef_125_cir.ecw'),
(508, 2, 2, '2009-05-22', 'three_flags_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_10band_georef_250_cir.ecw'),
(509, 1, 2, '2009-05-22', 'threeflags2_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'threeflags2_10band_georef_250_cir.ecw'),
(510, 31, 3, '2009-05-22', 'bishop_wisteryia_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_wisteryia_ndvi_georef_250.ecw'),
(511, 30, 3, '2009-05-22', 'bojax_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_ndvi_georef_250.ecw'),
(512, 27, 3, '2009-05-22', 'ecco_13e_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_ndvi_georef_250.ecw'),
(513, 26, 3, '2009-05-22', 'ecco_25e_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_ndvi_georef_250.ecw'),
(514, 25, 3, '2009-05-22', 'ivc_dogwood_67_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_ndvi_georef_250.ecw'),
(515, 24, 3, '2009-05-22', 'kalin_trif_9_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_ndvi_georef_250.ecw'),
(516, 23, 3, '2009-05-22', 'malva_29_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_29_10band_georef_250_ndvi.ecw'),
(517, 22, 3, '2009-05-22', 'n4_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n4_ndvi_georef_250.ecw'),
(518, 20, 3, '2009-05-22', 'o8_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'o8_ndvi_georef_250.ecw'),
(519, 19, 3, '2009-05-22', 'ohmar_26_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_ndvi_georef_250.ecw'),
(520, 18, 3, '2009-05-22', 'osterkamp_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_10band_georef_250_ndvi.ecw'),
(521, 15, 3, '2009-05-22', 'parafw_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'parafw_ndvi_georef_250.ecw'),
(522, 6, 3, '2009-05-22', 'rubber_a_ndvi_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_ndvi_georef_250.ecw'),
(523, 5, 3, '2009-05-22', 'rucker_1_10band_georef_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_10band_georef_125_ndvi.ecw'),
(524, 2, 3, '2009-05-22', 'three_flags_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_10band_georef_250_ndvi.ecw'),
(525, 1, 3, '2009-05-22', 'threeflags2_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'threeflags2_10band_georef_250_ndvi.ecw'),
(526, 31, 5, '2009-05-22', 'bishop_wisteryia_ndviHD_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_wisteryia_ndviHD_georef_250.ecw'),
(527, 30, 5, '2009-05-22', 'bojax_ndvihd_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_ndvihd_georef_250.ecw'),
(528, 27, 5, '2009-05-22', 'ecco_13e_ndviHD_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_ndviHD_georef_250.ecw'),
(529, 26, 5, '2009-05-22', 'ecco_25e_ndviHD_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_ndviHD_georef_250.ecw'),
(530, 25, 5, '2009-05-22', 'ivc_dogwood_67_ndvihd_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_ndvihd_georef_250.ecw'),
(531, 24, 5, '2009-05-22', 'kalin_trif_9_ndviHD_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_ndviHD_georef_250.ecw'),
(532, 23, 5, '2009-05-22', 'malva_29_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_29_10band_georef_250_ndvihd.ecw'),
(533, 22, 5, '2009-05-22', 'n4_ndvihd_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n4_ndvihd_georef_250.ecw'),
(534, 20, 5, '2009-05-22', 'o-8_ndvihd_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'o-8_ndvihd_georef_250.ecw'),
(535, 19, 5, '2009-05-22', 'ohmar_26_ndvihd_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_ndvihd_georef_250.ecw'),
(536, 18, 5, '2009-05-22', 'osterkamp_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_10band_georef_250_ndvihd.ecw'),
(537, 15, 5, '2009-05-22', 'parafw_ndvihd_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'parafw_ndvihd_georef_250.ecw'),
(538, 6, 5, '2009-05-22', 'rubber_a_ndvihd_georef_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_ndvihd_georef_250.ecw'),
(539, 5, 5, '2009-05-22', 'rucker_1_10band_georef_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_10band_georef_125_ndvihd.ecw'),
(540, 2, 5, '2009-05-22', 'three_flags_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_10band_georef_250_ndvihd.ecw'),
(541, 1, 5, '2009-05-22', 'threeflags2_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'threeflags2_10band_georef_250_ndvihd.ecw'),
(542, 31, 1, '2009-05-22', 'bishop_wisteryia_4band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_wisteryia_4band_georef_rgb_250.ecw'),
(543, 30, 1, '2009-05-22', 'bojax_4band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_4band_georef_rgb_250.ecw'),
(544, 27, 1, '2009-05-22', 'ecco_13e_4band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_4band_georef_rgb_250.ecw'),
(545, 26, 1, '2009-05-22', 'ecco_25e_4band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4band_georef_rgb_250.ecw'),
(546, 25, 1, '2009-05-22', 'ivc_dogwood_67_4band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ivc_dogwood_67_4band_georef_250_rgb.ecw'),
(547, 24, 1, '2009-05-22', 'kalin_trif_9_4band_georef_rgb_250.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_4band_georef_rgb_250.ecw'),
(548, 23, 1, '2009-05-22', 'malva_29_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva_29_10band_georef_250_rgb.ecw'),
(549, 22, 1, '2009-05-22', 'n4_4band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n4_4band_georef_250_rgb.ecw'),
(550, 20, 1, '2009-05-22', 'o-8_4band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'o-8_4band_georef_250_rgb.ecw'),
(551, 19, 1, '2009-05-22', 'ohmar_26_4band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar_26_4band_georef_250_rgb.ecw'),
(552, 18, 1, '2009-05-22', 'osterkamp_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'osterkamp_10band_georef_250_rgb.ecw'),
(553, 15, 1, '2009-05-22', 'parafw_4band_georef_250_rgb.ecwparafw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'parafw_4band_georef_250_rgb.ecwparafw'),
(554, 6, 1, '2009-05-22', 'rubber_a_4band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rubber_a_4band_georef_250_rgb.ecw'),
(555, 5, 1, '2009-05-22', 'rucker_1_10band_georef_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'rucker_1_10band_georef_125_rgb.ecw'),
(556, 2, 1, '2009-05-22', 'three_flags_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'three_flags_10band_georef_250_rgb.ecw'),
(557, 1, 1, '2009-05-22', 'threeflags2_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'threeflags2_10band_georef_250_rgb.ecw'),
(558, 31, 1, '2009-05-22', 'bishop_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bishop_4band_georef_250.tif'),
(559, 30, 1, '2009-05-22', 'bojax_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'bojax_4band_georef_250.tif'),
(560, 27, 1, '2009-05-22', 'ecco_13e_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_13e_4band_georef_250.tif'),
(561, 26, 1, '2009-05-22', 'ecco_25e_4band_georef_250.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco_25e_4band_georef_250.tif'),
(562, 24, 1, '2009-05-22', 'kalin_trif_9_4band_georef_250_ck.tif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalin_trif_9_4band_georef_250_ck.tif'),
(563, 40, 2, '2009-06-12', 'al_kalin_bn1_bn2_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'al_kalin_bn1_bn2_12band_georef_250_cropped_cir.ecw'),
(564, 36, 2, '2009-06-12', 'al_kalin_fuller_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'al_kalin_fuller_12band_georef_250_cropped_cir.ecw'),
(565, 27, 2, '2009-06-12', 'ecco13e_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco13e_12band_georef_250_cropped_cir.ecw'),
(566, 24, 2, '2009-06-12', 'kalintrif9_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalintrif9_12band_georef_250_cropped_cir.ecw'),
(567, 23, 2, '2009-06-12', 'malva29_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva29_12band_georef_250_cropped_cir.ecw'),
(568, 22, 2, '2009-06-12', 'n4_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n4_12band_georef_250_cropped_cir.ecw'),
(569, 19, 2, '2009-06-12', 'ohmar26_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar26_12band_georef_250_cropped_cir.ecw'),
(570, 15, 2, '2009-06-12', 'parafw_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'parafw_12band_georef_250_cropped_cir.ecw'),
(571, 33, 2, '2009-06-12', 'smilex58_smilex59_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'smilex58_smilex59_12band_georef_250_cropped_cir.ecw'),
(572, 34, 2, '2009-06-12', 'smilex_65_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'smilex_65_12band_georef_250_cropped_cir.ecw'),
(573, 35, 2, '2009-06-12', 'spruce166_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'spruce166_12band_georef_250_cropped_cir.ecw'),
(574, 40, 3, '2009-06-12', 'al_kalin_bn1_bn2_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'al_kalin_bn1_bn2_12band_georef_250_cropped_ndvi.ecw'),
(575, 36, 3, '2009-06-12', 'al_kalin_fuller_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'al_kalin_fuller_12band_georef_250_cropped_ndvi.ecw'),
(576, 27, 3, '2009-06-12', 'ecco13e_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco13e_12band_georef_250_cropped_ndvi.ecw'),
(577, 24, 3, '2009-06-12', 'kalintrif9_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalintrif9_12band_georef_250_cropped_ndvi.ecw'),
(578, 23, 3, '2009-06-12', 'malva29_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva29_12band_georef_250_cropped_ndvi.ecw'),
(579, 22, 3, '2009-06-12', 'n4_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n4_12band_georef_250_cropped_ndvi.ecw'),
(580, 19, 3, '2009-06-12', 'ohmar26_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar26_12band_georef_250_cropped_ndvi.ecw'),
(581, 15, 3, '2009-06-12', 'parafw_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'parafw_12band_georef_250_cropped_ndvi.ecw'),
(582, 33, 3, '2009-06-12', 'smilex58_smilex59_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'smilex58_smilex59_12band_georef_250_cropped_ndvi.ecw'),
(583, 34, 3, '2009-06-12', 'smilex_65_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'smilex_65_12band_georef_250_cropped_ndvi.ecw'),
(584, 35, 3, '2009-06-12', 'spruce166_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'spruce166_12band_georef_250_cropped_ndvi.ecw'),
(585, 40, 5, '2009-06-12', 'al_kalin_bn1_bn2_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'al_kalin_bn1_bn2_12band_georef_250_cropped_ndvihd.ecw'),
(586, 36, 5, '2009-06-12', 'al_kalin_fuller_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'al_kalin_fuller_12band_georef_250_cropped_ndvihd.ecw'),
(587, 27, 5, '2009-06-12', 'ecco13e_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco13e_12band_georef_250_cropped_ndvihd.ecw'),
(588, 23, 5, '2009-06-12', 'malva29_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva29_12band_georef_250_cropped_ndvihd.ecw'),
(589, 22, 5, '2009-06-12', 'n4_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n4_12band_georef_250_cropped_ndvihd.ecw'),
(590, 19, 5, '2009-06-12', 'ohmar26_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar26_12band_georef_250_cropped_ndvihd.ecw'),
(591, 15, 5, '2009-06-12', 'parafw_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'parafw_12band_georef_250_cropped_ndvihd.ecw'),
(592, 33, 5, '2009-06-12', 'smilex58_smilex59_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'smilex58_smilex59_12band_georef_250_cropped_ndvihd.ecw'),
(593, 34, 5, '2009-06-12', 'smilex_65_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'smilex_65_12band_georef_250_cropped_ndvihd.ecw'),
(594, 35, 5, '2009-06-12', 'spruce166_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'spruce166_12band_georef_250_cropped_ndvihd.ecw'),
(595, 40, 1, '2009-06-12', 'al_kalin_bn1_bn2_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'al_kalin_bn1_bn2_12band_georef_250_cropped_rgb.ecw'),
(596, 36, 1, '2009-06-12', 'al_kalin_fuller_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'al_kalin_fuller_12band_georef_250_cropped_rgb.ecw'),
(597, 27, 1, '2009-06-12', 'ecco13e_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ecco13e_12band_georef_250_cropped_rgb.ecw'),
(598, 24, 5, '2009-06-12', 'kalintrif9_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'kalintrif9_12band_georef_250_cropped_ndvihd.ecw'),
(599, 24, 1, '2009-06-12', 'kalintrif9_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'kalintrif9_12band_georef_250_cropped_rgb.ecw'),
(600, 23, 1, '2009-06-12', 'malva29_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'malva29_12band_georef_250_cropped_rgb.ecw'),
(601, 22, 1, '2009-06-12', 'n4_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'n4_12band_georef_250_cropped_rgb.ecw'),
(602, 19, 1, '2009-06-12', 'ohmar26_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'ohmar26_12band_georef_250_cropped_rgb.ecw'),
(603, 15, 1, '2009-06-12', 'parafw_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'parafw_12band_georef_250_cropped_rgb.ecw'),
(604, 33, 1, '2009-06-12', 'smilex58_smilex59_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'smilex58_smilex59_12band_georef_250_cropped_rgb.ecw'),
(605, 34, 1, '2009-06-12', 'smilex_65_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'smilex_65_12band_georef_250_cropped_rgb.ecw'),
(606, 35, 1, '2009-06-12', 'spruce166_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'spruce166_12band_georef_250_cropped_rgb.ecw'),
(607, 37, 2, '2009-06-12', 'branden2_12band_georef_125_cropped_cir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_12band_georef_125_cropped_cir'),
(608, 5, 2, '2009-06-12', 'rucker1_12band_georef_125_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rucker1_12band_georef_125_cropped_cir.ecw'),
(609, 1, 2, '2009-06-12', 'threeflags2_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags2_12band_georef_250_cropped_cir.ecw'),
(610, 2, 2, '2009-06-12', 'threeflags_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags_12band_georef_250_cropped_cir.ecw'),
(611, 37, 3, '2009-06-12', 'branden2_12band_georef_125_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_12band_georef_125_cropped_ndvi.ecw'),
(612, 5, 3, '2009-06-12', 'rucker1_12band_georef_125_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rucker1_12band_georef_125_cropped_ndvi.ecw'),
(613, 1, 3, '2009-06-12', 'threeflags2_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags2_12band_georef_250_cropped_ndvi.ecw'),
(614, 2, 3, '2009-06-12', 'threeflags_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags_12band_georef_250_cropped_ndvi.ecw'),
(615, 37, 5, '2009-06-12', 'branden2_12band_georef_125_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_12band_georef_125_cropped_ndvihd.ecw'),
(616, 5, 5, '2009-06-12', 'rucker1_12band_georef_125_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rucker1_12band_georef_125_cropped_ndvihd.ecw'),
(617, 1, 5, '2009-06-12', 'threeflags2_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags2_12band_georef_250_cropped_ndvihd.ecw'),
(618, 2, 5, '2009-06-12', 'threeflags_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags_12band_georef_250_cropped_ndvihd.ecw');
INSERT INTO `image` (`id`, `property_id`, `imagetypes_id`, `capture_date`, `webserver_layer`, `croptype_id`, `flight_time`, `resolution`, `aircraft_id`, `camera_id`, `image_processing_version`, `published_date`, `server_id`, `description`, `locked`, `name`) VALUES
(619, 37, 1, '2009-06-12', 'branden2_12band_georef_125_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_12band_georef_125_cropped_rgb.ecw'),
(620, 5, 1, '2009-06-12', 'rucker1_12band_georef_125_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rucker1_12band_georef_125_cropped_rgb.ecw'),
(621, 1, 1, '2009-06-12', 'threeflags2_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags2_12band_georef_250_cropped_rgb.ecw'),
(622, 2, 1, '2009-06-12', 'threeflags_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags_12band_georef_250_cropped_rgb.ecw'),
(628, 30, 2, '2009-06-12', 'bojax_12band_georef_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bojax_12band_georef_cropped_cir.ecw'),
(629, 28, 2, '2009-06-12', 'churchran_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'churchran_12band_georef_250_cropped_cir.ecw'),
(630, 26, 2, '2009-06-12', 'ecco25e_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ecco25e_12band_georef_250_cropped_cir.ecw'),
(631, 38, 2, '2009-06-12', 'indsprings_12band_georef_125_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings_12band_georef_125_cropped_cir.ecw'),
(632, 20, 2, '2009-06-12', 'o8_12_band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o8_12_band_georef_250_cropped_cir.ecw'),
(633, 9, 2, '2009-06-12', 'quatro_del_mar_georef_cropped_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatro_del_mar_georef_cropped_125_cir.ecw'),
(634, 8, 2, '2009-06-12', 'ranchosdh_12_band_georef_250_01_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_12_band_georef_250_01_cropped_cir.ecw'),
(635, 7, 2, '2009-06-12', 'rbw_12band_georef_250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_12band_georef_250_cropped_cir.ecw'),
(636, 3, 2, '2009-06-12', 'sheu_12_band_georef_250_01_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sheu_12_band_georef_250_01_cropped_cir.ecw'),
(637, 30, 3, '2009-06-12', 'bojax_12band_georef_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bojax_12band_georef_cropped_ndvi.ecw'),
(638, 28, 3, '2009-06-12', 'churchran_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'churchran_12band_georef_250_cropped_ndvi.ecw'),
(639, 26, 3, '2009-06-12', 'ecco25e_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ecco25e_12band_georef_250_cropped_ndvi.ecw'),
(640, 38, 3, '2009-06-12', 'indsprings_12band_georef_125_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings_12band_georef_125_cropped_ndvi.ecw'),
(641, 20, 3, '2009-06-12', 'o8_12_band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o8_12_band_georef_250_cropped_ndvi.ecw'),
(642, 9, 3, '2009-06-12', 'quatro_del_mar_georef_125_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatro_del_mar_georef_125_cropped_ndvi.ecw'),
(643, 8, 3, '2009-06-12', 'ranchosdh_12_band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_12_band_georef_250_cropped_ndvi.ecw'),
(644, 7, 3, '2009-06-12', 'rbw_12band_georef_250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_12band_georef_250_cropped_ndvi.ecw'),
(645, 3, 3, '2009-06-12', 'sheu_12_band_georef_250_01_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sheu_12_band_georef_250_01_cropped_ndvi.ecw'),
(646, 30, 5, '2009-06-12', 'bojax_12band_georef_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bojax_12band_georef_cropped_ndvihd.ecw'),
(647, 28, 5, '2009-06-12', 'churchran_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'churchran_12band_georef_250_cropped_ndvihd.ecw'),
(648, 26, 5, '2009-06-12', 'ecco25e_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ecco25e_12band_georef_250_cropped_ndvihd.ecw'),
(649, 38, 5, '2009-06-12', 'indsprings_12band_georef_125_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings_12band_georef_125_cropped_ndvihd.ecw'),
(650, 20, 5, '2009-06-12', 'o8_12_band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o8_12_band_georef_250_cropped_ndvihd.ecw'),
(651, 8, 5, '2009-06-12', 'ranchosdh_12_band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_12_band_georef_250_cropped_ndvihd.ecw'),
(652, 7, 5, '2009-06-12', 'rbw_12band_georef_250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_12band_georef_250_cropped_ndvihd.ecw'),
(653, 3, 5, '2009-06-12', 'sheu_12_band_georef_250_01_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sheu_12_band_georef_250_01_cropped_ndvihd.ecw'),
(654, 30, 1, '2009-06-12', 'bojax_12band_georef_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bojax_12band_georef_cropped_rgb.ecw'),
(655, 28, 1, '2009-06-12', 'churchran_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'churchran_12band_georef_250_cropped_rgb.ecw'),
(656, 26, 1, '2009-06-12', 'ecco25e_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ecco25e_12band_georef_250_cropped_rgb.ecw'),
(657, 38, 1, '2009-06-12', 'indsprings_12band_georef_125_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings_12band_georef_125_cropped_rgb.ecw'),
(658, 20, 1, '2009-06-12', 'o8_12_band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o8_12_band_georef_250_cropped_rgb.ecw'),
(659, 9, 1, '2009-06-12', 'quatro_del_mar_georef_125_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatro_del_mar_georef_125_cropped_rgb.ecw'),
(660, 8, 1, '2009-06-12', 'ranchosdh_12_band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_12_band_georef_250_cropped_rgb.ecw'),
(661, 7, 1, '2009-06-12', 'rbw_12band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_12band_georef_250_cropped_rgb.ecw'),
(662, 3, 1, '2009-06-12', 'sheu_12_band_georef_250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sheu_12_band_georef_250_cropped_rgb.ecw'),
(663, 9, 5, '2009-06-12', 'quatro_del_mar_georef_125_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatro_del_mar_georef_125_cropped_ndvihd.ecw'),
(664, 29, 1, '2009-06-12', 'branden1_12band_georef_01_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_12band_georef_01_cropped_rgb.ecw'),
(665, 29, 5, '2009-06-12', 'branden1_12band_georef_01_croppedndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_12band_georef_01_croppedndvihd.ecw'),
(666, 29, 3, '2009-06-12', 'branden1_12band_georef_01_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_12band_georef_01_cropped_ndvi.ecw'),
(667, 29, 2, '2009-06-12', 'branden1_12band_georef_01_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_12band_georef_01_cropped_cir.ecw'),
(668, 29, 2, '2009-05-22', 'branden1_10band_georef_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_10band_georef_125_cir.ecw'),
(669, 37, 2, '2009-05-22', 'branden2_10band_georef_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_10band_georef_125_cir.ecw'),
(670, 28, 2, '2009-05-22', 'church_ranch_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'church_ranch_10band_georef_250_cir.ecw'),
(671, 9, 2, '2009-05-22', 'quatrodm_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_10band_georef_250_cir.ecw'),
(672, 8, 2, '2009-05-22', 'ranchosdh_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_10band_georef_250_cir.ecw'),
(673, 7, 2, '2009-05-22', 'rbw_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_10band_georef_250_cir.ecw'),
(674, 3, 2, '2009-05-22', 'scheu_10band_georef_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_10band_georef_250_cir.ecw'),
(675, 29, 3, '2009-05-22', 'branden1_10band_georef_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_10band_georef_125_ndvi.ecw'),
(676, 37, 3, '2009-05-22', 'branden2_10band_georef_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_10band_georef_125_ndvi.ecw'),
(677, 28, 3, '2009-05-22', 'church_ranch_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'church_ranch_10band_georef_250_ndvi.ecw'),
(678, 9, 3, '2009-05-22', 'quatrodm_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_10band_georef_250_ndvi.ecw'),
(679, 8, 3, '2009-05-22', 'ranchosdh_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_10band_georef_250_ndvi.ecw'),
(680, 7, 3, '2009-05-22', 'rbw_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_10band_georef_250_ndvi.ecw'),
(681, 3, 3, '2009-05-22', 'scheu_10band_georef_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_10band_georef_250_ndvi.ecw'),
(682, 29, 5, '2009-05-22', 'branden1_10band_georef_125ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_10band_georef_125ndvihd.ecw'),
(683, 37, 5, '2009-05-22', 'branden2_10band_georef_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_10band_georef_125_ndvihd.ecw'),
(684, 28, 5, '2009-05-22', 'church_ranch_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'church_ranch_10band_georef_250_ndvihd.ecw'),
(685, 9, 5, '2009-05-22', 'quatrodm_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_10band_georef_250_ndvihd.ecw'),
(686, 8, 5, '2009-05-22', 'ranchosdh_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_10band_georef_250_ndvihd.ecw'),
(687, 7, 5, '2009-05-22', 'rbw_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_10band_georef_250_ndvihd.ecw'),
(688, 3, 5, '2009-05-22', 'scheu_10band_georef_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_10band_georef_250_ndvihd.ecw'),
(689, 29, 1, '2009-05-22', 'branden1_10band_georef_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_10band_georef_125_rgb.ecw'),
(690, 37, 1, '2009-05-22', 'branden2_10band_georef_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_10band_georef_125_rgb.ecw'),
(691, 28, 1, '2009-05-22', 'church_ranch_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'church_ranch_10band_georef_250_rgb.ecw'),
(692, 9, 1, '2009-05-22', 'quatrodm_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_10band_georef_250_rgb.ecw'),
(693, 8, 1, '2009-05-22', 'ranchosdh_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_10band_georef_250_rgb.ecw'),
(694, 7, 1, '2009-05-22', 'rbw_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_10band_georef_250_rgb.ecw'),
(695, 3, 1, '2009-05-22', 'scheu_10band_georef_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_10band_georef_250_rgb.ecw'),
(696, 14, 2, '2009-06-12', 'pfisterhr_12band_georef_250_cropped_01_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pfisterhr_12band_georef_250_cropped_01_cir.ecw'),
(697, 14, 3, '2009-06-12', 'pfisterhr_12band_georef_250_cropped_01_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pfisterhr_12band_georef_250_cropped_01_ndvi.ecw'),
(698, 14, 5, '2009-06-12', 'pfisterhr_12band_georef_250_cropped_01_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pfisterhr_12band_georef_250_cropped_01_ndvihd.ecw'),
(699, 14, 1, '2009-06-12', 'pfisterhr_12band_georef_250_cropped_01_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pfisterhr_12band_georef_250_cropped_01_rgb.ecw'),
(707, 43, 1, '2009-06-12', '01_Indian_Springs_Golf.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '01_Indian_Springs_Golf.ecw'),
(708, 43, 1, '2009-06-30', 'KK_indsprings_12band_georef_125_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'KK_indsprings_12band_georef_125_cropped_rgb.ecw'),
(709, 42, 2, '2009-06-12', 'rancholaquintag_12band_georef_125_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rancholaquintag_12band_georef_125_cropped_cir.ecw'),
(710, 41, 2, '2009-06-12', 'heriflag_12band_georef_125_01_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heriflag_12band_georef_125_01_cropped_cir.ecw'),
(711, 41, 3, '2009-06-12', 'heriflag_12band_georef_125_01_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heriflag_12band_georef_125_01_cropped_ndvi.ecw'),
(712, 42, 3, '2009-06-12', 'rancholaquintag_12band_georef_125_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rancholaquintag_12band_georef_125_cropped_ndvi.ecw'),
(713, 41, 5, '2009-06-12', 'heriflag_12band_georef_125_01_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heriflag_12band_georef_125_01_cropped_ndvihd.ecw'),
(714, 42, 5, '2009-06-12', 'rancholaquintag_12band_georef_125_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rancholaquintag_12band_georef_125_cropped_ndvihd.ecw'),
(715, 41, 1, '2009-06-12', 'heriflag_12band_georef_125_01_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heriflag_12band_georef_125_01_cropped_rgb.ecw'),
(716, 42, 1, '2009-06-12', 'rancholaquintag_12band_georef_125_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rancholaquintag_12band_georef_125_cropped_rgb.ecw'),
(717, 43, 1, '2009-06-12', '02_rancholaquintag_test.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '02_rancholaquintag_test.ecw'),
(718, 43, 1, '2009-06-12', 'heriflag_12band_georef_125_01_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heriflag_12band_georef_125_01_cropped_rgb.ecw'),
(722, 19, 2, '2009-07-11', 'ohmar26_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ohmar26_250_cir.ecw'),
(723, 19, 3, '2009-07-11', 'ohmar26_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ohmar26_250_ndvi.ecw'),
(724, 19, 5, '2009-07-11', 'ohmar26_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ohmar26_250_ndvihd.ecw'),
(725, 19, 1, '2009-07-11', 'ohmar26_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ohmar26_250_rgb.ecw'),
(726, 31, 2, '2009-07-11', 'bishopw_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bishopw_250_cir.ecw'),
(727, 31, 3, '2009-07-11', 'bishopw_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bishopw_250_ndvi.ecw'),
(728, 31, 5, '2009-07-11', 'bishopw_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bishopw_250_ndvihd.ecw'),
(729, 31, 1, '2009-07-11', 'bishopw_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bishopw_250_rgb.ecw'),
(730, 30, 2, '2009-07-11', 'bojax_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bojax_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw'),
(731, 30, 3, '2009-07-11', 'bojax_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bojax_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw'),
(732, 30, 5, '2009-07-11', 'bojax_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bojax_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw'),
(733, 30, 1, '2009-07-11', 'bojax_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'bojax_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw'),
(734, 28, 2, '2009-07-11', 'churchran_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'churchran_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw'),
(735, 28, 3, '2009-07-11', 'churchran_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'churchran_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw'),
(736, 28, 5, '2009-07-11', 'churchran_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'churchran_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw'),
(737, 28, 1, '2009-07-11', 'churchran_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'churchran_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw'),
(738, 24, 2, '2009-07-11', 'kalintrif9_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'kalintrif9_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw'),
(739, 24, 3, '2009-07-11', 'kalintrif9_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'kalintrif9_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw'),
(740, 24, 5, '2009-07-11', 'kalintrif9_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'kalintrif9_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw'),
(741, 24, 1, '2009-07-11', 'kalintrif9_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'kalintrif9_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw'),
(742, 23, 2, '2009-07-11', 'malva29_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'malva29_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw'),
(743, 23, 3, '2009-07-11', 'malva29_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'malva29_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw'),
(744, 23, 5, '2009-07-11', 'malva29_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'malva29_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw'),
(745, 23, 1, '2009-07-11', 'malva29_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'malva29_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw'),
(746, 22, 2, '2009-07-11', 'n-4_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'n-4_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw'),
(747, 22, 3, '2009-07-11', 'n-4_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'n-4_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw'),
(748, 22, 5, '2009-07-11', 'n-4_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'n-4_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw'),
(749, 22, 1, '2009-07-11', 'n-4_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'n-4_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw'),
(750, 20, 2, '2009-07-11', 'o8_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o8_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_cir.ecw'),
(751, 20, 3, '2009-07-11', 'o8_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o8_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvi.ecw'),
(752, 20, 5, '2009-07-11', 'o8_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o8_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_ndvihd.ecw'),
(753, 20, 1, '2009-07-11', 'o8_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o8_indv_12band_rgb-cir-ndvihd-ndvi_georef250_cropped_rgb.ecw'),
(754, 29, 2, '2009-07-11', 'branden1_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_125_cir.ecw'),
(755, 29, 3, '2009-07-11', 'branden1_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_125_ndvi.ecw'),
(756, 29, 5, '2009-07-11', 'branden1_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_125_ndvihd.ecw'),
(757, 29, 1, '2009-07-11', 'branden1_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden1_125_rgb.ecw'),
(758, 44, 2, '2009-07-11', 'moss20_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'moss20_250_cir.ecw'),
(759, 44, 3, '2009-07-11', 'moss20_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'moss20_250_ndvi.ecw'),
(760, 44, 5, '2009-07-11', 'moss20_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'moss20_250_ndvihd.ecw'),
(761, 44, 1, '2009-07-11', 'moss20_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'moss20_250_rgb.ecw'),
(762, 37, 2, '2009-07-11', 'branden2_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_125_cir.ecw'),
(763, 37, 3, '2009-07-11', 'branden2_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_125_ndvi.ecw'),
(764, 37, 5, '2009-07-11', 'branden2_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_125_ndvihd.ecw'),
(765, 37, 1, '2009-07-11', 'branden2_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_125_rgb.ecw'),
(766, 46, 2, '2009-07-11', 'beachline1_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachline1_250_cir.ecw'),
(767, 46, 3, '2009-07-11', 'beachline1_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachline1_250_ndvi.ecw'),
(768, 46, 5, '2009-07-11', 'beachline1_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachline1_250_ndvihd.ecw'),
(769, 46, 1, '2009-07-11', 'beachline1_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachline1_250_rgb.ecw'),
(770, 45, 2, '2009-07-11', 'beachline2_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachline2_250_cir.ecw'),
(771, 45, 3, '2009-07-11', 'beachline2_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachline2_250_ndvi.ecw'),
(772, 45, 5, '2009-07-11', 'beachline2_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachline2_250_ndvihd.ecw'),
(773, 45, 1, '2009-07-11', 'beachline2_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachline2_250_rgb.ecw'),
(774, 40, 2, '2009-07-11', 'alkalinbnx_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'alkalinbnx_250_cir.ecw'),
(775, 47, 2, '2009-07-11', 'claverie_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'claverie_250_cir.ecw'),
(776, 41, 2, '2009-07-11', 'heritagegolf_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heritagegolf_125_cir.ecw'),
(777, 48, 2, '2009-07-11', 'i34_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'i34_250_cir.ecw'),
(778, 38, 2, '2009-07-11', 'indiansprings_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indiansprings_125_cir.ecw'),
(779, 52, 2, '2009-07-11', 'j12_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'j12_250_cir.ecw'),
(780, 50, 2, '2009-07-11', 'myrtle14_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'myrtle14_250_cir.ecw'),
(781, 51, 2, '2009-07-11', 'nettle5_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'nettle5_250_cir.ecw'),
(782, 53, 2, '2009-07-11', 'osage89_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osage89_250_cir.ecw'),
(783, 18, 2, '2009-07-11', 'osterkamp_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osterkamp_250_cir.ecw'),
(784, 15, 2, '2009-07-11', 'parafw_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'parafw_250_cir.ecw'),
(785, 14, 2, '2009-07-11', 'pfisterhreast_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pfisterhreast_250_cir.ecw'),
(786, 9, 2, '2009-07-11', 'quatrodm_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_250_cir.ecw'),
(787, 8, 2, '2009-07-11', 'ranchosdh_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_250_cir.ecw'),
(788, 7, 2, '2009-07-11', 'rbw_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_250_cir.ecw'),
(789, 5, 2, '2009-07-11', 'rucker1_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rucker1_125_cir.ecw'),
(790, 3, 2, '2009-07-11', 'scheu_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_250_cir.ecw'),
(791, 1, 2, '2009-07-11', 'threeflag2_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflag2_250_cir.ecw'),
(792, 2, 2, '2009-07-11', 'threeflags_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags_250_cir.ecw'),
(793, 40, 3, '2009-07-11', 'alkalinbnx_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'alkalinbnx_250_ndvi.ecw'),
(794, 47, 3, '2009-07-11', 'claverie_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'claverie_250_ndvi.ecw'),
(795, 41, 3, '2009-07-11', 'heritagegolf_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heritagegolf_125_ndvi.ecw'),
(796, 48, 3, '2009-07-11', 'i34_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'i34_250_ndvi.ecw'),
(797, 38, 3, '2009-07-11', 'indiansprings_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indiansprings_125_ndvi.ecw'),
(798, 52, 3, '2009-07-11', 'j12_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'j12_250_ndvi.ecw'),
(799, 50, 3, '2009-07-11', 'myrtle14_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'myrtle14_250_ndvi.ecw'),
(800, 51, 3, '2009-07-11', 'nettle5_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'nettle5_250_ndvi.ecw'),
(801, 53, 3, '2009-07-11', 'osage89_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osage89_250_ndvi.ecw'),
(802, 18, 3, '2009-07-11', 'osterkamp_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osterkamp_250_ndvi.ecw'),
(803, 15, 3, '2009-07-11', 'parafw_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'parafw_250_ndvi.ecw'),
(804, 14, 3, '2009-07-11', 'pfisterhreast_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pfisterhreast_250_ndvi.ecw'),
(805, 9, 3, '2009-07-11', 'quatrodm_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_250_ndvi.ecw'),
(806, 8, 3, '2009-07-11', 'ranchosdh_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_250_ndvi.ecw'),
(807, 7, 3, '2009-07-11', 'rbw_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_250_ndvi.ecw'),
(808, 5, 3, '2009-07-11', 'rucker1_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rucker1_125_ndvi.ecw'),
(809, 3, 3, '2009-07-11', 'scheu_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_250_ndvi.ecw'),
(810, 1, 3, '2009-07-11', 'threeflag2_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflag2_250_ndvi.ecw'),
(811, 2, 3, '2009-07-11', 'threeflags_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags_250_ndvi.ecw'),
(812, 40, 5, '2009-07-11', 'alkalinbnx_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'alkalinbnx_250_ndvihd.ecw'),
(813, 47, 5, '2009-07-11', 'claverie_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'claverie_250_ndvihd.ecw'),
(814, 41, 5, '2009-07-11', 'heritagegolf_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heritagegolf_125_ndvihd.ecw'),
(815, 48, 5, '2009-07-11', 'i34_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'i34_250_ndvihd.ecw'),
(816, 38, 5, '2009-07-11', 'indiansprings_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indiansprings_125_ndvihd.ecw'),
(817, 52, 5, '2009-07-11', 'j12_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'j12_250_ndvihd.ecw'),
(818, 50, 5, '2009-07-11', 'myrtle14_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'myrtle14_250_ndvihd.ecw'),
(819, 51, 5, '2009-07-11', 'nettle5_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'nettle5_250_ndvihd.ecw'),
(820, 53, 5, '2009-07-11', 'osage89_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osage89_250_ndvihd.ecw'),
(821, 18, 5, '2009-07-11', 'osterkamp_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osterkamp_250_ndvihd.ecw'),
(822, 15, 5, '2009-07-11', 'parafw_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'parafw_250_ndvihd.ecw'),
(823, 14, 5, '2009-07-11', 'pfisterhreast_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pfisterhreast_250_ndvihd.ecw'),
(824, 9, 5, '2009-07-11', 'quatrodm_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_250_ndvihd.ecw'),
(825, 8, 5, '2009-07-11', 'ranchosdh_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_250_ndvihd.ecw'),
(826, 7, 5, '2009-07-11', 'rbw_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_250_ndvihd.ecw'),
(827, 5, 5, '2009-07-11', 'rucker1_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rucker1_125_ndvihd.ecw'),
(828, 3, 5, '2009-07-11', 'scheu_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_250_ndvihd.ecw'),
(829, 1, 5, '2009-07-11', 'threeflag2_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflag2_250_ndvihd.ecw'),
(830, 2, 5, '2009-07-11', 'threeflags_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags_250_ndvihd.ecw'),
(831, 40, 1, '2009-07-11', 'alkalinbnx_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'alkalinbnx_250_rgb.ecw'),
(832, 47, 1, '2009-07-11', 'claverie_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'claverie_250_rgb.ecw'),
(833, 41, 1, '2009-07-11', 'heritagegolf_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heritagegolf_125_rgb.ecw'),
(834, 48, 1, '2009-07-11', 'i34_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'i34_250_rgb.ecw'),
(835, 38, 1, '2009-07-11', 'indiansprings_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indiansprings_125_rgb.ecw'),
(836, 52, 1, '2009-07-11', 'j12_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'j12_250_rgb.ecw'),
(837, 50, 1, '2009-07-11', 'myrtle14_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'myrtle14_250_rgb.ecw'),
(838, 51, 1, '2009-07-11', 'nettle5_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'nettle5_250_rgb.ecw'),
(839, 53, 1, '2009-07-11', 'osage89_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osage89_250_rgb.ecw'),
(840, 18, 1, '2009-07-11', 'osterkamp_250_RGB.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osterkamp_250_RGB.ecw'),
(841, 15, 1, '2009-07-11', 'parafw_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'parafw_250_rgb.ecw'),
(842, 14, 1, '2009-07-11', 'pfisterhreast_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pfisterhreast_250_rgb.ecw'),
(843, 9, 1, '2009-07-11', 'quatrodm_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_250_rgb.ecw'),
(844, 8, 1, '2009-07-11', 'ranchosdh_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_250_rgb.ecw'),
(845, 7, 1, '2009-07-11', 'rbw_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rbw_250_rgb.ecw'),
(846, 5, 1, '2009-07-11', 'rucker1_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'rucker1_125_rgb.ecw'),
(847, 3, 1, '2009-07-11', 'scheu_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_250_rgb.ecw'),
(848, 1, 1, '2009-07-11', 'threeflag2_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflag2_250_rgb.ecw'),
(849, 2, 1, '2009-07-11', 'threeflags_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'threeflags_250_rgb.ecw'),
(850, 49, 1, '2009-07-11', 'thefigtree_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'thefigtree_250_rgb.ecw'),
(851, 49, 2, '2009-07-11', 'thefigtree_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'thefigtree_250_cir.ecw'),
(852, 49, 3, '2009-07-11', 'thefigtree_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'thefigtree_250_ndvi.ecw'),
(853, 49, 5, '2009-07-11', 'thefigtree_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'thefigtree_250_ndvihd.ecw'),
(854, 54, 1, '2009-07-11', 'vail221_250_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'vail221_250_rgb.ecw'),
(855, 54, 2, '2009-07-11', 'vail221_250_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'vail221_250_cir.ecw'),
(856, 54, 3, '2009-07-11', 'vail221_250_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'vail221_250_ndvi.ecw'),
(857, 54, 5, '2009-07-11', 'vail221_250_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'vail221_250_ndvihd.ecw'),
(858, 55, 2, '2009-07-31', 'pecanorc_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pecanorc_125_cir.ecw'),
(859, 55, 3, '2009-07-31', 'pecanorc_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pecanorc_125_ndvi.ecw'),
(860, 55, 5, '2009-07-31', 'pecanorc_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pecanorc_125_ndvihd.ecw'),
(861, 55, 1, '2009-07-31', 'pecanorc_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'pecanorc_125_rgb.ecw'),
(862, 40, 1, '2009-01-01', 'alkalin-bn1-bn2_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'alkalin-bn1-bn2_250_rgb.jp2'),
(863, 40, 2, '2009-01-01', 'alkalin-bn1-bn2_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'alkalin-bn1-bn2_250_cir.jp2'),
(864, 46, 1, '2009-09-12', 'beachhighnw02_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachhighnw02_250_rgb.jp2'),
(865, 46, 2, '2009-09-12', 'beachhighnw02_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachhighnw02_250_cir.jp2'),
(866, 46, 3, '2009-09-12', 'beachhighnw02_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachhighnw02_250_ndvi.jp2'),
(867, 46, 5, '2009-09-12', 'beachhighnw02_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachhighnw02_250_ndvihd.jp2'),
(868, 45, 2, '2009-09-12', 'beachhighse02_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachhighse02_250_cir.jp2'),
(869, 57, 2, '2009-09-12', '20090912_casagrande_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20090912_casagrande_250_cir.jp2'),
(870, 56, 2, '2009-10-02', 'sharps103-104_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps103-104_250_cir.jp2'),
(871, 49, 2, '2009-09-12', 'thefigtree02_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'thefigtree02_250_cir.jp2'),
(872, 45, 3, '2009-09-12', 'beachhighse02_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachhighse02_250_ndvi.jp2'),
(873, 57, 3, '2009-09-12', '20090912_casagrande_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20090912_casagrande_250_ndvi.jp2'),
(874, 56, 3, '2009-10-02', 'sharps103-104_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps103-104_250_ndvi.jp2'),
(875, 49, 3, '2009-09-12', 'thefigtree02_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'thefigtree02_250_ndvi.jp2'),
(876, 45, 5, '2009-09-12', 'beachhighse02_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachhighse02_250_ndvihd.jp2'),
(877, 57, 5, '2009-09-12', '20090912_casagrande_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20090912_casagrande_250_ndvihd.jp2'),
(878, 56, 5, '2009-10-02', 'sharps103-104_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps103-104_250_ndvihd.jp2'),
(879, 49, 5, '2009-09-12', 'thefigtree02_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'thefigtree02_250_ndvihd.jp2'),
(880, 45, 1, '2009-09-12', 'beachhighse02_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'beachhighse02_250_rgb.jp2'),
(881, 57, 1, '2009-09-12', '20090912_casagrande_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20090912_casagrande_250_rgb.jp2'),
(882, 56, 1, '2009-10-02', 'sharps103-104_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps103-104_250_rgb.jp2'),
(884, 49, 1, '2009-09-12', 'thefigtree02_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'thefigtree02_250_rgb.jp2'),
(885, 56, 1, '2009-01-01', 'sharps_test_rgb_11ncropped.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps_test_rgb_11ncropped.jp2'),
(886, 20, 1, '2009-01-01', 'o-8_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o-8_250_rgb.jp2'),
(887, 20, 1, '2009-01-02', 'o-8_rgb_250b.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o-8_rgb_250b.jp2'),
(888, 22, 1, '2009-10-02', 'n4--01_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'n4--01_250_rgb.jp2'),
(889, 22, 2, '2009-10-02', 'n4--01_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'n4--01_250_cir.jp2'),
(890, 22, 3, '2009-10-02', 'n4--01_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'n4--01_250_ndvi.jp2'),
(891, 22, 5, '2009-10-02', 'n4--01_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'n4--01_250_ndvihd.jp2'),
(892, 58, 2, '2009-10-02', 'g3_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'g3_250_cir.jp2'),
(893, 58, 3, '2009-10-02', 'g3_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'g3_250_ndvi.jp2'),
(894, 58, 5, '2009-10-02', 'g3_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'g3_250_ndvihd.jp2'),
(895, 58, 1, '2009-10-02', 'g3_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'g3_250_rgb.jp2'),
(896, 57, 2, '2009-10-02', 'casagrande_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'casagrande_250_cir.jp2'),
(897, 57, 3, '2009-10-02', 'casagrande_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'casagrande_250_ndvi.jp2'),
(898, 57, 5, '2009-10-02', 'casagrande_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'casagrande_250_ndvihd.jp2'),
(899, 57, 1, '2009-10-02', 'casagrande_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'casagrande_250_rgb.jp2'),
(901, 20, 2, '2009-10-02', 'o-8_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o-8_250_cir.jp2'),
(902, 20, 3, '2009-10-02', 'o-8_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o-8_250_ndvi.jp2'),
(903, 20, 5, '2009-10-02', 'o-8_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o-8_250_ndvihd.jp2'),
(904, 20, 1, '2009-10-02', 'o-8_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'o-8_250_rgb.jp2'),
(905, 60, 2, '2009-10-02', 'osagecit_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osagecit_250_cir.jp2'),
(906, 60, 3, '2009-10-02', 'osagecit_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osagecit_250_ndvi.jp2'),
(907, 60, 5, '2009-10-02', 'osagecit_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osagecit_250_ndvihd.jp2'),
(908, 60, 1, '2009-10-02', 'osagecit_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'osagecit_250_rgb.jp2'),
(909, 9, 1, '2009-10-02', 'quatrodm_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_250_rgb.jp2'),
(910, 9, 5, '2009-10-02', 'quatrodm_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_250_ndvihd.jp2'),
(911, 9, 3, '2009-10-02', 'quatrodm_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_250_ndvi.jp2'),
(912, 9, 2, '2009-10-02', 'quatrodm_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'quatrodm_250_cir.jp2'),
(913, 8, 2, '2009-10-02', 'ranchosdh_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_250_cir.jp2'),
(914, 8, 3, '2009-10-02', 'ranchosdh_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_250_ndvi.jp2'),
(915, 8, 5, '2009-10-02', 'ranchosdh_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_250_ndvihd.jp2'),
(916, 8, 1, '2009-10-02', 'ranchosdh_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'ranchosdh_250_rgb.jp2'),
(917, 3, 2, '2009-10-02', 'scheu_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_250_cir.jp2'),
(918, 3, 3, '2009-10-02', 'scheu_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_250_ndvi.jp2'),
(919, 3, 5, '2009-10-02', 'scheu_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_250_ndvihd.jp2'),
(920, 3, 1, '2009-10-02', 'scheu_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'scheu_250_rgb.jp2'),
(921, 56, 2, '2009-10-02', 'sharps103-104_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps103-104_250_cir.jp2'),
(922, 56, 3, '2009-10-02', 'sharps103-104_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps103-104_250_ndvi.jp2'),
(923, 56, 5, '2009-10-02', 'sharps103-104_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps103-104_250_ndvihd.jp2'),
(924, 56, 1, '2009-10-02', 'sharps103-104_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'sharps103-104_250_rgb.jp2'),
(925, 61, 2, '2009-10-02', 'desertdel_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'desertdel_250_cir.jp2'),
(926, 61, 3, '2009-10-02', 'desertdel_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'desertdel_250_ndvi.jp2'),
(927, 61, 5, '2009-10-02', 'desertdel_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'desertdel_250_ndvihd.jp2'),
(928, 61, 1, '2009-10-02', 'desertdel_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'desertdel_250_rgb.jp2'),
(929, 62, 1, '2009-10-02', 'iid-marshrec_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'iid-marshrec_250_rgb.jp2'),
(930, 62, 2, '2009-10-02', 'iid-marshrec_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'iid-marshrec_250_cir.jp2'),
(931, 62, 3, '2009-10-02', 'iid-marshrec_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'iid-marshrec_250_ndvi.jp2'),
(932, 62, 5, '2009-10-02', 'iid-marshrec_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'iid-marshrec_250_ndvihd.jp2'),
(933, 63, 1, '2009-10-02', 'cvwd-recharge_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'cvwd-recharge_125_rgb.jp2'),
(934, 63, 2, '2009-10-02', 'cvwd-recharge_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'cvwd-recharge_125_cir.jp2'),
(935, 63, 3, '2009-10-02', 'cvwd-recharge_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'cvwd-recharge_125_ndvi.jp2'),
(936, 63, 5, '2009-10-02', 'cvwd-recharge_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'cvwd-recharge_125_ndvihd.jp2'),
(937, 64, 2, '2009-10-02', 'mardesgolf_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'mardesgolf_125_cir.jp2'),
(938, 65, 2, '2009-10-02', 'marshagolf_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'marshagolf_125_cir.jp2'),
(939, 64, 3, '2009-10-02', 'mardesgolf_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'mardesgolf_125_ndvi.jp2'),
(940, 65, 3, '2009-10-02', 'marshagolf_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'marshagolf_125_ndvi.jp2'),
(941, 64, 5, '2009-10-02', 'mardesgolf_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'mardesgolf_125_ndvihd.jp2'),
(942, 65, 5, '2009-10-02', 'marshagolf_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'marshagolf_125_ndvihd.jp2'),
(943, 64, 1, '2009-10-02', 'mardesgolf_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'mardesgolf_125_rgb.jp2'),
(944, 65, 1, '2009-10-02', 'marshagolf_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'marshagolf_125_rgb.jp2'),
(945, 38, 2, '2009-09-12', 'indianheritage_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indianheritage_125_cir.jp2'),
(946, 38, 3, '2009-09-12', 'indianheritage_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indianheritage_125_ndvi.jp2'),
(947, 38, 5, '2009-09-12', 'indianheritage_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indianheritage_125_ndvihd.jp2'),
(948, 38, 1, '2009-09-12', 'indianheritage_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indianheritage_125_rgb.jp2'),
(949, 66, 2, '2009-09-12', 'laquinta_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquinta_125_cir.jp2'),
(950, 66, 3, '2009-09-12', 'laquinta_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquinta_125_ndvi.jp2'),
(951, 66, 5, '2009-09-12', 'laquinta_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquinta_125_ndvihd.jp2'),
(952, 66, 1, '2009-09-12', 'laquinta_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquinta_125_rgb.jp2'),
(953, 67, 2, '2009-10-02', 'laquintadunes_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintadunes_125_cir.jp2'),
(954, 67, 3, '2009-10-02', 'laquintadunes_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintadunes_125_ndvi.jp2'),
(955, 67, 5, '2009-10-02', 'laquintadunes_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintadunes_125_ndvihd.jp2'),
(956, 67, 1, '2009-10-02', 'laquintadunes_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintadunes_125_rgb.jp2'),
(957, 68, 2, '2009-10-02', 'laquintamountain_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintamountain_125_cir.jp2'),
(958, 68, 3, '2009-10-02', 'laquintamountain_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintamountain_125_ndvi.jp2'),
(959, 68, 5, '2009-10-02', 'laquintamountain_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintamountain_125_ndvihd.jp2'),
(960, 68, 1, '2009-10-02', 'laquintamountain_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintamountain_125_rgb.jp2');
INSERT INTO `image` (`id`, `property_id`, `imagetypes_id`, `capture_date`, `webserver_layer`, `croptype_id`, `flight_time`, `resolution`, `aircraft_id`, `camera_id`, `image_processing_version`, `published_date`, `server_id`, `description`, `locked`, `name`) VALUES
(961, 66, 2, '2009-10-02', 'laquintacountryclub_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintacountryclub_125_cir.jp2'),
(962, 66, 3, '2009-10-02', 'laquintacountryclub_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintacountryclub_125_ndvi.jp2'),
(963, 66, 5, '2009-10-02', 'laquintacountryclub_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintacountryclub_125_ndvihd.jp2'),
(964, 66, 1, '2009-10-02', 'laquintacountryclub_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintacountryclub_125_rgb.jp2'),
(965, 41, 2, '2009-10-02', 'heritpalms_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heritpalms_125_cir.jp2'),
(966, 38, 2, '2009-10-02', 'indsprings_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings_125_cir.jp2'),
(967, 69, 2, '2009-10-02', 'marrangolf_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'marrangolf_125_cir.jp2'),
(968, 41, 3, '2009-10-02', 'heritpalms_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heritpalms_125_ndvi.jp2'),
(969, 38, 3, '2009-10-02', 'indsprings_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings_125_ndvi.jp2'),
(970, 69, 3, '2009-10-02', 'marrangolf_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'marrangolf_125_ndvi.jp2'),
(971, 69, 5, '2009-10-02', 'marrangolf_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'marrangolf_125_ndvihd.jp2'),
(972, 38, 5, '2009-10-02', 'indsprings_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings_125_ndvihd.jp2'),
(973, 41, 5, '2009-10-02', 'heritpalms_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heritpalms_125_ndvihd.jp2'),
(974, 41, 1, '2009-10-02', 'heritpalms_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'heritpalms_125_rgb.jp2'),
(975, 38, 1, '2009-10-02', 'indsprings_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings_125_rgb.jp2'),
(976, 69, 1, '2009-10-02', 'marrangolf_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'marrangolf_125_rgb.jp2'),
(977, 70, 2, '2009-10-02', 'dospalmmit_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'dospalmmit_250_cir.jp2'),
(978, 70, 3, '2009-10-02', 'dospalmmit_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'dospalmmit_250_ndvi.jp2'),
(979, 70, 5, '2009-10-02', 'dospalmmit_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'dospalmmit_250_ndvihd.jp2'),
(980, 70, 1, '2009-10-02', 'dospalmmit_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'dospalmmit_250_rgb.jp2'),
(981, 61, 2, '2009-10-17', '20091017_desertdel_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_desertdel_250_cir.jp2'),
(982, 61, 3, '2009-10-17', '20091017_desertdel_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_desertdel_250_ndvi.jp2'),
(983, 61, 5, '2009-10-17', '20091017_desertdel_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_desertdel_250_ndvihd.jp2'),
(984, 61, 1, '2009-10-17', '20091017_desertdel_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_desertdel_250_rgb.jp2'),
(985, 71, 2, '2009-10-17', '20091017_bensent467a_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_bensent467a_250_cir.jp2'),
(986, 71, 3, '2009-10-17', '20091017_bensent467a_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_bensent467a_250_ndvi.jp2'),
(987, 71, 5, '2009-10-17', '20091017_bensent467a_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_bensent467a_250_ndvihd.jp2'),
(988, 71, 1, '2009-10-17', '20091017_bensent467a_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_bensent467a_250_rgb.jp2'),
(989, 56, 2, '2009-10-17', '20091017_sharps103-104_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_sharps103-104_250_cir.jp2'),
(990, 56, 3, '2009-10-17', '20091017_sharps103-104_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_sharps103-104_250_ndvi.jp2'),
(991, 56, 5, '2009-10-17', '20091017_sharps103-104_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_sharps103-104_250_ndvihd.jp2'),
(992, 56, 1, '2009-10-17', '20091017_sharps103-104_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_sharps103-104_250_rgb.jp2'),
(993, 22, 2, '2009-10-17', '20091017_n4_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_n4_250_cir.jp2'),
(994, 22, 3, '2009-10-17', '20091017_n4_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_n4_250_ndvi.jp2'),
(995, 22, 5, '2009-10-17', '20091017_n4_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_n4_250_ndvihd.jp2'),
(996, 22, 1, '2009-10-17', '20091017_n4_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_n4_250_rgb.jp2'),
(997, 58, 2, '2009-10-17', '20091017_g3_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_g3_250_cir.jp2'),
(998, 58, 3, '2009-10-17', '20091017_g3_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_g3_250_ndvi.jp2'),
(999, 58, 5, '2009-10-17', '20091017_g3_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_g3_250_ndvihd.jp2'),
(1000, 58, 1, '2009-10-17', '20091017_g3_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_g3_250_rgb.jp2'),
(1001, 62, 2, '2009-10-17', '20091017_iidmarchrec_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_iidmarchrec_250_cir.jp2'),
(1002, 62, 3, '2009-10-17', '20091017_iidmarchrec_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_iidmarchrec_250_ndvi.jp2'),
(1003, 62, 5, '2009-10-17', '20091017_iidmarchrec_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_iidmarchrec_250_ndvihd.jp2'),
(1004, 62, 1, '2009-10-17', '20091017_iidmarchrec_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_iidmarchrec_250_rgb.jp2'),
(1005, 8, 2, '2009-10-17', '20091017_ranchosdh_250_cir_crop.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '  ', NULL, '20091017_ranchosdh_250_cir_crop.jp2'),
(1007, 8, 3, '2009-10-17', '20091017_ranchosdh_250_ndvi_crop.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_ranchosdh_250_ndvi_crop.jp2'),
(1008, 8, 5, '2009-10-17', '20091017_ranchosdh_250_ndvihd_crop.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_ranchosdh_250_ndvihd_crop.jp2'),
(1009, 8, 1, '2009-10-17', '20091017_ranchosdh_250_rgb_crop.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_ranchosdh_250_rgb_crop.jp2'),
(1010, 20, 2, '2009-10-17', '20091017_o8_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_o8_250_cir.jp2'),
(1011, 20, 3, '2009-10-17', '20091017_o8_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_o8_250_ndvi.jp2'),
(1012, 20, 5, '2009-10-17', '20091017_o8_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_o8_250_ndvihd.jp2'),
(1013, 20, 1, '2009-10-17', '20091017_o8_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_o8_250_rgb.jp2'),
(1014, 3, 2, '2009-10-17', '20091017_scheu_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_scheu_250_cir.jp2'),
(1015, 3, 3, '2009-10-17', '20091017_scheu_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_scheu_250_ndvi.jp2'),
(1016, 3, 5, '2009-10-17', '20091017_scheu_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_scheu_250_ndvihd.jp2'),
(1017, 3, 1, '2009-10-17', '20091017_scheu_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_scheu_250_rgb.jp2'),
(1018, 9, 2, '2009-10-17', '20091017_quatrodm_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_quatrodm_250_cir.jp2'),
(1019, 9, 3, '2009-10-17', '20091017_quatrodm_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_quatrodm_250_ndvi.jp2'),
(1020, 9, 5, '2009-10-17', '20091017_quatrodm_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_quatrodm_250_ndvihd.jp2'),
(1021, 9, 1, '2009-10-17', '20091017_quatrodm_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_quatrodm_250_rgb.jp2'),
(1022, 72, 2, '2009-10-17', '20091017_Ohmar9_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_Ohmar9_250_cir.jp2'),
(1023, 72, 3, '2009-10-17', '20091017_Ohmar9_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_Ohmar9_250_ndvi.jp2'),
(1024, 72, 5, '2009-10-17', '20091017_Ohmar9_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_Ohmar9_250_ndvihd.jp2'),
(1025, 72, 1, '2009-10-17', '20091017_Ohmar9_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_Ohmar9_250_rgb.jp2'),
(1026, 38, 2, '2009-10-17', 'indsprings1017_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings1017_125_cir.jp2'),
(1027, 38, 3, '2009-10-17', 'indsprings1017_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings1017_125_ndvi.jp2'),
(1028, 38, 5, '2009-10-17', 'indsprings1017_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings1017_125_ndvihd.jp2'),
(1029, 38, 1, '2009-10-17', 'indsprings1017_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'indsprings1017_125_rgb.jp2'),
(1031, 57, 2, '2009-10-17', '20091017_casagrande_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_casagrande_250_cir.jp2'),
(1032, 57, 3, '2009-10-17', '20091017_casagrande_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_casagrande_250_ndvi.jp2'),
(1033, 57, 5, '2009-10-17', '20091017_casagrande_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_casagrande_250_ndvihd.jp2'),
(1034, 57, 1, '2009-10-17', '20091017_casagrande_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_casagrande_250_rgb.jp2'),
(1035, 41, 2, '2009-10-17', '20091017_heritagepalms_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_heritagepalms_125_cir.jp2'),
(1036, 41, 3, '2009-10-17', '20091017_heritagepalms_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_heritagepalms_125_ndvi.jp2'),
(1037, 41, 5, '2009-10-17', '20091017_heritagepalms_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_heritagepalms_125_ndvihd.jp2'),
(1038, 41, 1, '2009-10-17', '20091017_heritagepalms_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_heritagepalms_125_rgb.jp2'),
(1039, 63, 2, '2009-10-17', '20091017_cvwdrechargeck_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_cvwdrechargeck_125_cir.jp2'),
(1040, 63, 3, '2009-10-17', '20091017_cvwdrechargeck_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_cvwdrechargeck_125_ndvi.jp2'),
(1041, 63, 5, '2009-10-17', '20091017_cvwdrechargeck_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_cvwdrechargeck_125_ndvihd.jp2'),
(1042, 63, 1, '2009-10-17', '20091017_cvwdrechargeck_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_cvwdrechargeck_125_rgb.jp2'),
(1043, 64, 2, '2009-10-17', '20091017_mardesgolf_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_mardesgolf_125_cir.jp2'),
(1044, 64, 3, '2009-10-17', '20091017_mardesgolf_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_mardesgolf_125_ndvi.jp2'),
(1045, 64, 5, '2009-10-17', '20091017_mardesgolf_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_mardesgolf_125_ndvihd.jp2'),
(1046, 64, 1, '2009-10-17', '20091017_mardesgolf_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_mardesgolf_125_rgb.jp2'),
(1047, 69, 2, '2009-10-17', '20091017_marrangolf_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_marrangolf_125_cir.jp2'),
(1048, 69, 3, '2009-10-17', '20091017_marrangolf_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_marrangolf_125_ndvi.jp2'),
(1049, 69, 5, '2009-10-17', '20091017_marrangolf_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_marrangolf_125_ndvihd.jp2'),
(1050, 69, 1, '2009-10-17', '20091017_marrangolf_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_marrangolf_125_rgb.jp2'),
(1051, 67, 2, '2009-10-17', '20091017_laquintadunes_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_laquintadunes_125_cir.jp2'),
(1052, 67, 3, '2009-10-17', '20091017_laquintadunes_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_laquintadunes_125_ndvi.jp2'),
(1053, 66, 5, '2009-10-17', '20091017_laquintadunes_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_laquintadunes_125_ndvihd.jp2'),
(1054, 67, 1, '2009-10-17', '20091017_laquintadunes_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_laquintadunes_125_rgb.jp2'),
(1055, 66, 2, '2009-10-17', '20091017_laquintacc_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_laquintacc_125_cir.jp2'),
(1056, 66, 3, '2009-10-17', '20091017_laquintacc_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_laquintacc_125_ndvi.jp2'),
(1057, 66, 5, '2009-10-17', '20091017_laquintacc_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_laquintacc_125_ndvihd.jp2'),
(1058, 66, 1, '2009-10-17', '20091017_laquintacc_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_laquintacc_125_rgb.jp2'),
(1059, 8, 1, '2009-01-02', 'test1_out.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'test1_out.jp2'),
(1060, 56, 1, '2009-02-01', '20091031_sharps_rgb_test.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_sharps_rgb_test.jp2'),
(1061, 57, 2, '2009-10-31', '20091031_arp35-5,35-6_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_arp35-5,35-6_250_cir.jp2'),
(1062, 57, 3, '2009-10-31', '20091031_arp35-5,35-6_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_arp35-5,35-6_250_ndvi.jp2'),
(1063, 57, 5, '2009-10-31', '20091031_arp35-5,35-6_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_arp35-5,35-6_250_ndvihd.jp2'),
(1064, 57, 1, '2009-10-31', '20091031_arp35-5,35-6_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_arp35-5,35-6_250_rgb.jp2'),
(1065, 71, 2, '2009-10-31', '20091031_Bensen467A-2ndTry_Guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_Bensen467A-2ndTry_Guest_250_cir.jp2'),
(1066, 71, 3, '2009-10-31', '20091031_Bensen467A-2ndTry_Guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_Bensen467A-2ndTry_Guest_250_ndvi.jp2'),
(1067, 71, 5, '2009-10-31', '20091031_Bensen467A-2ndTry_Guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_Bensen467A-2ndTry_Guest_250_ndvihd.jp2'),
(1068, 71, 1, '2009-10-31', '20091031_Bensen467A-2ndTry_Guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_Bensen467A-2ndTry_Guest_250_rgb.jp2'),
(1069, 73, 2, '2009-10-31', '20091031_DosPalmMit-demo_CVWD_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_DosPalmMit-demo_CVWD_125_cir.jp2'),
(1070, 73, 3, '2009-10-31', '20091031_DosPalmMit-demo_CVWD_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_DosPalmMit-demo_CVWD_125_ndvi.jp2'),
(1071, 73, 5, '2009-10-31', '20091031_DosPalmMit-demo_CVWD_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_DosPalmMit-demo_CVWD_125_ndvihd.jp2'),
(1072, 73, 1, '2009-10-31', '20091031_DosPalmMit-demo_CVWD_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_DosPalmMit-demo_CVWD_125_rgb.jp2'),
(1073, 62, 2, '2009-10-31', '20091031_MarshLandRec_IID_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_MarshLandRec_IID_250_cir.jp2'),
(1074, 62, 3, '2009-10-31', '20091031_MarshLandRec_IID_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_MarshLandRec_IID_250_ndvi.jp2'),
(1075, 62, 5, '2009-10-31', '20091031_MarshLandRec_IID_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_MarshLandRec_IID_250_ndvihd.jp2'),
(1076, 62, 1, '2009-10-31', '20091031_MarshLandRec_IID_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_MarshLandRec_IID_250_rgb.jp2'),
(1077, 60, 2, '2009-10-31', '20091031_OsageCit_Guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_OsageCit_Guest_250_cir.jp2'),
(1078, 60, 3, '2009-10-31', '20091031_OsageCit_Guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_OsageCit_Guest_250_ndvi.jp2'),
(1079, 60, 5, '2009-10-31', '20091031_OsageCit_Guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_OsageCit_Guest_250_ndvihd.jp2'),
(1080, 60, 1, '2009-10-31', '20091031_OsageCit_Guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_OsageCit_Guest_250_rgb.jp2'),
(1081, 56, 2, '2009-10-31', '20091031_Sharps103-104_Guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_Sharps103-104_Guest_250_cir.jp2'),
(1082, 56, 3, '2009-10-31', '20091031_Sharps103-104_Guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_Sharps103-104_Guest_250_ndvi.jp2'),
(1083, 56, 5, '2009-10-31', '20091031_Sharps103-104_Guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_Sharps103-104_Guest_250_ndvihd.jp2'),
(1084, 56, 1, '2009-10-31', '20091031_Sharps103-104_Guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_Sharps103-104_Guest_250_rgb.jp2'),
(1086, 60, 2, '2009-10-17', '20091017_osagecit_guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_osagecit_guest_250_cir.jp2'),
(1087, 60, 3, '2009-10-17', '20091017_osagecit_guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_osagecit_guest_250_ndvi.jp2'),
(1088, 60, 5, '2009-10-17', '20091017_osagecit_guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_osagecit_guest_250_ndvihd.jp2'),
(1089, 60, 1, '2009-10-17', '20091017_osagecit_guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_osagecit_guest_250_rgb.jp2'),
(1090, 74, 2, '2009-10-31', '20091031_dospalmamit_cvwd_63_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_dospalmamit_cvwd_63_cir.jp2'),
(1091, 74, 3, '2009-10-31', '20091031_dospalmamit_cvwd_63_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_dospalmamit_cvwd_63_ndvi.jp2'),
(1092, 74, 5, '2009-10-31', '20091031_dospalmamit_cvwd_63_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_dospalmamit_cvwd_63_ndvihd.jp2'),
(1093, 74, 1, '2009-10-31', '20091031_dospalmamit_cvwd_63_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_dospalmamit_cvwd_63_rgb.jp2'),
(1094, 75, 2, '2009-11-01', 'branden2_demo_125_cir.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_demo_125_cir.ecw'),
(1095, 75, 3, '2009-11-01', 'branden2_demo_125_ndvi.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_demo_125_ndvi.ecw'),
(1096, 75, 5, '2009-11-01', 'branden2_demo_125_ndvihd.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_demo_125_ndvihd.ecw'),
(1097, 75, 1, '2009-11-01', 'branden2_demo_125_rgb.ecw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'branden2_demo_125_rgb.ecw'),
(1098, 41, 2, '2009-10-31', '20091031_heritagepalms_heritagepalms_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_heritagepalms_heritagepalms_125_cir.jp2'),
(1099, 41, 3, '2009-10-31', '20091031_heritagepalms_heritagepalms_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_heritagepalms_heritagepalms_125_ndvi.jp2'),
(1100, 41, 5, '2009-10-31', '20091031_heritagepalms_heritagepalms_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_heritagepalms_heritagepalms_125_ndvihd.jp2'),
(1101, 41, 1, '2009-10-31', '20091031_heritagepalms_heritagepalms_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_heritagepalms_heritagepalms_125_rgb.jp2'),
(1102, 38, 2, '2009-10-31', '20091031_indiansprings_indiansprings_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_indiansprings_indiansprings_125_cir.jp2'),
(1103, 38, 3, '2009-10-31', '20091031_indiansprings_indiansprings_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_indiansprings_indiansprings_125_ndvi.jp2'),
(1104, 38, 5, '2009-10-31', '20091031_indiansprings_indiansprings_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_indiansprings_indiansprings_125_ndvihd.jp2'),
(1105, 38, 1, '2009-10-31', '20091031_indiansprings_indiansprings_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_indiansprings_indiansprings_125_rgb.jp2'),
(1106, 64, 2, '2009-10-31', '20091031_marriotdesert_marriot_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotdesert_marriot_125_cir.jp2'),
(1107, 64, 3, '2009-10-31', '20091031_marriotdesert_marriot_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotdesert_marriot_125_ndvi.jp2'),
(1108, 64, 5, '2009-10-31', '20091031_marriotdesert_marriot_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotdesert_marriot_125_ndvihd.jp2'),
(1109, 64, 1, '2009-10-31', '20091031_marriotdesert_marriot_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotdesert_marriot_125_rgb.jp2'),
(1110, 69, 2, '2009-10-31', '20091031_marriotrancho_marriot_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotrancho_marriot_125_cir.jp2'),
(1111, 65, 2, '2009-10-31', '20091031_marriotshadow_marriot_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotshadow_marriot_125_cir.jp2'),
(1112, 69, 3, '2009-10-31', '20091031_marriotrancho_marriot_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotrancho_marriot_125_ndvi.jp2'),
(1113, 65, 3, '2009-10-31', '20091031_marriotshadow_marriot_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotshadow_marriot_125_ndvi.jp2'),
(1114, 69, 5, '2009-10-31', '20091031_marriotrancho_marriot_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotrancho_marriot_125_ndvihd.jp2'),
(1115, 65, 5, '2009-10-31', '20091031_marriotshadow_marriot_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotshadow_marriot_125_ndvihd.jp2'),
(1116, 69, 1, '2009-10-31', '20091031_marriotrancho_marriot_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotrancho_marriot_125_rgb.jp2'),
(1117, 65, 1, '2009-10-31', '20091031_marriotshadow_marriot_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091031_marriotshadow_marriot_125_rgb.jp2'),
(1118, 68, 2, '2009-10-17', 'laquintamountain_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintamountain_125_cir.jp2'),
(1119, 68, 3, '2009-10-17', 'laquintamountain_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintamountain_125_ndvi.jp2'),
(1120, 68, 5, '2009-10-17', 'laquintamountain_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintamountain_125_ndvihd.jp2'),
(1121, 68, 1, '2009-10-17', 'laquintamountain_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, 'laquintamountain_125_rgb.jp2'),
(1122, 65, 2, '2009-10-17', '20091017_marriotshadow_marriot_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_marriotshadow_marriot_125_cir.jp2'),
(1123, 65, 3, '2009-10-17', '20091017_marriotshadow_marriot_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_marriotshadow_marriot_125_ndvi.jp2'),
(1124, 65, 5, '2009-10-17', '20091017_marriotshadow_marriot_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_marriotshadow_marriot_125_ndvihd.jp2'),
(1125, 65, 1, '2009-10-17', '20091017_marriotshadow_marriot_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091017_marriotshadow_marriot_125_rgb.jp2'),
(1126, 41, 2, '2009-09-12', '2009912_heritagepalms_heritagepalms_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '2009912_heritagepalms_heritagepalms_125_cir.jp2'),
(1127, 41, 3, '2009-09-12', '2009912_heritagepalms_heritagepalms_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '2009912_heritagepalms_heritagepalms_125_ndvi.jp2'),
(1128, 41, 5, '2009-09-12', '2009912_heritagepalms_heritagepalms_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '2009912_heritagepalms_heritagepalms_125_ndvihd.jp2'),
(1129, 41, 1, '2009-09-12', '2009912_heritagepalms_heritagepalms_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '2009912_heritagepalms_heritagepalms_125_rgb.jp2'),
(1130, 76, 2, '2009-11-21', '20091121_alkalinr1_akalin_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_alkalinr1_akalin_125_cir.jp2'),
(1131, 76, 3, '2009-11-21', '20091121_alkalinr1_akalin_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_alkalinr1_akalin_125_ndvi.jp2'),
(1132, 76, 5, '2009-11-21', '20091121_alkalinr1_akalin_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_alkalinr1_akalin_125_ndvihd.jp2'),
(1133, 76, 1, '2009-11-21', '20091121_alkalinr1_akalin_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_alkalinr1_akalin_125_rgb.jp2'),
(1134, 77, 2, '2009-11-21', '20091121_bensentam222_aronq_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_bensentam222_aronq_125_cir.jp2'),
(1135, 77, 3, '2009-11-21', '20091121_bensentam222_aronq_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_bensentam222_aronq_125_ndvi.jp2'),
(1136, 77, 5, '2009-11-21', '20091121_bensentam222_aronq_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_bensentam222_aronq_125_ndvihd.jp2'),
(1137, 77, 1, '2009-11-21', '20091121_bensentam222_aronq_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_bensentam222_aronq_125_rgb.jp2'),
(1138, 62, 2, '2009-11-21', '20091121_marshlandrec_iid_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_marshlandrec_iid_250_cir.jp2'),
(1139, 62, 3, '2009-11-21', '20091121_marshlandrec_iid_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_marshlandrec_iid_250_ndvi.jp2'),
(1140, 62, 5, '2009-11-21', '20091121_marshlandrec_iid_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_marshlandrec_iid_250_ndvihd.jp2'),
(1141, 62, 1, '2009-11-21', '20091121_marshlandrec_iid_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_marshlandrec_iid_250_rgb.jp2'),
(1142, 5, 2, '2009-11-21', '20091121_rucker1_guest_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_rucker1_guest_125_cir.jp2'),
(1143, 5, 3, '2009-11-21', '20091121_rucker1_guest_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_rucker1_guest_125_ndvi.jp2'),
(1144, 5, 5, '2009-11-21', '20091121_rucker1_guest_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_rucker1_guest_125_ndvihd.jp2'),
(1145, 5, 1, '2009-11-21', '20091121_rucker1_guest_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_rucker1_guest_125_rgb.jp2'),
(1146, 37, 1, '2009-11-21', '20091121_brandenberg2_guest_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_brandenberg2_guest_125_rgb.jp2'),
(1147, 37, 5, '2009-11-21', '20091121_brandenberg2_guest_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_brandenberg2_guest_125_ndvihd.jp2'),
(1148, 37, 3, '2009-11-21', '20091121_brandenberg2_guest_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_brandenberg2_guest_125_ndvi.jp2'),
(1149, 37, 2, '2009-11-21', '20091121_brandenberg2_guest_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_brandenberg2_guest_125_cir.jp2'),
(1150, 70, 2, '2009-11-21', '20091121_dospalmmit-10in-demo_cvwd_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_dospalmmit-10in-demo_cvwd_250_cir.jp2'),
(1151, 70, 1, '2009-11-21', '20091121_dospalmmit-10in-demo_cvwd_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_dospalmmit-10in-demo_cvwd_250_rgb.jp2'),
(1152, 70, 5, '2009-11-21', '20091121_dospalmmit-10in-demo_cvwd_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_dospalmmit-10in-demo_cvwd_250_ndvihd.jp2'),
(1153, 70, 2, '2009-11-21', '20091121_dospalmmit-10in-demo_cvwd_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_dospalmmit-10in-demo_cvwd_250_cir.jp2'),
(1154, 78, 5, '2009-11-21', '20091121_audubonsitetri_akalin_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_audubonsitetri_akalin_125_ndvihd.jp2'),
(1155, 78, 3, '2009-11-21', '20091121_audubonsitetri_akalin_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_audubonsitetri_akalin_125_ndvi.jp2'),
(1156, 78, 1, '2009-11-21', '20091121_audubonsitetri_akalin_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_audubonsitetri_akalin_125_rgb.jp2'),
(1157, 78, 2, '2009-11-21', '20091121_audubonsitetri_akalin_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_audubonsitetri_akalin_125_cir.jp2'),
(1158, 79, 2, '2009-11-21', '20091121_osterkampred94_guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_osterkampred94_guest_250_cir.jp2'),
(1159, 79, 3, '2009-11-21', '20091121_osterkampred94_guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_osterkampred94_guest_250_ndvi.jp2'),
(1160, 79, 5, '2009-11-21', '20091121_osterkampred94_guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_osterkampred94_guest_250_ndvihd.jp2'),
(1161, 79, 1, '2009-11-21', '20091121_osterkampred94_guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091121_osterkampred94_guest_250_rgb.jp2'),
(1162, 76, 6, '2009-12-04', '20091204_kalinr1_akalin_250_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_kalinr1_akalin_250_change.jp2'),
(1163, 76, 2, '2009-12-04', '20091204_kalinr1_akalin_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_kalinr1_akalin_250_cir.jp2'),
(1164, 76, 7, '2009-12-04', '20091204_kalinr1_akalin_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_kalinr1_akalin_250_color.jp2'),
(1165, 76, 3, '2009-12-04', '20091204_kalinr1_akalin_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_kalinr1_akalin_250_ndvi.jp2'),
(1166, 76, 5, '2009-12-04', '20091204_kalinr1_akalin_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_kalinr1_akalin_250_ndvihd.jp2'),
(1167, 76, 1, '2009-12-04', '20091204_kalinr1_akalin_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_kalinr1_akalin_250_rgb.jp2'),
(1168, 80, 2, '2009-12-04', '20091204_roselle7_guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_roselle7_guest_250_cir.jp2'),
(1169, 80, 7, '2009-12-04', '20091204_roselle7_guest_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_roselle7_guest_250_color.jp2'),
(1170, 80, 3, '2009-12-04', '20091204_roselle7_guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_roselle7_guest_250_ndvi.jp2'),
(1171, 80, 5, '2009-12-04', '20091204_roselle7_guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_roselle7_guest_250_ndvihd.jp2'),
(1172, 80, 1, '2009-12-04', '20091204_roselle7_guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_roselle7_guest_250_rgb.jp2'),
(1187, 77, 6, '2009-12-04', '20091204_benTam222-02_aronq_250_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_benTam222-02_aronq_250_change.jp2'),
(1188, 77, 2, '2009-12-04', '20091204_benTam222-02_aronq_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_benTam222-02_aronq_250_cir.jp2'),
(1189, 77, 7, '2009-12-04', '20091204_benTam222-02_aronq_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_benTam222-02_aronq_250_color.jp2'),
(1190, 77, 8, '2009-12-04', '20091204_benTam222-02_aronq_250_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_benTam222-02_aronq_250_fpar.jp2'),
(1191, 77, 3, '2009-12-04', '20091204_benTam222-02_aronq_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_benTam222-02_aronq_250_ndvi.jp2'),
(1192, 77, 5, '2009-12-04', '20091204_benTam222-02_aronq_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_benTam222-02_aronq_250_ndvihd.jp2'),
(1193, 77, 1, '2009-12-04', '20091204_benTam222-02_aronq_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_benTam222-02_aronq_250_rgb.jp2'),
(1194, 71, 5, '2009-12-04', '20091204_bentri475-476-02_guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_bentri475-476-02_guest_250_ndvihd.jp2'),
(1195, 71, 3, '2009-12-04', '20091204_bentri475-476-02_guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_bentri475-476-02_guest_250_ndvi.jp2'),
(1196, 71, 7, '2009-12-04', '20091204_bentri475-476-02_guest_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_bentri475-476-02_guest_250_color.jp2'),
(1197, 71, 8, '2009-12-04', '20091204_bentri475-476-02_guest_250_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_bentri475-476-02_guest_250_fpar.jp2'),
(1198, 71, 6, '2009-12-04', '20091204_bentri475-476-02_guest_250_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_bentri475-476-02_guest_250_change.jp2'),
(1199, 71, 2, '2009-12-04', '20091204_bentri475-476-02_guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_bentri475-476-02_guest_250_cir.jp2'),
(1200, 71, 1, '2009-12-04', '20091204_bentri475-476-02_guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_bentri475-476-02_guest_250_rgb.jp2'),
(1201, 38, 2, '2009-12-04', '20091204_ind-her-golf_indiansprings_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_ind-her-golf_indiansprings_125_cir.jp2'),
(1202, 38, 3, '2009-12-04', '20091204_ind-her-golf_indiansprings_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_ind-her-golf_indiansprings_125_ndvi.jp2'),
(1203, 38, 5, '2009-12-04', '20091204_ind-her-golf_indiansprings_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_ind-her-golf_indiansprings_125_ndvihd.jp2'),
(1204, 38, 1, '2009-12-04', '20091204_ind-her-golf_indiansprings_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_ind-her-golf_indiansprings_125_rgb.jp2'),
(1205, 64, 2, '2009-12-04', '20091204_marriotdesert_marriot_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotdesert_marriot_125_cir.jp2'),
(1206, 64, 3, '2009-12-04', '20091204_marriotdesert_marriot_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotdesert_marriot_125_ndvi.jp2'),
(1207, 64, 5, '2009-12-04', '20091204_marriotdesert_marriot_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotdesert_marriot_125_ndvihd.jp2'),
(1208, 64, 1, '2009-12-04', '20091204_marriotdesert_marriot_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotdesert_marriot_125_rgb.jp2'),
(1209, 69, 2, '2009-12-04', '20091204_marriotrancho_marriot_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotrancho_marriot_125_cir.jp2'),
(1210, 69, 3, '2009-12-04', '20091204_marriotrancho_marriot_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotrancho_marriot_125_ndvi.jp2'),
(1211, 69, 5, '2009-12-04', '20091204_marriotrancho_marriot_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotrancho_marriot_125_ndvihd.jp2'),
(1212, 69, 1, '2009-12-04', '20091204_marriotrancho_marriot_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotrancho_marriot_125_rgb.jp2'),
(1213, 65, 2, '2009-12-04', '20091204_marriotshadow_marriot_125_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotshadow_marriot_125_cir.jp2'),
(1214, 64, 3, '2009-12-04', '20091204_marriotshadow_marriot_125_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotshadow_marriot_125_ndvi.jp2'),
(1215, 65, 5, '2009-12-04', '20091204_marriotshadow_marriot_125_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotshadow_marriot_125_ndvihd.jp2'),
(1216, 65, 1, '2009-12-04', '20091204_marriotshadow_marriot_125_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_marriotshadow_marriot_125_rgb.jp2'),
(1217, 56, 2, '2009-12-04', '20091204_sharps103-104_guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_sharps103-104_guest_250_cir.jp2'),
(1218, 56, 3, '2009-12-04', '20091204_sharps103-104_guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_sharps103-104_guest_250_ndvi.jp2'),
(1219, 56, 5, '2009-12-04', '20091204_sharps103-104_guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_sharps103-104_guest_250_ndvihd.jp2'),
(1220, 56, 1, '2009-12-04', '20091204_sharps103-104_guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091204_sharps103-104_guest_250_rgb.jp2'),
(1221, 76, 6, '2009-12-18', '20091218_kalinr1_akalin_250_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_kalinr1_akalin_250_change.jp2'),
(1222, 76, 2, '2009-12-18', '20091218_kalinr1_akalin_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_kalinr1_akalin_250_cir.jp2'),
(1223, 76, 7, '2009-12-18', '20091218_kalinr1_akalin_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_kalinr1_akalin_250_color.jp2'),
(1224, 76, 8, '2009-12-18', '20091218_kalinr1_akalin_250_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_kalinr1_akalin_250_fpar.jp2'),
(1225, 76, 3, '2009-12-18', '20091218_kalinr1_akalin_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_kalinr1_akalin_250_ndvi.jp2'),
(1226, 76, 5, '2009-12-18', '20091218_kalinr1_akalin_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_kalinr1_akalin_250_ndvihd.jp2'),
(1227, 76, 1, '2009-12-18', '20091218_kalinr1_akalin_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_kalinr1_akalin_250_rgb.jp2'),
(1228, 81, 2, '2009-12-18', '20091218_redwood90e_osterkamp_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_redwood90e_osterkamp_250_cir.jp2'),
(1229, 81, 7, '2009-12-18', '20091218_redwood90e_osterkamp_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_redwood90e_osterkamp_250_color.jp2'),
(1230, 81, 3, '2009-12-18', '20091218_redwood90e_osterkamp_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_redwood90e_osterkamp_250_ndvi.jp2'),
(1231, 81, 5, '2009-12-18', '20091218_redwood90e_osterkamp_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_redwood90e_osterkamp_250_ndvihd.jp2'),
(1232, 81, 1, '2009-12-18', '20091218_redwood90e_osterkamp_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_redwood90e_osterkamp_250_rgb.jp2'),
(1233, 80, 6, '2009-12-18', '20091218_roselle7_guest_250_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_roselle7_guest_250_change.jp2'),
(1234, 80, 2, '2009-12-18', '20091218_roselle7_guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_roselle7_guest_250_cir.jp2'),
(1235, 80, 7, '2009-12-18', '20091218_roselle7_guest_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_roselle7_guest_250_color.jp2'),
(1236, 80, 8, '2009-12-18', '20091218_roselle7_guest_250_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_roselle7_guest_250_fpar.jp2'),
(1237, 80, 3, '2009-12-18', '20091218_roselle7_guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_roselle7_guest_250_ndvi.jp2'),
(1238, 80, 5, '2009-12-18', '20091218_roselle7_guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_roselle7_guest_250_ndvihd.jp2'),
(1239, 80, 1, '2009-12-18', '20091218_roselle7_guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_roselle7_guest_250_rgb.jp2'),
(1240, 77, 6, '2009-12-18', '20091218_bensentam222_aronq_250_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bensentam222_aronq_250_change.jp2'),
(1241, 77, 2, '2009-12-18', '20091218_bensentam222_aronq_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bensentam222_aronq_250_cir.jp2'),
(1242, 77, 7, '2009-12-18', '20091218_bensentam222_aronq_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bensentam222_aronq_250_color.jp2'),
(1243, 77, 8, '2009-12-18', '20091218_bensentam222_aronq_250_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bensentam222_aronq_250_fpar.jp2'),
(1244, 77, 3, '2009-12-18', '20091218_bensentam222_aronq_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bensentam222_aronq_250_ndvi.jp2'),
(1245, 77, 5, '2009-12-18', '20091218_bensentam222_aronq_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bensentam222_aronq_250_ndvihd.jp2'),
(1246, 77, 1, '2009-12-18', '20091218_bensentam222_aronq_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bensentam222_aronq_250_rgb.jp2'),
(1247, 71, 6, '2009-12-18', '20091218_bentri-475-476_guest_250_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bentri-475-476_guest_250_change.jp2'),
(1248, 71, 2, '2009-12-18', '20091218_bentri-475-476_guest_250_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bentri-475-476_guest_250_cir.jp2'),
(1249, 71, 7, '2009-12-18', '20091218_bentri-475-476_guest_250_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bentri-475-476_guest_250_color.jp2'),
(1250, 71, 8, '2009-12-18', '20091218_bentri-475-476_guest_250_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bentri-475-476_guest_250_fpar.jp2'),
(1251, 71, 3, '2009-12-18', '20091218_bentri-475-476_guest_250_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bentri-475-476_guest_250_ndvi.jp2'),
(1252, 71, 5, '2009-12-18', '20091218_bentri-475-476_guest_250_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bentri-475-476_guest_250_ndvihd.jp2'),
(1253, 71, 1, '2009-12-18', '20091218_bentri-475-476_guest_250_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20091218_bentri-475-476_guest_250_rgb.jp2'),
(1254, 37, 6, '2010-01-16', '20100116_000037_1250_0002_change_fixed.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000037_1250_0002_change_fixed.jp2'),
(1255, 37, 2, '2010-01-16', '20100116_000037_1250_0002_cir_fixed.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000037_1250_0002_cir_fixed.jp2'),
(1256, 37, 8, '2010-01-16', '20100116_000037_1250_0002_fpar_fixed.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000037_1250_0002_fpar_fixed.jp2'),
(1257, 37, 3, '2010-01-16', '20100116_000037_1250_0002_ndvi_fixed.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000037_1250_0002_ndvi_fixed.jp2'),
(1258, 37, 5, '2010-01-16', '20100116_000037_1250_0002_ndvihd_fixed.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000037_1250_0002_ndvihd_fixed.jp2'),
(1259, 37, 1, '2010-01-16', '20100116_000037_1250_0002_rgb_fixed.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000037_1250_0002_rgb_fixed.jp2'),
(1260, 62, 6, '2010-01-16', '20100116_000062_2500_0011_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000062_2500_0011_change.jp2'),
(1262, 62, 2, '2010-01-16', '20100116_000062_2500_0011_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000062_2500_0011_cir.jp2'),
(1263, 62, 3, '2010-01-16', '20100116_000062_2500_0011_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000062_2500_0011_ndvi.jp2'),
(1264, 62, 5, '2010-01-16', '20100116_000062_2500_0011_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000062_2500_0011_ndvihd.jp2'),
(1265, 62, 1, '2010-01-16', '20100116_000062_2500_0011_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000062_2500_0011_rgb.jp2'),
(1266, 76, 6, '2010-01-16', '20100116_000076_2500_0017_Change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000076_2500_0017_Change.jp2'),
(1267, 76, 2, '2010-01-16', '20100116_000076_2500_0017_Cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000076_2500_0017_Cir.jp2'),
(1268, 76, 7, '2010-01-16', '20100116_000076_2500_0017_Color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000076_2500_0017_Color.jp2'),
(1269, 76, 8, '2010-01-16', '20100116_000076_2500_0017_Fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000076_2500_0017_Fpar.jp2'),
(1270, 76, 3, '2010-01-16', '20100116_000076_2500_0017_Ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000076_2500_0017_Ndvi.jp2'),
(1271, 76, 5, '2010-01-16', '20100116_000076_2500_0017_Ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000076_2500_0017_Ndvihd.jp2'),
(1272, 76, 1, '2010-01-16', '20100116_000076_2500_0017_RGB.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000076_2500_0017_RGB.jp2'),
(1273, 82, 2, '2010-01-16', '20100116_000082_2500_0002_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000082_2500_0002_cir.jp2'),
(1274, 82, 8, '2010-01-16', '20100116_000082_2500_0002_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000082_2500_0002_fpar.jp2'),
(1275, 82, 3, '2010-01-16', '20100116_000082_2500_0002_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000082_2500_0002_ndvi.jp2'),
(1276, 82, 5, '2010-01-16', '20100116_000082_2500_0002_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000082_2500_0002_ndvihd.jp2');
INSERT INTO `image` (`id`, `property_id`, `imagetypes_id`, `capture_date`, `webserver_layer`, `croptype_id`, `flight_time`, `resolution`, `aircraft_id`, `camera_id`, `image_processing_version`, `published_date`, `server_id`, `description`, `locked`, `name`) VALUES
(1277, 82, 1, '2010-01-16', '20100116_000082_2500_0002_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000082_2500_0002_rgb.jp2'),
(1278, 81, 6, '2010-01-16', '20100116_000081_2500_0016_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000081_2500_0016_change.jp2'),
(1279, 81, 2, '2010-01-16', '20100116_000081_2500_0016_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000081_2500_0016_cir.jp2'),
(1280, 81, 7, '2010-01-16', '20100116_000081_2500_0016_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000081_2500_0016_color.jp2'),
(1281, 81, 8, '2010-01-16', '20100116_000081_2500_0016_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000081_2500_0016_fpar.jp2'),
(1282, 81, 3, '2010-01-16', '20100116_000081_2500_0016_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000081_2500_0016_ndvi.jp2'),
(1283, 81, 5, '2010-01-16', '20100116_000081_2500_0016_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000081_2500_0016_ndvihd.jp2'),
(1284, 81, 1, '2010-01-16', '20100116_000081_2500_0016_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000081_2500_0016_rgb.jp2'),
(1285, 80, 6, '2010-01-16', '20100116_000080_2500_0000_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000080_2500_0000_change.jp2'),
(1286, 80, 2, '2010-01-16', '20100116_000080_2500_0000_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000080_2500_0000_cir.jp2'),
(1287, 80, 7, '2010-01-16', '20100116_000080_2500_0000_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000080_2500_0000_color.jp2'),
(1288, 80, 8, '2010-01-16', '20100116_000080_2500_0000_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000080_2500_0000_fpar.jp2'),
(1289, 80, 3, '2010-01-16', '20100116_000080_2500_0000_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000080_2500_0000_ndvi.jp2'),
(1290, 80, 5, '2010-01-16', '20100116_000080_2500_0000_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000080_2500_0000_ndvihd.jp2'),
(1291, 80, 1, '2010-01-16', '20100116_000080_2500_0000_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000080_2500_0000_rgb.jp2'),
(1292, 77, 6, '2010-01-16', '20100116_000077_2500_0015_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000077_2500_0015_change.jp2'),
(1293, 77, 2, '2010-01-16', '20100116_000077_2500_0015_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000077_2500_0015_cir.jp2'),
(1294, 77, 7, '2010-01-16', '20100116_000077_2500_0015_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000077_2500_0015_color.jp2'),
(1295, 77, 8, '2010-01-16', '20100116_000077_2500_0015_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000077_2500_0015_fpar.jp2'),
(1296, 77, 3, '2010-01-16', '20100116_000077_2500_0015_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000077_2500_0015_ndvi.jp2'),
(1297, 77, 5, '2010-01-16', '20100116_000077_2500_0015_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000077_2500_0015_ndvihd.jp2'),
(1298, 77, 1, '2010-01-16', '20100116_000077_2500_0015_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000077_2500_0015_rgb.jp2'),
(1299, 71, 6, '2010-01-16', '20100116_000071_2500_0002_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000071_2500_0002_change.jp2'),
(1300, 71, 2, '2010-01-16', '20100116_000071_2500_0002_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000071_2500_0002_cir.jp2'),
(1301, 71, 3, '2010-01-16', '20100116_000071_2500_0002_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000071_2500_0002_ndvi.jp2'),
(1302, 71, 5, '2010-01-16', '20100116_000071_2500_0002_ndvihd.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000071_2500_0002_ndvihd.jp2'),
(1303, 71, 1, '2010-01-16', '20100116_000071_2500_0002_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000071_2500_0002_rgb.jp2'),
(1304, 5, 6, '2010-01-16', '20100116_000005_1250_0002_change.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000005_1250_0002_change.jp2'),
(1305, 5, 2, '2010-01-16', '20100116_000005_1250_0002_cir.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000005_1250_0002_cir.jp2'),
(1306, 5, 7, '2010-01-16', '20100116_000005_1250_0002_color.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000005_1250_0002_color.jp2'),
(1307, 5, 8, '2010-01-16', '20100116_000005_1250_0002_fpar.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000005_1250_0002_fpar.jp2'),
(1308, 5, 3, '2010-01-16', '20100116_000005_1250_0002_ndvi.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000005_1250_0002_ndvi.jp2'),
(1310, 5, 1, '2010-01-16', '20100116_000005_1250_0002_rgb.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000005_1250_0002_rgb.jp2'),
(1312, 5, 5, '2010-01-16', '20100116_000005_1250_0020_ndvihd_fixed-02.jp2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ' ', NULL, '20100116_000005_1250_0020_ndvihd_fixed-02.jp2');

-- --------------------------------------------------------

--
-- Table structure for table `imagetype`
--

CREATE TABLE IF NOT EXISTS `imagetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `extension` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `imagetype`
--

INSERT INTO `imagetype` (`id`, `name`, `extension`) VALUES
(1, 'RGB', '_rgb.jp2'),
(2, 'CIR', '_cir.jp2'),
(3, 'NDVI', '_ndvi.jp2'),
(5, 'HD NDVI', '_hdndvi.jp2'),
(6, 'Change Detection', '_cd.jp2'),
(7, 'Color Variation', '_cv.jp2'),
(8, 'Leaf Cover (FPAR)', '_lcfpar.jp2');

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE IF NOT EXISTS `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` varchar(11) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `fax` varchar(12) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `created_on` date NOT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persons_agency_id` (`agency_id`),
  KEY `persons_type_id` (`type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`id`, `agency_id`, `first_name`, `last_name`, `username`, `password`, `address`, `city`, `state`, `zipcode`, `phone`, `fax`, `email`, `created_on`, `locked`, `type_id`) VALUES
(2, 1, 'Helena', 'User', 'helena', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', '', '', '', '', '', '', '', '2010-02-02', 0, 3),
(5, 5, 'Alfredo', 'Alcocer', 'aalcocer', 'sha1$d8541$bab79dc76cc26d919a17144ac801c25f2c1ae33e', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(6, 6, 'Salton City', 'User', 'scuser', 'sha1$e6b60$4d16ff576f313197e711f8d31f1aa1be682b711e', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(7, 7, 'Heritiage Palms User', '', 'hpuser', 'sha1$61202$0f7d8513c2f4bfe658b174b148cd99bc501b8b94', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(8, 8, 'La Quinta', '', 'lquser', 'sha1$6b20d$2bcca91c5c7fae77b2cbbd6dd5592013e45a752a', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(10, 4, 'Randy', 'Holleschau', 'rholleschau', 'sha1$75a25$187418d4136d4be3c6c2746b83cf4cbfdb4fb852', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(11, 9, 'IID', 'User', 'iiduser', 'sha1$80ef6$d6d876ea4b4b4dc9333b41f9d5baf85c0c3cab6a', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(12, 10, 'Central Valley Water District', '', 'cvwduser', 'sha1$b8387$ab7f17b59f39110519d12cf62c1e8d7554ecc7e0', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(13, 11, 'Marriot', 'User', 'muser', 'sha1$2297d$8438da0b5e84ed74025f1082c70c527f21e056d9', '', '', 'CA', '', '', '', '', '2010-02-08', 0, 3),
(14, NULL, 'Stan', 'Sinclear', 'ssinclear', 'sha1$eb048$51e13c52e2e529a765a63933beb6760478b42675', '', '', 'CA', '', '', '', '', '2010-02-08', 0, NULL),
(15, NULL, 'aronq', '', 'aronq', 'sha1$1c6f0$9177166f2265b5a7932cf9d64a800ddbecb1ec19', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(16, NULL, 'Mark', 'Osterakmp', 'mosterakmp', 'sha1$b2c0b$169005e8e75423df9e8e370d52eb1784da2d649d', '', '', '', '', '', '', 'osterkampfarms@yahoo.com', '2010-02-08', 0, NULL),
(17, 12, 'Al', 'Kalin', 'akalin', 'sha1$f35a0$bd6f28e96fd3e6b0b83698f5f108149e1d06e9a7', '', '', '', '', '', '', 'akalin@hughes.net', '2010-02-08', 0, NULL),
(18, NULL, 'Jesse', 'Achenbach', 'jcachen', 'sha1$d5818$9a8c226fa2b8abc42420cdd11d8da5ab3721b4e1', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(20, 13, 'Oceano Produce', 'User', 'opuser', 'sha1$2d689$76d3507d30711d6460efe0dc9e43d4289a3dcc90', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(21, NULL, 'Bruce', 'Rucker', 'brucker', 'sha1$b2e18$54cb18ae49c2f5c6953203805be81b530b78a18c', '', '', '', '', '', '', '', '2010-02-08', 0, NULL),
(101, 4, 'Kevin', 'Koller', 'kkoller', 'abbc0f861702d5e95990b0bc3a89a2884e3aed42', '', '', '', '', '', '', '', '2010-02-12', 0, NULL),
(102, 4, 'Aaron', 'Koller', 'akoller', '17ddc753d46458a1d5b45ca85bf27ae9138bcf89', '', '', '', '', '', '', '', '2010-02-12', 0, NULL),
(103, NULL, 'Test', 'User', 'tuser', 'a77591be2044afcd45b50acdfce3a585caae257c', '', '', '', '', '', '', '', '2010-02-12', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `person_types`
--

CREATE TABLE IF NOT EXISTS `person_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `person_types`
--

INSERT INTO `person_types` (`id`, `name`) VALUES
(1, 'Agent'),
(2, 'Customer'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE IF NOT EXISTS `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `field_number` varchar(25) DEFAULT NULL,
  `center_lat` double DEFAULT NULL,
  `center_lon` double DEFAULT NULL,
  `center_elev` double DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `area` double DEFAULT NULL,
  `croptype_id` int(11) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `croptype_id` (`croptype_id`),
  KEY `property_customer_id` (`customer_id`),
  KEY `property_agent_id` (`agent_id`),
  KEY `property_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `customer_id`, `agent_id`, `user_id`, `name`, `field_number`, `center_lat`, `center_lon`, `center_elev`, `zoom`, `resolution`, `area`, `croptype_id`, `locked`, `created_on`) VALUES
(1, NULL, NULL, 2, 'Three Flags 2', NULL, 33.15448, -115.84847, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 2, 'Three Flags', NULL, 33.16928, -115.86525, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 2, 'Scheu', NULL, 33.13985, -115.34237, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(4, NULL, NULL, 12, 'Salton City - 18 inch', NULL, 33.29712, -115.95556, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(5, NULL, NULL, 21, 'Rucker', NULL, 33.56223, -116.02212, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 2, 'Rubber', NULL, 32.8382, -115.45678, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(7, NULL, NULL, 2, 'RBW', NULL, 32.9309, -115.44889, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 2, 'Ranchos Dos Hermanos', NULL, 33.03048, -115.70973, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(9, NULL, NULL, 2, 'Cuatro Del Mar', NULL, 33.08583, -115.73964, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(10, NULL, NULL, 2, 'Pfister Sprinkler', NULL, 32.88509, -115.35167, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(14, NULL, NULL, 2, 'Pfister Home Ranch', NULL, 32.88853, -115.341, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(15, NULL, NULL, 2, 'Paramount Flowing Wells', NULL, 33.22733, -115.45404, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(18, NULL, NULL, 2, 'Osterkamp', NULL, 32.91288, -115.46193, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(19, NULL, NULL, 2, 'Ohmar 26', NULL, 32.96394, -115.42767, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(20, NULL, NULL, 2, '0-8', NULL, 33.20184, -115.4717, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(21, NULL, NULL, 2, 'Niland', NULL, 33.42335, -115.68059, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(22, NULL, NULL, 2, 'N4', NULL, 33.19465, -115.44495, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(23, NULL, NULL, 2, 'Malva 2-9', NULL, 33.05736, -115.40934, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(24, NULL, NULL, 2, 'Kalin Trif 9', NULL, 33.08043, -115.65282, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(25, NULL, NULL, 2, 'IVC Dogwood', NULL, 32.83094, -115.50545, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(26, NULL, NULL, 2, 'Ecco 25 E', NULL, 33.12241, -115.8244, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(27, NULL, NULL, 2, 'Ecco 13E', NULL, 33.11706, -115.81574, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(28, NULL, NULL, 2, 'Church Ranch', NULL, 32.94885, -115.55259, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(29, NULL, NULL, 2, 'Brandenberg 1', NULL, 33.60587, -116.10318, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(30, NULL, NULL, 2, 'Bojax', NULL, 33.23112, -115.44638, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(31, NULL, NULL, 2, 'Bishop Wistyeria', NULL, 32.67547, -115.54667, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(33, NULL, NULL, 2, 'Smilex 58 and 59', NULL, 33.00469, -115.54609, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(34, NULL, NULL, 2, 'Smilex 65', NULL, 33.01012, -115.54828, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(35, NULL, NULL, 2, 'Spruce 166', NULL, 33.01189, -115.53727, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(36, NULL, NULL, 2, 'Kalin Fuller', NULL, 33.03547, -115.53961, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(37, NULL, NULL, 2, 'Brandenberg 2', NULL, 33.5476, -116.0307, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(38, NULL, NULL, 5, 'Indian Springs Golf Course', NULL, 33.717, -116.2687, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(40, NULL, NULL, 2, 'Kalin BN1, BN2', NULL, 33.0556, -115.6604, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(41, NULL, NULL, 7, 'Heritage Palms Country Club', NULL, 33.7292, -116.26145, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(42, NULL, NULL, 8, 'Rancho La Quinta Country Club', NULL, 33.69271, -116.28733, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(43, NULL, NULL, NULL, 'Indian Springs Golf Course', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, NULL, NULL, 2, 'Moss 20-24', NULL, 32.9972, -115.4361, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(45, NULL, NULL, 2, 'Beachline / Highline 2', NULL, 33.2818, -115.5242, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(46, NULL, NULL, 2, 'Beachline / Highline 1', NULL, 33.2999, -115.5363, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(47, NULL, NULL, 2, 'Claverie', NULL, 32.713, -115.403, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(48, NULL, NULL, 2, 'I-34', NULL, 33.166, -115.532, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(49, NULL, NULL, 2, 'The Fig Tree', NULL, 33.314, -115.549, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(50, NULL, NULL, 2, 'Myrtle 14-16', NULL, 33.023, -115.397, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(51, NULL, NULL, 2, 'Nettle 5', NULL, 33.086, -115.394, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(52, NULL, NULL, 2, 'J-12', NULL, 33.169, -115.467, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(53, NULL, NULL, 2, 'Osage 8-9', NULL, 32.98, -115.381, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(54, NULL, NULL, 2, 'Vail 221-217', NULL, 33.173, -115.575, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(55, NULL, NULL, 10, 'Pecan Orchard', NULL, 31.97969, -110.95428, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(56, NULL, NULL, 15, 'Sharps 103-104', NULL, 32.75151, -114.00081, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(57, NULL, NULL, 2, 'ARP Farms 35-5, 35-6', NULL, 32.59267, -111.49561, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(58, NULL, NULL, 2, 'G3', NULL, 33.14764, -115.39582, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(60, NULL, NULL, 2, 'Osage Citrus', NULL, 32.97968, -115.31058, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(61, NULL, NULL, 2, 'Desert Delight', NULL, 33.14019, -115.3851, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(62, NULL, NULL, 11, 'Marsh Land Reclamation', NULL, 33.20912, -115.53262, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(63, NULL, NULL, 12, 'Thomas Levy Recharge - 5 inch', NULL, 33.60568, -116.25886, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(64, NULL, NULL, 13, 'Marriot Desert Springs Resort', NULL, 33.75256, -116.36536, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(65, NULL, NULL, 13, 'Marriot Shadow Ridge', NULL, 33.78055, -116.38365, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(66, NULL, NULL, 12, 'La Quinta Country Club - 5 inch', NULL, 33.69029, -116.30106, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(67, NULL, NULL, 8, 'La Quinta Dunes', NULL, 33.68208, -116.29722, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(68, NULL, NULL, 8, 'LA Quinta Mountain Course', NULL, 33.68632, -116.31341, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(69, NULL, NULL, 13, 'Marriot Rancho Las Palmas', NULL, 33.74111, -116.40023, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(70, NULL, NULL, 12, 'Dos Palmas Mitigation - 10 inch', NULL, 33.47924, -115.82799, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(71, NULL, NULL, 2, 'Benson Tri 475-476', NULL, 33.05733, -115.61758, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(72, NULL, NULL, 2, 'Ohmar 9', NULL, 32.96401, -115.35908, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(73, NULL, NULL, 12, 'Dos Palmas Mitigation - 5 inch', NULL, 33.49488, -115.82385, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(74, NULL, NULL, 12, 'Dos Palmas Mitigation - 2.5 inch', NULL, 33.49488, -115.82385, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(75, NULL, NULL, 14, 'Sinclear Demo', NULL, 33.5476, -116.0307, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(76, NULL, NULL, 17, 'Kalin R1', NULL, 33.07682, -115.65357, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(77, NULL, NULL, 15, 'Bensen Tamarak 222', NULL, 33.07278, -115.583, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(78, NULL, NULL, 17, 'Audubon Site TriCounty', NULL, 33.08763, -115.69718, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(79, NULL, NULL, 16, 'Osterkamp Red 94', NULL, 32.94574, -115.46677, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(80, NULL, NULL, 20, 'Roselle 7', NULL, 32.83103, -115.47234, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(81, NULL, NULL, 16, 'Redwood 90 E', NULL, 32.92767, -115.46229, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(82, NULL, NULL, 2, 'Mayflower 7', NULL, 33.06447, -115.37514, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(83, NULL, NULL, 2, 'Dove Mountain', NULL, 32.45762, -111.08798, NULL, NULL, 5, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE IF NOT EXISTS `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`id`, `name`) VALUES
(1, 'M5');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_message`
--
ALTER TABLE `auth_message`
  ADD CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `aircraft_id_refs_id_30b63891` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`),
  ADD CONSTRAINT `camera_id_refs_id_2b602194` FOREIGN KEY (`camera_id`) REFERENCES `camera` (`id`),
  ADD CONSTRAINT `croptype_id_refs_id_3ff017ff` FOREIGN KEY (`croptype_id`) REFERENCES `croptype` (`id`),
  ADD CONSTRAINT `imagetypes_id_refs_id_f72a1a3` FOREIGN KEY (`imagetypes_id`) REFERENCES `imagetype` (`id`),
  ADD CONSTRAINT `property_id_refs_id_7c2f7fec` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`),
  ADD CONSTRAINT `server_id_refs_id_f127390` FOREIGN KEY (`server_id`) REFERENCES `server` (`id`);

--
-- Constraints for table `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `agency_id_refs_id_4d442d27` FOREIGN KEY (`agency_id`) REFERENCES `agencies` (`id`),
  ADD CONSTRAINT `type_id_refs_id_1043a0e3` FOREIGN KEY (`type_id`) REFERENCES `person_types` (`id`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `agent_id_refs_id_2ab815b3` FOREIGN KEY (`agent_id`) REFERENCES `persons` (`id`),
  ADD CONSTRAINT `croptype_id_refs_id_4e9f4486` FOREIGN KEY (`croptype_id`) REFERENCES `croptype` (`id`),
  ADD CONSTRAINT `customer_id_refs_id_2ab815b3` FOREIGN KEY (`customer_id`) REFERENCES `persons` (`id`),
  ADD CONSTRAINT `user_id_refs_id_2ab815b3` FOREIGN KEY (`user_id`) REFERENCES `persons` (`id`);
