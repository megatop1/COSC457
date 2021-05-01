#
# TABLE STRUCTURE FOR: Client
#

DROP TABLE IF EXISTS `Client`;

CREATE TABLE `Client` (
  `PhoneNumber` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FirstName` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LastName` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClientID` int(11) NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('(532)474-25', 'Colin', 'Casper', 0);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('370-473-513', 'Jarred', 'Stiedemann', 1);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('975-545-393', 'Tre', 'Glover', 2);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('385-586-695', 'Albina', 'Bogan', 3);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('980-919-926', 'Crystal', 'Greenholt', 4);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('+89(7)38080', 'Chanelle', 'Predovic', 5);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('(629)216-11', 'Myles', 'Upton', 6);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('146-200-601', 'Lelah', 'Funk', 7);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('262-282-969', 'Alphonso', 'Breitenberg', 8);
INSERT INTO `Client` (`PhoneNumber`, `FirstName`, `LastName`, `ClientID`) VALUES ('984.257.125', 'Felicity', 'Spencer', 9);


#
# TABLE STRUCTURE FOR: Employee
#

DROP TABLE IF EXISTS `Employee`;

CREATE TABLE `Employee` (
  `HairStylist` int(11) NOT NULL,
  `Manager_` int(11) NOT NULL,
  `Barber` int(11) NOT NULL,
  `FirstName` int(11) NOT NULL,
  `LastName` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `Client` (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Employee_DaysOff
#

DROP TABLE IF EXISTS `Employee_DaysOff`;

CREATE TABLE `Employee_DaysOff` (
  `DaysOff` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`DaysOff`,`EmployeeID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `Employee_DaysOff_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: Service
#

DROP TABLE IF EXISTS `Service`;

CREATE TABLE `Service` (
  `ServiceName` int(11) NOT NULL,
  `ServiceID` int(11) NOT NULL,
  `Nails` int(11) NOT NULL,
  `Hair` int(11) NOT NULL,
  `wax` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `Service_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `Client` (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

