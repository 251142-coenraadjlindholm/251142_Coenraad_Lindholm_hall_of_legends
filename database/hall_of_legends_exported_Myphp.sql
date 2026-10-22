-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2026 at 03:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";





-- Database: `hall_of_legends`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `entry_id`, `user_id`, `text`, `created_at`) VALUES
(1, 1, 2, 'that route is filthy, stealing this', '2026-08-17 14:02:40'),
(2, 1, 3, 'new record, congrats', '2026-08-17 14:02:40'),
(3, 2, 4, 'insane execution honestly', '2026-08-17 14:02:40'),
(4, 2, 6, 'Your a Legend!!!!!', '2026-08-19 15:45:43'),
(5, 1, 7, 'Damn what a run', '2026-08-20 11:09:12');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `entry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `game` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `rep_awarded` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`entry_id`, `user_id`, `title`, `game`, `type`, `description`, `file_path`, `rep_awarded`, `created_at`) VALUES
(1, 3, 'Sub 20 speedrun, First clean deathless run.', 'Celeste', 'Speedrun', 'Route skips the crystal heart pickup in chapter 4 and takes the golden feather shortcut instead.', NULL, 350, '2026-08-17 14:02:40'),
(2, 2, 'Solo Malenia kill, no summons, no bleed.', 'Elden Ring', 'Boss Kill', 'Pure melee, no summons, no bleed build. Took about 40 attempts.', NULL, 90, '2026-08-17 14:02:40'),
(3, 5, 'Pantheon of Hollownest, First Clear', 'Hollow Knight', 'Speedrun', 'First deathless clear of the Pantheon of Hollownest.', NULL, 350, '2026-08-17 14:02:40'),
(4, 4, 'Heat 32 clear, No boons repeated', 'Hades', 'Screenshot', 'Cleared a Heat 32 run without repeating a single boon the whole run.', NULL, 210, '2026-08-17 14:02:40');

-- --------------------------------------------------------

--
-- Stand-in structure for view `entry_feed_view`
-- (See below for the actual view)
--
CREATE TABLE `entry_feed_view` (
`entry_id` int(11)
,`user_id` int(11)
,`title` varchar(150)
,`game` varchar(100)
,`type` varchar(50)
,`description` text
,`file_path` varchar(255)
,`rep_awarded` int(11)
,`created_at` datetime
,`username` varchar(50)
,`like_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `leaderboard_view`
-- (See below for the actual view)
--
CREATE TABLE `leaderboard_view` (
`user_id` int(11)
,`username` varchar(50)
,`rep` int(11)
,`position` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `entry_id`, `user_id`, `created_at`) VALUES
(1, 1, 2, '2026-08-17 14:02:40'),
(2, 1, 4, '2026-08-17 14:02:40'),
(4, 2, 3, '2026-08-17 14:02:40'),
(5, 2, 4, '2026-08-17 14:02:40'),
(6, 3, 1, '2026-08-17 14:02:40'),
(7, 4, 2, '2026-08-17 14:02:40'),
(8, 4, 3, '2026-08-17 14:02:40'),
(11, 2, 6, '2026-08-19 15:45:55'),
(12, 2, 1, '2026-08-20 09:21:52');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `rep` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `rep`, `created_at`) VALUES
(1, 'admin_dragon', 'admin@hall.dev', '$2y$10$3acoSBQDTqeldYLkTGVHsusBDX0PX8pz3JNV3VUlxDRYmioODOLFe', 'admin', 9400, '2026-08-17 14:02:40'),
(2, 'mika.exe', 'mika@hall.dev', '$2y$10$3acoSBQDTqeldYLkTGVHsusBDX0PX8pz3JNV3VUlxDRYmioODOLFe', 'user', 9910, '2026-08-17 14:02:40'),
(3, 'jrunner_45', 'jrunner@hall.dev', '$2y$10$3acoSBQDTqeldYLkTGVHsusBDX0PX8pz3JNV3VUlxDRYmioODOLFe', 'user', 8420, '2026-08-17 14:02:40'),
(4, '10noblade', 'noblade@hall.dev', '$2y$10$3acoSBQDTqeldYLkTGVHsusBDX0PX8pz3JNV3VUlxDRYmioODOLFe', 'user', 7540, '2026-08-17 14:02:40'),
(5, 'coldstreak', 'cold@hall.dev', '$2y$10$3acoSBQDTqeldYLkTGVHsusBDX0PX8pz3JNV3VUlxDRYmioODOLFe', 'user', 6110, '2026-08-17 14:02:40'),
(6, 'DrAg0nX', '251142@virtualwindow.co.za', '$2y$10$sZw9caDRIynwEGEyG38TzucTUdZrBmwqkp5pRqOcz06Z24QlHefgW', 'user', 0, '2026-08-17 15:08:04'),
(7, 'Manchester United', 'manu@gmail.com', '$2y$10$MDxF72d6vyQGtsTXkCDt..1xGqSE7x3QjRNXRThaefCcwaxkPr35O', 'user', 0, '2026-08-20 11:05:08');

-- --------------------------------------------------------

--
-- Structure for view `entry_feed_view`
--
DROP TABLE IF EXISTS `entry_feed_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `entry_feed_view`  AS SELECT `e`.`entry_id` AS `entry_id`, `e`.`user_id` AS `user_id`, `e`.`title` AS `title`, `e`.`game` AS `game`, `e`.`type` AS `type`, `e`.`description` AS `description`, `e`.`file_path` AS `file_path`, `e`.`rep_awarded` AS `rep_awarded`, `e`.`created_at` AS `created_at`, `u`.`username` AS `username`, (select count(0) from `likes` `l` where `l`.`entry_id` = `e`.`entry_id`) AS `like_count` FROM (`entries` `e` join `users` `u` on(`u`.`user_id` = `e`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `leaderboard_view`
--
DROP TABLE IF EXISTS `leaderboard_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leaderboard_view`  AS SELECT `users`.`user_id` AS `user_id`, `users`.`username` AS `username`, `users`.`rep` AS `rep`, rank() over ( order by `users`.`rep` desc) AS `position` FROM `users` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD UNIQUE KEY `unique_like` (`entry_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `entries`
--
ALTER TABLE `entries`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`entry_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `entries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`entry_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
