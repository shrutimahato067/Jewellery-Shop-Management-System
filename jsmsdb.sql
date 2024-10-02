-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2022 at 08:30 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jsmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`, `createdBy`) VALUES
(1, 'Earing', 'Various  type of earing', '2022-01-31 04:23:02', NULL, 1),
(2, 'Pendants', 'Pendants is very beautiful', '2022-01-31 04:27:41', NULL, 1),
(3, 'Finger Rings', 'There is huge variety of finger rings', '2022-01-31 04:28:31', NULL, 1),
(4, 'Mangalsutra', 'Mangalsutra', '2022-01-31 04:28:56', NULL, 1),
(5, 'Chain', 'Chain', '2022-01-31 04:29:12', NULL, 1),
(6, 'Necklace', 'Necklace', '2022-01-31 04:29:28', NULL, 1),
(7, 'Nose pin', 'Nose pin', '2022-01-31 04:30:00', NULL, 1),
(8, 'Toe Ring', 'Toe Ring', '2022-01-31 04:30:16', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `PId` varchar(255) DEFAULT NULL,
  `IsOrderPlaced` int(5) DEFAULT NULL,
  `OrderNumber` int(5) DEFAULT NULL,
  `PaymentMethod` varchar(200) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `UserId`, `PId`, `IsOrderPlaced`, `OrderNumber`, `PaymentMethod`, `orderDate`) VALUES
(7, 5, '22', 1, 424108694, 'Cash on Delivery', '2022-02-02 06:15:46'),
(8, 5, '21', 1, 424108694, 'Cash on Delivery', '2022-02-02 06:38:17'),
(9, 5, '26', 1, 424108694, 'Cash on Delivery', '2022-02-02 06:40:05'),
(11, 5, '28', 1, 424108694, 'Cash on Delivery', '2022-02-02 07:14:31'),
(12, 5, '26', 1, 624951460, 'Credit Card', '2022-02-03 04:11:12'),
(13, 5, '31', 1, 260984104, 'Debit Card', '2022-02-03 05:30:21'),
(15, 5, '27', 1, 849570981, 'E-Wallet', '2022-02-03 09:30:16'),
(16, 5, '26', 1, 849570981, 'E-Wallet', '2022-02-04 08:38:39'),
(21, 6, '28', 1, 224122905, 'E-Wallet', '2022-02-05 09:49:59'),
(22, 6, '26', 1, 224122905, 'E-Wallet', '2022-02-05 10:29:20'),
(23, 5, '26', NULL, NULL, NULL, '2022-02-07 09:32:35'),
(24, 5, '31', NULL, NULL, NULL, '2022-02-09 11:57:42'),
(33, 6, '28', NULL, NULL, NULL, '2022-02-12 10:51:01'),
(34, 0, '34', NULL, NULL, NULL, '2022-02-12 11:23:04'),
(36, 7, '28', 1, 819293354, 'Cash on Delivery', '2022-02-12 11:31:15'),
(37, 7, '29', 1, 819293354, 'Cash on Delivery', '2022-02-12 11:31:20'),
(38, 7, '31', 1, 819293354, 'Cash on Delivery', '2022-02-12 11:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productweight` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `addedBy` int(11) DEFAULT NULL,
  `lastUpdatedBy` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `type`, `productName`, `productweight`, `productPrice`, `gender`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `addedBy`, `lastUpdatedBy`) VALUES
