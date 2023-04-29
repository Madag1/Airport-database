CREATE TABLE Airports(
	IATA_aiport_code VARCHAR(3) CHECK(IATA_aiport_code LIKE '[A-Z][A-Z][A-Z]') PRIMARY KEY,
	City VARCHAR(30) NOT NULL CHECK(City NOT LIKE '%[!@#$%^&*()_+={}:"|;\<>?,./]%'),
	Runway_length INT CHECK(Runway_length > 0 AND Runway_length < 30000),
	Airport_name VARCHAR(100) CHECK(Airport_name NOT LIKE '%[!@#$%^&*()_+={}:"|;\<>?,./]%'),
);

CREATE TABLE Type_of_aircraft(
	Model VARCHAR(50) CHECK(Model NOT LIKE '%[!@#$%^&*()_+={}:"|;\<>?,./]%') PRIMARY KEY,
	Capacity INT CHECK(Capacity>0),
	Air_weight INT CHECK(Air_weight>0),
	Air_Year INT CHECK(Air_Year>1940),
	Required_runway_length INT CHECK(Required_runway_length>0),
);

CREATE TABLE Aircraft(
	Registration_number VARCHAR(30) CHECK(Registration_number LIKE '[A-Z][A-Z][-][A-Z][A-Z][A-Z]') PRIMARY KEY,
	Air_owner VARCHAR(30) CHECK(Air_owner NOT LIKE '%[!@#$%^&*()_+={}:"|;\<>?,./]%'),
	Model VARCHAR(50) REFERENCES Type_of_aircraft ON DELETE SET NULL,
);

CREATE TABLE Flights(
	Flight_ID INT PRIMARY KEY,
	Day_of_week VARCHAR(10) CHECK(Day_of_week NOT LIKE '%[!@#$%^&*()_+={}:"|;\<>?,./]%'),
	Operator VARCHAR(30) CHECK(Operator NOT LIKE '%[!@#$%^&*()_+={}:"|;\<>?,./]%'),
	Departure_hour VARCHAR(5) NOT NULL CHECK(Departure_hour LIKE '[0-2][0-9][:][0-5][0-9]'),
	Arrival_hour VARCHAR(5) NOT NULL CHECK(Arrival_hour LIKE '[0-2][0-9][:][0-5][0-9]'),
	From_air VARCHAR(3) REFERENCES Airports ON DELETE CASCADE,
	To_air VARCHAR(3) REFERENCES Airports ON DELETE NO ACTION,
	Air_registration_number VARCHAR(30) REFERENCES Aircraft ON DELETE SET NULL,
);

CREATE TABLE Arrival_schedule(
	Arrival_ID INT PRIMARY KEY,
	Arr_date DATE,
	Flight_ID INT REFERENCES Flights ON DELETE SET NULL,
);

CREATE TABLE Departure_schedule(
	Departure_ID INT PRIMARY KEY,
	Dep_date DATE,
	Flight_ID INT REFERENCES Flights ON DELETE SET NULL,
);

CREATE TABLE Arrived(
	Flight_number VARCHAR(6) CHECK(Flight_number LIKE'[A-Z][A-Z][0-9][0-9][0-9][0-9]') PRIMARY KEY,
	Arr_Delay INT,
	Passengers_onboard INT,
	Crew_onboard INT CHECK(Crew_onboard>0),
	Flight_duration INT CHECK(Flight_duration>0),
	Arrival_ID INT REFERENCES Arrival_schedule ON DELETE SET NULL,
);

CREATE TABLE Departed(
	Flight_number VARCHAR(6) CHECK(Flight_number LIKE'[A-Z][A-Z][0-9][0-9][0-9][0-9]') PRIMARY KEY,
	Dep_Delay INT,
	Passengers_onboard INT,
	Crew_onboard INT CHECK(Crew_onboard>0),
	Flight_duration INT CHECK(Flight_duration>0),
	Departure_ID INT REFERENCES Departure_schedule ON DELETE SET NULL,
);

CREATE TABLE Gates(
	Gate_number INT PRIMARY KEY,
	Terminal INT,
	Sleeve BIT, /* powinno byæ boolem */
);

CREATE TABLE Luggage_belts(
	Belt_number INT PRIMARY KEY,
	Terminal INT,
	Capacity INT,
);

CREATE TABLE Check_in_desks(
	Desk_number INT PRIMARY KEY,
	Terminal INT,
);

CREATE TABLE Runways(
	Runway_ID VARCHAR(3) CHECK(Runway_ID LIKE '[0-9][0-9][A-Z]') PRIMARY KEY,
	Run_length INT,
	ILS BIT, /* powinien byæ bool */
	Surface VARCHAR(30) NOT NULL CHECK(Surface NOT LIKE '%[!@#$%^&*()_+={}:"|;\<>?,.]%'),
);

CREATE TABLE Reservations(
	Reservation_ID INT PRIMARY KEY,
	Res_date DATE,
	Res_from VARCHAR(5) NOT NULL CHECK(Res_from LIKE '[0-2][0-9][:][0-5][0-9]'),
	Res_to VARCHAR(5) NOT NULL CHECK(Res_to LIKE '[0-2][0-9][:][0-5][0-9]'),
	Is_active BIT,
	Arrival_ID INT REFERENCES Arrival_schedule ON DELETE SET NULL,
	Departure_ID INT REFERENCES Departure_schedule ON DELETE SET NULL,
	Runway_ID VARCHAR(3) REFERENCES Runways ON DELETE SET NULL,
	Gate_numer INT REFERENCES Gates ON DELETE SET NULL,
	Belt_number INT REFERENCES Luggage_belts ON DELETE SET NULL,
	Desk_number INT REFERENCES Check_in_desks ON DELETE SET NULL,
);
