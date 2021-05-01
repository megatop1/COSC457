CREATE TABLE Invoice
(
  InvoiceID INT NOT NULL,
  Amount INT NOT NULL,
  PaymentType INT NOT NULL,
  AppointmentID INT NOT NULL,
  PaymentDate INT NOT NULL,
  InvoiceDate INT NOT NULL,
  PRIMARY KEY (InvoiceID)
);

CREATE TABLE Appointment
(
  Date INT NOT NULL,
  AppointmentID INT NOT NULL,
  InvoiceID INT NOT NULL,
  PRIMARY KEY (AppointmentID),
  FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
);

CREATE TABLE Employee
(
  Position INT NOT NULL,
  DaysOff INT NOT NULL,
  EmployeeID INT NOT NULL,
  FirstName INT NOT NULL,
  LastName INT NOT NULL,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE Client
(
  PhoneNumber INT(15) NOT NULL,
  ClientID INT NOT NULL,
  FirstName VARCHAR(15) NOT NULL,
  LastName VARCHAR(20) NOT NULL,
  PRIMARY KEY (ClientID)
);

CREATE TABLE Service
(
  ServiceName INT NOT NULL,
  ServiceID INT NOT NULL,
  ServiceType INT NOT NULL,
  Cost INT NOT NULL,
  PRIMARY KEY (ServiceID)
);

CREATE TABLE ScheduledFor
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
