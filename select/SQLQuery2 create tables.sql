--Customer Table:
CREATE TABLE Customer (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
PhoneNumber VARCHAR(20),
Address VARCHAR(200),
City VARCHAR(50),
State VARCHAR(50),
ZipCode VARCHAR(20)
);

--Staff Table:
CREATE TABLE Staff (
StaffID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
PhoneNumber VARCHAR(20),
Position VARCHAR(50),
HireDate DATE,
Salary DECIMAL(10,2)
);

--Room Table:
CREATE TABLE Room (
RoomID INT PRIMARY KEY,
RoomNumber VARCHAR(20),
RoomType VARCHAR(50),
RoomDescription VARCHAR(500),
RoomRate DECIMAL(10,2),
RoomCapacity INT,
IsClean BIT
);

--Reservation Table:
CREATE TABLE Reservation (
ReservationID INT PRIMARY KEY,
CustomerID INT,
RoomID INT,
StaffID INT,
CheckInDate DATE,
CheckOutDate DATE,
ReservationDate DATE,
TotalCost DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

--Payment Table:
CREATE TABLE Payment (
PaymentID INT PRIMARY KEY,
ReservationID INT,
PaymentDate DATE,
PaymentMethod VARCHAR(50),
PaymentAmount DECIMAL(10,2),
FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID)
);

--Housekeeping Table:
CREATE TABLE Housekeeping (
HousekeepingID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
PhoneNumber VARCHAR(20),
RoomID INT,
CleaningDate DATE,
FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);


--Rewards Program Table:
CREATE TABLE RewardsProgram (
RewardsID INT PRIMARY KEY,
CustomerID INT,
RewardsPoints INT,
RewardsLevel VARCHAR(50),
RewardsExpirationDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

--Event Bookings Table:
CREATE TABLE EventBookings (
EventBookingID INT PRIMARY KEY,
CustomerID INT,
EventType VARCHAR(50),
EventDate DATE,
NumberOfAttendees INT,
RoomID INT,
TotalCost DECIMAL(10,2),
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);