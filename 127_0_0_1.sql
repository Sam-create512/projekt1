-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hostiteľ: 127.0.0.1
-- Čas generovania: Št 30.Apr 2026, 13:08
-- Verzia serveru: 10.4.32-MariaDB
-- Verzia PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáza: `block`
--
CREATE DATABASE IF NOT EXISTS `block` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `block`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `posts`
--
-- Error reading structure for table block.posts: #1932 - Table &#039;block.posts&#039; doesn&#039;t exist in engine
-- Error reading data for table block.posts: #1064 - Something is wrong in your syntax blízko &#039;FROM `block`.`posts`&#039; na riadku 1

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--
-- Error reading structure for table block.users: #1932 - Table &#039;block.users&#039; doesn&#039;t exist in engine
-- Error reading data for table block.users: #1064 - Something is wrong in your syntax blízko &#039;FROM `block`.`users`&#039; na riadku 1
--
-- Databáza: `company_training`
--
CREATE DATABASE IF NOT EXISTS `company_training` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `company_training`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `hire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `hire_date`) VALUES
(1, 'Jakub', 'Košťal', '0000-00-00'),
(2, 'Jana', 'Jánošíková', '0000-00-00'),
(3, 'Milan', 'Podmanický', '0000-00-00');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `employee_profile`
--

CREATE TABLE `employee_profile` (
  `profile_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `employee_profile`
--

INSERT INTO `employee_profile` (`profile_id`, `employee_id`, `phone`, `address`) VALUES
(1, 1, '023456789', '615'),
(2, 2, '045689482', '789'),
(3, 3, '056897456', '155');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `employee_trainings`
--

