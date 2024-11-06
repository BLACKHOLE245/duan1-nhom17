-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 06, 2024 lúc 03:40 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `z9milktea`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categorys`
--

CREATE TABLE `categorys` (
  `category_id` varchar(10) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `categorys`
--

INSERT INTO `categorys` (`category_id`, `category_name`) VALUES
('CT001', 'IPhone'),
('CT002', 'Samsung'),
('CT003', 'Laptop'),
('CT004', 'Phụ Kiện');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `cmt_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `delivery_status`
--

CREATE TABLE `delivery_status` (
  `delivery_status_id` int(11) NOT NULL,
  `delivery_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `delivery_status`
--

INSERT INTO `delivery_status` (`delivery_status_id`, `delivery_status_name`) VALUES
(1, 'Chờ Xác Nhận'),
(2, 'Đã Nhận Đơn'),
(3, 'Đang Giao Hàng'),
(4, 'Giao Thành Công'),
(5, 'Đã Huỷ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `orders_id` varchar(10) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `order_total` varchar(50) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `delivery_status_id` int(11) NOT NULL,
  `order_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_des`
--

CREATE TABLE `order_des` (
  `order_des_id` int(11) NOT NULL,
  `orders_id` varchar(10) NOT NULL,
  `hoTen` varchar(50) NOT NULL,
  `SDT` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `order_info` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` varchar(10) NOT NULL,
  `category_id` varchar(10) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_img` varchar(255) DEFAULT NULL,
  `product_des` text DEFAULT NULL,
  `product_price` varchar(22) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `product_name`, `product_img`, `product_des`, `product_price`, `create_time`) VALUES
('SP003', 'CT001', 'IPhone 16', '(600x600)_crop_iphone-16-128gb-my-ll-a-didongmy-thumb-600x600.jpg', 'Mỗi thế hệ iPhone đều mang đến những cải tiến đáng kể về camera, hiệu suất và khả năng kết nối. Camera trên iPhone được đánh giá cao nhờ chất lượng hình ảnh xuất sắc và tính năng chụp ảnh thông minh, phục vụ cho cả người dùng cá nhân và nhiếp ảnh gia chuyên nghiệp. Ngoài ra, iPhone còn tích hợp nhiều công nghệ mới như Face ID, cảm biến vân tay và khả năng chống nước, mang lại trải nghiệm sử dụng tiện lợi và an toàn.', '17.000.000đ', '2024-11-04 17:35:35'),
('SP004', 'CT001', 'Iphone 12', '(600x600)_crop_iphone-12-64gb-cu-99-like-new-didongmy-thumb-600x600.jpg', 'Mỗi thế hệ iPhone đều mang đến những cải tiến đáng kể về camera, hiệu suất và khả năng kết nối. Camera trên iPhone được đánh giá cao nhờ chất lượng hình ảnh xuất sắc và tính năng chụp ảnh thông minh, phục vụ cho cả người dùng cá nhân và nhiếp ảnh gia chuyên nghiệp. Ngoài ra, iPhone còn tích hợp nhiều công nghệ mới như Face ID, cảm biến vân tay và khả năng chống nước, mang lại trải nghiệm sử dụng tiện lợi và an toàn.', '', '2024-11-04 17:35:18'),
('SP005', 'CT001', 'Iphone 12 Promax 256G', '(600x600)_crop_iphone-12-pro-max-256gb-new-didongmy-thumb-600x600.jpg', 'Mỗi thế hệ iPhone đều mang đến những cải tiến đáng kể về camera, hiệu suất và khả năng kết nối. Camera trên iPhone được đánh giá cao nhờ chất lượng hình ảnh xuất sắc và tính năng chụp ảnh thông minh, phục vụ cho cả người dùng cá nhân và nhiếp ảnh gia chuyên nghiệp. Ngoài ra, iPhone còn tích hợp nhiều công nghệ mới như Face ID, cảm biến vân tay và khả năng chống nước, mang lại trải nghiệm sử dụng tiện lợi và an toàn.', '', '2024-11-04 17:36:32'),
('SP006', 'CT001', 'IPhone 15 Plus', '(600x600)_crop_iphone-15-plus-128gb-black-ban-my-ll-didongmy-thumb-600x600.png', 'Mỗi thế hệ iPhone đều mang đến những cải tiến đáng kể về camera, hiệu suất và khả năng kết nối. Camera trên iPhone được đánh giá cao nhờ chất lượng hình ảnh xuất sắc và tính năng chụp ảnh thông minh, phục vụ cho cả người dùng cá nhân và nhiếp ảnh gia chuyên nghiệp. Ngoài ra, iPhone còn tích hợp nhiều công nghệ mới như Face ID, cảm biến vân tay và khả năng chống nước, mang lại trải nghiệm sử dụng tiện lợi và an toàn.', '', '2024-11-04 17:36:55'),
('SP007', 'CT001', 'Iphone 16 Promax (white) 256G', '(600x600)_crop_iphone-16-pro-max-512gb-ll-a-didongmy-thumb-600x600.jpg', 'Mỗi thế hệ iPhone đều mang đến những cải tiến đáng kể về camera, hiệu suất và khả năng kết nối. Camera trên iPhone được đánh giá cao nhờ chất lượng hình ảnh xuất sắc và tính năng chụp ảnh thông minh, phục vụ cho cả người dùng cá nhân và nhiếp ảnh gia chuyên nghiệp. Ngoài ra, iPhone còn tích hợp nhiều công nghệ mới như Face ID, cảm biến vân tay và khả năng chống nước, mang lại trải nghiệm sử dụng tiện lợi và an toàn.', '', '2024-11-04 17:37:49'),
('SP008', 'CT001', 'IPhone 16 Promax (mạ vàng)', '(600x600)_crop_iphone-16-pro-max-256gb-ll-a-didongmy-thumb-600x600.jpg', 'Mỗi thế hệ iPhone đều mang đến những cải tiến đáng kể về camera, hiệu suất và khả năng kết nối. Camera trên iPhone được đánh giá cao nhờ chất lượng hình ảnh xuất sắc và tính năng chụp ảnh thông minh, phục vụ cho cả người dùng cá nhân và nhiếp ảnh gia chuyên nghiệp. Ngoài ra, iPhone còn tích hợp nhiều công nghệ mới như Face ID, cảm biến vân tay và khả năng chống nước, mang lại trải nghiệm sử dụng tiện lợi và an toàn.', '', '2024-11-04 17:38:27'),
('SP011', 'CT003', 'IPhone 11 ', '01.jpg', 'Dòng điện thoại Phone đã nhanh chóng khẳng định vị thế của mình trên thị trường công nghệ, thu hút sự chú ý của người tiêu dùng với thiết kế tinh tế và tính năng vượt trội. Được trang bị màn hình sắc nét và công nghệ hiển thị tiên tiến, mỗi chiếc Phone mang đến trải nghiệm hình ảnh sống động, từ việc xem phim cho đến chơi game. Bên cạnh đó, camera chất lượng cao với nhiều chế độ chụp đa dạng giúp người dùng ghi lại những khoảnh khắc đẹp trong cuộc sống một cách dễ dàng.', '', '2024-11-04 17:20:05'),
('SP012', 'CT001', 'Iphone 15 Promax', '02.png', 'Mỗi thế hệ iPhone đều mang đến những cải tiến đáng kể về camera, hiệu suất và khả năng kết nối. Camera trên iPhone được đánh giá cao nhờ chất lượng hình ảnh xuất sắc và tính năng chụp ảnh thông minh, phục vụ cho cả người dùng cá nhân và nhiếp ảnh gia chuyên nghiệp. Ngoài ra, iPhone còn tích hợp nhiều công nghệ mới như Face ID, cảm biến vân tay và khả năng chống nước, mang lại trải nghiệm sử dụng tiện lợi và an toàn.', '', '2024-11-04 17:28:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_sizes`
--

CREATE TABLE `product_sizes` (
  `product_size_id` int(11) NOT NULL,
  `product_id` varchar(10) NOT NULL,
  `size_id` int(11) NOT NULL,
  `product_price` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `product_sizes`
--

INSERT INTO `product_sizes` (`product_size_id`, `product_id`, `size_id`, `product_price`) VALUES
(112, 'SP011', 1, '10.000.000đ'),
(113, 'SP011', 2, '12.000.000đ'),
(118, 'SP012', 3, '18.000.000đ'),
(119, 'SP012', 4, '20.000.000đ'),
(121, 'SP004', 1, '13.000.000đ'),
(122, 'SP003', 1, NULL),
(123, 'SP005', 2, '15.000.000đ'),
(124, 'SP006', 2, '17.000.000đ'),
(125, 'SP007', 2, '30.000.000đ'),
(126, 'SP008', 2, '40.000.000đ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `size_id` int(11) NOT NULL,
  `size_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`size_id`, `size_name`) VALUES
(1, '64G'),
(2, '128G'),
(3, '256G'),
(4, '512G'),
(5, '1T');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` varchar(10) NOT NULL,
  `user_name` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass_word` varchar(20) NOT NULL,
  `role` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `pass_word`, `role`) VALUES
('US001', 'Admin', 'admin@gmail.com', '1234', 0),
('US002', 'Tan Phat', 'test@gmail.com', '1234', 1),
('US003', 'TPIT', 'test2@gmail.com', '1234', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_des`
--

CREATE TABLE `user_des` (
  `user_des_id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `SDT` int(10) NOT NULL,
  `soNhaTenDuong` varchar(100) NOT NULL,
  `phuongXa` varchar(100) NOT NULL,
  `quanHuyen` varchar(100) NOT NULL,
  `tinhTP` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_des`
--

INSERT INTO `user_des` (`user_des_id`, `user_id`, `SDT`, `soNhaTenDuong`, `phuongXa`, `quanHuyen`, `tinhTP`) VALUES
(5, 'US002', 678961162, '2222', 'tân chánh hiệp', 'quận 12', 'Hồ Chí Minh'),
(6, 'US003', 98765432, '1221', 'Quang Trung', 'Quận 12', 'Hồ Chí Minh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_path`
--

CREATE TABLE `user_path` (
  `user_path_id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `path` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user_path`
--

INSERT INTO `user_path` (`user_path_id`, `user_id`, `path`) VALUES
(3, 'US001', 'images.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`cmt_id`);

--
-- Chỉ mục cho bảng `delivery_status`
--
ALTER TABLE `delivery_status`
  ADD PRIMARY KEY (`delivery_status_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `fk_orders_users` (`user_id`);

--
-- Chỉ mục cho bảng `order_des`
--
ALTER TABLE `order_des`
  ADD PRIMARY KEY (`order_des_id`),
  ADD KEY `fk_order_des_orders` (`orders_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`product_size_id`),
  ADD KEY `fk_product_sizes_products` (`product_id`),
  ADD KEY `fk_product_sizes_sizes` (`size_id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`size_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_des`
--
ALTER TABLE `user_des`
  ADD PRIMARY KEY (`user_des_id`),
  ADD KEY `fk_user_des_users` (`user_id`);

--
-- Chỉ mục cho bảng `user_path`
--
ALTER TABLE `user_path`
  ADD PRIMARY KEY (`user_path_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `delivery_status`
--
ALTER TABLE `delivery_status`
  MODIFY `delivery_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order_des`
--
ALTER TABLE `order_des`
  MODIFY `order_des_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `product_size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `size_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `user_des`
--
ALTER TABLE `user_des`
  MODIFY `user_des_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `user_path`
--
ALTER TABLE `user_path`
  MODIFY `user_path_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_des`
--
ALTER TABLE `order_des`
  ADD CONSTRAINT `fk_order_des_orders` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categorys` FOREIGN KEY (`category_id`) REFERENCES `categorys` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categorys` (`category_id`);

--
-- Các ràng buộc cho bảng `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `fk_product_sizes_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_sizes_sizes` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`size_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_des`
--
ALTER TABLE `user_des`
  ADD CONSTRAINT `fk_user_des_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_path`
--
ALTER TABLE `user_path`
  ADD CONSTRAINT `user_path_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
