CREATE TABLE IF NOT EXISTS `imagetype` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `beiapp_imagetype`
--

INSERT INTO `imagetype` (`id`, `name`) VALUES
(1, 'RGB'),
(2, 'CIR'),
(3, 'NDVI'),
(5, 'HD NDVI'),
(6, 'Change Detection'),
(7, 'Color Variation'),
(8, 'Leaf Cover (FPAR)');