CREATE TABLE `employee_trainings` (
  `employee_id` int(11) NOT NULL,
  `training_id` int(11) NOT NULL,
  `completion_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `trainings`
--

CREATE TABLE `trainings` (
  `training_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `duration_hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `training_categories`
--

CREATE TABLE `training_categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexy pre tabuľku `employee_profile`
--
ALTER TABLE `employee_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexy pre tabuľku `employee_trainings`
--
ALTER TABLE `employee_trainings`
  ADD PRIMARY KEY (`employee_id`,`training_id`),
  ADD KEY `training_id` (`training_id`);

--
-- Indexy pre tabuľku `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`training_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexy pre tabuľku `training_categories`
--
ALTER TABLE `training_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `employee_profile`
--
ALTER TABLE `employee_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `trainings`
--
ALTER TABLE `trainings`
  MODIFY `training_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pre tabuľku `training_categories`
--
ALTER TABLE `training_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `employee_profile`
--
ALTER TABLE `employee_profile`
  ADD CONSTRAINT `employee_profile_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Obmedzenie pre tabuľku `employee_trainings`
--
ALTER TABLE `employee_trainings`
  ADD CONSTRAINT `employee_trainings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_trainings_ibfk_2` FOREIGN KEY (`training_id`) REFERENCES `trainings` (`training_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Obmedzenie pre tabuľku `trainings`
--
ALTER TABLE `trainings`
  ADD CONSTRAINT `trainings_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `training_categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Databáza: `dbschool`
--
CREATE DATABASE IF NOT EXISTS `dbschool` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dbschool`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `class`
--

INSERT INTO `class` (`class_id`, `class_name`) VALUES
(1, '1.A'),
(2, '1.B'),
(3, '2.A'),
(4, '2.B'),
(5, '3.A');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `student`
--

INSERT INTO `student` (`student_id`, `name`, `surname`, `class_id`) VALUES
(1, 'Ján', 'Novák', 3),
(2, 'Eva', 'Kováčová', 3),
(3, 'Peter', 'Horváth', 4),
(4, 'Lucia', 'Mravcová', 4),
(5, 'Marek', 'Hudec', 5),
(6, 'Zuzana', 'Križová', 5),
(7, 'Adam', 'Blažek', 1),
(8, 'Katarína', 'Pavlíková', 2),
(9, 'Tomáš', 'Čierny', 2),
(10, 'Barbora', 'Bieliková', 1);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `studentdetail`
--

CREATE TABLE `studentdetail` (
  `detail_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `studentdetail`
--

INSERT INTO `studentdetail` (`detail_id`, `address`, `phone`, `student_id`) VALUES
(11, 'Hlavná 12, Bratislava', '0905123456', 1),
(12, 'Dlhá 5, Košice', '0906123456', 2),
(13, 'Lesná 8, Nitra', '0918123456', 3),
(14, 'Družstevná 22, Trenčín', '0908123123', 4),
(15, 'Lipová 9, Žilina', '0907123000', 5),
(16, 'Parková 15, Banská Bystrica', '0940123000', 6),
(17, 'Dolná 3, Trnava', '0908999999', 7),
(18, 'Polná 6, Poprad', '0910555444', 8),
(19, 'Slnečná 7, Prešov', '0902555111', 9),
(20, 'Jarná 18, Bratislava', '0909333444', 10);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `student_subject`
--

CREATE TABLE `student_subject` (
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `student_subject`
--

INSERT INTO `student_subject` (`student_id`, `subject_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 4),
(3, 6),
(4, 2),
(4, 3),
(4, 7),
(5, 4),
(5, 5),
(5, 6),
(5, 8),
(6, 2),
(6, 3),
(6, 7),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 3),
(8, 5),
(9, 2),
(9, 3),
(9, 6),
(9, 7),
(10, 1),
(10, 3),
(10, 4);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`) VALUES
(1, 'Matematika'),
(2, 'Slovenký jazyk'),
(3, 'Angličtina'),
(4, 'Programovanie'),
(5, 'Databázy'),
(6, 'Fyzika'),
(7, 'Dejepis'),
(8, 'Geografia');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexy pre tabuľku `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexy pre tabuľku `studentdetail`
--
ALTER TABLE `studentdetail`
  ADD PRIMARY KEY (`detail_id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Indexy pre tabuľku `student_subject`
--
ALTER TABLE `student_subject`
  ADD PRIMARY KEY (`student_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexy pre tabuľku `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pre tabuľku `studentdetail`
--
ALTER TABLE `studentdetail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pre tabuľku `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Obmedzenie pre tabuľku `studentdetail`
--
ALTER TABLE `studentdetail`
  ADD CONSTRAINT `studentdetail_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Obmedzenie pre tabuľku `student_subject`
--
ALTER TABLE `student_subject`
  ADD CONSTRAINT `student_subject_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_subject_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Databáza: `db_user`
--
CREATE DATABASE IF NOT EXISTS `db_user` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `db_user`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `age` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `age`) VALUES
(1, 'Tomas', 'Varecha', 11),
(2, 'Michal', 'Kratky', 15),
(3, 'Janka ', 'Horka', 20),
(4, 'Ivan', 'Panvica', 15),
(5, 'Radka', 'Kruta', 16),
(6, 'Peter', 'Sykora', 20);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Databáza: `db_users`
--
CREATE DATABASE IF NOT EXISTS `db_users` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `db_users`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `id` int(8) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(80) DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `password` (`password`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- Databáza: `dom`
--
CREATE DATABASE IF NOT EXISTS `dom` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dom`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `osoba`
--
-- Error reading structure for table dom.osoba: #1932 - Table &#039;dom.osoba&#039; doesn&#039;t exist in engine
-- Error reading data for table dom.osoba: #1064 - Something is wrong in your syntax blízko &#039;FROM `dom`.`osoba`&#039; na riadku 1
--
-- Databáza: `dtbz`
--
CREATE DATABASE IF NOT EXISTS `dtbz` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `dtbz`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Technology'),
(2, 'Health'),
(3, 'Travel'),
(4, 'Programming');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comment_text`) VALUES
(1, 1, 2, 'Great insights on AI trends!'),
(2, 1, 3, 'Interesting read, thanks for sharing.'),
(3, 2, 1, 'I totally agree with these tips!'),
(4, 3, 4, 'Can’t wait to visit these places!'),
(5, 4, 2, 'This is super helpful, thank you!');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `likes_count` int(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`, `comment_id`, `likes_count`) VALUES
(1, 2, 2, NULL, 7),
(2, 3, 1, NULL, 12),
(4, 4, 3, 2, 50),
(5, 3, 4, NULL, 30);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`) VALUES
(1, 1, 'Tech Trends 2023', 'Exploring the latest in AI and ML.'),
(2, 2, 'Healthy Living', 'Tips for a healthier lifestyle.'),
(3, 3, 'Travel Adventures', 'Top destinations for 2023.'),
(4, 1, 'Coding Best Practices', 'How to write clean and efficient code.');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `post_categories`
--

CREATE TABLE `post_categories` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `post_categories`
--

INSERT INTO `post_categories` (`post_id`, `category_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `post_tags`
--

CREATE TABLE `post_tags` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'AI'),
(2, 'Machine Learning'),
(3, 'Healthy Living'),
(4, 'Adventure'),
(5, 'Clean Code');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `users`
--

