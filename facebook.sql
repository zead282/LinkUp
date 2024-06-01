-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2024 at 03:38 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `facebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `createdAt`, `updatedAt`, `userId`, `postId`) VALUES
(4, 'update', '2024-05-28 04:49:13', '2024-05-28 04:50:33', 1, 2),
(5, 'update5', '2024-05-28 04:50:18', '2024-05-28 04:59:07', 1, 2),
(6, 'new commentt', '2024-05-28 05:05:16', '2024-05-28 05:05:16', 1, 3),
(7, 'new commentt', '2024-05-28 06:03:23', '2024-05-28 06:03:23', 1, 4),
(8, 'new commentt', '2024-05-28 06:10:31', '2024-05-28 06:10:31', 1, 4),
(9, 'new commentt', '2024-05-28 06:11:28', '2024-05-28 06:11:28', 1, 4),
(10, 'new commentt', '2024-05-28 06:13:04', '2024-05-28 06:13:04', NULL, 4),
(11, 'new commentt', '2024-05-28 06:14:09', '2024-05-28 06:14:09', NULL, 4),
(12, 'new commentt', '2024-05-28 06:17:48', '2024-05-28 06:17:48', NULL, 4),
(13, 'new commentt', '2024-05-28 06:18:40', '2024-05-28 06:18:40', 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `isdeleted` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `content`, `title`, `isdeleted`, `createdAt`, `updatedAt`, `userId`) VALUES
(1, 'neww', 'newwtw', 1, '2024-05-28 03:52:18', '2024-05-28 03:54:12', 1),
(2, 'newwww', 'title', 0, '2024-05-28 04:05:48', '2024-05-28 04:05:48', 1),
(3, 'newwww', 'title', 0, '2024-05-28 05:04:50', '2024-05-28 05:04:50', 1),
(4, 'newwww', 'title', 0, '2024-05-28 06:03:01', '2024-05-28 06:03:01', 1),
(5, 'newwww', 'title', 0, '2024-05-28 06:06:50', '2024-05-28 06:06:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `online` tinyint(1) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `online`, `createdAt`, `updatedAt`) VALUES
(1, 'zead', 'zytad@.com', '$2a$08$2MemBr7mnEdQhctIZHPG1eK7fEjmRWQ0kgXUJlKaiWgPRDxS8jB8q', 'user', 1, '2024-05-28 03:51:49', '2024-05-28 06:02:40'),
(2, 'zeadmohamed', 'aaaaa@gmail.com', '$2a$08$dWY0o48Bkw2fqPn/pwRA2.d7d9AodHntWiXbqOEHabuQZe3khdhwy', 'user', 1, '2024-05-28 05:58:12', '2024-05-28 05:58:12'),
(4, 'zeadmohamed', 'aaaga@gmail.com', '$2a$08$EMFwsJbyIuZKMSRYhiKYVe3AzxIHev1KLFIscNGJnLnGVVY3xbS6q', 'user', 1, '2024-05-28 06:00:37', '2024-05-28 06:00:37'),
(6, 'zeadmohamed', 'azzaaga@gmail.com', '$2a$08$tVQzMa4DWb.UaUfMILNc1.gYVzadnAA0tQveZrWiCA1j2PT8KPiKW', 'user', 1, '2024-05-28 06:02:18', '2024-05-28 06:17:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `email_14` (`email`),
  ADD UNIQUE KEY `email_15` (`email`),
  ADD UNIQUE KEY `email_16` (`email`),
  ADD UNIQUE KEY `email_17` (`email`),
  ADD UNIQUE KEY `email_18` (`email`),
  ADD UNIQUE KEY `email_19` (`email`),
  ADD UNIQUE KEY `email_20` (`email`),
  ADD UNIQUE KEY `email_21` (`email`),
  ADD UNIQUE KEY `email_22` (`email`),
  ADD UNIQUE KEY `email_23` (`email`),
  ADD UNIQUE KEY `email_24` (`email`),
  ADD UNIQUE KEY `email_25` (`email`),
  ADD UNIQUE KEY `email_26` (`email`),
  ADD UNIQUE KEY `email_27` (`email`),
  ADD UNIQUE KEY `email_28` (`email`),
  ADD UNIQUE KEY `email_29` (`email`),
  ADD UNIQUE KEY `email_30` (`email`),
  ADD UNIQUE KEY `email_31` (`email`),
  ADD UNIQUE KEY `email_32` (`email`),
  ADD UNIQUE KEY `email_33` (`email`),
  ADD UNIQUE KEY `email_34` (`email`),
  ADD UNIQUE KEY `email_35` (`email`),
  ADD UNIQUE KEY `email_36` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_61` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_62` FOREIGN KEY (`postId`) REFERENCES `posts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
