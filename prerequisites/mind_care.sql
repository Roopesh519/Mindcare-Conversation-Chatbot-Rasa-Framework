-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2024 at 02:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mind_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` bigint(20) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `is_enabled` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `user_type`, `name`, `contact`, `email`, `password`, `image`, `address`, `timestamp`, `is_enabled`) VALUES
(1, 'admin', 'Admin', '1234567890', 'admin@example.com', 'admin', '', 'admin address', '2024-05-27 19:12:47.734761', 1);

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` bigint(20) NOT NULL,
  `emotion` varchar(50) NOT NULL,
  `activity_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `is_enabled` int(11) NOT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `emotion`, `activity_name`, `type`, `image`, `is_enabled`, `timestamp`) VALUES
(1, 'sad', 'Meditation', 'meditation', 'activity/pexels-prasanth-inturi-1051838.jpg', 1, '2024-05-27 19:12:47.763529'),
(2, 'angry', 'Breathing Exercise', 'breathing', 'activity/pexels-ivan-samkov-6648547.jpg', 1, '2024-05-27 19:12:47.764526'),
(3, 'neutral', 'Walking', 'walking', 'activity/pexels-agung-pandit-wiguna-1149923.jpg', 1, '2024-05-27 19:12:47.765526'),
(4, 'happy', 'Music', 'music', 'activity/pexels-suvan-chowdhury-144429.jpg', 1, '2024-05-27 19:12:47.766547'),
(5, 'sad', 'Comedy clips', 'comedy', 'activity/pexels-gratisography-476.jpg', 1, '2024-05-27 19:12:47.767653');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add activity', 8, 'add_activity'),
(30, 'Can change activity', 8, 'change_activity'),
(31, 'Can delete activity', 8, 'delete_activity'),
(32, 'Can view activity', 8, 'view_activity'),
(33, 'Can add professionals', 9, 'add_professionals'),
(34, 'Can change professionals', 9, 'change_professionals'),
(35, 'Can delete professionals', 9, 'delete_professionals'),
(36, 'Can view professionals', 9, 'view_professionals'),
(37, 'Can add messages', 10, 'add_messages'),
(38, 'Can change messages', 10, 'change_messages'),
(39, 'Can delete messages', 10, 'delete_messages'),
(40, 'Can view messages', 10, 'view_messages');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'MindCareApp', 'activity'),
(10, 'MindCareApp', 'messages'),
(9, 'MindCareApp', 'professionals'),
(7, 'MindCareApp', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'MindCareApp', '0001_initial', '2024-05-27 19:12:47.738784'),
(2, 'MindCareApp', '0002_activity', '2024-05-27 19:12:47.770835'),
(3, 'MindCareApp', '0003_professionals', '2024-05-27 19:12:47.813433'),
(4, 'MindCareApp', '0004_professionals_specialty', '2024-05-27 19:12:47.830676'),
(5, 'MindCareApp', '0005_messages', '2024-05-27 19:12:47.906889'),
(6, 'MindCareApp', '0006_alter_messages_emotion', '2024-05-27 19:12:47.919990'),
(7, 'contenttypes', '0001_initial', '2024-05-27 19:12:47.953688'),
(8, 'auth', '0001_initial', '2024-05-27 19:12:48.482951'),
(9, 'admin', '0001_initial', '2024-05-27 19:12:48.604278'),
(10, 'admin', '0002_logentry_remove_auto_add', '2024-05-27 19:12:48.618469'),
(11, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-27 19:12:48.630526'),
(12, 'contenttypes', '0002_remove_content_type_name', '2024-05-27 19:12:48.739253'),
(13, 'auth', '0002_alter_permission_name_max_length', '2024-05-27 19:12:48.813354'),
(14, 'auth', '0003_alter_user_email_max_length', '2024-05-27 19:12:48.836990'),
(15, 'auth', '0004_alter_user_username_opts', '2024-05-27 19:12:48.854539'),
(16, 'auth', '0005_alter_user_last_login_null', '2024-05-27 19:12:48.909148'),
(17, 'auth', '0006_require_contenttypes_0002', '2024-05-27 19:12:48.916164'),
(18, 'auth', '0007_alter_validators_add_error_messages', '2024-05-27 19:12:48.929288'),
(19, 'auth', '0008_alter_user_username_max_length', '2024-05-27 19:12:48.947779'),
(20, 'auth', '0009_alter_user_last_name_max_length', '2024-05-27 19:12:48.969311'),
(21, 'auth', '0010_alter_group_name_max_length', '2024-05-27 19:12:48.988411'),
(22, 'auth', '0011_update_proxy_permissions', '2024-05-27 19:12:49.007538'),
(23, 'auth', '0012_alter_user_first_name_max_length', '2024-05-27 19:12:49.026701'),
(24, 'sessions', '0001_initial', '2024-05-27 19:12:49.071132');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('kk1kilf5b23n0y1isri3u37l6id0qlbl', '.eJwtTj0PgjAU_CukM8WmtNAw6eDAQoy6k4c8AUMpaTUOxv9uK93u3ce7-5CXQ1v3pOLpHzagkVTkbMyKbiQbeRrNEtiSKZFLVRZlFI4aptkLdrPvh3BnN6Ojfuh7i855R4Ngk4vRsMBzhOSKep0xDYzPvcFCTNQahlAV8C6uaDnjgkmuGBOS8eyxDt7t_OPJLO3kxxMlO0k7LHJKheronZLvD8CGRiQ:1sGdhO:POy9znBQu4fMprOOMjCieLzgt3gYoqBzBqI94Txxpuw', '2024-06-24 12:00:30.648715'),
('o8pwy7ckuql5cr2hxq3ha65vye44bvyo', '.eJwtTj0PgjAU_CvkzRSbUmxl0sGBhRh1Jy-2AoZS0mocjP_dVrrdu49394GX165RULP8D1s0Gmo4W7toP8BKngY7R1ZQyctKiq1IwtHgOAXBrfZ9H-_iZk3SD0o57X1wtBpddrEGZ3wOmF21WSadRybk3ugwJRqDfayKeJNWdIwyTismKeUVZcVj6YPbh8ejnbsxjAemuCSlUDtC-J0TReD7A74sRfc:1sDpHB:WvJLr9obbE5WCANy0LM6ix7-TtKb9z3GqhJQNE_-Ckg', '2024-06-16 17:45:49.389803');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `session_id` varchar(20) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `emotion` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `session_id`, `sender`, `emotion`, `content`, `created_at`, `user_id`) VALUES
(1, '0185-1886--1af-a-', '', 'sad', 'recommend me a beautiful music', '2024-05-28 05:58:09.309424', 2),
(2, '2548-0043--8e1-e-', '', 'sad', 'recommend me music', '2024-06-02 15:25:39.497460', 2),
(3, 'b3f3-b72c--b68-f-', '', 'sad', 'recommend me music', '2024-06-02 15:31:49.839748', 2),
(4, '4e8b-b22b--8b8-3-', '', 'sad', 'recommend me music', '2024-06-02 16:19:13.009079', 2),
(5, 'f69d-71f7--a7e-d-', '', 'sad', 'recommend me music', '2024-06-02 16:33:09.395397', 2),
(6, '4a01-1336--83b-d-', '', 'sad', 'recommend me music', '2024-06-02 16:38:29.219680', 2),
(7, 'df54-c280--66f-2-', '', 'sad', 'recommend me music', '2024-06-02 17:45:43.496724', 2);

-- --------------------------------------------------------

--
-- Table structure for table `professionals`
--

CREATE TABLE `professionals` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `location` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `is_enabled` int(11) NOT NULL,
  `specialty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `professionals`
