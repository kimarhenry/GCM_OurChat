-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2016 at 06:08 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gcm_chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--
--

CREATE TABLE IF NOT EXISTS `chat_rooms` (
  `chat_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_room_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `chat_rooms`
--

INSERT INTO `chat_rooms` (`chat_room_id`, `name`, `created_at`) VALUES
(1, 'PHYS3671', '2016-01-06 06:57:40'),
(2, 'PHYS2671', '2016-01-06 06:57:40'),
(3, 'PHYS1422', '2016-01-06 06:57:40'),
(4, 'MATH3424', '2016-01-06 06:57:40'),
(5, 'MATH2404', '2016-01-06 06:57:40'),
(6, 'MATH1142', '2016-01-06 06:58:46'),
(7, 'COMP2211', '2016-01-06 06:58:46'),
(8, 'COMP1126', '2016-01-06 06:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `chat_room_id` (`chat_room_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `chat_room_id`, `user_id`, `message`, `created_at`) VALUES
(1, 3, 1, 'hello!', '2016-05-14 14:53:03'),
(2, 3, 1, 'this is awesome!', '2016-05-14 14:53:21'),
(3, 1, 3, 'OK', '2016-05-14 15:31:49'),
(4, 1, 4, 'seems to be working', '2016-05-14 15:36:59'),
(5, 1, 5, 'cool', '2016-05-14 15:40:09'),
(6, 1, 5, 'nice', '2016-05-14 15:40:16'),
(7, 1, 4, 'cool', '2016-05-14 15:48:05'),
(8, 1, 4, 'cool', '2016-05-14 15:48:18'),
(9, 1, 4, 'ok', '2016-05-14 15:48:26'),
(10, 1, 4, 'hi', '2016-05-14 15:48:35'),
(11, 1, 4, 'hey', '2016-05-14 15:51:33'),
(12, 2, 4, 'hey', '2016-05-14 15:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gcm_registration_id` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `gcm_registration_id`, `created_at`) VALUES
(1, 'kimarhenry', 'kimar@yahoo.com', '', '2016-05-14 14:48:07'),
(2, 'kimarhenry', 'kimarhenry@yahoo.com', 'eLVNxN_0x3Y:APA91bFD2V-5L0eeEzYm3TPzlVeIKuCdXc0RIwbgmkmVZqS_pbidn9yuiN14ma0jECjMjP4yqATTKEj-4ka8QJ-80YkN_mmkJKqxe7WWi4kZD8H6-nAEeCwuqx11DfiNNtQqK7RZQ_i3', '2016-05-14 14:49:11'),
(3, 'AndroidHive', 'admin@androidhive.info', '', '2016-05-14 15:18:29'),
(4, 'Admin', 'admin@alocalhost.info', '', '2016-05-14 15:36:45'),
(5, 'mar', 'mar@yahoo.com', 'cIXTQXEKK9g:APA91bHaf7BQxlzctpYedRtixTt7eIx6EJE-ilxBso1YUThg34qzj4zBGKUQ311Qfu9SeTU_np3-dsYtvKx1W7jrUnBFysPAyjYRtbcToBfEW9hH1n6ADpVLzKjhFhTvp2rO-J1mqguf', '2016-05-14 15:39:50');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`chat_room_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
