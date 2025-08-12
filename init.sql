CREATE USER 'user00'@'%'
  IDENTIFIED WITH mysql_native_password BY 'password00';
GRANT ALL
  ON *.*
  TO 'user00'@'%'
  WITH GRANT OPTION;
SET NAMES utf8mb4;

CREATE DATABASE mydb DEFAULT CHARACTER SET utf8mb4;
USE mydb;

CREATE TABLE `mytable` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `value` varchar(128) NOT NULL
);

INSERT INTO `mytable` (`value`) VALUES
('data00'),
('data01'),
('data02');
