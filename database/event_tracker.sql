-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 04:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendee`
--

CREATE TABLE `attendee` (
  `attendee_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `group_size` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendee`
--

INSERT INTO `attendee` (`attendee_id`, `name`, `username`, `password`, `email`, `group_size`, `group_id`) VALUES
(1, 'Alex Johnson', 'alexj', 'apass1', 'alex@email.com', 2, 101),
(2, 'Maria Garcia', 'mariag', 'mpass2', 'maria@email.com', 4, 102),
(3, 'Robert Kim', 'robertk', 'rpass3', 'robert@email.com', 1, 103),
(4, 'Emily Davis', 'emilyd', 'epass4', 'emily@email.com', 3, 104),
(5, 'Chris Wong', 'chrisw', 'cpass5', 'chris@email.com', 2, 105),
(6, 'Anna Smith', 'annas', 'apass6', 'anna@email.com', 5, 106),
(7, 'Peter Brown', 'peterb', 'ppass7', 'peter@email.com', 1, 107),
(8, 'Sofia Perez', 'sofiap', 'spass8', 'sofia@email.com', 2, 108),
(9, 'Ryan Taylor', 'ryant', 'rpass9', 'ryan@email.com', 3, 109),
(10, 'Linda Chen', 'lindac', 'lpass10', 'linda@email.com', 4, 110);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_num` int(11) NOT NULL,
  `event_start_date` date DEFAULT NULL,
  `event_end_date` date DEFAULT NULL,
  `event_status` varchar(20) DEFAULT NULL,
  `event_location` varchar(100) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_num`, `event_start_date`, `event_end_date`, `event_status`, `event_location`, `org_id`) VALUES
(1, '2024-01-15', '2024-01-16', 'upcoming', 'Convention Center', 2),
(2, '2024-02-01', '2024-02-03', 'upcoming', 'City Hall', 1),
(3, '2024-03-10', '2024-03-10', 'planning', 'Central Park', 1),
(4, '2024-04-20', '2024-04-22', 'upcoming', 'Sports Arena', 1),
(5, '2024-05-05', '2024-05-15', 'planning', 'Beach Resort', 5),
(6, '2024-06-15', '2024-06-17', 'planning', 'Mountain Lodge', 1),
(7, '2024-07-01', '2024-07-02', 'upcoming', 'Downtown Plaza', 1),
(8, '2024-08-12', '2024-08-14', 'planning', 'University Hall', 1),
(9, '2024-09-20', '2024-09-20', 'upcoming', 'Art Gallery', 1),
(10, '2024-10-31', '2024-10-31', 'planning', 'Historic Theater', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `item_num` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`item_num`, `type`) VALUES
(1, 'Vegetarian'),
(2, 'Vegan'),
(3, 'Gluten-Free'),
(4, 'Seafood'),
(5, 'BBQ'),
(6, 'Italian'),
(7, 'Asian Fusion'),
(8, 'Mexican'),
(9, 'Mediterranean'),
(10, 'Dessert');

-- --------------------------------------------------------

--
-- Table structure for table `organizer`
--

CREATE TABLE `organizer` (
  `org_id` int(11) NOT NULL,
  `orgname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `event_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizer`
--

INSERT INTO `organizer` (`org_id`, `orgname`, `email`, `username`, `password`, `event_status`) VALUES
(1, 'John Smith', 'john@events.com', 'johnsmith', 'pass123', 'active'),
(2, 'Sarah Jones', 'sarah@events.com', 'sarahj', 'pass456', 'active'),
(3, 'Mike Wilson', 'mike@events.com', 'mikew', 'pass789', 'inactive'),
(4, 'Lisa Brown', 'lisa@events.com', 'lisab', 'pass321', 'active'),
(5, 'Tom Davis', 'tom@events.com', 'tomd', 'pass654', 'active'),
(6, 'Emma White', 'emma@events.com', 'emmaw', 'pass987', 'active'),
(7, 'David Lee', 'david@events.com', 'davidl', 'pass147', 'inactive'),
(8, 'Amy Chen', 'amy@events.com', 'amyc', 'pass258', 'active'),
(9, 'James Wilson', 'james@events.com', 'jamesw', 'pass369', 'active'),
(10, 'Kate Miller', 'kate@events.com', 'katem', 'pass741', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `attendee_id` int(11) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `item_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `attendee_id`, `payment_date`, `org_id`, `item_num`) VALUES
(1, 1, '2024-01-01', 1, 1),
(2, 2, '2024-01-02', 1, 2),
(3, 3, '2024-01-03', 2, 3),
(4, 4, '2024-01-04', 2, 4),
(5, 5, '2024-01-05', 3, 5),
(6, 6, '2024-01-06', 4, 6),
(7, 7, '2024-01-07', 5, 7),
(8, 8, '2024-01-08', 6, 8),
(9, 9, '2024-01-09', 7, 9),
(10, 10, '2024-01-10', 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `reg_num` int(11) NOT NULL,
  `event_num` int(11) DEFAULT NULL,
  `attendee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`reg_num`, `event_num`, `attendee_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 4, 6),
(7, 5, 7),
(8, 6, 8),
(9, 7, 9),
(10, 8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_num` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `item_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_num`, `type`, `item_num`) VALUES
(1, 'VIP', 1),
(2, 'Regular', 2),
(3, 'Premium', 3),
(4, 'Standard', 4),
(5, 'VIP', 5),
(6, 'Regular', 6),
(7, 'Premium', 7),
(8, 'Standard', 8),
(9, 'VIP', 9),
(10, 'Regular', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendee`
--
ALTER TABLE `attendee`
  ADD PRIMARY KEY (`attendee_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_num`),
  ADD KEY `fk_organizer` (`org_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`item_num`);

--
-- Indexes for table `organizer`
--
ALTER TABLE `organizer`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `attendee_id` (`attendee_id`),
  ADD KEY `org_id` (`org_id`),
  ADD KEY `item_num` (`item_num`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`reg_num`),
  ADD KEY `event_num` (`event_num`),
  ADD KEY `attendee_id` (`attendee_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_num`),
  ADD KEY `item_num` (`item_num`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_organizer` FOREIGN KEY (`org_id`) REFERENCES `organizer` (`org_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`attendee_id`) REFERENCES `attendee` (`attendee_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`org_id`) REFERENCES `organizer` (`org_id`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`item_num`) REFERENCES `food` (`item_num`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`event_num`) REFERENCES `event` (`event_num`),
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`attendee_id`) REFERENCES `attendee` (`attendee_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`item_num`) REFERENCES `food` (`item_num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
