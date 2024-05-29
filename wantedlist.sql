-- phpMyAdmin SQL Dump
-- version 4.2.4
-- http://www.phpmyadmin.net
--
-- Host: ovid.u.washington.edu:20345
-- Generation Time: May 23, 2019 at 04:58 PM
-- Server version: 5.5.18
-- PHP Version: 7.2.4

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wantedlist`
--

DROP DATABASE IF EXISTS `wantedlist`;

CREATE DATABASE IF NOT EXISTS `wantedlist` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `wantedlist`;


-- Drop child tables first to avoid foreign key constraints
DROP TABLE IF EXISTS `criminal_alias`;
DROP TABLE IF EXISTS `criminal`;
DROP TABLE IF EXISTS `criminal_location`;
DROP TABLE IF EXISTS `authority_cases`;
DROP TABLE IF EXISTS `authority_phone`;
DROP TABLE IF EXISTS `authority`;
DROP TABLE IF EXISTS `victim`;
DROP TABLE IF EXISTS `victim_injuries`;
DROP TABLE IF EXISTS `victim_phone`;
DROP TABLE IF EXISTS `PSA`;
DROP TABLE IF EXISTS `PSA_Locations`;
DROP TABLE IF EXISTS `crimes`;
DROP TABLE IF EXISTS `witnesses`;
DROP TABLE IF EXISTS `witness_phone`;
-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE IF NOT EXISTS `authority` (
  `authorityID` int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  `name` varchar(50) DEFAULT NULL,
  `jurisdiction` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authority` (`authorityID`, `name`, `jurisdiction`) VALUES
(1, 'Authority One', 'Region A'),
(2, 'Authority Two', 'Region B'),
(3, 'Authority Three', 'Region C'),
(4, 'Authority Four', 'Region D'),
(5, 'Authority Five', 'Region E'),
(6, 'Authority Six', 'Region F'),
(7, 'Authority Seven', 'Region G'),
(8, 'Authority Eight', 'Region H'),
(9, 'Authority Nine', 'Region I'),
(10, 'Authority Ten', 'Region J'),
(11, 'Authority Eleven', 'Region K'),
(12, 'Authority Twelve', 'Region L'),
(13, 'Authority Thirteen', 'Region M'),
(14, 'Authority Fourteen', 'Region N'),
(15, 'Authority Fifteen', 'Region O'),
(16, 'Authority Sixteen', 'Region P'),
(17, 'Authority Seventeen', 'Region Q'),
(18, 'Authority Eighteen', 'Region R'),
(19, 'Authority Nineteen', 'Region S'),
(20, 'Authority Twenty', 'Region T');


--
-- table for authority phone num
--

