#
# TABLE STRUCTURE FOR: Appointment
#

DROP TABLE IF EXISTS `Appointment`;

CREATE TABLE `Appointment` (
  `Date` int(11) NOT NULL,
  `AppointmentID` int(11) NOT NULL,
  `InvoiceID` int(11) NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `InvoiceID` (`InvoiceID`),
  CONSTRAINT `Appointment_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `Invoice` (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Client
#

DROP TABLE IF EXISTS `Client`;

CREATE TABLE `Client` (
  `PhoneNumber` int(15) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `FirstName` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (769605, 0, 'Ophelia', 'O\'Keefe');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (0, 1, 'Kylee', 'Morar');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (1, 2, 'Rafaela', 'Greenfelder');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (219038850, 3, 'Myles', 'Langworth');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (0, 4, 'Otha', 'Braun');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (1, 5, 'Jaunita', 'Pagac');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (0, 6, 'Laurie', 'Klein');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (1, 7, 'Daisy', 'Raynor');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (96, 8, 'Emmett', 'Davis');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES (0, 9, 'Henry', 'Doyle');


#
# TABLE STRUCTURE FOR: Employee
#

DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` (
  `Position` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DaysOff` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Friday', 0, 'Adriel', 'Lehner');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Wednesday', 1, 'Lucile', 'Maggio');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Sunday', 2, 'Emanuel', 'Goyette');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Sunday', 3, 'Dawn', 'Roob');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Tuesday', 4, 'Kenny', 'Morar');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Saturday', 5, 'Kian', 'Kuphal');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Monday', 6, 'Macy', 'Huel');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Saturday', 7, 'Waylon', 'Homenick');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Tuesday', 8, 'Kavon', 'Erdman');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('janitor', 'Friday', 9, 'Nicholaus', 'Leffler');


#
# TABLE STRUCTURE FOR: Includes
#

DROP TABLE IF EXISTS `Includes`;

CREATE TABLE `Includes` (
  `ServiceID` int(11) NOT NULL,
  `AppointmentID` int(11) NOT NULL,
  PRIMARY KEY (`ServiceID`,`AppointmentID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `Includes_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `Service` (`ServiceID`),
  CONSTRAINT `Includes_ibfk_2` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointment` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Invoice
#

DROP TABLE IF EXISTS `Invoice`;

CREATE TABLE `Invoice` (
  `InvoiceID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `PaymentType` int(11) NOT NULL,
  `AppointmentID` int(11) NOT NULL,
  `PaymentDate` int(11) NOT NULL,
  `InvoiceDate` int(11) NOT NULL,
  PRIMARY KEY (`InvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (0, 48991, 0, 2, 1990, 1984);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (1, 33, 0, 3, 1985, 1993);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (2, 22, 0, 8, 1987, 1986);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (3, 12579, 0, 4, 1975, 2010);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (4, 7241, 0, 2, 1990, 2001);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (5, 2876, 0, 8, 1991, 1972);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (6, 467, 0, 0, 1998, 2006);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (7, 201, 0, 2, 1970, 1992);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (8, 32874665, 0, 3, 2003, 1985);
INSERT INTO `Invoice` (`InvoiceID`, `Amount`, `PaymentType`, `AppointmentID`, `PaymentDate`, `InvoiceDate`) VALUES (9, 293185702, 0, 9, 2006, 1996);


#
# TABLE STRUCTURE FOR: Pays
#

DROP TABLE IF EXISTS `Pays`;

CREATE TABLE `Pays` (
  `InvoiceID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  PRIMARY KEY (`InvoiceID`,`ClientID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `Pays_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `Invoice` (`InvoiceID`),
  CONSTRAINT `Pays_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `Client` (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: ScheduledFor
#

DROP TABLE IF EXISTS `ScheduledFor`;

CREATE TABLE `ScheduledFor` (
  `AppointmentID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`AppointmentID`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `ScheduledFor_ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointment` (`AppointmentID`),
  CONSTRAINT `ScheduledFor_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Schedules_
#

DROP TABLE IF EXISTS `Schedules_`;

CREATE TABLE `Schedules_` (
  `ClientID` int(11) NOT NULL,
  `AppointmentID` int(11) NOT NULL,
  PRIMARY KEY (`ClientID`,`AppointmentID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `Schedules__ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `Client` (`ClientID`),
  CONSTRAINT `Schedules__ibfk_2` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointment` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Service
#

DROP TABLE IF EXISTS `Service`;

CREATE TABLE `Service` (
  `ServiceName` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  `ServiceType` int(11) NOT NULL,
  `Cost` int(11) NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

