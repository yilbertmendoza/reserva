-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-08-2011 a las 00:46:36
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `reservaunad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_email_queue`
--

DROP TABLE IF EXISTS `rs_email_queue`;
CREATE TABLE IF NOT EXISTS `rs_email_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_email` varchar(128) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `alt_message` text,
  `max_attempts` int(11) NOT NULL DEFAULT '3',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `rs_email_queue`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_login_attempts`
--

DROP TABLE IF EXISTS `rs_login_attempts`;
CREATE TABLE IF NOT EXISTS `rs_login_attempts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) NOT NULL,
  `login` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcar la base de datos para la tabla `rs_login_attempts`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_permissions`
--

DROP TABLE IF EXISTS `rs_permissions`;
CREATE TABLE IF NOT EXISTS `rs_permissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `Site.Signin.Allow` tinyint(1) NOT NULL DEFAULT '0',
  `Site.Content.View` tinyint(1) NOT NULL DEFAULT '0',
  `Site.Statistics.View` tinyint(1) NOT NULL DEFAULT '0',
  `Site.Appearance.View` tinyint(1) NOT NULL DEFAULT '0',
  `Site.Settings.View` tinyint(1) NOT NULL DEFAULT '0',
  `Site.Developer.View` tinyint(1) NOT NULL DEFAULT '0',
  `Bonfire.Roles.Manage` tinyint(1) NOT NULL DEFAULT '0',
  `Bonfire.Users.Manage` tinyint(1) NOT NULL DEFAULT '0',
  `Bonfire.Users.View` tinyint(1) NOT NULL DEFAULT '0',
  `Bonfire.Users.Add` tinyint(1) NOT NULL DEFAULT '0',
  `Bonfire.Database.Manage` tinyint(1) NOT NULL DEFAULT '0',
  `Bonfire.Emailer.Manage` tinyint(1) NOT NULL DEFAULT '0',
  `Bonfire.Logs.View` tinyint(1) NOT NULL DEFAULT '0',
  `Bonfire.Logs.Manage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `rs_permissions`
--

INSERT INTO `rs_permissions` (`permission_id`, `role_id`, `Site.Signin.Allow`, `Site.Content.View`, `Site.Statistics.View`, `Site.Appearance.View`, `Site.Settings.View`, `Site.Developer.View`, `Bonfire.Roles.Manage`, `Bonfire.Users.Manage`, `Bonfire.Users.View`, `Bonfire.Users.Add`, `Bonfire.Database.Manage`, `Bonfire.Emailer.Manage`, `Bonfire.Logs.View`, `Bonfire.Logs.Manage`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(2, 2, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
(3, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(4, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_roles`
--

DROP TABLE IF EXISTS `rs_roles`;
CREATE TABLE IF NOT EXISTS `rs_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `rs_roles`
--

INSERT INTO `rs_roles` (`role_id`, `role_name`, `description`, `default`, `can_delete`) VALUES
(1, 'Administrador', 'Administrador del sitio', 0, 0),
(2, 'Editor', 'Es el usuario de la taquilla', 0, 1),
(3, 'bloqueado', 'es el usuaio que no tiene permitido el acceso al sitio', 0, 0),
(6, 'Desarrollador', 'Developers typically are the only ones that can access the developer tools. Otherwise identical to Administrators, at least until the site is handed off.', 0, 1),
(7, 'cliente', 'El usuario que puede realizar reservas como cliente', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_sala`
--

