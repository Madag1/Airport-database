ALTER TABLE Gates ADD New_column INT;

INSERT INTO Gates VALUES(1, 2, 3, 4);

SELECT * FROM Gates;

/* there can be same slots in different hangars, hangar + slot = unique
*/
CREATE TABLE Parking_spots(
	Hangar_num INT CHECK(Hangar_num>0),
	Slot_num INT CHECK(Slot_num>0),
	Size INT,
	PRIMARY KEY(Hangar_num, Slot_num)
);

CREATE TABLE Parked_aircraft(
	Air_ID INT PRIMARY KEY,
	C1 INT,
	C2 INT,
	FOREiGN KEY(C1, C2) REFERENCES Parking_spots(Hangar_num, Slot_num),
);

DROP TABLE Reservations;
DROP TABLE Departed;
DROP TABLE Arrived;
DROP TABLE Departure_schedule;
DROP TABLE Arrival_schedule;
DROP TABLE Flights;
DROP TABLE Aircraft;
DROP TABLE Type_of_aircraft;
DROP TABLE Check_in_desks;
DROP TABLE Runways;
DROP TABLE Luggage_belts;
DROP TABLE Gates;
DROP TABLE Airports;