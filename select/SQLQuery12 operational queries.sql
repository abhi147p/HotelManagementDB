-- retrieve the details of all reservations along with the names of the customers who made them.

SELECT Reservation.*, Customer.FirstName, Customer.LastName
FROM Reservation
JOIN Customer ON Reservation.CustomerID = Customer.CustomerID;


-- Retrieve the details of all event bookings along with the room number and type of the room where the event will be held.


SELECT EventBookings.*, Room.RoomNumber, Room.RoomType
FROM EventBookings
JOIN Room ON EventBookings.RoomID = Room.RoomID;


-- Retrieve the details of all payments along with the names of the customers who made the reservations.

SELECT Payment.*, Customer.FirstName, Customer.LastName
FROM Payment
JOIN Reservation ON Payment.ReservationID = Reservation.ReservationID
JOIN Customer ON Reservation.CustomerID = Customer.CustomerID;


-- Retrieve the details of all reservations that were made by customers who have a rewards level of "Gold".

SELECT Reservation.*
FROM Reservation
JOIN Customer ON Reservation.CustomerID = Customer.CustomerID
JOIN RewardsProgram ON Customer.CustomerID = RewardsProgram.CustomerID
WHERE RewardsProgram.RewardsLevel = 'Gold';



-- Retrieve the names of all staff members who have ever cleaned a room that is currently occupied by a customer.
SELECT DISTINCT Staff.FirstName, Staff.LastName, CheckOutDate
FROM Staff
JOIN Housekeeping ON Staff.StaffID = Housekeeping.HousekeepingID
JOIN Room ON Housekeeping.RoomID = Room.RoomID
JOIN Reservation ON Room.RoomID = Reservation.RoomID
WHERE Reservation.CheckOutDate > GETDATE();