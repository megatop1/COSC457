CREATE DATABASE brandon;
use brandon;

CREATE TABLE Invoice
(
  InvoiceID INT NOT NULL AUTO_INCREMENT,
  Amount INT NOT NULL,
  PaymentType VARCHAR(11) NOT NULL,
  TestID INT NOT NULL,
  PaymentDate VARCHAR(20) NOT NULL,
  InvoiceDate VARCHAR(20) NOT NULL,
  PRIMARY KEY (InvoiceID)
);

CREATE TABLE Appointment
(
  Date INT NOT NULL,
  AppointmentID INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (AppointmentID)
);

CREATE TABLE Employee
(
  Position VARCHAR(11) NOT NULL,
  DaysOff VARCHAR(11) NOT NULL,
  EmployeeID INT NOT NULL AUTO_INCREMENT,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Client
(
  PhoneNumber VARCHAR(20) NOT NULL,
  ClientID INT NOT NULL AUTO_INCREMENT,
  FirstName VARCHAR(20) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  PRIMARY KEY (ClientID)
);

CREATE TABLE Service
(
  ServiceName VARCHAR(11) NOT NULL,
  ServiceID INT NOT NULL AUTO_INCREMENT,
  ServiceType VARCHAR(11) NOT NULL,
  Cost INT NOT NULL,
  PRIMARY KEY (ServiceID)
);

CREATE TABLE Bills
(
  InvoiceID INT NOT NULL,
  AppointmentID INT NOT NULL,
  PRIMARY KEY (InvoiceID, AppointmentID),
  FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE Scheduled_For_
(
  AppointmentID INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (AppointmentID, EmployeeID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Pays
(
  InvoiceID INT NOT NULL,
  ClientID INT NOT NULL,
  PRIMARY KEY (InvoiceID, ClientID),
  FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE Schedules_
(
  ClientID INT NOT NULL,
  AppointmentID INT NOT NULL,
  PRIMARY KEY (ClientID, AppointmentID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE Includes
(
  ServiceID INT NOT NULL,
  AppointmentID INT NOT NULL,
  PRIMARY KEY (ServiceID, AppointmentID),
  FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);



