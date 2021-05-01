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

