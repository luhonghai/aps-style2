create database parkingsystem;
use parkingsystem;

CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_id` BIGINT(20),
  `firstname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` VARCHAR(100)  NOT NULL ,
  `password` VARCHAR(100)  NOT NULL ,
  `gender` BIT DEFAULT 1,
  `date_of_birth` DATETIME,
  `phone_no` VARCHAR(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `park` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `air_port` VARCHAR(200),
  `name` VARCHAR(200),
  `phone`VARCHAR(50),
  `address` VARCHAR(500),
  `capacity` int,
  `price` FLOAT
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `park_id` BIGINT(20),
  `user_id` BIGINT(20),
  `arrival_date` DATETIME,
  `departure_date` DATETIME,
  `car_number` VARCHAR(100),
  `car_made_by` VARCHAR(200),
  `car_model` VARCHAR(200),
  `type` int -- 0 = default, 1 = family, 2 = disabled
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

