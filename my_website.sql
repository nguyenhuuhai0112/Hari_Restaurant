-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th12 23, 2024 lúc 07:51 PM
-- Phiên bản máy phục vụ: 8.0.39
-- Phiên bản PHP: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `my_website`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `role`, `department`, `last_login_ip`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'HẢI DZ', 'admin@gmail.com', '$2y$12$ZEpXUR2ugfVNoq9Wc52koeqJ3HvjfdcN9IMGVR.i9IVfHibAyfuuK', 'Admin', NULL, '127.0.0.1', '2024-12-23 05:25:33', NULL, '2024-11-29 07:01:06', '2024-12-23 05:25:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `item_id` int UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReservationID` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `item_id`, `quantity`, `created_at`, `updated_at`, `ReservationID`) VALUES
(141, 1, 23, 1, '2024-12-06 22:24:20', '2024-12-06 22:24:20', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menucategory`
--

CREATE TABLE `menucategory` (
  `CategoryID` int UNSIGNED NOT NULL,
  `CategoryName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menucategory`
--

INSERT INTO `menucategory` (`CategoryID`, `CategoryName`, `Description`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Món chính', 'Các món ăn chính trong thực đơn', '2024-11-09 01:16:33', '2024-11-09 01:16:33'),
(2, 'Khai vị', 'Các món khai vị', '2024-11-09 01:16:33', '2024-11-09 01:16:33'),
(3, 'Tráng miệng', 'Các món tráng miệng', '2024-11-09 01:16:33', '2024-11-09 01:16:33'),
(4, 'Chay', 'Dành cho khách ăn chay', '2024-11-20 06:05:36', '2024-11-27 06:39:15'),
(7, 'Đồ uống', 'giải khát tuyệt vời', '2024-11-26 15:37:08', '2024-11-27 06:43:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menuitem`
--

CREATE TABLE `menuitem` (
  `ItemID` int UNSIGNED NOT NULL,
  `CategoryID` int UNSIGNED NOT NULL,
  `ItemName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `status` enum('Món mới','Phổ biến','Đặc biệt','Bình thường') COLLATE utf8mb4_unicode_ci DEFAULT 'Bình thường',
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Available` tinyint(1) DEFAULT '1',
  `ImageURL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menuitem`
--

INSERT INTO `menuitem` (`ItemID`, `CategoryID`, `ItemName`, `Price`, `status`, `Description`, `Available`, `ImageURL`, `CreatedAt`, `UpdatedAt`) VALUES
(16, 2, 'Súp bí đỏ kem tươi', 50000.00, 'Phổ biến', 'khai vị tuyệt vời', 1, 'images/1732688898_supbido.jpg', '2024-11-27 06:28:18', '2024-12-03 08:32:17'),
(17, 2, 'Gỏi cuốn tôm thịt', 40000.00, 'Bình thường', '1 phần 2 cuộn', 1, 'images/1732689184_goicuon.jpg', '2024-11-27 06:33:04', '2024-11-27 06:33:04'),
(19, 1, 'Mỳ ý sốt kem nấm', 120000.00, 'Món mới', 'Đậm đà hương vị', 1, 'images/1732689451_my_y.jpg', '2024-11-27 06:37:31', '2024-11-27 06:37:31'),
(20, 4, 'Lẩu nấm chay thập cẩm', 150000.00, 'Bình thường', 'dành cho 2 -3 người', 1, 'images/1732689600_lau_nam.jpg', '2024-11-27 06:40:00', '2024-11-27 06:40:00'),
(21, 3, 'Bánh flan caramel', 30000.00, 'Phổ biến', 'Ngon ngọt béo ngậy', 1, 'images/1732689723_banh_flan.jpg', '2024-11-27 06:42:03', '2024-11-27 06:42:03'),
(22, 7, 'Cocktail mojito dâu tây', 100000.00, 'Bình thường', NULL, 1, 'images/1732689847_cocktail.jpg', '2024-11-27 06:44:07', '2024-11-27 06:44:07'),
(23, 1, 'Cá chiên sốt chanh dây', 150000.00, 'Đặc biệt', 'Hương vị quê hương', 1, 'images/1732690184_cachien.jpg', '2024-11-27 06:49:44', '2024-12-03 08:33:26'),
(24, 1, 'Cá hồi nướng', 170000.00, 'Món mới', 'Cá hồi nướng siêu ngon', 1, 'images/1733838309_cahoinuong.jpg', '2024-12-10 13:45:09', '2024-12-10 13:45:09'),
(25, 1, 'Gà nướng lá sen', 140000.00, 'Bình thường', 'Gà nướng thơm ngon', 1, 'images/1733838360_ganuonglasen.jpg', '2024-12-10 13:46:00', '2024-12-10 13:46:00'),
(26, 1, 'Cá hồi kho tiêu', 100000.00, 'Đặc biệt', 'Cá hồi tuyệt vời', 1, 'images/1733838527_cahoikhotieu.jpg', '2024-12-10 13:48:47', '2024-12-10 13:48:47'),
(27, 1, 'Canh khổ qua', 45000.00, 'Phổ biến', 'Canh khổ qua nhồi thịt', 1, 'images/1733838604_canhkhoiqua.jpg', '2024-12-10 13:50:04', '2024-12-10 13:50:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `OrderID` int UNSIGNED NOT NULL,
  `UserID` bigint UNSIGNED DEFAULT NULL,
  `ReservationID` int UNSIGNED DEFAULT NULL,
  `TotalAmount` decimal(15,2) NOT NULL,
  `OrderDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('Đã thanh toán','Chưa thanh toán') COLLATE utf8mb4_unicode_ci DEFAULT 'Chưa thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int UNSIGNED NOT NULL,
  `PaymentCode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ReservationID` int UNSIGNED NOT NULL,
  `Amount` decimal(15,2) NOT NULL,
  `PaymentMethod` enum('Thanh toán tại nhà hàng','VNPAY','Chuyển khoản ngân hàng') COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` enum('Chờ thanh toán','Đã thanh toán','Đã hủy','Từ chối') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Chờ thanh toán',
  `PaymentProof` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payment`
--

INSERT INTO `payment` (`PaymentID`, `PaymentCode`, `ReservationID`, `Amount`, `PaymentMethod`, `Status`, `PaymentProof`, `CreatedAt`, `UpdatedAt`) VALUES
(111, 'PAY-C0ABE7', 130, 675000.00, 'Chuyển khoản ngân hàng', 'Đã thanh toán', 'payment_proofs/1734973294_PAY-C0ABE7.jpg', '2024-12-23 10:01:22', '2024-12-23 10:10:06'),
(112, 'PAY-613751', 131, 45000.00, 'Chuyển khoản ngân hàng', 'Đã thanh toán', 'payment_proofs/1734973849_PAY-613751.jpg', '2024-12-23 10:10:40', '2024-12-23 10:11:04'),
(113, 'PAY-9DC806', 132, 270000.00, 'Chuyển khoản ngân hàng', 'Đã thanh toán', 'payment_proofs/1734974419_PAY-9DC806.jpg', '2024-12-23 10:20:06', '2024-12-23 10:24:28'),
(114, 'PAY-1FD1DE', 133, 285000.00, 'Chuyển khoản ngân hàng', 'Đã thanh toán', 'payment_proofs/1734974937_PAY-1FD1DE.jpg', '2024-12-23 10:28:46', '2024-12-23 10:33:47'),
(115, 'PAY-DECBAF', 134, 270000.00, 'Thanh toán tại nhà hàng', 'Chờ thanh toán', NULL, '2024-12-23 10:43:57', '2024-12-23 11:36:27'),
(116, 'PAY-2DDFC6', 135, 45000.00, 'Chuyển khoản ngân hàng', 'Từ chối', 'payment_proofs/1734977098_PAY-2DDFC6.jpg', '2024-12-23 11:04:48', '2024-12-23 11:14:05'),
(117, 'PAY-66AF79', 136, 45000.00, 'Chuyển khoản ngân hàng', 'Từ chối', 'payment_proofs/1734978080_PAY-66AF79.jpg', '2024-12-23 11:21:10', '2024-12-23 11:21:35'),
(118, 'PAY-0873CD', 137, 145000.00, 'Chuyển khoản ngân hàng', 'Từ chối', 'payment_proofs/1734978792_PAY-0873CD.jpg', '2024-12-23 11:33:01', '2024-12-23 11:33:33'),
(119, 'PAY-71A243', 138, 285000.00, 'Chuyển khoản ngân hàng', 'Từ chối', 'payment_proofs/1734979801_PAY-71A243.png', '2024-12-23 11:49:48', '2024-12-23 11:50:21'),
(120, 'PAY-619AAE', 139, 285000.00, 'Chuyển khoản ngân hàng', 'Từ chối', 'payment_proofs/1734980026_PAY-619AAE.jpg', '2024-12-23 11:53:35', '2024-12-23 11:53:55'),
(121, 'PAY-C35084', 140, 285000.00, 'Chuyển khoản ngân hàng', 'Đã thanh toán', 'payment_proofs/1734980194_PAY-C35084.jpg', '2024-12-23 11:56:24', '2024-12-23 11:56:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reservation`
--

CREATE TABLE `reservation` (
  `ReservationID` int UNSIGNED NOT NULL,
  `ReservationCode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UserID` bigint UNSIGNED NOT NULL,
  `FullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TableID` int UNSIGNED DEFAULT NULL,
  `GuestCount` int NOT NULL,
  `ReservationDate` datetime NOT NULL,
  `Status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Note` text COLLATE utf8mb4_unicode_ci,
  `CreatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CheckInTime` timestamp NULL DEFAULT NULL,
  `CheckOutTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reservation`
--

INSERT INTO `reservation` (`ReservationID`, `ReservationCode`, `UserID`, `FullName`, `Phone`, `TableID`, `GuestCount`, `ReservationDate`, `Status`, `Note`, `CreatedAt`, `UpdatedAt`, `CheckInTime`, `CheckOutTime`) VALUES
(130, 'RES2BFB00', 17, 'Cục', '0966994591', NULL, 1, '2024-12-25 12:01:00', 'Đã hủy', NULL, '2024-12-23 10:01:18', '2024-12-23 10:10:15', NULL, NULL),
(131, 'RES9A9726', 17, 'Cục', '0966994591', NULL, 1, '2024-12-25 12:10:00', 'Đã hủy', NULL, '2024-12-23 10:10:37', '2024-12-23 11:41:02', NULL, NULL),
(132, 'RES167E46', 17, 'Cục', '0966994591', 4, 1, '2024-12-25 12:19:00', 'Đã hoàn tất', NULL, '2024-12-23 10:20:02', '2024-12-23 12:35:24', '2024-12-23 12:35:22', '2024-12-23 12:35:24'),
(133, 'RES9E3FD6', 17, 'Cục', '0966994591', NULL, 1, '2024-12-25 12:28:00', 'Chờ xác nhận', NULL, '2024-12-23 10:28:41', '2024-12-23 10:28:57', NULL, NULL),
(134, 'RESEDA236', 17, 'Cục', '0966994591', NULL, 1, '2024-12-24 12:43:00', 'Chờ xác nhận', NULL, '2024-12-23 10:43:39', '2024-12-23 10:43:57', NULL, NULL),
(135, 'RES75398A', 17, 'Cục', '0966994591', NULL, 1, '2024-12-25 13:04:00', 'Đã hủy', NULL, '2024-12-23 11:04:44', '2024-12-23 11:14:05', NULL, NULL),
(136, 'RESF22630', 17, 'Cục', '0966994591', NULL, 1, '2024-12-25 13:21:00', 'Đã hủy', NULL, '2024-12-23 11:21:05', '2024-12-23 11:21:35', NULL, NULL),
(137, 'RES409232', 17, 'Cục', '0966994591', NULL, 1, '2024-12-24 14:32:00', 'Đã hủy', NULL, '2024-12-23 11:32:56', '2024-12-23 11:33:33', NULL, NULL),
(138, 'RESB9E8D0', 17, 'Cục', '0966994591', NULL, 1, '2024-12-25 13:49:00', 'Đã hủy', NULL, '2024-12-23 11:49:44', '2024-12-23 11:50:21', NULL, NULL),
(139, 'RESF820B8', 17, 'Cục', '0966994591', NULL, 1, '2024-12-25 13:53:00', 'Đã hủy', NULL, '2024-12-23 11:53:30', '2024-12-23 11:53:55', NULL, NULL),
(140, 'RESD42B65', 17, 'Cục', '0966994591', NULL, 1, '2024-12-25 13:56:00', 'Chờ xác nhận', NULL, '2024-12-23 11:56:19', '2024-12-23 11:56:34', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reservation_item`
--

CREATE TABLE `reservation_item` (
  `ReservationItemID` bigint UNSIGNED NOT NULL,
  `ReservationID` int UNSIGNED NOT NULL,
  `ItemID` int UNSIGNED NOT NULL,
  `Quantity` int NOT NULL DEFAULT '1',
  `Price` decimal(10,2) NOT NULL,
  `PaymentID` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_initial_order` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reservation_item`
--

INSERT INTO `reservation_item` (`ReservationItemID`, `ReservationID`, `ItemID`, `Quantity`, `Price`, `PaymentID`, `created_at`, `updated_at`, `is_initial_order`) VALUES
(164, 130, 27, 1, 45000.00, NULL, '2024-12-23 17:01:34', '2024-12-23 17:01:34', 0),
(165, 130, 25, 1, 140000.00, NULL, '2024-12-23 17:01:34', '2024-12-23 17:01:34', 0),
(166, 130, 24, 1, 170000.00, NULL, '2024-12-23 17:01:34', '2024-12-23 17:01:34', 0),
(167, 130, 23, 1, 150000.00, NULL, '2024-12-23 17:01:34', '2024-12-23 17:01:34', 0),
(168, 130, 16, 1, 50000.00, NULL, '2024-12-23 17:02:36', '2024-12-23 17:02:36', 0),
(169, 130, 19, 1, 120000.00, NULL, '2024-12-23 17:10:06', '2024-12-23 17:10:06', 0),
(170, 131, 27, 1, 45000.00, NULL, '2024-12-23 17:10:49', '2024-12-23 17:10:49', 0),
(171, 132, 20, 1, 150000.00, NULL, '2024-12-23 17:20:19', '2024-12-23 17:20:19', 0),
(172, 132, 19, 1, 120000.00, NULL, '2024-12-23 17:24:28', '2024-12-23 17:24:28', 0),
(173, 133, 27, 1, 45000.00, NULL, '2024-12-23 17:28:57', '2024-12-23 17:28:57', 0),
(174, 133, 26, 1, 100000.00, NULL, '2024-12-23 17:28:57', '2024-12-23 17:28:57', 0),
(175, 133, 25, 1, 140000.00, NULL, '2024-12-23 17:28:57', '2024-12-23 17:28:57', 0),
(176, 134, 23, 1, 150000.00, NULL, '2024-12-23 17:55:47', '2024-12-23 17:55:47', 0),
(181, 134, 19, 1, 120000.00, NULL, '2024-12-23 18:36:27', '2024-12-23 18:36:27', 0),
(188, 140, 27, 1, 45000.00, NULL, '2024-12-23 18:56:34', '2024-12-23 18:56:34', 0),
(189, 140, 26, 1, 100000.00, NULL, '2024-12-23 18:56:34', '2024-12-23 18:56:34', 0),
(190, 140, 25, 1, 140000.00, NULL, '2024-12-23 18:56:34', '2024-12-23 18:56:34', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `table`
--

CREATE TABLE `table` (
  `TableID` int UNSIGNED NOT NULL,
  `TableNumber` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Status` enum('Trống','Đang sử dụng','Bảo trì') COLLATE utf8mb4_unicode_ci DEFAULT 'Trống',
  `Seats` int NOT NULL,
  `Location` enum('Trong nhà','Ngoài sân','VIP') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Trong nhà',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `table`
--

INSERT INTO `table` (`TableID`, `TableNumber`, `Status`, `Seats`, `Location`, `created_at`, `updated_at`) VALUES
(1, 'T01', 'Đang sử dụng', 4, 'Trong nhà', '2024-11-21 18:46:04', '2024-12-23 09:39:02'),
(2, 'T02', 'Bảo trì', 6, 'VIP', '2024-11-21 18:46:04', '2024-12-23 03:32:12'),
(4, 'T04', 'Trống', 2, 'Ngoài sân', '2024-11-21 18:46:04', '2024-12-23 12:35:24'),
(5, 'T05', 'Đang sử dụng', 8, 'Trong nhà', '2024-11-22 08:25:54', '2024-12-23 09:30:47'),
(6, 'T06', 'Trống', 8, 'VIP', '2024-11-22 08:31:02', '2024-12-07 06:44:13'),
(8, 'T03', 'Trống', 6, 'VIP', '2024-11-24 01:37:46', '2024-11-24 01:37:46'),
(9, 'T07', 'Trống', 1, 'Trong nhà', '2024-11-30 09:20:55', '2024-11-30 09:20:55'),
(10, 'T08', 'Trống', 16, 'VIP', '2024-11-30 09:21:09', '2024-11-30 09:48:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `roles` enum('User') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `email_verified_at`, `roles`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hải Hay Ho ', 'nguyenhuuhai01122005@gmail.com', '$2y$12$q0bWR6mDBuLK3llWhb4CfeC.U9vSLOs.gMr7aUgrRV/FkuE/MIiiO', NULL, 'User', NULL, '2024-11-01 20:31:22', '2024-11-20 03:33:59'),
(14, 'Hữu Hải', 'hai123@gmail.com', '$2y$12$tGC5AbzrLxjVOKZRxzlilOm0us/8wrAx81/YXx2R4/Q6pYvQOnpGm', NULL, 'User', NULL, '2024-11-16 04:20:25', '2024-11-19 21:40:36'),
(15, 'Thu Trang', 'thutrang123@gmail.com', '$2y$12$RXv5gEjU462E36JMlqJi9.OuNUOORzdSPFYt6yx/KXrslern2HKTm', NULL, 'User', NULL, '2024-11-17 02:34:16', '2024-11-20 03:34:02'),
(17, 'Cục', 'huuhaiauau@gmail.com', '$2y$12$lb.qY4/6S/KxgQzdx56SjO7HG/CgpcORzDxVRT/avjXhi/gg1FLoS', NULL, 'User', NULL, '2024-11-30 11:03:49', '2024-11-30 11:05:53'),
(19, 'Bo Cute', 'nguyenhuuhai0112@gmail.com', '$2y$12$.90O3t6OquROvT11D93GoOzFdKDLe37n4hfk1cgv0ssGKznNgjRv2', NULL, 'User', NULL, '2024-12-07 02:00:27', '2024-12-07 02:00:27'),
(20, 'Tran Dinh Hoang Long', 'longtdh.23ns@vku.udn.vn', '$2y$12$N6nld2wHSB5tlEJRzO62Pe93Bb5tojMKNIGcJw2MoO6ltuJKMfn1m', NULL, 'User', NULL, '2024-12-07 07:08:35', '2024-12-07 07:08:35');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `cart_reservation_fk` (`ReservationID`);

--
-- Chỉ mục cho bảng `menucategory`
--
ALTER TABLE `menucategory`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ReservationID` (`ReservationID`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD UNIQUE KEY `idx_payment_code` (`PaymentCode`),
  ADD KEY `ReservationID` (`ReservationID`);

--
-- Chỉ mục cho bảng `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD UNIQUE KEY `idx_reservation_code` (`ReservationCode`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `TableID` (`TableID`);

--
-- Chỉ mục cho bảng `reservation_item`
--
ALTER TABLE `reservation_item`
  ADD PRIMARY KEY (`ReservationItemID`),
  ADD KEY `ReservationID` (`ReservationID`),
  ADD KEY `ItemID` (`ItemID`),
  ADD KEY `PaymentID` (`PaymentID`);

--
-- Chỉ mục cho bảng `table`
--
ALTER TABLE `table`
  ADD PRIMARY KEY (`TableID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT cho bảng `menucategory`
--
ALTER TABLE `menucategory`
  MODIFY `CategoryID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `menuitem`
--
ALTER TABLE `menuitem`
  MODIFY `ItemID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT cho bảng `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ReservationID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT cho bảng `reservation_item`
--
ALTER TABLE `reservation_item`
  MODIFY `ReservationItemID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT cho bảng `table`
--
ALTER TABLE `table`
  MODIFY `TableID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `menuitem` (`ItemID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_reservation_fk` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_reservation_fk` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_table_fk` FOREIGN KEY (`TableID`) REFERENCES `table` (`TableID`),
  ADD CONSTRAINT `reservation_user_fk` FOREIGN KEY (`UserID`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `reservation_item`
--
ALTER TABLE `reservation_item`
  ADD CONSTRAINT `reservation_item_fk_1` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_item_fk_2` FOREIGN KEY (`ItemID`) REFERENCES `menuitem` (`ItemID`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_item_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