--

INSERT INTO `professionals` (`id`, `name`, `contact`, `email`, `image`, `location`, `timestamp`, `is_enabled`, `specialty`) VALUES
(1, 'Basavaprabhu', '9783547904', 'basavaachappa436@gmail.com', 'professionals\\basavaprabhu.webp', 'Mangalore', '2024-04-08 07:05:53.133888', 1, 'Counselling Psychologists'),
(2, 'Krithishree', '9876543210', 'krithi@gmail.com', 'professionals\\krithika.jpg', 'Mangalore', '2024-04-08 07:05:53.133888', 1, 'Educational Psychologists'),
(3, 'Anil Kakunje', '8511767226', 'anilk@egmail.com', 'professionals\\anilkakunje.png', 'Lalbhag', '2024-04-08 07:05:53.140946', 1, 'Counselling Psychologists'),
(4, 'Supriya hegde', '9877543216', 'supriyahegde@gmail.com', 'professionals\\Supriya.webp', 'Jyothi', '2024-04-08 07:05:53.140946', 1, 'Cognitive and Perceptual Psychologists.'),
(5, 'Kiran Kumar', '9633864522', 'kiran kumar@gmail.com', 'professionals\\kirankumar.jpg', 'Ballalbhag', '2024-04-08 07:05:53.149327', 1, 'Educational Psychologists'),
(6, 'Mahesh B S', '9769878822', 'karan@example.com', 'professionals\\mahesh.png', 'Ballalbhag', '2024-04-08 07:05:53.149327', 1, ' Cognitive and Perceptual Psychologists.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact` (`contact`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_70242949_fk_account_id` (`user_id`);

--
-- Indexes for table `professionals`
--
ALTER TABLE `professionals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact` (`contact`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `professionals`
--
ALTER TABLE `professionals`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_user_id_70242949_fk_account_id` FOREIGN KEY (`user_id`) REFERENCES `account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
