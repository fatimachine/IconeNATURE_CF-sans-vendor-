-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2022 at 09:59 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `icone_e-shop`
--
CREATE DATABASE IF NOT EXISTS `icone_e-shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `icone_e-shop`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `active`, `created_at`) VALUES
(1, 'T-shirt', 1, '2022-03-30 18:18:00'),
(2, 'Shirt', 1, '2022-03-30 18:57:15'),
(3, 'Robe', 1, '2022-03-31 09:49:03'),
(4, 'Sac', 1, '2022-04-01 15:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220330110957', '2022-03-30 13:10:06', 441),
('DoctrineMigrations\\Version20220330174103', '2022-03-30 19:41:14', 71),
('DoctrineMigrations\\Version20220330182333', '2022-03-30 20:23:52', 54),
('DoctrineMigrations\\Version20220330225019', '2022-03-31 00:50:37', 51),
('DoctrineMigrations\\Version20220404104740', '2022-04-04 12:47:52', 69);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ref_no` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_method` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` int(11) NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `product_name`, `product_ref_no`, `price`, `size`, `color`, `quantity`, `delivery_method`, `first_name`, `last_name`, `email`, `phone_no`, `address`, `post_code`, `city`, `created_at`) VALUES
(2, 'Sac', 'Sac à main e', '1.00', 'L', 'Begie', 1, 'click and collect', 'Imran', 'Hossain', 'imranhossain17@gmail.com', 751194581, '54 Avenue du General de Gaulle', 77500, 'Chelles', '2022-04-04 15:21:18'),
(3, 'Robe 2 set Femme', 'F03RB3001', '12500.00', 'X', 'noir', 1, 'Home Delivery', 'Imran', 'Hossain', 'imranhossain17@gmail.com', 751194581, '54 Avenue du General de Gaulle', 77500, 'Chelles', '2022-04-04 15:30:08'),
(4, 'assiette en toile de jute florale T-shirt femme', 'F10TS1002', '4500.00', 'm', 'Begie', 2, 'click and collect', 'Imran', 'Hossain', 'imranhossain17@gmail.com', 751194581, '54 Avenue du General de Gaulle', 77500, 'Chelles', '2022-04-05 10:54:47'),
(5, 'assiette en toile de jute florale T-shirt femme', 'F10TS1002', '4500.00', 'S', 'lhguy', 1, 'cnc', 'MD Imran', 'Hossain', 'imranhossain17@gmail.com', 2147483647, '48 Rue Massue', 94300, 'Vincennes', '2022-04-05 13:14:14');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_no` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `gender` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `reference_no`, `description`, `price`, `image`, `discount`, `color`, `size`, `active`, `created_at`, `gender`) VALUES
(1, 1, 'Chèque de toile de jute T-shirt homme', 'H01TS1001', 'L’article sur mon sac de voyage en toile de jute semble vous avoir beaucoup plu. Certaines m’ont d’ailleurs confié avoir de la toile de jute, mais ne pas savoir quoi en faire. Je me suis dit que c’était l’occasion de préparer un article.\nJ’ai vu énormément de belles choses sur Pinterest, que ce soit des accessoires mode ou de la déco. Ça n’a donc pas était facile de choisir. Voici mes coups de cœur ! Avis aux amatrices de DIY', '3900.00', '../upload/images/gptr,1265x,front,black-c,330,402,600,600-bg,f8f8f8.jpg', NULL, 'Noir & Beige', 'S, M, L, XXL', 1, '2022-03-30 19:31:40', 'Homme'),
(2, 1, 'assiette en toile de jute florale T-shirt femme', 'F10TS1002', 'L’article sur mon sac de voyage en toile de jute semble vous avoir beaucoup plu. Certaines m’ont d’ailleurs confié avoir de la toile de jute, mais ne pas savoir quoi en faire. Je me suis dit que c’était l’occasion de préparer un article.\nJ’ai vu énormément de belles choses sur Pinterest, que ce soit des accessoires mode ou de la déco. Ça n’a donc pas était facile de choisir. Voici mes coups de cœur ! Avis aux amatrices de DIY', '4500.00', '../upload/images/Screenshot-2022-03-30-at-19-49-55-T-shirt-graphique-«-assiette-en-toile-de-jute-florale-»-par-drifti.jpg', '5%', 'Noir & Beige', 'S, M, L, XXL', 1, '2022-03-30 19:55:23', 'Femme'),
(3, 3, 'Robe 2 set Femme', 'F03RB3001', 'L’article sur mon sac de voyage en toile de jute semble vous avoir beaucoup plu. Certaines m’ont d’ailleurs confié avoir de la toile de jute, mais ne pas savoir quoi en faire. Je me suis dit que c’était l’occasion de préparer un article.\nJ’ai vu énormément de belles choses sur Pinterest, que ce soit des accessoires mode ou de la déco. Ça n’a donc pas était facile de choisir. Voici mes coups de cœur ! Avis aux amatrices de DIY', '12500.00', '../upload/images/fg105-ca0b41468f59efc7ab8d5899d6af89085d0e6e11.png', '20%', 'Beige nature', 'S, M, L, XXL', 1, '2022-03-31 09:52:33', 'Femme'),
(4, 4, 'Sac', 'Sac à main e', 'L’article sur mon sac de voyage en toile de jute semble vous avoir beaucoup plu. Certaines m’ont d’ailleurs confié avoir de la toile de jute, mais ne pas savoir quoi en faire. Je me suis dit que c’était l’occasion de préparer un article.\nJ’ai vu énormément de belles choses sur Pinterest, que ce soit des accessoires mode ou de la déco. Ça n’a donc pas était facile de choisir. Voici mes coups de cœur ! Avis aux amatrices de DIY', '7000.00', '../upload/images/G_80935435_2885_VFP_1.jpg', '10%', 'Beige nature', 'Dimensions H 15 x L 22 x P 5,5 cm', 1, '2022-04-01 15:25:21', 'Femme'),
(6, 4, 'Sac', 'F10S10001', 'L’article sur mon sac de voyage en toile de jute semble vous avoir beaucoup plu. Certaines m’ont d’ailleurs confié avoir de la toile de jute, mais ne pas savoir quoi en faire. Je me suis dit que c’était l’occasion de préparer un article.\nJ’ai vu énormément de belles choses sur Pinterest, que ce soit des accessoires mode ou de la déco. Ça n’a donc pas était facile de choisir. Voici mes coups de cœur ! Avis aux amatrices de DIY', '5000.00', '../upload/images/611nGsaZtuL.jpg', NULL, 'Noir & Beige', 'general', 0, '2022-04-01 15:54:46', 'Femme'),
(7, 2, 'Sac à main en toile de jute por famme', 'H01TS1001', 'L’article sur mon sac de voyage en toile de jute semble vous avoir beaucoup plu. Certaines m’ont d’ailleurs confié avoir de la toile de jute, mais ne pas savoir quoi en faire. Je me suis dit que c’était l’occasion de préparer un article.\nJ’ai vu énormément de belles choses sur Pinterest, que ce soit des accessoires mode ou de la déco. Ça n’a donc pas était facile de choisir. Voici mes coups de cœur ! Avis aux amatrices de DIY', '4500.00', '../upload/images/ec6c1f60cb93340158f77c72ec703dfa4c68966a.png', NULL, 'Beige nature', 'S, M, L, XXL', 1, '2022-04-01 16:02:53', 'Homme');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `roles`, `password`, `is_verified`, `address`, `post_code`, `city`, `phone_no`, `created_at`) VALUES
(4, 'MD Imran', 'Hossain', 'imran.hossain@colombbus.org', '[\"ROLE_ADMIN\"]', '$2y$13$49im25hI4ii2JCpR8froDOkc4Yy4DoVRYTMeqg5TeJidBDpYVuxs.', 0, '48 Rue Massue', '94300', 'Vincennes', 751194581, '2022-03-31 00:59:00'),
(6, 'Fatima', 'Chine', 'fatima.chine@colombbus.org', '[]', '$2y$13$ePx3EGnlLGvFmoRaSUg7UOaB5HODMXTAAEFUiRUWmgzAs1994jPGy', 0, '8 bd Surennes', '92100', 'Suresnes', 123456789, '2022-03-31 09:41:00'),
(7, 'MD Imran', 'Hossain', 'imranhossain17@gmail.com', '[]', '$2y$13$4giei8yojAYLbiA9dkmDnetjNbcvwLPgb99cXuVsINSI8s.NU3J/O', 1, '48 Rue Massue', '94300', 'Vincennes', 2147483647, '2022-04-05 13:05:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