CREATE TABLE IF NOT EXISTS `authority_phone` (
  `authorityID` int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  `phone` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`authorityID`) REFERENCES `authority`(`authorityID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authority_phone` (`authorityID`, `phone`) VALUES
(1, '555-1234'),
(2, '555-2345'),
(3, '555-3456'),
(4, '555-4567'),
(5, '555-5678'),
(6, '555-6789'),
(7, '555-7890'),
(8, '555-8901'),
(9, '555-9012'),
(10, '555-0123'),
(11, '555-1111'),
(12, '555-2222'),
(13, '555-3333'),
(14, '555-4444'),
(15, '555-5555'),
(16, '555-6666'),
(17, '555-7777'),
(18, '555-8888'),
(19, '555-9999'),
(20, '555-0000');


--
-- table for authority cases
--

CREATE TABLE IF NOT EXISTS `authority_cases` (
  `authorityID` int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  `caseID` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`authorityID`) REFERENCES `authority`(`authorityID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `authority_cases` (`authorityID`, `caseID`) VALUES
(1, 1001),
(2, 1002),
(3, 1003),
(4, 1004),
(5, 1005),
(6, 1006),
(7, 1007),
(8, 1008),
(9, 1009),
(10, 1010),
(11, 1011),
(12, 1012),
(13, 1013),
(14, 1014),
(15, 1015),
(16, 1016),
(17, 1017),
(18, 1018),
(19, 1019),
(20, 1020);



--
-- table for criminal
--

CREATE TABLE IF NOT EXISTS `criminal` (
  `criminalID` int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  `flyerID` varchar(50) DEFAULT NULL,
  `DOB` DATE DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `bounty` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `authorityID` int(11) NOT NULL DEFAULT '0',
  FOREIGN KEY (`authorityID`) REFERENCES `authority`(`authorityID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `criminal` (`criminalID`, `flyerID`, `DOB`, `gender`, `name`, `bounty`, `status`, `authorityID`) VALUES
(1, 'FLY001', '1980-01-01', 'Male', 'John Doe', '10000', 'Wanted', 1),
(2, 'FLY002', '1975-02-02', 'Female', 'Jane Smith', '15000', 'Captured', 2),
(3, 'FLY003', '1982-03-03', 'Male', 'Bob Johnson', '20000', 'Wanted', 3),
(4, 'FLY004', '1985-04-04', 'Female', 'Alice Brown', '5000', 'Captured', 4),
(5, 'FLY005', '1990-05-05', 'Male', 'Charlie Davis', '25000', 'Wanted', 5),
(6, 'FLY006', '1988-06-06', 'Female', 'Emily Wilson', '30000', 'Captured', 6),
(7, 'FLY007', '1984-07-07', 'Male', 'Frank Thomas', '12000', 'Wanted', 7),
(8, 'FLY008', '1992-08-08', 'Female', 'Grace Martinez', '35000', 'Captured', 8),
(9, 'FLY009', '1978-09-09', 'Male', 'Henry Lee', '40000', 'Wanted', 9),
(10, 'FLY010', '1986-10-10', 'Female', 'Isabella Harris', '45000', 'Captured', 10),
(11, 'FLY011', '1991-11-11', 'Male', 'Jack Walker', '5000', 'Wanted', 11),
(12, 'FLY012', '1983-12-12', 'Female', 'Karen Hall', '55000', 'Captured', 12),
(13, 'FLY013', '1987-01-13', 'Male', 'Larry King', '60000', 'Wanted', 13),
(14, 'FLY014', '1979-02-14', 'Female', 'Mary Scott', '65000', 'Captured', 14),
(15, 'FLY015', '1981-03-15', 'Male', 'Nick Adams', '70000', 'Wanted', 15),
(16, 'FLY016', '1989-04-16', 'Female', 'Olivia Clark', '75000', 'Captured', 16),
(17, 'FLY017', '1993-05-17', 'Male', 'Peter Lewis', '80000', 'Wanted', 17),
(18, 'FLY018', '1986-06-18', 'Female', 'Quinn Robinson', '85000', 'Captured', 18),
(19, 'FLY019', '1977-07-19', 'Male', 'Rachel Young', '90000', 'Wanted', 19),
(20, 'FLY020', '1994-08-20', 'Female', 'Steve Allen', '95000', 'Captured', 20);


--
-- crimes
--

CREATE TABLE IF NOT EXISTS `crimes` (
  `crimeNo` int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  `description` varchar(50) DEFAULT NULL,
  `date` DATE DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `witnessCount` int(11) DEFAULT NULL,
  `criminalID` int(11) NOT NULL DEFAULT '0',
  FOREIGN KEY (`criminalID`) REFERENCES `criminal`(`criminalID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `crimes` (`crimeNo`, `description`, `date`, `location`, `status`, `name`, `witnessCount`, `criminalID`) VALUES
(1, 'Bank Robbery', '2024-01-10', 'New York, NY', 'Unsolved', 'John Doe', 5, 1),
(2, 'Arson', '2024-02-15', 'Los Angeles, CA', 'Solved', 'Jane Smith', 3, 2),
(3, 'Burglary', '2024-03-20', 'Chicago, IL', 'Unsolved', 'Bob Johnson', 2, 3),
(4, 'Homicide', '2024-04-25', 'Houston, TX', 'Unsolved', 'Alice Brown', 4, 4),
(5, 'Fraud', '2024-05-30', 'Phoenix, AZ', 'Solved', 'Charlie Davis', 1, 5),
(6, 'Kidnapping', '2024-06-05', 'Philadelphia, PA', 'Unsolved', 'Emily Wilson', 6, 6),
(7, 'Drug Trafficking', '2024-07-10', 'San Antonio, TX', 'Solved', 'Frank Thomas', 7, 7),
(8, 'Human Trafficking', '2024-08-15', 'San Diego, CA', 'Unsolved', 'Grace Martinez', 8, 8),
(9, 'Terrorism', '2024-09-20', 'Dallas, TX', 'Unsolved', 'Henry Lee', 10, 9),
(10, 'Extortion', '2024-10-25', 'San Jose, CA', 'Solved', 'Isabella Harris', 4, 10),
(11, 'Cybercrime', '2024-11-30', 'Austin, TX', 'Unsolved', 'Jack Walker', 2, 11),
(12, 'Money Laundering', '2024-12-05', 'Jacksonville, FL', 'Solved', 'Karen Hall', 5, 12),
(13, 'Theft', '2024-01-15', 'Fort Worth, TX', 'Unsolved', 'Larry King', 6, 13),
(14, 'Child Exploitation', '2024-02-20', 'Columbus, OH', 'Solved', 'Mary Scott', 3, 14),
(15, 'Rape', '2024-03-25', 'Charlotte, NC', 'Unsolved', 'Nick Adams', 8, 15),
(16, 'Weapons Trafficking', '2024-04-30', 'San Francisco, CA', 'Solved', 'Olivia Clark', 4, 16),
(17, 'Smuggling', '2024-05-05', 'Indianapolis, IN', 'Unsolved', 'Peter Lewis', 7, 17),
(18, 'Gang Violence', '2024-06-10', 'Seattle, WA', 'Solved', 'Quinn Robinson', 9, 18),
(19, 'Identity Theft', '2024-07-15', 'Denver, CO', 'Unsolved', 'Rachel Young', 2, 19),
(20, 'Armed Robbery', '2024-08-20', 'Washington, DC', 'Solved', 'Steve Allen', 1, 20);



--
-- table for criminal_alias
--

CREATE TABLE IF NOT EXISTS `criminal_alias` (
  `criminalID` int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  `alias` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`criminalID`) REFERENCES `criminal`(`criminalID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `criminal_alias` (`criminalID`, `alias`) VALUES
(1, 'The Shadow'),
(2, 'Black Widow'),
(3, 'The Snake'),
(4, 'Ghost Face'),
(5, 'Scarlet Witch'),
(6, 'The Viper'),
(7, 'Nightshade'),
(8, 'Dark Knight'),
(9, 'Steel Serpent'),
(10, 'Crimson Reaper'),
(11, 'Silver Fox'),
(12, 'Raven'),
(13, 'Deathstroke'),
(14, 'Spectre'),
(15, 'The Phantom'),
(16, 'Black Mamba'),
(17, 'The Enigma'),
(18, 'Shadow King'),
(19, 'The Banshee'),
(20, 'Mistress of Mayhem');



--
-- table for criminal_location
--

CREATE TABLE IF NOT EXISTS `criminal_location` (
  `criminalID` int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  `location` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`criminalID`) REFERENCES `criminal`(`criminalID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `criminal_location` (`criminalID`, `location`) VALUES
(1, 'New York'),
(2, 'Los Angeles'),
(3, 'Chicago'),
(4, 'Houston'),
(5, 'Phoenix'),
(6, 'Philadelphia'),
(7, 'San Antonio'),
(8, 'San Diego'),
(9, 'Dallas'),
(10, 'San Jose'),
(11, 'Austin'),
(12, 'Jacksonville'),
(13, 'Fort Worth'),
(14, 'Columbus'),
(15, 'Charlotte'),
(16, 'San Francisco'),
(17, 'Indianapolis'),
(18, 'Seattle'),
(19, 'Denver'),
(20, 'Washington');



--
-- table for victim
--

CREATE TABLE IF NOT EXISTS `victim` (
  `SSN` varchar(50) NOT NULL DEFAULT '0' PRIMARY KEY,
  `Name` varchar(50) DEFAULT NULL,
  `Statement` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `DOB` DATE DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `criminalID` int(11) DEFAULT '0',
  FOREIGN KEY (`criminalID`) REFERENCES `criminal`(`criminalID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `victim` (`SSN`, `Name`, `Statement`, `Status`, `DOB`, `Gender`, `criminalID`) VALUES
('123-45-6789', 'Alice Johnson', 'I saw him running away!', 'Survivor', '1980-05-10', 'Female', 1),
('234-56-7890', 'Bob Smith', 'He stole my wallet!', 'Survivor', '1975-08-15', 'Male', 2),
('345-67-8901', 'Charlie Brown', 'She attacked me!', 'Victim', '1982-03-20', 'Male', 3),
('456-78-9012', 'Daisy Green', 'I was mugged!', 'Victim', '1985-06-25', 'Female', 4),
('567-89-0123', 'Eve Williams', 'He threatened me!', 'Survivor', '1990-10-30', 'Female', 5),
('678-90-1234', 'Frank Davis', 'They broke into my house!', 'Victim', '1988-07-05', 'Male', 6),
('789-01-2345', 'Grace Taylor', 'I was assaulted!', 'Victim', '1984-12-15', 'Female', 7),
('890-12-3456', 'Harry Brown', 'He attacked me with a knife!', 'Survivor', '1992-09-20', 'Male', 8),
('901-23-4567', 'Ivy Lee', 'I was robbed at gunpoint!', 'Victim', '1978-04-05', 'Female', 9),
('012-34-5678', 'Jack Martin', 'They stole my car!', 'Victim', '1986-11-10', 'Male', '10'),
('123-45-6780', 'Katie Clark', 'She vandalized my property!', 'Survivor', '1991-02-15', 'Female', 11),
('234-56-7891', 'Liam Hall', 'He threatened me!', 'Victim', '1983-07-20', 'Male', 12),
('345-67-8902', 'Mia Garcia', 'I was attacked!', 'Victim', '1979-10-25', 'Female', 13),
('456-78-9013', 'Nathan Young', 'He stole my laptop!', 'Survivor', '1987-03-30', 'Male', 14),
('567-89-0124', 'Olivia Martinez', 'She assaulted me!', 'Victim', '1981-06-05', 'Female', 15),
('678-90-1235', 'Paul Robinson', 'I was mugged!', 'Victim', '1989-09-10', 'Male', 16),
('789-01-2346', 'Quinn White', 'He broke into my house!', 'Survivor', '1977-12-20', 'Female', 17),
('890-12-3457', 'Ryan King', 'They threatened me with a gun!', 'Victim', '1993-01-25', 'Male', 18),
('901-23-4568', 'Samantha Adams', 'I was attacked by a gang!', 'Victim', '1986-04-01', 'Female', 19),
('012-34-5679', 'Tyler Scott', 'He stole my wallet!', 'Survivor', '1994-07-10', 'Male', 20);

--
-- table for victim_injuries
--

CREATE TABLE IF NOT EXISTS `victim_injuries` (
  `SSN` varchar(50) NOT NULL DEFAULT '0',
  `Injury` varchar(50) DEFAULT 'Unharmed',
  FOREIGN KEY (`SSN`) REFERENCES `victim`(`SSN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `victim_injuries` (`SSN`, `Injury`) VALUES
('123-45-6789', 'Head injury'),
('234-56-7890', 'Broken arm'),
('345-67-8901', 'Bruised ribs'),
('456-78-9012', 'Internal bleeding'),
('567-89-0123', 'Concussion'),
('678-90-1234', 'Sprained ankle'),
('789-01-2345', 'Black eye'),
('890-12-3456', 'Lacerations'),
('901-23-4567', 'Fractured skull'),
('012-34-5678', 'Neck injury'),
('123-45-6780', 'Stab wounds'),
('234-56-7891', 'Gunshot wound'),
('345-67-8902', 'Burns'),
('456-78-9013', 'Broken leg'),
('567-89-0124', 'Facial cuts'),
('678-90-1235', 'Back injury'),
('789-01-2346', 'Torn ligament'),
('890-12-3457', 'Broken nose'),
('901-23-4568', 'Rib fracture'),
('012-34-5679', 'Sprained wrist');

--
-- victim phone no
--

CREATE TABLE IF NOT EXISTS `victim_phone` (
  `SSN` varchar(50) NOT NULL DEFAULT '0',
  `Phone` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`SSN`) REFERENCES `victim`(`SSN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `victim_phone` (`SSN`, `Phone`) VALUES
('123-45-6789', '555-1234'),
('234-56-7890', '555-5678'),
('345-67-8901', '555-9101'),
('456-78-9012', '555-1122'),
('567-89-0123', '555-3344'),
('678-90-1234', '555-5566'),
('789-01-2345', '555-7788'),
('890-12-3456', '555-9900'),
('901-23-4567', '555-1111'),
('012-34-5678', '555-2222'),
('123-45-6780', '555-3333'),
('234-56-7891', '555-4444'),
('345-67-8902', '555-5555'),
('456-78-9013', '555-6666'),
('567-89-0124', '555-7777'),
('678-90-1235', '555-8888'),
('789-01-2346', '555-9999'),
('890-12-3457', '555-0000'),
('901-23-4568', '555-1212'),
('012-34-5679', '555-2323');


--
-- PSA
--

CREATE TABLE IF NOT EXISTS `PSA` (
  `PsaNo` int(11) NOT NULL DEFAULT '0' PRIMARY KEY,
  `Title` varchar(50) DEFAULT NULL,
  `Date` DATE DEFAULT NULL,
  `Subject` varchar(50) DEFAULT NULL,
  `Body Text` varchar(50) DEFAULT NULL,
  `authorityID` int(11) NOT NULL DEFAULT '0',
  FOREIGN KEY (`authorityID`) REFERENCES `authority`(`authorityID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `PSA` (`PsaNo`, `Title`, `Date`, `Subject`, `Body Text`, `authorityID`) VALUES
(1, 'Wanted: John Doe', '2024-01-01', 'Armed Robbery', 'Details about John Doe', 1),
(2, 'Wanted: Jane Smith', '2024-02-01', 'Fraud', 'Details about Jane Smith', 2),
(3, 'Wanted: Bob Johnson', '2024-03-01', 'Assault', 'Details about Bob Johnson', 3),
(4, 'Wanted: Alice Brown', '2024-04-01', 'Burglary', 'Details about Alice Brown', 4),
(5, 'Wanted: Charlie Davis', '2024-05-01', 'Homicide', 'Details about Charlie Davis', 5),
(6, 'Wanted: Emily Wilson', '2024-06-01', 'Kidnapping', 'Details about Emily Wilson', 6),
(7, 'Wanted: Frank Thomas', '2024-07-01', 'Drug Trafficking', 'Details about Frank Thomas', 7),
(8, 'Wanted: Grace Martinez', '2024-08-01', 'Human Trafficking', 'Details about Grace Martinez', 8),
(9, 'Wanted: Henry Lee', '2024-09-01', 'Terrorism', 'Details about Henry Lee', 9),
(10, 'Wanted: Isabella Harris', '2024-10-01', 'Extortion', 'Details about Isabella Harris', 10),
(11, 'Wanted: Jack Walker', '2024-11-01', 'Cybercrime', 'Details about Jack Walker', 11),
(12, 'Wanted: Karen Hall', '2024-12-01', 'Arson', 'Details about Karen Hall', 12),
(13, 'Wanted: Larry King', '2024-01-15', 'Money Laundering', 'Details about Larry King', 13),
(14, 'Wanted: Mary Scott', '2024-02-15', 'Child Exploitation', 'Details about Mary Scott', 14),
(15, 'Wanted: Nick Adams', '2024-03-15', 'Rape', 'Details about Nick Adams', 15),
(16, 'Wanted: Olivia Clark', '2024-04-15', 'Domestic Terrorism', 'Details about Olivia Clark', 16),
(17, 'Wanted: Peter Lewis', '2024-05-15', 'Weapons Trafficking', 'Details about Peter Lewis', 17),
(18, 'Wanted: Quinn Robinson', '2024-06-15', 'Smuggling', 'Details about Quinn Robinson', 18),
(19, 'Wanted: Rachel Young', '2024-07-15', 'Gang Violence', 'Details about Rachel Young', 19),
(20, 'Wanted: Steve Allen', '2024-08-15', 'Identity Theft', 'Details about Steve Allen', 20);


--
-- PSA locations
--

CREATE TABLE IF NOT EXISTS `PSA_Locations` (
  `PsaNo` int(11) NOT NULL DEFAULT '0',
  `Location` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`PsaNo`) REFERENCES `PSA`(`PsaNo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `PSA_Locations` (`PsaNo`, `Location`) VALUES
(1, 'New York, NY'),
(2, 'Los Angeles, CA'),
(3, 'Chicago, IL'),
(4, 'Houston, TX'),
(5, 'Phoenix, AZ'),
(6, 'Philadelphia, PA'),
(7, 'San Antonio, TX'),
(8, 'San Diego, CA'),
(9, 'Dallas, TX'),
(10, 'San Jose, CA'),
(11, 'Austin, TX'),
(12, 'Jacksonville, FL'),
(13, 'Fort Worth, TX'),
(14, 'Columbus, OH'),
(15, 'Charlotte, NC'),
(16, 'San Francisco, CA'),
(17, 'Indianapolis, IN'),
(18, 'Seattle, WA'),
(19, 'Denver, CO'),
(20, 'Washington, DC');


--
-- Witnesses
--

CREATE TABLE IF NOT EXISTS `witnesses` (
  `SSN` varchar(50) NOT NULL DEFAULT '0' PRIMARY KEY,
  `Name` varchar(50) DEFAULT NULL,
  `Statement` varchar(75) DEFAULT NULL,
  `DOB` DATE DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `crimeNo` int(11) DEFAULT '0',
  FOREIGN KEY (`crimeNo`) REFERENCES `crimes`(`crimeNo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `witnesses` (`SSN`, `Name`, `Statement`, `DOB`, `Gender`, `crimeNo`) VALUES
('111-22-3333', 'Liam Murphy', 'Saw the suspect fleeing the scene', '1980-01-01', 'Male', 1),
('222-33-4444', 'Sophia Johnson', 'Heard loud noises before the fire started', '1985-02-02', 'Female', 2),
('333-44-5555', 'Daniel Wilson', 'Noticed suspicious activity near the house', '1990-03-03', 'Male', 3),
('444-55-6666', 'Emily Davis', 'Saw the victim arguing with the suspect', '1975-04-04', 'Female', 4),
('555-66-7777', 'Michael Brown', 'Observed the suspect using a fake ID', '1982-05-05', 'Male', 5),
('666-77-8888', 'Emma Thompson', 'Witnessed the suspect forcing the victim into a car', '1995-06-06', 'Female', 6),
('777-88-9999', 'James Martinez', 'Saw a handoff of suspicious packages', '1988-07-07', 'Male', 7),
('888-99-0000', 'Bob Clark', 'Saw a group of people with the victim', '1992-08-08', 'Female', 8),
('999-00-1111', 'Noah Lewis', 'Heard an explosion from a nearby building', '1978-09-09', 'Male', 9),
('000-11-2222', 'Ava White', 'Received threatening messages from the suspect', '1986-10-10', 'Female', 10),
('111-22-3334', 'William Hall', 'Noticed unusual online activities', '1991-11-11', 'Male', 11),
('222-33-4445', 'Isabella King', 'Saw the suspect meeting with known criminals', '1984-12-12', 'Female', 12),
('333-44-5556', 'Logan Young', 'Heard cries for help from the house', '1979-01-13', 'Male', 13),
('444-55-6667', 'Charlotte Scott', 'Identified the suspect from a previous encounter', '1983-02-14', 'Female', 14),
('555-66-7778', 'Benjamin Walker', 'Observed the suspect making purchases with fake money', '1994-03-15', 'Male', 15),
('666-77-8889', 'Amelia Adams', 'Saw the suspect transporting weapons', '1996-04-16', 'Female', 16),
('777-88-9990', 'Lucas Robinson', 'Noticed suspicious cargo being unloaded', '1987-05-17', 'Male', 17),
('888-99-0001', 'Harper Harris', 'Heard gunshots during a gang altercation', '1989-06-18', 'Female', 18),
('999-00-1112', 'Jack Perez', 'Noticed someone using stolen identity details', '1990-07-19', 'Male', 19),
('000-11-2223', 'Grace Lee', 'Saw the suspect attacking the victim', '1981-08-20', 'Female', 20);


--
-- Witness_Phone
--

CREATE TABLE IF NOT EXISTS `witness_phone` (
  `SSN` varchar(50) NOT NULL DEFAULT '0',
  `Phone` varchar(50) DEFAULT NULL,
  FOREIGN KEY (`SSN`) REFERENCES `witnesses`(`SSN`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `witness_phone` (`SSN`, `Phone`) VALUES
('111-22-3333', '555-1111'),
('222-33-4444', '555-2222'),
('333-44-5555', '555-3333'),
('444-55-6666', '555-4444'),
('555-66-7777', '555-5555'),
('666-77-8888', '555-6666'),
('777-88-9999', '555-7777'),
('888-99-0000', '555-8888'),
('999-00-1111', '555-9999'),
('000-11-2222', '555-0000'),
('111-22-3334', '555-1234'),
('222-33-4445', '555-2345'),
('333-44-5556', '555-3456'),
('444-55-6667', '555-4567'),
('555-66-7778', '555-5678'),
('666-77-8889', '555-6789'),
('777-88-9990', '555-7890'),
('888-99-0001', '555-8901'),
('999-00-1112', '555-9012'),
('000-11-2223', '555-0123');
