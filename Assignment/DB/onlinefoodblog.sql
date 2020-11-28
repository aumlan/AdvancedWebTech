-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2020 at 11:21 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinefoodblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `A_ID` varchar(20) NOT NULL,
  `A_NAME` varchar(50) NOT NULL,
  `A_ADDRESS` varchar(50) NOT NULL,
  `A_EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`A_ID`, `A_NAME`, `A_ADDRESS`, `A_EMAIL`) VALUES
('', '', '', ''),
('bbbbbbbb', 'bbbbbbbbbbbbbbb', 'bbbbbbbbbbbbbbb', 'bbb@bb.nn'),
('bbbbbbbbbbbbbb', 'bbbbbbbbbbbbbb', 'bbbbbbbbbbbbbbbbb', 'bbbbbbbbbbbb@gmmmm.hh'),
('button', 'button', 'butt', 'but@gm.gf'),
('nayan', 'Tanzirul Haque Nayan', 'Basundhara', 'nayan@gmail.com'),
('sdf', 'fdg', 'gfh', 'aumlan0120@gmail.com'),
('subbut', 'subbutttt', 'subbbbbbb', 's@gm.jh');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `F_ID` int(11) NOT NULL,
  `F_TITLE` varchar(100) NOT NULL,
  `F_DESCRIPTION` text,
  `R_ID` int(11) NOT NULL,
  `F_IMAGE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`F_ID`, `F_TITLE`, `F_DESCRIPTION`, `R_ID`, `F_IMAGE`) VALUES