(26, 1, 1, 'Gold', 'Glinting Butterfly Diamond Stud Earrings(14 Carate)', '', 8607, 'gender', 'Product Information\r\nWidth - 7.5 mm\r\nHeight - 5.9 mm\r\nPurity - 14 Kt\r\nApprox.Weight - 0.97 g', 'd917f129d6e4b0895d864682a3909c5b.jpg', '610510f601f662581c6fbb577c8b30f5.jpg', 'a6146e9bb59550da409063667a94b450.jpg', 120, 'In Stock', '2022-01-31 05:26:23', NULL, 1, NULL),
(27, 1, 2, 'Gold', 'Drop Earing 22 Carate', '15G', 24000, 'gender', 'Drop Earing 22 Carate\r\nuiyuiyui\r\njoiuoi\r\nkoujoi', 'c3c08f9c03c66d753798274b4245d158.jpg', 'c3c08f9c03c66d753798274b4245d158.jpg', 'c3c08f9c03c66d753798274b4245d158.jpg', 120, 'In Stock', '2022-01-31 05:38:58', '2022-02-12 11:46:54', 1, 1),
(28, 2, 10, 'Diamond', 'Crystal Diamond Pendant', '', 15346, 'gender', 'Width - 7.2 mm\r\nHeight - 28.9 mm\r\nPurity - 18 Kt\r\nApprox.Weight - 1.62 g', '42e3a6ca313022c6d3f34a1676bd434f.jpg', 'e431ea294034a9afbc885e35e4ad0558.jpg', '42e3a6ca313022c6d3f34a1676bd434f.jpg', 80, 'In Stock', '2022-01-31 05:42:33', NULL, 1, NULL),
(29, 2, 12, 'Gold', 'Teardrop Pendant in gold', '', 27000, 'gender', 'Teardrop Pendant in gold\r\nProduct Information\r\nWeight: 2 gm\r\nCarate: 22K', '19e2705e043c3807b4a19fd336977ec8.jpg', '3fcb00947475cd8a85638374f20198b2.jpg', '19e2705e043c3807b4a19fd336977ec8.jpg', 85, 'In Stock', '2022-01-31 05:50:07', NULL, 1, NULL),
(30, 1, 1, 'Gold', 'gjhghjgj', '7gm', 545544, 'gender', 'hjkhkjhkjhkhkhklvcgf\r\ngtuyiuhkjk', '205a8fd06cdb1ab80d3b1436c004be9b.jpg', 'ca1df5cc5f239e4475e32d2c451b9caa.jpg', '205a8fd06cdb1ab80d3b1436c004be9b.jpg', 89, 'In Stock', '2022-01-31 12:56:00', NULL, 1, NULL),
(31, 2, 11, 'Diamond', 'bjgjlhhui', '12 gm', 11579888, 'Female', 'jhghjghhkkjl\r\nkjhiuyiu\r\nkjyiuyioulhyiuytiu\r\njiouiy', 'b0962738125cc719cb04e494ef6675f8.jpg', '94896cbf76d9133c94b737da69d79832.jpg', '0f60661062bc215e2f63d28554dc6832.jpg', 90, 'In Stock', '2022-01-31 12:58:29', NULL, 1, NULL),
(32, 2, 12, 'Gold', 'Teardrop Pendant in gold', '', 27000, 'gender', 'Teardrop Pendant in gold\r\nProduct Information\r\nWeight: 2 gm\r\nCarate: 22K', '19e2705e043c3807b4a19fd336977ec8.jpg', '3fcb00947475cd8a85638374f20198b2.jpg', '19e2705e043c3807b4a19fd336977ec8.jpg', 85, 'In Stock', '2022-01-31 05:50:07', NULL, 1, NULL),
(33, 1, 1, 'Gold', 'gjhghjgj', '7gm', 545544, 'gender', 'hjkhkjhkjhkhkhklvcgf\r\ngtuyiuhkjk', '205a8fd06cdb1ab80d3b1436c004be9b.jpg', 'ca1df5cc5f239e4475e32d2c451b9caa.jpg', '205a8fd06cdb1ab80d3b1436c004be9b.jpg', 89, 'In Stock', '2022-01-31 12:56:00', NULL, 1, NULL),
(34, 2, 12, 'Gold', 'Teardrop Pendant in gold', '', 27000, 'gender', 'Teardrop Pendant in gold\r\nProduct Information\r\nWeight: 2 gm\r\nCarate: 22K', '19e2705e043c3807b4a19fd336977ec8.jpg', '3fcb00947475cd8a85638374f20198b2.jpg', '19e2705e043c3807b4a19fd336977ec8.jpg', 85, 'In Stock', '2022-01-31 05:50:07', NULL, 1, NULL),
(35, 2, 10, 'Diamond', 'Crystal Diamond Pendant', '', 15346, 'gender', 'Width - 7.2 mm\r\nHeight - 28.9 mm\r\nPurity - 18 Kt\r\nApprox.Weight - 1.62 g', '42e3a6ca313022c6d3f34a1676bd434f.jpg', 'e431ea294034a9afbc885e35e4ad0558.jpg', '42e3a6ca313022c6d3f34a1676bd434f.jpg', 80, 'In Stock', '2022-01-31 05:42:33', NULL, 1, NULL),
(36, 1, 2, 'Gold', 'Drop Earing 22 Carate', '', 24000, 'gender', 'Drop Earing 22 Carate\r\nuiyuiyui\r\njoiuoi\r\nkoujoi', 'c3c08f9c03c66d753798274b4245d158.jpg', 'c3c08f9c03c66d753798274b4245d158.jpg', 'c3c08f9c03c66d753798274b4245d158.jpg', 120, 'In Stock', '2022-01-31 05:38:58', NULL, 1, NULL),
(37, 1, 2, 'Gold', 'fsdfsd', '234csdf', 234234, 'Female', 'dsfsdf', '402fdfb700f491da48cf8536e0593cf0.jpg', '402fdfb700f491da48cf8536e0593cf0.jpg', '402fdfb700f491da48cf8536e0593cf0.jpg', 34, 'In Stock', '2022-02-12 11:55:44', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategoryName` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `createdBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategoryName`, `creationDate`, `updationDate`, `createdBy`) VALUES
(1, 1, 'Stud Earrings', '2022-01-31 04:32:15', NULL, 1),
(5, 1, 'Hoop Earrings', '2022-01-31 04:33:25', NULL, 1),
(6, 1, 'Huggie Earrings', '2022-01-31 04:33:42', NULL, 1),
(7, 1, 'Threader Earrings', '2022-01-31 04:33:59', NULL, 1),
(8, 1, 'Jacket Earrings', '2022-01-31 04:34:35', NULL, 1),
(9, 1, 'Ear Climbers', '2022-01-31 04:34:52', NULL, 1),
(10, 2, 'CRYSTAL PENDANT', '2022-01-31 04:35:47', NULL, 1),
(11, 2, 'CROSS PENDANT', '2022-01-31 04:36:04', NULL, 1),
(12, 2, 'TEARDROP PENDANT', '2022-01-31 04:36:22', NULL, 1),
(13, 2, 'HAMSA PENDANT', '2022-01-31 04:36:35', NULL, 1),
(14, 2, 'HAMSA PENDANT', '2022-01-31 04:37:09', NULL, 1),
(15, 2, 'PEARL PENDANT', '2022-01-31 04:37:33', NULL, 1),
(16, 3, 'Claddagh Ring', '2022-01-31 04:48:43', NULL, 1),
(17, 3, 'Cluster Ring', '2022-01-31 04:48:59', NULL, 1),
(18, 3, 'Cocktail Ring', '2022-01-31 04:49:17', NULL, 1),
(19, 3, 'Contemporary Ring', '2022-01-31 04:49:34', NULL, 1),
(20, 3, 'Engagement Ring', '2022-01-31 04:49:49', NULL, 1),
(21, 5, 'Mariner Chain', '2022-01-31 04:51:47', NULL, 1),
(22, 5, 'Ball Chain', '2022-01-31 04:52:10', NULL, 1),
(24, 9, 'Sub Test', '2022-02-12 11:36:02', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 8979555558, 'admin@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2022-02-02 04:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontact`
--

CREATE TABLE `tblcontact` (
  `ID` int(10) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `EnquiryDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `IsRead` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblcontact`
--

INSERT INTO `tblcontact` (`ID`, `Name`, `Email`, `Message`, `EnquiryDate`, `IsRead`) VALUES
(1, 'Kiran', 'kran@gmail.com', 'cost of volvo place pritampura to dwarka', '2021-07-05 07:26:24', 1),
(2, 'Sarita Pandey', 'sar@gmail.com', 'huiyuihhjjkhkjvhknv iyi tuyvuoiup', '2021-07-09 12:48:40', 1),
(3, 'Test', 'test@gmail.com', 'Want to know price of forest cake', '2021-07-16 12:51:06', 1),
(4, 'Shanu', 'shanu@gmail.com', 'hkjhkjhk', '2021-07-17 07:32:14', 1),
(5, 'Taanu Sharma', 'tannu@gmail.com', 'ytjhdjguqwgyugjhbjdsuy\r\nkjhjkwhkd\r\nljkkljwq\r\nmlkjol ', '2021-07-28 12:09:22', 1),
(6, 'Harish Kumar', 'hari@gmail.com', 'rytweiuyeiouoipoipo[po\r\njknkjlkdsflkjflkdjslk;lsdkf;l\r\nn,mn,ncxm.,m.m.,.', '2021-07-31 16:34:16', NULL),
(7, 'test', 'test@gmail.com', 'Test', '2021-08-25 16:56:19', 1),
(8, 'Sarita Pandey', 'sar@gmail.com', 'ytgjq[prooaerh', '2022-02-07 11:38:47', NULL),
(9, 'Anuj', 'ak@gmail.com', 'This is for Testing.', '2022-02-12 11:49:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblorderaddresses`
--

CREATE TABLE `tblorderaddresses` (
  `ID` int(10) NOT NULL,
  `UserId` int(5) DEFAULT NULL,
  `Ordernumber` int(10) DEFAULT NULL,
  `Flatnobuldngno` varchar(200) DEFAULT NULL,
  `StreetName` varchar(200) DEFAULT NULL,
  `Area` varchar(200) DEFAULT NULL,
  `Landmark` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `Zipcode` int(10) DEFAULT NULL,
  `Phone` bigint(11) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `PaymentMethod` varchar(200) DEFAULT NULL,
  `OrderTime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Status` varchar(200) DEFAULT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `UpdationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblorderaddresses`
--

INSERT INTO `tblorderaddresses` (`ID`, `UserId`, `Ordernumber`, `Flatnobuldngno`, `StreetName`, `Area`, `Landmark`, `City`, `Zipcode`, `Phone`, `Email`, `PaymentMethod`, `OrderTime`, `Status`, `Remark`, `UpdationDate`) VALUES
(1, 5, 424108694, '456', 'ghy', 'hjkh', 'guytuy', 'ytyt', 201017, 6565785875, 'rt@gmail.com', 'Cash on Delivery', '2022-02-04 07:21:48', 'Delivered', 'Your order has been delivered', '2022-02-04 07:21:48'),
(2, 5, 624951460, 'H-809', 'Abc street', 'Gokuldham', 'Hyuf palace', 'ghaziabad', 155016, 7979879798, 'hjk@gmail.com', 'Credit Card', '2022-02-04 07:34:55', 'Delivered', 'Order has been deliver', '2022-02-04 07:34:55'),
(3, 5, 260984104, 'ggjh', 'jhgjh', 'jhgjh', 'hkhk', 'kjhkj', 664446, 8887997789, 'kj@gmail.com', 'Debit Card', '2022-02-04 08:37:29', 'Order Cancelled', 'Order Cancelled', '2022-02-04 08:37:29'),
(5, 5, 849570981, 'hgjhg', 'jhgh', 'jhg', 'koiuoiuo', 'oiuoiuo', 789456, 9879879879, 'kjk@gmail.com', 'E-Wallet', '2022-02-04 08:39:23', NULL, NULL, '2022-02-04 08:39:23'),
(6, 6, 224122905, 'H 345', 'ABC Street', 'New XYZ', 'NA', 'New Delhi', 110001, 1234567890, 'ak@gmail.cokm', '', '2022-02-12 11:01:47', 'Order Confirmed', 'Order Has been Confirmed', '2022-02-12 11:01:47'),
(7, 7, 819293354, 'XYZ', 'ABC Street', 'Noida', 'NA', 'Noida', 201301, 3698521470, 'jhohn@gmail.com', 'Cash on Delivery', '2022-02-12 11:35:02', 'Delivered', 'Delivered', '2022-02-12 11:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `Timing`) VALUES
(1, 'aboutus', 'About Us', '<div><font color=\"#202124\" face=\"arial, sans-serif\"><b>Our mission declares our purpose of existence as a company and our objectives.</b></font></div><div><font color=\"#202124\" face=\"arial, sans-serif\"><b><br></b></font></div><div><font color=\"#202124\" face=\"arial, sans-serif\"><b>To give every customer much more than what he/she asks for in terms of quality, selection, value for money and customer service, by understanding local tastes and preferences and innovating constantly to eventually provide an unmatched experience in jewellery shopping.</b></font></div>', NULL, NULL, NULL, ''),
(2, 'contactus', 'Contact Us', '890,Sector 62, Gyan Sarovar, GAIL Noida(Delhi/NCR)', 'info@gmail.com', 7896541239, NULL, '10:30 am to 8:30 pm');

-- --------------------------------------------------------

--
-- Table structure for table `tblreview`
--

CREATE TABLE `tblreview` (
  `ID` int(10) NOT NULL,
  `ProductID` int(10) DEFAULT NULL,
  `ReviewTitle` varchar(200) DEFAULT NULL,
  `Review` mediumtext DEFAULT NULL,
  `UserId` int(5) DEFAULT NULL,
  `DateofReview` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Remark` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `UpdationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblreview`
--

INSERT INTO `tblreview` (`ID`, `ProductID`, `ReviewTitle`, `Review`, `UserId`, `DateofReview`, `Remark`, `Status`, `UpdationDate`) VALUES
(1, 1, 'Great Product', 'nice product I have great expierince', 2, '2022-02-07 10:01:12', 'Review Accept', 'Review Accept', '2021-08-12 07:15:07'),
(2, 3, 'Great Expierence', 'nice product', 1, '2022-02-07 10:01:07', 'Review Reject', 'Review Reject', '2021-08-12 07:15:07'),
(5, 26, 'test', 'Value for Money. Excellent Product', 5, '2022-02-12 09:02:31', 'Review Accept', 'Review Accept', '2021-08-25 16:54:56'),
(6, 26, 'Nice Product', 'Nice Prodouct', 5, '2022-02-12 09:02:09', 'Review Accept', 'Review Accept', '2022-02-05 10:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscriber`
--

CREATE TABLE `tblsubscriber` (
  `ID` int(5) NOT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `DateofSub` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblsubscriber`
--

INSERT INTO `tblsubscriber` (`ID`, `Email`, `DateofSub`) VALUES
(1, 'ani@gmail.com', '2021-07-16 07:32:33'),
(2, 'rahul@gmail.com', '2021-07-16 07:32:33'),
(6, 'j@gmail.com', '2021-08-16 15:00:59'),
(7, 'cfsdf@gmail.com', '2021-08-25 16:57:34'),
(8, 'money@gmail.com', '2022-02-09 11:19:40'),
(9, 'anujk@gmail.com', '2022-02-12 10:53:53'),
(10, 'jh@gmail.com', '2022-02-12 11:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `tbltracking`
--

CREATE TABLE `tbltracking` (
  `ID` int(10) NOT NULL,
  `OrderId` char(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` char(50) DEFAULT NULL,
  `StatusDate` timestamp NULL DEFAULT current_timestamp(),
  `OrderCanclledByUser` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltracking`
--

INSERT INTO `tbltracking` (`ID`, `OrderId`, `remark`, `status`, `StatusDate`, `OrderCanclledByUser`) VALUES
(1, '680013087', 'order confirmed', 'Order Confirmed', '2021-08-11 05:29:47', NULL),
(2, '680013087', 'Mobile Pickup', 'Mobile Pickup', '2021-08-11 05:35:09', NULL),
(3, '680013087', 'Mobile Pickup', 'Mobile Pickup', '2021-08-11 05:36:50', NULL),
(4, '680013087', 'Mobile Pickup', 'Mobile Pickup', '2021-08-11 05:37:59', NULL),
(5, '756641148', 'Order Confirmed', 'Order Confirmed', '2021-08-11 05:50:31', NULL),
(6, '756641148', 'Mobile Pickup', 'Mobile Pickup', '2021-08-11 05:50:56', NULL),
(7, '756641148', 'On the way', 'On The Way', '2021-08-11 05:51:28', NULL),
(8, '756641148', 'Delivered', 'Mobile Delivered', '2021-08-11 05:52:20', NULL),
(9, '501768737', 'Order is confirmed', 'Order Confirmed', '2021-08-25 16:50:39', NULL),
(10, '501768737', 'In transit', 'On The Way', '2021-08-25 16:51:03', NULL),
(11, '501768737', 'Delivered', 'On The Way', '2021-08-25 16:51:14', NULL),
(12, '680013087', 'delivered', 'Mobile Delivered', '2021-08-25 17:10:47', NULL),
(13, '424108694', 'delivery boy take the order', 'Pickup', '2022-02-04 07:19:47', NULL),
(14, '424108694', 'Delivery boy is on the way', 'On The Way', '2022-02-04 07:21:25', NULL),
(15, '424108694', 'Your order has been delivered', 'Delivered', '2022-02-04 07:21:48', NULL),
(16, '624951460', 'Order Confiremd', 'Order Confirmed', '2022-02-04 07:28:09', NULL),
(17, '624951460', 'Order Has been pickup', 'Pickup', '2022-02-04 07:30:45', NULL),
(18, '624951460', 'Delivery boy is on the way', 'On The Way', '2022-02-04 07:32:40', NULL),
(19, '624951460', 'Order has been deliver', 'Delivered', '2022-02-04 07:34:55', NULL),
(20, '260984104', 'Order Cancelled', 'Order Cancelled', '2022-02-04 08:37:29', NULL),
(21, '260984104', 'tyty', 'Order Cancelled', '2022-02-04 08:40:15', 1),
(22, '424108694', 'gthth', 'Order Cancelled', '2022-02-04 12:23:13', 1),
(23, '284289657', 'cancel', 'Order Cancelled', '2022-02-04 12:27:36', 1),
(24, '224122905', 'Order Has been Confirmed', 'Order Confirmed', '2022-02-12 11:01:47', NULL),
(25, '819293354', 'Order Has been corfiremed', 'Order Confirmed', '2022-02-12 11:33:57', NULL),
(26, '819293354', 'Order picked up', 'Pickup', '2022-02-12 11:34:26', NULL),
(27, '819293354', 'Delivered', 'Delivered', '2022-02-12 11:35:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:18:50', '', 1),
(2, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:29:33', '', 1),
(3, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 11:30:11', '', 1),
(4, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 15:00:23', '26-02-2017 11:12:06 PM', 1),
(5, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:08:58', '', 0),
(6, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:09:41', '', 0),
(7, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:04', '', 0),
(8, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:10:31', '', 0),
(9, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-26 18:13:43', '', 1),
(10, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:52:58', '', 0),
(11, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-02-27 18:53:07', '', 1),
(12, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:09', '', 0),
(13, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-03 18:00:15', '', 1),
(14, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-06 18:10:26', '', 1),
(15, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 12:28:16', '', 1),
(16, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:43:27', '', 1),
(17, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 18:55:33', '', 1),
(18, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-07 19:44:29', '', 1),
(19, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-08 19:21:15', '', 1),
(20, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:19:38', '', 1),
(21, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-15 17:20:36', '15-03-2017 10:50:39 PM', 1),
(22, 'anuj.lpu1@gmail.com', 0x3a3a3100000000000000000000000000, '2017-03-16 01:13:57', '', 1),
(23, 'hgfhgf@gmass.com', 0x3a3a3100000000000000000000000000, '2018-04-29 09:30:40', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `FirstName`, `LastName`, `Email`, `MobileNumber`, `Password`, `regDate`) VALUES
(1, 'Anuj Kumar', NULL, 'anuj.lpu1@gmail.com', 9009857868, 'f925916e2754e5e03f75dd58a5733251', '2017-02-04 19:30:50'),
(2, 'Amit ', NULL, 'amit@gmail.com', 8285703355, '5c428d8875d2948607f3e3fe134d71b4', '2017-03-15 17:21:22'),
(3, 'hg', NULL, 'hgfhgf@gmass.com', 1121312312, '827ccb0eea8a706c4c34a16891f84e7b', '2018-04-29 09:30:32'),
(4, 'hhkhj', 'jkh', 'g@gmail.com', 9089879765, '202cb962ac59075b964b07152d234b70', '2022-02-01 10:05:17'),
(5, 'sarita', 'pandey', 'sar@gmail.com', 7987979797, '202cb962ac59075b964b07152d234b70', '2022-02-02 06:12:53'),
(6, 'Manish ', 'Sisodia', 'manish@gmail.com', 8979898989, '202cb962ac59075b964b07152d234b70', '2022-02-05 09:49:18'),
(7, 'John', 'Doe', 'johdoe@gmail.com', 1478523690, 'f925916e2754e5e03f75dd58a5733251', '2022-02-12 11:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `UserId`, `ProductId`, `postingDate`) VALUES
(6, 5, 27, '2022-02-07 09:32:46'),
(10, 7, 28, '2022-02-12 11:31:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblorderaddresses`
--
ALTER TABLE `tblorderaddresses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblreview`
--
ALTER TABLE `tblreview`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblsubscriber`
--
ALTER TABLE `tblsubscriber`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbltracking`
--
ALTER TABLE `tbltracking`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontact`
--
ALTER TABLE `tblcontact`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblorderaddresses`
--
ALTER TABLE `tblorderaddresses`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblreview`
--
ALTER TABLE `tblreview`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblsubscriber`
--
ALTER TABLE `tblsubscriber`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbltracking`
--
ALTER TABLE `tbltracking`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


