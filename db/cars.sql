SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET TIME_ZONE = "+00:00";

-- Admin Table
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` INT(11) NOT NULL AUTO_INCREMENT,
  `uname` VARCHAR(255) NOT NULL,
  `pass` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE = INNODB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 2;

INSERT INTO `admin` (`admin_id`, `uname`, `pass`) VALUES
(1, 'admin', 'admin');

-- Cars Table
CREATE TABLE IF NOT EXISTS `cars` (
  `car_id` INT(11) NOT NULL AUTO_INCREMENT,
  `car_name` VARCHAR(255) NOT NULL,
  `car_type` VARCHAR(255) NOT NULL,
  `image` TEXT NOT NULL,
  `hire_cost` INT(11) NOT NULL,
  `capacity` INT(11) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE = INNODB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 8;

INSERT INTO `cars` (`car_id`, `car_name`, `car_type`, `image`, `hire_cost`, `capacity`, `status`) VALUES
(1, 'Mercedes', 'Mercedes Benz', 'amg.jpg', 20000, 5, 'Available'),
(2, 'Audi A4', 'Audi', 'audi.jpg', 30000, 6, 'Available'),
(3, 'bmw 3 series', 'BMW', 'bmw.png', 20000, 6, 'Available'),
(4, 'LandCruiser V8', 'LandCruiser ', 'land.jpg', 20000, 5, 'Available'),
(5, 'Toyota Corolla', 'Toyota', 'Corolla.jpg', 30000, 8, 'Available'),
(6, 'Honda Civic', 'Civic', 'civic.jpg', 50000, 10, 'Available');

-- Client Table
CREATE TABLE IF NOT EXISTS `client` (
  `client_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `id_no` BIGINT(20) NOT NULL,
  `phone` BIGINT(20) NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(255) NOT NULL,
  `car_id` INT(11) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`client_id`),
  FOREIGN KEY (`car_id`) REFERENCES `cars`(`car_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 5;

INSERT INTO `client` (`client_id`, `fname`, `email`, `id_no`, `phone`, `location`, `gender`, `car_id`, `status`) VALUES
(2, 'ahmed khan', 'ahmed.khan@gmail.com', 4210156789123, 3001234567, 'karachi', 'Male', 1, 'Approved'),
(3, 'imran malik', 'imran.malik@hotmail.com', 3520212345678, 3123456789, 'lahore', 'Male', 2, 'Approved'),
(4, 'usman ali', 'usman.ali@yahoo.com', 6110123456789, 3456789012, 'islamabad', 'Male', 2, 'Approved');

-- Hire Table
CREATE TABLE IF NOT EXISTS `hire` (
  `hire_id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11) NOT NULL,
  `car_id` INT(11) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`hire_id`),
  FOREIGN KEY (`client_id`) REFERENCES `client`(`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`car_id`) REFERENCES `cars`(`car_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = INNODB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 4;

INSERT INTO `hire` (`hire_id`, `client_id`, `car_id`, `status`) VALUES
(1, 2, 1, 'Ongoing'),
(2, 3, 2, 'Completed'),
(3, 4, 2, 'Pending');

-- Message Table
CREATE TABLE IF NOT EXISTS `message` (
  `msg_id` INT(11) NOT NULL AUTO_INCREMENT,
  `client_id` INT(11),  -- Allow NULL for ON DELETE SET NULL
  `message` VARCHAR(255) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `time` DATETIME NOT NULL,
  PRIMARY KEY (`msg_id`),
  FOREIGN KEY (`client_id`) REFERENCES `client`(`client_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE
) ENGINE = INNODB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 6;


INSERT INTO `message` (`msg_id`, `client_id`, `message`, `status`, `time`) VALUES
(2, 2, 'Am happy its working?', 'Unread', '2023-01-01 10:00:00'),
(3, 3, 'Thanks for that..OK?', 'Unread', '2023-01-01 11:00:00'),
(5, 4, 'I love this. It worked the way i want...', 'Unread', '2023-01-01 12:00:00');