(1, 'Caprese Pasta Salad', 'Hurry, make this one before the good tomatoes are gone! It’s a super simple burst cherry tomato pasta dish with little mozzarella balls, fresh basil and a splash of white balsamic vinegar. It packs well for lunch the next day, too.', 1, ''),
(2, 'Spaghetti Squash Burrito Bowls', 'Hearty burrito bowls made with a base of spaghetti squash. These are such a fun dinner option.', 1, '/pictures/image_1606315419187.jpg'),
(3, 'Vegetarian Tortilla Soup', 'Finally! Homemade tortilla soup that’s even better than the restaurant versions I enjoyed before giving up chicken. Posole might be a better name for this soup, but whatever you want to call it, it’s light but filling, spicy and delicious.', 1, ''),
(4, 'Extra Vegetable Fried Rice', '“With more mouths to feed than usual over the holidays, I made this twice in the last 10 days! Both times, I followed the recipe exactly, and it was a huge hit! I used snow peas and red pepper for the 2 cups of extra veggies. Everyone gobbled it up and asked for seconds. Thanks, Kate!” – Emily', 1, ''),
(8, 'BIG KING', 'Our BIG KING™ Burger features two delicious flame-grilled beef patties, topped with melted cheese, freshly cut iceberg lettuce, crisp onions,  crunchy pickles, and secret Big King sauce, all on a warm, toasted, sesame seed tower bun.', 3, ''),
(9, 'WHOPPER®', 'Our WHOPPER® Sandwich is a ¼ lb* of savory flame-grilled beef topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun. Served with a medium side of piping hot, thick cut French Fries or golden Onion Rings and a small fountain drink of your choice to make it a meal.', 3, ''),
(10, 'DOUBLE WHOPPER®', 'Our DOUBLE WHOPPER® Sandwich is a pairing of two ¼ lb* savory flame-grilled beef patties topped with juicy tomatoes, fresh lettuce, creamy mayonnaise, ketchup, crunchy pickles, and sliced white onions on a soft sesame seed bun.', 3, ''),
(11, 'DOUBLE CHEESEBURGER', 'Make room for our Double Cheeseburger, two signature flame-grilled beef patties topped with a simple layer of melted American cheese, crinkle cut pickles, yellow mustard, and ketchup on a toasted sesame seed bun.', 3, ''),
(12, 'THE BIG PHILLY CHEESE STEAK', 'Huge pie cut into 8 extra-large slices topped with tender Philly Steak, mushrooms, red onion and capsicum on a tasty American style cheddar sauce base.', 4, ''),
(13, 'HALF \'N\' HALF', 'Your choice. Combine any 2 of our delicious pizzas in 1', 4, ''),
(14, 'THE BIG HAM & PINEAPPLE', 'Huge pie cut into 8 extra-large slices. Authentic soft and foldable New York style dough topped with ham, pineapple and mozzarella', 4, ''),
(15, 'THE BIG PEPPERONI, SAUSAGE & MUSHROOM', 'Huge pie cut into 8 extra-large slices. Authentic soft and foldable New York style dough topped with pepperoni, pork & fennel sausage, mushrooms and mozzarella', 4, ''),
(19, 'aaaa', 'ghjhgjghj', 3, '/pictures/image_1606321167472.jpg'),
(20, 'uuu', 'yyyy', 1, '/pictures/image_1606173108647.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `food_review`
--

CREATE TABLE `food_review` (
  `FR_ID` int(11) NOT NULL,
  `FR_TEXT` text NOT NULL,
  `FR_TIME` date NOT NULL,
  `F_ID` int(11) NOT NULL,
  `M_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food_review`
--

INSERT INTO `food_review` (`FR_ID`, `FR_TEXT`, `FR_TIME`, `F_ID`, `M_ID`) VALUES
(1, 'fghfghfgh', '2020-11-04', 20, 'rt'),
(2, 'fghfghfgh', '2020-11-04', 20, 'rt'),
(3, 'fgfghfghfghf', '2020-11-26', 20, 'rt'),
(4, 'kojupio', '2020-11-26', 19, 'rt'),
(5, 'good', '2020-11-27', 20, 'rt'),
(6, 'ffffff', '2020-11-27', 20, 'rt'),
(7, 'ASasAS', '2020-11-27', 15, 'rt'),
(8, 'zxcXZC', '2020-11-27', 12, 'rt'),
(9, 'ZCZXC', '2020-11-27', 12, 'rt'),
(10, 'zxcXZC', '2020-11-27', 12, 'rt');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `M_ID` varchar(20) NOT NULL,
  `M_NAME` varchar(50) NOT NULL,
  `M_ADDRESS` varchar(50) NOT NULL,
  `M_EMAIL` varchar(50) NOT NULL,
  `M_IMAGE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`M_ID`, `M_NAME`, `M_ADDRESS`, `M_EMAIL`, `M_IMAGE`) VALUES
('jaowat', 'Jaowat Raihan', 'Basundhara', 'jaowat@yahoo.com', ''),
('rt', 'sdf', 'gfh', 'aumlan0120@gmail.com', '/pictures/image_1606321167472.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `price` int(10) NOT NULL,
  `catagoryID` int(10) NOT NULL,
  `average_rating` double(5,5) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `exclusive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `user_id`, `product_name`, `quantity`, `price`, `catagoryID`, `average_rating`, `description`, `published`, `exclusive`) VALUES
(1, 's1', 'aassa', '23', 300, 4, NULL, 'dfghfgfdgfdgfdgsfdgfd rgfdgfd  ggfdgfd', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `R_ID` int(11) NOT NULL,
  `R_NAME` varchar(50) NOT NULL,
  `R_DESCRIPTION` text NOT NULL,
  `R_TYPE` varchar(15) NOT NULL,
  `R_LOCATION` varchar(50) NOT NULL,
  `R_STATUS` varchar(10) NOT NULL,
  `R_IMAGE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`R_ID`, `R_NAME`, `R_DESCRIPTION`, `R_TYPE`, `R_LOCATION`, `R_STATUS`, `R_IMAGE`) VALUES
(1, 'Veggie', 'Veggie is a restaurant that serves primarily, or exclusively, health foods, which may include vegetarian, vegan, raw, macrobiotic, organic, and low-fat menu options.', 'Vegan', 'Gulshan', 'VALID', '/pictures/image_1606315419187.jpg'),
(3, 'Burger King', 'Burger King is an American global chain of hamburger fast food restaurants. Headquartered in the unincorporated area of Miami-Dade County, Florida, the company was founded in 1953 as Insta-Burger King, a Jacksonville, Florida–based restaurant chain.', 'Fast Food', 'Basundhara', 'VALID', ''),
(4, 'Domino\'s Pizza', 'Domino\'s Pizza, Inc., branded as Domino\'s, is an American pizza restaurant chain founded in 1960. The corporation is headquartered at the Domino\'s Farms Office Park in Ann Arbor, Michigan, and incorporated in Delaware. In February 2018, the chain became the largest pizza seller worldwide in terms of sales.', 'Pizza', 'Dhanmondi', 'VALID', ''),
(5, 'gjgh', 'jghfj', 'Pizza', 'jfghj', 'VALID', ''),
(6, 'fgf', 'fgfdg', 'sfdg', 'sfdgsfdg', 'VALID', ''),
(7, 'sdf', 'dfgh', 'fgdhfgdh', 'fgdh', 'VALID', ''),
(8, 'rassssssss', 'sssssssssss', 'sssssss', 'sssssssss', 'VALID', '');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_review`
--

CREATE TABLE `restaurant_review` (
  `RR_ID` int(11) NOT NULL,
  `RR_TEXT` text NOT NULL,
  `RR_TIME` date NOT NULL,
  `R_ID` int(11) NOT NULL,
  `U_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `social_media` varchar(50) NOT NULL,
  `level` int(20) NOT NULL,
  `selling_point` int(10) NOT NULL,
  `block_status` tinyint(1) NOT NULL,
  `verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`seller_id`, `user_id`, `name`, `email`, `address`, `dob`, `phone_no`, `payment_type`, `social_media`, `level`, `selling_point`, `block_status`, `verified`) VALUES
(1, 's', 'sad', 'sadsad', 'asdsa', 'sadsad', 'asdsad', 'asdsa', 'asdasd', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `U_ID` varchar(20) NOT NULL,
  `U_PASSWORD` varchar(25) NOT NULL,
  `U_TYPE` varchar(7) NOT NULL,
  `U_STATUS` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`U_ID`, `U_PASSWORD`, `U_TYPE`, `U_STATUS`) VALUES
('', '', 'ADMIN', 'VALID'),
('bbbbbbbb', '1', 'ADMIN', 'VALID'),
('bbbbbbbbbbbbbb', '1', 'ADMIN', 'VALID'),
('button', '123', 'ADMIN', 'VALID'),
('jaowat', 'jaowat', 'MEMBER', 'VALID'),
('nayan', '1', 'ADMIN', 'VALID'),
('rt', '1', 'MEMBER', 'VALID'),
('s', '1', 'SELLER', 'VALID'),
('sdf', '7', 'SELLER', 'VALID');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`A_ID`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`F_ID`);

--
-- Indexes for table `food_review`
--
ALTER TABLE `food_review`
  ADD PRIMARY KEY (`FR_ID`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`M_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`R_ID`);

--
-- Indexes for table `restaurant_review`
--
ALTER TABLE `restaurant_review`
  ADD PRIMARY KEY (`RR_ID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`U_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `F_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `food_review`
--
ALTER TABLE `food_review`
  MODIFY `FR_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `R_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `restaurant_review`
--
ALTER TABLE `restaurant_review`
  MODIFY `RR_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