DROP TABLE IF EXISTS `rs_sala`;
CREATE TABLE IF NOT EXISTS `rs_sala` (
  `id_sala` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `asientos` int(11) NOT NULL,
  `fila` int(11) DEFAULT NULL,
  `columna` int(11) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_sala`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `rs_sala`
--

INSERT INTO `rs_sala` (`id_sala`, `nombre`, `asientos`, `fila`, `columna`, `descripcion`, `estado`) VALUES
(1, 'Sala comedia', 40, NULL, NULL, 'Sala para comedias', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_schema_version`
--

DROP TABLE IF EXISTS `rs_schema_version`;
CREATE TABLE IF NOT EXISTS `rs_schema_version` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `rs_schema_version`
--

INSERT INTO `rs_schema_version` (`version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_sessions`
--

DROP TABLE IF EXISTS `rs_sessions`;
CREATE TABLE IF NOT EXISTS `rs_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `rs_sessions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_states`
--

DROP TABLE IF EXISTS `rs_states`;
CREATE TABLE IF NOT EXISTS `rs_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL,
  `abbrev` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Volcar la base de datos para la tabla `rs_states`
--

INSERT INTO `rs_states` (`id`, `name`, `abbrev`) VALUES
(1, 'Alaska', 'AK'),
(2, 'Alabama', 'AL'),
(3, 'American Samoa', 'AS'),
(4, 'Arizona', 'AZ'),
(5, 'Arkansas', 'AR'),
(6, 'California', 'CA'),
(7, 'Colorado', 'CO'),
(8, 'Connecticut', 'CT'),
(9, 'Delaware', 'DE'),
(10, 'District of Columbia', 'DC'),
(12, 'Florida', 'FL'),
(13, 'Georgia', 'GA'),
(14, 'Guam', 'GU'),
(15, 'Hawaii', 'HI'),
(16, 'Idaho', 'ID'),
(17, 'Illinois', 'IL'),
(18, 'Indiana', 'IN'),
(19, 'Iowa', 'IA'),
(20, 'Kansas', 'KS'),
(21, 'Kentucky', 'KY'),
(22, 'Louisiana', 'LA'),
(23, 'Maine', 'ME'),
(24, 'Marshall Islands', 'MH'),
(25, 'Maryland', 'MD'),
(26, 'Massachusetts', 'MA'),
(27, 'Michigan', 'MI'),
(28, 'Minnesota', 'MN'),
(29, 'Mississippi', 'MS'),
(30, 'Missouri', 'MO'),
(31, 'Montana', 'MT'),
(32, 'Nebraska', 'NE'),
(33, 'Nevada', 'NV'),
(34, 'New Hampshire', 'NH'),
(35, 'New Jersey', 'NJ'),
(36, 'New Mexico', 'NM'),
(37, 'New York', 'NY'),
(38, 'North Carolina', 'NC'),
(39, 'North Dakota', 'ND'),
(40, 'Northern Mariana Islands', 'MP'),
(41, 'Ohio', 'OH'),
(42, 'Oklahoma', 'OK'),
(43, 'Oregon', 'OR'),
(44, 'Palau', 'PW'),
(45, 'Pennsylvania', 'PA'),
(46, 'Puerto Rico', 'PR'),
(47, 'Rhode Island', 'RI'),
(48, 'South Carolina', 'SC'),
(49, 'South Dakota', 'SD'),
(50, 'Tennessee', 'TN'),
(51, 'Texas', 'TX'),
(52, 'Utah', 'UT'),
(53, 'Vermont', 'VT'),
(54, 'Virgin Islands', 'VI'),
(55, 'Virginia', 'VA'),
(56, 'Washington', 'WA'),
(57, 'West Virginia', 'WV'),
(58, 'Wisconsin', 'WI'),
(59, 'Wyoming', 'WY'),
(60, 'Armed Forces Africa', 'AE'),
(62, 'Armed Forces Canada', 'AE'),
(63, 'Armed Forces Europe', 'AE'),
(64, 'Armed Forces Middle East', 'AE'),
(65, 'Armed Forces Pacific', 'AP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_users`
--

DROP TABLE IF EXISTS `rs_users`;
CREATE TABLE IF NOT EXISTS `rs_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '4',
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `password_hash` varchar(40) NOT NULL,
  `temp_password_hash` varchar(40) DEFAULT NULL,
  `salt` varchar(7) NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_ip` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `street_1` varchar(255) DEFAULT NULL,
  `street_2` varchar(255) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `zipcode` int(7) DEFAULT NULL,
  `zip_extra` int(5) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `rs_users`
--

INSERT INTO `rs_users` (`id`, `role_id`, `first_name`, `last_name`, `email`, `username`, `password_hash`, `temp_password_hash`, `salt`, `last_login`, `last_ip`, `created_on`, `street_1`, `street_2`, `city`, `state_id`, `zipcode`, `zip_extra`, `country_id`, `deleted`) VALUES
(1, 1, NULL, NULL, 'admin@admin.com', 'admin', '8b02d57f8dad007bea697fbc0c72698645393490', NULL, 'bNQiXRs', '2011-06-29 14:33:54', '127.0.0.1', '2011-06-29 14:33:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(2, 1, NULL, NULL, 'kdarcila@gmail.com', 'darcila', 'e95323c7a3c09c23d52ce686d89377c0dd613625', NULL, '0eRVJoI', '2011-08-03 22:57:22', '127.0.0.1', '2011-06-29 14:42:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(3, 1, 'usuario', 'reserva', 'reserva@reservacion.com', 'reserva', '2e99cb50d441ed01261f6f186b0d47c8217b3d82', NULL, 'KsrnJ0F', '2011-08-03 23:02:19', '127.0.0.1', '2011-08-03 22:55:36', '', '', '', 12, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rs_user_cookies`
--

DROP TABLE IF EXISTS `rs_user_cookies`;
CREATE TABLE IF NOT EXISTS `rs_user_cookies` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(128) NOT NULL,
  `created_on` datetime NOT NULL,
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `rs_user_cookies`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