INSERT INTO `users` (`id`, `name`, `email`) VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Smith', 'jane.smith@example.com'),
(3, 'Alice Brown', 'alice.brown@example.com'),
(4, 'Bob White', 'bob.white@example.com');

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pre tabuľku `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexy pre tabuľku `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexy pre tabuľku `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexy pre tabuľku `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexy pre tabuľku `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pre tabuľku `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pre tabuľku `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `post_categories`
--
ALTER TABLE `post_categories`
  ADD CONSTRAINT `post_categories_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Obmedzenie pre tabuľku `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
--
-- Databáza: `filmoteka`
--
CREATE DATABASE IF NOT EXISTS `filmoteka` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `filmoteka`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `film`
--
-- Error reading structure for table filmoteka.film: #1932 - Table &#039;filmoteka.film&#039; doesn&#039;t exist in engine
-- Error reading data for table filmoteka.film: #1064 - Something is wrong in your syntax blízko &#039;FROM `filmoteka`.`film`&#039; na riadku 1

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `film_herec`
--
-- Error reading structure for table filmoteka.film_herec: #1932 - Table &#039;filmoteka.film_herec&#039; doesn&#039;t exist in engine
-- Error reading data for table filmoteka.film_herec: #1064 - Something is wrong in your syntax blízko &#039;FROM `filmoteka`.`film_herec`&#039; na riadku 1

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `film_reziser`
--
-- Error reading structure for table filmoteka.film_reziser: #1932 - Table &#039;filmoteka.film_reziser&#039; doesn&#039;t exist in engine
-- Error reading data for table filmoteka.film_reziser: #1064 - Something is wrong in your syntax blízko &#039;FROM `filmoteka`.`film_reziser`&#039; na riadku 1

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `film_zaner`
--
-- Error reading structure for table filmoteka.film_zaner: #1932 - Table &#039;filmoteka.film_zaner&#039; doesn&#039;t exist in engine
-- Error reading data for table filmoteka.film_zaner: #1064 - Something is wrong in your syntax blízko &#039;FROM `filmoteka`.`film_zaner`&#039; na riadku 1

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `herec`
--
-- Error reading structure for table filmoteka.herec: #1932 - Table &#039;filmoteka.herec&#039; doesn&#039;t exist in engine
-- Error reading data for table filmoteka.herec: #1064 - Something is wrong in your syntax blízko &#039;FROM `filmoteka`.`herec`&#039; na riadku 1

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `hodnotenie`
--
-- Error reading structure for table filmoteka.hodnotenie: #1932 - Table &#039;filmoteka.hodnotenie&#039; doesn&#039;t exist in engine
-- Error reading data for table filmoteka.hodnotenie: #1064 - Something is wrong in your syntax blízko &#039;FROM `filmoteka`.`hodnotenie`&#039; na riadku 1

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `reziser`
--
-- Error reading structure for table filmoteka.reziser: #1932 - Table &#039;filmoteka.reziser&#039; doesn&#039;t exist in engine
-- Error reading data for table filmoteka.reziser: #1064 - Something is wrong in your syntax blízko &#039;FROM `filmoteka`.`reziser`&#039; na riadku 1

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `zaner`
--
-- Error reading structure for table filmoteka.zaner: #1932 - Table &#039;filmoteka.zaner&#039; doesn&#039;t exist in engine
-- Error reading data for table filmoteka.zaner: #1064 - Something is wrong in your syntax blízko &#039;FROM `filmoteka`.`zaner`&#039; na riadku 1
--
-- Databáza: `kniznica`
--
CREATE DATABASE IF NOT EXISTS `kniznica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `kniznica`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `knihy`
--

