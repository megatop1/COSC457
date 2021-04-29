CREATE TABLE Client
(
  PhoneNumber INT NOT NULL,
  ClientID INT NOT NULL,
  PRIMARY KEY (ClientID)
);

CREATE TABLE Service
(
  ServiceName INT NOT NULL,
  ServiceID INT NOT NULL,
  ServiceType INT NOT NULL,
  ClientID INT NOT NULL,
  PRIMARY KEY (ServiceID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE Client_Name
(
  Name INT NOT NULL,
  ClientID INT NOT NULL,
  PRIMARY KEY (Name, ClientID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE Invoice
(
  InvoiceID INT NOT NULL,
  Amount INT NOT NULL,
  PaymentType INT NOT NULL,
  PaymentID INT NOT NULL,
  ClientID INT NOT NULL,
  PRIMARY KEY (InvoiceID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
  UNIQUE (Amount),
  UNIQUE (PaymentID)
);

CREATE TABLE Employee
(
  EmployeeID INT NOT NULL,
  ClientID INT NOT NULL,
  PRIMARY KEY (EmployeeID),
  FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE Employee_Position
(
  Position INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (Position, EmployeeID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Employee_DaysOff
(
  DaysOff INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (DaysOff, EmployeeID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Employee_Name
(
  Name INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (Name, EmployeeID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Appointment
(
  TypeAppointment INT NOT NULL,
  AppointmentID INT NOT NULL,
  EmployeeID INT NOT NULL,
  ServiceID INT NOT NULL,
  PRIMARY KEY (AppointmentID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
);

CREATE TABLE Appointment_Date
(
  Date INT NOT NULL,
  AppointmentID INT NOT NULL,
  PRIMARY KEY (Date, AppointmentID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);

CREATE TABLE Appointment_Price
(
  Price INT NOT NULL,
  AppointmentID INT NOT NULL,
  PRIMARY KEY (Price, AppointmentID),
  FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);
