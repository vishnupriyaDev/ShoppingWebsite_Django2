-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2022 at 04:49 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `register1_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `app6_cart_tb`
--

CREATE TABLE `app6_cart_tb` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `totalamount` varchar(225) NOT NULL,
  `quantity` varchar(225) NOT NULL,
  `status` varchar(225) NOT NULL,
  `pid_id` bigint(20) NOT NULL,
  `uid_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app6_cart_tb`
--

INSERT INTO `app6_cart_tb` (`id`, `image`, `totalamount`, `quantity`, `status`, `pid_id`, `uid_id`) VALUES
(2, '', '1365.0', '2', 'paid', 4, 1),
(3, '', '1650.0', '1', 'paid', 5, 1),
(4, '', '6200.0', '3', 'paid', 6, 1),
(5, '', '1100.0', '1', 'paid', 3, 1),
(6, '', '715.0', '1', 'pending', 4, 1),
(7, '', '1650.0', '1', 'pending', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app6_payment_tb`
--

CREATE TABLE `app6_payment_tb` (
  `id` bigint(20) NOT NULL,
  `status` varchar(225) NOT NULL,
  `total` varchar(225) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `uid_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app6_payment_tb`
--

INSERT INTO `app6_payment_tb` (`id`, `status`, `total`, `date`, `time`, `uid_id`) VALUES
(1, 'paid', '10315.0', '2022-12-15', '09:24:38.986276', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app6_prd_tb`
--

CREATE TABLE `app6_prd_tb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(225) NOT NULL,
  `price` varchar(225) NOT NULL,
  `desc` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `gender` varchar(225) NOT NULL,
  `category` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app6_prd_tb`
--

INSERT INTO `app6_prd_tb` (`id`, `name`, `price`, `desc`, `image`, `gender`, `category`) VALUES
(3, 'Kurthi', '1000', 'Silky and black coloured', 'product/p5.jpg', 'women', 'Clothing'),
(4, 'BAG', '650', 'Leather and soft', 'product/p11.jpg', 'women', 'Bags'),
(5, 'SHOES', '1500', 'Leather and soft', 'product/p10.jpg', 'men', 'Footwear'),
(6, 'WATCH', '2000', 'Stylish Watch', 'product/p9.jpg', 'men', 'Watches');

-- --------------------------------------------------------

--
-- Table structure for table `app6_register_tb`
--

CREATE TABLE `app6_register_tb` (
  `id` bigint(20) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `phonenumber` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app6_register_tb`
--

INSERT INTO `app6_register_tb` (`id`, `name`, `email`, `phonenumber`, `password`) VALUES
(1, 'vp', 'vp@gmail.com', '122269877996', '123'),
(2, 'rs', 'rs@gmail.com', '789456123332', '456');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(25, 'Can add prd_tb', 7, 'add_prd_tb'),
(26, 'Can change prd_tb', 7, 'change_prd_tb'),
(27, 'Can delete prd_tb', 7, 'delete_prd_tb'),
(28, 'Can view prd_tb', 7, 'view_prd_tb'),
(29, 'Can add register_tb', 8, 'add_register_tb'),
(30, 'Can change register_tb', 8, 'change_register_tb'),
(31, 'Can delete register_tb', 8, 'delete_register_tb'),
(32, 'Can view register_tb', 8, 'view_register_tb'),
(33, 'Can add cart_tb', 9, 'add_cart_tb'),
(34, 'Can change cart_tb', 9, 'change_cart_tb'),
(35, 'Can delete cart_tb', 9, 'delete_cart_tb'),
(36, 'Can view cart_tb', 9, 'view_cart_tb'),
(45, 'Can add payment_tb', 12, 'add_payment_tb'),
(46, 'Can change payment_tb', 12, 'change_payment_tb'),
(47, 'Can delete payment_tb', 12, 'delete_payment_tb'),
(48, 'Can view payment_tb', 12, 'view_payment_tb');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'admin', NULL, 0, 'admin', '', '', 'admin@gmail.com', 0, 0, '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'app6', 'cart_tb'),
(12, 'app6', 'payment_tb'),
(7, 'app6', 'prd_tb'),
(8, 'app6', 'register_tb'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-14 03:44:58.507687'),
(2, 'auth', '0001_initial', '2022-12-14 03:45:03.831856'),
(3, 'admin', '0001_initial', '2022-12-14 03:45:05.159237'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-12-14 03:45:05.221697'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-14 03:45:05.252939'),
(6, 'app6', '0001_initial', '2022-12-14 03:45:06.862147'),
(7, 'contenttypes', '0002_remove_content_type_name', '2022-12-14 03:45:07.241726'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-12-14 03:45:07.913851'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-12-14 03:45:08.241807'),
(10, 'auth', '0004_alter_user_username_opts', '2022-12-14 03:45:08.273048'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-12-14 03:45:08.585477'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-12-14 03:45:08.616728'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-12-14 03:45:08.663607'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-12-14 03:45:08.726126'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-12-14 03:45:08.819797'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-12-14 03:45:08.897961'),
(17, 'auth', '0011_update_proxy_permissions', '2022-12-14 03:45:08.929168'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-12-14 03:45:09.007250'),
(19, 'sessions', '0001_initial', '2022-12-14 03:45:09.882170'),
(20, 'app6', '0002_payment_tb', '2022-12-15 03:43:17.632815');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3c3621l39l8w4j7nesj4xb4mx3tzq1co', 'eyJpZDEiOjEsIm5hbWUxIjoiYWRtaW4iLCJteWlkIjoxLCJteW5hbWUiOiJ2cCJ9:1p2lTU:9JZrIX5tPQ8CXzIWYc4XbhB-SxPkCZg7mRDzHx0UD2Q', '2022-12-21 03:52:00.094382'),
('5g6bj3r6mm8gycav8s2zye9azbkocsez', 'e30:1p0d2R:M5hrX1Ca95dZyfAB926Ry_ptPdgW2qYalK8q4Ct8RGQ', '2022-12-15 06:27:15.498774'),
('dx2bico97v20gfj262pzxja346nljl3c', 'eyJteWlkIjoxLCJteW5hbWUiOiJ2cCJ9:1p5fHw:j6Cb91YKpO1_kYI0eR6mS7Z1PMRbvtL2mtFN3lUfyFE', '2022-12-29 03:52:04.798477'),
('sydqln5kmwuz409spj5kwn94voh80vhk', 'eyJteWlkIjoxLCJteW5hbWUiOiJ2cCJ9:1p5Il0:CkfJ-zMcKPdfmDrD4_kOutb8IKnH002XXeuEa2_YCtg', '2022-12-28 03:48:34.271278'),
('wridjvdt2bu2gf8wipyy046jsokyj9f2', 'eyJteWlkIjoxLCJteW5hbWUiOiJ2cCJ9:1p4xgb:EiXPAXNzE3d3tpQg4Y1TWmi1jo5SQ0HAnoqRm1-M-00', '2022-12-27 05:18:37.089379');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app6_cart_tb`
--
ALTER TABLE `app6_cart_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app6_cart_tb_pid_id_38915576_fk_app6_prd_tb_id` (`pid_id`),
  ADD KEY `app6_cart_tb_uid_id_57a3acc7_fk_app6_register_tb_id` (`uid_id`);

--
-- Indexes for table `app6_payment_tb`
--
ALTER TABLE `app6_payment_tb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app6_payment_tb_uid_id_999a8b74_fk_app6_register_tb_id` (`uid_id`);

--
-- Indexes for table `app6_prd_tb`
--
ALTER TABLE `app6_prd_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app6_register_tb`
--
ALTER TABLE `app6_register_tb`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app6_cart_tb`
--
ALTER TABLE `app6_cart_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `app6_payment_tb`
--
ALTER TABLE `app6_payment_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app6_prd_tb`
--
ALTER TABLE `app6_prd_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app6_register_tb`
--
ALTER TABLE `app6_register_tb`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app6_cart_tb`
--
ALTER TABLE `app6_cart_tb`
  ADD CONSTRAINT `app6_cart_tb_pid_id_38915576_fk_app6_prd_tb_id` FOREIGN KEY (`pid_id`) REFERENCES `app6_prd_tb` (`id`),
  ADD CONSTRAINT `app6_cart_tb_uid_id_57a3acc7_fk_app6_register_tb_id` FOREIGN KEY (`uid_id`) REFERENCES `app6_register_tb` (`id`);

--
-- Constraints for table `app6_payment_tb`
--
ALTER TABLE `app6_payment_tb`
  ADD CONSTRAINT `app6_payment_tb_uid_id_999a8b74_fk_app6_register_tb_id` FOREIGN KEY (`uid_id`) REFERENCES `app6_register_tb` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