CREATE TABLE `knihy` (
  `id` int(10) NOT NULL,
  `nazov` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `rok_vydania` int(10) NOT NULL,
  `stav` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Sťahujem dáta pre tabuľku `knihy`
--

INSERT INTO `knihy` (`id`, `nazov`, `autor`, `rok_vydania`, `stav`) VALUES
(9, 'Harry Potter', 'Janko Slivka', 2000, 1),
(12, 'Harry Potter', 'Janko Slivka', 2000, 1);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `knihy`
--
ALTER TABLE `knihy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `knihy`
--
ALTER TABLE `knihy`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Databáza: `mesta`
--
CREATE DATABASE IF NOT EXISTS `mesta` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mesta`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `miesta`
--

CREATE TABLE `miesta` (
  `id` int(11) NOT NULL,
  `nazov` varchar(50) NOT NULL,
  `typ` enum('park','fitness','oddych') NOT NULL,
  `obsadenost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `miesta`
--

INSERT INTO `miesta` (`id`, `nazov`, `typ`, `obsadenost`) VALUES
(1, 'Mestský park Sihoť', 'park', 40),
(2, 'Park na Sihoti', 'park', 55),
(3, 'Kalvária', 'oddych', 30),
(4, 'Fitko ABC', 'fitness', 33),
(5, 'Fitcentrum Olympia', 'fitness', 24),
(6, 'Park Chrenová', 'park', 35),
(7, 'Relax zóna Krškany', 'oddych', 20),
(8, 'City Gym', 'fitness', 41),
(9, 'Zobor lesopark', 'oddych', 25),
(10, 'Univerzitný park', 'park', 42),
(11, 'Workout ihrisko Klokočina', 'fitness', 12),
(12, 'Oddychová zóna Párovce', 'oddych', 33);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `miesta`
--
ALTER TABLE `miesta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `miesta`
--
ALTER TABLE `miesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Databáza: `miesta`
--
CREATE DATABASE IF NOT EXISTS `miesta` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `miesta`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `miesta`
--

CREATE TABLE `miesta` (
  `id` int(11) NOT NULL,
  `nazov` varchar(50) NOT NULL,
  `typ` enum('park','fitness','oddych') NOT NULL,
  `obsadenost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Sťahujem dáta pre tabuľku `miesta`
--

INSERT INTO `miesta` (`id`, `nazov`, `typ`, `obsadenost`) VALUES
(1, 'Mestský park Sihoť', 'park', 40),
(2, 'Park na Sihoti', 'park', 55),
(3, 'Kalvária', 'oddych', 30),
(4, 'Fitko ABC', 'fitness', 33),
(5, 'Fitcentrum Olympia', 'fitness', 24),
(6, 'Park Chrenová', 'park', 35),
(7, 'Relax zóna Krškany', 'oddych', 20),
(8, 'City Gym', 'fitness', 41),
(9, 'Zobor lesopark', 'oddych', 25),
(10, 'Univerzitný park', 'park', 42),
(11, 'Workout ihrisko Klokočina', 'fitness', 12),
(12, 'Oddychová zóna Párovce', 'oddych', 33);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `miesta`
--
ALTER TABLE `miesta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `miesta`
--
ALTER TABLE `miesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Databáza: `miestnost`
--
CREATE DATABASE IF NOT EXISTS `miestnost` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `miestnost`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--
-- Error reading structure for table miestnost.users: #1932 - Table &#039;miestnost.users&#039; doesn&#039;t exist in engine
-- Error reading data for table miestnost.users: #1064 - Something is wrong in your syntax blízko &#039;FROM `miestnost`.`users`&#039; na riadku 1
--
-- Databáza: `moja_databaza`
--
CREATE DATABASE IF NOT EXISTS `moja_databaza` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `moja_databaza`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `uzivatelia`
--

CREATE TABLE `uzivatelia` (
  `id_uzivatel` int(11) NOT NULL,
  `meno` varchar(60) DEFAULT NULL,
  `priezvisko` varchar(60) DEFAULT NULL,
  `vek` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `uzivatelia`
--
ALTER TABLE `uzivatelia`
  ADD PRIMARY KEY (`id_uzivatel`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `uzivatelia`
--
ALTER TABLE `uzivatelia`
  MODIFY `id_uzivatel` int(11) NOT NULL AUTO_INCREMENT;
--
-- Databáza: `moja_skupina`
--
CREATE DATABASE IF NOT EXISTS `moja_skupina` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `moja_skupina`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `spoluziaci`
--
-- Error reading structure for table moja_skupina.spoluziaci: #1932 - Table &#039;moja_skupina.spoluziaci&#039; doesn&#039;t exist in engine
-- Error reading data for table moja_skupina.spoluziaci: #1064 - Something is wrong in your syntax blízko &#039;FROM `moja_skupina`.`spoluziaci`&#039; na riadku 1
--
-- Databáza: `nová_databaza`
--
CREATE DATABASE IF NOT EXISTS `nová_databaza` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `nová_databaza`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `users`
--
-- Error reading structure for table nová_databaza.users: #1932 - Table &#039;nová_databaza.users&#039; doesn&#039;t exist in engine
-- Error reading data for table nová_databaza.users: #1064 - Something is wrong in your syntax blízko &#039;FROM `nová_databaza`.`users`&#039; na riadku 1
--
-- Databáza: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Sťahujem dáta pre tabuľku `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Sťahujem dáta pre tabuľku `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"db_users\",\"table\":\"users\"},{\"db\":\"kniznica\",\"table\":\"knihy\"},{\"db\":\"triedy\",\"table\":\"ziaci\"},{\"db\":\"miesta\",\"table\":\"miesta\"},{\"db\":\"triedy\",\"table\":\"triedy\"},{\"db\":\"company_training\",\"table\":\"trainings\"},{\"db\":\"company_training\",\"table\":\"employee_trainings\"},{\"db\":\"company_training\",\"table\":\"employee_profile\"},{\"db\":\"company_training\",\"table\":\"employees\"},{\"db\":\"company_training\",\"table\":\"training_categories\"}]');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Sťahujem dáta pre tabuľku `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-04-30 09:39:39', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"sk\"}');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pre tabuľku `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexy pre tabuľku `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexy pre tabuľku `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexy pre tabuľku `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexy pre tabuľku `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexy pre tabuľku `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexy pre tabuľku `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexy pre tabuľku `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexy pre tabuľku `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexy pre tabuľku `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexy pre tabuľku `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexy pre tabuľku `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexy pre tabuľku `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexy pre tabuľku `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexy pre tabuľku `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexy pre tabuľku `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexy pre tabuľku `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexy pre tabuľku `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pre tabuľku `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Databáza: `skuska`
--
CREATE DATABASE IF NOT EXISTS `skuska` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `skuska`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `osoba`
--
-- Error reading structure for table skuska.osoba: #1932 - Table &#039;skuska.osoba&#039; doesn&#039;t exist in engine
-- Error reading data for table skuska.osoba: #1064 - Something is wrong in your syntax blízko &#039;FROM `skuska`.`osoba`&#039; na riadku 1
--
-- Databáza: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Databáza: `triedy`
--
CREATE DATABASE IF NOT EXISTS `triedy` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `triedy`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `triedy`
--

CREATE TABLE `triedy` (
  `id_triedy` int(11) NOT NULL,
  `nazov` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `triedy`
--

INSERT INTO `triedy` (`id_triedy`, `nazov`) VALUES
(1, '1.AI'),
(2, '1.AT'),
(3, '3.AT');

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `ziaci`
--

CREATE TABLE `ziaci` (
  `id_ziak` int(11) NOT NULL,
  `meno` varchar(15) DEFAULT NULL,
  `id_triedy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `ziaci`
--

INSERT INTO `ziaci` (`id_ziak`, `meno`, `id_triedy`) VALUES
(13, 'Adam', 1),
(14, 'Fero', 1),
(15, 'Miro', 2),
(16, 'Maja', NULL);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `triedy`
--
ALTER TABLE `triedy`
  ADD PRIMARY KEY (`id_triedy`);

--
-- Indexy pre tabuľku `ziaci`
--
ALTER TABLE `ziaci`
  ADD PRIMARY KEY (`id_ziak`),
  ADD KEY `id_triedy` (`id_triedy`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `triedy`
--
ALTER TABLE `triedy`
  MODIFY `id_triedy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pre tabuľku `ziaci`
--
ALTER TABLE `ziaci`
  MODIFY `id_ziak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Obmedzenie pre exportované tabuľky
--

--
-- Obmedzenie pre tabuľku `ziaci`
--
ALTER TABLE `ziaci`
  ADD CONSTRAINT `ziaci_ibfk_1` FOREIGN KEY (`id_triedy`) REFERENCES `triedy` (`id_triedy`) ON DELETE SET NULL ON UPDATE CASCADE;
--
-- Databáza: `ziaci`
--
CREATE DATABASE IF NOT EXISTS `ziaci` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ziaci`;

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `spoluziaci`
--

CREATE TABLE `spoluziaci` (
  `id_ziak` int(11) NOT NULL,
  `meno` varchar(15) DEFAULT NULL,
  `priezvisko` varchar(20) DEFAULT NULL,
  `vek` int(3) DEFAULT NULL,
  `pocet_surodencov` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `spoluziaci`
--

INSERT INTO `spoluziaci` (`id_ziak`, `meno`, `priezvisko`, `vek`, `pocet_surodencov`) VALUES
(1, 'Matias', 'Rabik', 16, 1),
(2, 'Bruno', 'Vojtek', 17, 2),
(3, 'Martin', 'Mitka', 16, 1),
(4, 'Lukas', 'Makky', 16, 3),
(5, 'Daniel', 'Pokorny', 17, 2),
(6, 'Stefan', 'Piesecky', 17, 3),
(7, 'Alex', 'Slivka', 16, 2),
(8, 'David', 'Sopor', 16, 1),
(9, 'Samuel', 'Smrecek', 16, 2),
(10, 'Samuel', 'Svoboda', 17, 1),
(11, 'Jozef', 'Tarfa', 17, 3),
(12, 'Samuel', 'Sutek', 16, 2),
(13, 'Oliver', 'Mravec', 17, 2),
(14, 'Nastia', 'Zherdevia', 16, 3);

-- --------------------------------------------------------

--
-- Štruktúra tabuľky pre tabuľku `ziak`
--

CREATE TABLE `ziak` (
  `id_ziak` int(11) NOT NULL,
  `meno` varchar(15) DEFAULT NULL,
  `priezvisko` varchar(20) DEFAULT NULL,
  `vek` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Sťahujem dáta pre tabuľku `ziak`
--

INSERT INTO `ziak` (`id_ziak`, `meno`, `priezvisko`, `vek`) VALUES
(6, 'Fero', 'Mrk', 150),
(12, 'Stano', 'Kral', 15),
(15, 'Jakub', 'Hruska', 12),
(16, 'Adam', 'Kostal', 25),
(18, 'Pavol', 'Kral', 20);

--
-- Kľúče pre exportované tabuľky
--

--
-- Indexy pre tabuľku `spoluziaci`
--
ALTER TABLE `spoluziaci`
  ADD PRIMARY KEY (`id_ziak`);

--
-- Indexy pre tabuľku `ziak`
--
ALTER TABLE `ziak`
  ADD PRIMARY KEY (`id_ziak`);

--
-- AUTO_INCREMENT pre exportované tabuľky
--

--
-- AUTO_INCREMENT pre tabuľku `spoluziaci`
--
ALTER TABLE `spoluziaci`
  MODIFY `id_ziak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pre tabuľku `ziak`
--
ALTER TABLE `ziak`
  MODIFY `id_ziak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
