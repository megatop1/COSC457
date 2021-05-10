CREATE DATABASE barber;
use barber;

# TABLE STRUCTURE FOR: Appointment
#

DROP TABLE IF EXISTS `Appointment`;

CREATE TABLE `Appointment` (
  `Date` datetime COLLATE utf8mb4_unicode_ci NOT NULL,
  `AppointmentID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`AppointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-01 10:30:00', 1);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-02 11:15:00', 2);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-03 12:30:00', 3);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-04 14:45:00', 4);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-05 16:00:00', 5);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-06 17:15:00', 6);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-07 18:00:00', 7);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-08 09:15:00', 8);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-09 10:00:00', 9);
INSERT INTO `Appointment` (`Date`, `AppointmentID`) VALUES ('2021-05-10 13:30:00', 10);


#
# TABLE STRUCTURE FOR: Client
#

DROP TABLE IF EXISTS `Client`;

CREATE TABLE `Client` (
  `PhoneNumber` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClientID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('460.067.0219', 1, 'Kaelyn', 'Hartmann');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('001.815.8054', 2, 'Tavares', 'Collier');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('(655)250-9279', 3, 'Cornelius', 'McGlynn');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('(489)727-9369', 4, 'Taryn', 'Runolfsson');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('060-847-6242', 5, 'Juana', 'Grimes');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('02195638100', 6, 'Manuel', 'Johnson');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('(989)626-0206x5358', 7, 'Alyce', 'Bauch');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('1-639-039-9724', 8, 'Katelin', 'Zemlak');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('1-646-389-9061x22629', 9, 'Allene', 'Prosacco');
INSERT INTO `Client` (`PhoneNumber`, `ClientID`, `FirstName`, `LastName`) VALUES ('1-657-208-0016', 10, 'Kenna', 'Gutmann');


#
# TABLE STRUCTURE FOR: Employee
#

DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` (
  `Position` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DaysOff` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Manager', 'Wednesday', 1, 'Hilda', 'Aufderhar');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Esthetician', 'Friday', 2, 'Hollie', 'Reilly');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Janitor', 'Sunday', 3, 'Angelo', 'Nicolas');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Manicurist', 'Thursday', 4, 'Isaac', 'Windler');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Barber', 'Monday', 5, 'Vincent', 'Harris');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Janitor', 'Tuesday', 6, 'Garett', 'Welch');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Manicurist', 'Thursday', 7, 'Magdalena', 'Towne');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Manager', 'Sunday', 8, 'Odell', 'Corkery');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Barber', 'Wednesday', 9, 'Dulce', 'Dach');
INSERT INTO `Employee` (`Position`, `DaysOff`, `EmployeeID`, `FirstName`, `LastName`) VALUES ('Esthetician', 'Tuesday', 10, 'Kira', 'Pagac');


#
# TABLE STRUCTURE FOR: Invoice
#

DROP TABLE IF EXISTS `Invoice`;

CREATE TABLE `Invoice` (
  `InvoiceID` int(11) NOT NULL AUTO_INCREMENT,
  `Amount` int(11) NOT NULL,
  `PaymentType` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PaymentDate` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InvoiceDate` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
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
# TABLE STRUCTURE FOR: Scheduled_For_
#

DROP TABLE IF EXISTS `Scheduled_For_`;

CREATE TABLE `Scheduled_For_` (
  `AppointmentID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`AppointmentID`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `Scheduled_For__ibfk_1` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointment` (`AppointmentID`),
  CONSTRAINT `Scheduled_For__ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
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
  `ServiceName` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceType` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Cost` int(11) NOT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Haircut', 1, 'Nails', 60);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Wax', 2, 'Eyebrows', 40);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Haircut', 3, 'Eyebrows', 50);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Haircut', 4, 'Nails', 45);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Wax', 5, 'Nails', 65);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Wax', 6, 'Eyebrows', 55);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Nails', 7, 'Eyebrows', 85);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Wax', 8, 'Eyebrows', 75);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Haircut', 9, 'Nails', 100);
INSERT INTO `Service` (`ServiceName`, `ServiceID`, `ServiceType`, `Cost`) VALUES ('Wax', 10, 'Haircut', 50);


#
# TABLE STRUCTURE FOR: Bills
#

DROP TABLE IF EXISTS `Bills`;

CREATE TABLE `Bills` (
  `InvoiceID` int(11) NOT NULL,
  `AppointmentID` int(11) NOT NULL,
  PRIMARY KEY (`InvoiceID`,`AppointmentID`),
  KEY `AppointmentID` (`AppointmentID`),
  CONSTRAINT `Bills_ibfk_1` FOREIGN KEY (`InvoiceID`) REFERENCES `Invoice` (`InvoiceID`),
  CONSTRAINT `Bills_ibfk_2` FOREIGN KEY (`AppointmentID`) REFERENCES `Appointment` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

