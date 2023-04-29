------------------------ 1 query using a view ------------------------
	/* Flight schedule for departures and arrivals but instead of IATA code we get the full names.
	   Sth simmilar to what can be found on the airport screens*/

CREATE VIEW flight_schedule AS
SELECT Day_of_week, Operator, Departure_hour, Arrival_hour, 
	   From_airports.Airport_name AS Departure_airport, 
	   To_airports.Airport_name AS Arrival_airport
FROM Flights
JOIN Airports AS From_airports ON Flights.From_air = From_airports.IATA_aiport_code
JOIN Airports AS To_airports ON Flights.To_air = To_airports.IATA_aiport_code
-- arrivals
SELECT * FROM flight_schedule WHERE Arrival_airport = 'Gdañsk Lech Wa³êsa Airport'
-- departures
SELECT * FROM flight_schedule WHERE Arrival_airport != 'Gdañsk Lech Wa³êsa Airport'

DROP VIEW flight_schedule

------------------------ at least 2 queries using joins ------------------------
	/* Flight schedule with details about the aircrat used for a given flight */

SELECT Flights.Flight_ID, Flights.Day_of_week, Flights.Operator, Flights.Departure_hour, Flights.Arrival_hour,
       Type_of_aircraft.Model, Type_of_aircraft.Capacity, Type_of_aircraft.Air_weight
FROM Flights
JOIN Aircraft ON Flights.Air_registration_number = Aircraft.Registration_number
JOIN Type_of_aircraft ON Aircraft.Model = Type_of_aircraft.Model
	
	/* Number of reservation made for a different types of aircraft.
	   Departures = Arrivalas so we can chose either of them */

SELECT Type_of_aircraft.Model, COUNT(Reservations.Reservation_ID)*2 AS Number_of_reservations
FROM Flights
JOIN Aircraft ON Flights.Air_registration_number = Aircraft.Registration_number
JOIN Type_of_aircraft ON Aircraft.Model = Type_of_aircraft.Model
JOIN Departure_schedule ON Flights.Flight_ID = Departure_schedule.Flight_ID
JOIN Reservations ON Departure_schedule.Departure_ID = Reservations.Departure_ID
GROUP BY Type_of_aircraft.Model

------------------------ at least 2 queries with subqueries ------------------------
	/* Airports of departure of planes that landed with more than 10 min delay */

SELECT Airports.Airport_name, Airports.Airport_name
FROM Airports
WHERE Airports.IATA_aiport_code IN (SELECT From_air FROM Flights 
WHERE Flight_ID IN (SELECT Flight_ID FROM Arrival_schedule 
WHERE Arrival_ID IN (SELECT Arrival_ID FROM Arrived WHERE Arr_Delay >= 10)))

	/* Aircrafts that took of from runway 29W */

SELECT Flight_number
FROM Departed
WHERE Departed.Departure_ID IN (SELECT Departure_ID FROM Departure_schedule
WHERE Departed.Departure_ID IN (SELECT Departure_ID FROM Reservations
WHERE Reservations.Runway_ID IN (SELECT Runway_ID FROM Runways
WHERE Runway_ID = '29W')))

------------------------ at least 2 queries using aggregate functions ------------------------
	/* Average delay of an arriving aircraft given the day of a week, also include max delay on a given day */ 

SELECT Day_of_week, COUNT(Arrived.Arrival_ID) AS Total_landings , AVG(Arr_Delay) AS Average_delay, MAX(Arr_delay) AS Max_delay
FROM Arrived
JOIN Arrival_schedule ON Arrived.Arrival_ID = Arrival_schedule.Arrival_ID
JOIN Flights ON Arrival_schedule.Flight_ID = Flights.Flight_ID
GROUP BY Day_of_week;

	/* Average passengers on board departing and arriving aircrafts of different owners */
-- more grouping than aggregate

WITH Departures AS (
    SELECT Air_owner, AVG(Departed.Passengers_onboard) as avg_dep_passengers
    FROM Departed
    JOIN Departure_schedule ON Departed.Departure_ID = Departure_schedule.Departure_ID
	JOIN Flights ON Departure_schedule.Flight_ID = Flights.Flight_ID
	JOIN Aircraft ON Flights.Air_registration_number = Aircraft.Registration_number
    GROUP BY Air_owner
), Arrivals AS (
    SELECT Air_owner, AVG(Arrived.Passengers_onboard) as avg_arr_passengers
    FROM Arrived
    JOIN Arrival_schedule ON Arrived.Arrival_ID = Arrival_schedule.Arrival_ID
	JOIN Flights ON Arrival_schedule.Flight_ID = Flights.Flight_ID
	JOIN Aircraft ON Flights.Air_registration_number = Aircraft.Registration_number
    GROUP BY Air_owner
)
SELECT Departures.Air_owner, Departures.avg_dep_passengers, Arrivals.avg_arr_passengers
FROM Departures
JOIN Arrivals ON Departures.Air_owner = Arrivals.Air_owner

------------------------ at least 2 queries using grouping ------------------------


------------------------ at least 1 query with ordering ------------------------
	/* Delay of departing aircraft and the combination of reservation made for a given delay */

SELECT Departed.Dep_Delay, Reservations.Gate_numer, Reservations.Runway_ID, Reservations.Desk_number 
FROM Departed
JOIN Departure_schedule ON Departed.Departure_ID = Departure_schedule.Departure_ID
JOIN Reservations ON Departure_schedule.Departure_ID = Reservations.Departure_ID
ORDER BY Departed.Dep_Delay DESC, Reservations.Gate_numer ASC, Reservations.Runway_ID ASC, Reservations.Desk_number ASC



