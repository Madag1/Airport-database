-- Model | PAX | Weight | Year of manufacture | Required runway length
INSERT INTO Type_of_aircraft VALUES('Airbus A320', 170, 42600, 2009, 6900);
INSERT INTO Type_of_aircraft VALUES('Boeing 737', 162, 41140, 2019, 4960);
INSERT INTO Type_of_aircraft VALUES('Cessna 172', 4, 757, 2010, 805);
INSERT INTO Type_of_aircraft VALUES('Saab 340', 37, 8100, 2018, 2000);

-- Registration number | Owner | Type of air REF
INSERT INTO Aircraft VALUES('HA-LSA', 'Wizz Air', 'Airbus A320');
INSERT INTO Aircraft VALUES('HA-LYZ', 'Wizz Air', 'Airbus A320');
INSERT INTO Aircraft VALUES('EI-IFT', 'Ryanair', 'Boeing 737');
INSERT INTO Aircraft VALUES('EI-IFV', 'Ryanair', 'Boeing 737');
INSERT INTO Aircraft VALUES('AG-KMS', 'Air Adam', 'Saab 340');
INSERT INTO Aircraft VALUES('AG-KMT', 'Air Adam', 'Saab 340');

-- IATA | City | Runway Length | Name
INSERT INTO Airports VALUES('GDN', 'Gdañsk', 9200, 'Gdañsk Lech Wa³êsa Airport');
INSERT INTO Airports VALUES('WAW', 'Warsaw', 12106, 'Warsaw Chopin Airport');
INSERT inTO Airports VALUES('LHR', 'London', 12801, 'London Heathrow Airport');
INSERT INTO Airports VALUES('CDG', 'Paris', 13829, 'Paris Charles de Gaulle Airport');
INSERT INTO Airports VALUES('IEG', 'Zielona Góra', 8200, 'Góra-Babimost Airport');
INSERT INTO Airports VALUES('BZG', 'Bydgoszcz', 8200, 'Jan Paderewski Airport');

-- ID | Day of week | Operator | Dep hour | Arr hour | IATA Dep | IATA Arr | Aircraft REF
INSERT INTO Flights VALUES(1, 'Monday', 'Wizz Air', '12:10', '13:10', 'WAW', 'GDN', 'HA-LSA');
INSERT INTO Flights VALUES(9, 'Monday', 'Wizz Air', '13:40', '14:40', 'GDN', 'WAW', 'HA-LSA');

INSERT INTO Flights VALUES(2, 'Tuesday', 'Ryanair', '10:30', '11:10', 'GDN', 'LHR', 'EI-IFT');
INSERT INTO Flights VALUES(10, 'Tuesday', 'Ryanair', '12:40', '14:20', 'LHR', 'GDN', 'EI-IFT');

INSERT INTO Flights VALUES(3, 'Tuesday', 'Wizz Air', '11:00', '12:30', 'GDN', 'CDG', 'HA-LYZ');
INSERT INTO Flights VALUES(11, 'Tuesday', 'Wizz Air', '13:10', '14:40', 'CDG', 'GDN', 'HA-LYZ');

INSERT INTO Flights VALUES(4, 'Wednesday', 'Ryanair', '21:10', '22:50', 'LHR', 'GDN', 'EI-IFT');
INSERT INTO Flights VALUES(12, 'Wednesday', 'Ryanair', '23:15', '00:55', 'GDN', 'LHR', 'EI-IFT');

INSERT INTO Flights VALUES(5, 'Thursday', 'Air Adam', '09:00', '10:05', 'GDN', 'IEG', 'AG-KMS');
INSERT INTO Flights VALUES(6, 'Thursday', 'Air Adam', '10:45', '11:50', 'IEG', 'GDN', 'AG-KMS');

INSERT INTO Flights VALUES(7, 'Friday', 'Wizz Air', '10:10', '11:10', 'GDN', 'WAW', 'HA-LSA');
INSERT INTO Flights VALUES(8, 'Friday', 'Wizz Air', '17:05', '18:05', 'CDG', 'GDN', 'HA-LYZ');

-- ID | Date | Flights REF
INSERT INTO Arrival_schedule VALUES(1, '2022-12-15', 1);
INSERT INTO Arrival_schedule VALUES(2, '2022-12-17', 4);
INSERT INTO Arrival_schedule VALUES(3, '2022-12-18', 6);
INSERT INTO Arrival_schedule VALUES(4, '2022-12-19', 8);
INSERT INTO Arrival_schedule VALUES(5, '2022-12-16', 10);
INSERT INTO Arrival_schedule VALUES(6, '2022-12-16', 11);
 
-- ID | Date | Flights REF
INSERT INTO Departure_schedule VALUES(1, '2022-12-16', 2);
INSERT INTO Departure_schedule VALUES(2, '2022-12-16', 3);
INSERT INTO Departure_schedule VALUES(3, '2022-12-18', 5);
INSERT INTO Departure_schedule VALUES(4, '2022-12-19', 7);
INSERT INTO Departure_schedule VALUES(5, '2022-12-15', 9);
INSERT INTO Departure_schedule VALUES(6, '2022-12-17', 12);

INSERT INTO Gates VALUES(1, 1, 1);
INSERT INTO Gates VALUES(2, 1, 1);
INSERT INTO Gates VALUES(3, 1, 1);
INSERT INTO Gates VALUES(4, 2, 0);
INSERT INTO Gates VALUES(5, 2, 0);
INSERT INTO Gates VALUES(6, 2, 0);

INSERT INTO Luggage_belts VALUES(1, 1, 50);
INSERT INTO Luggage_belts VALUES(2, 1, 50);
INSERT INTO Luggage_belts VALUES(3, 1, 100);
INSERT INTO Luggage_belts VALUES(4, 2, 100);
INSERT INTO Luggage_belts VALUES(5, 2, 110);

INSERT INTO Runways VALUES('29E', 9200, 1, 'Asphalt');
INSERT INTO Runways VALUES('29W', 9200, 1, 'Asphalt');
INSERT INTO Runways VALUES('35N', 11200, 0, 'Concreat');
INSERT INTO Runways VALUES('35S', 11200, 1, 'Concreat');

INSERT INTO Check_in_desks VALUES(1, 1);
INSERT INTO Check_in_desks VALUES(2, 1);
INSERT INTO Check_in_desks VALUES(3, 1);
INSERT INTO Check_in_desks VALUES(4, 2);
INSERT INTO Check_in_desks VALUES(5, 2);

							 /* ID  DATE  FROM  TO  ACIVE  ARR_REF  DEP_REF  RUNWAY  GATE BELT DESK */
INSERT INTO Reservations VALUES(1, '2022-12-15', '13:10', '13:25', 1, 1, NULL, '29E', 1, 1, NULL);
INSERT INTO Reservations VALUES(2, '2022-12-16', '10:30', '10:45', 1, NULL, 1, '29W', 1, NULL, 1);
INSERT INTO Reservations VALUES(3, '2022-12-16', '11:00', '11:15', 1, NULL, 2, '29W', 2, NULL, 2);
INSERT INTO Reservations VALUES(4, '2022-12-17', '22:15', '22:30', 1, 2, NULL, '35S', 4, 4, NULL);
INSERT INTO Reservations VALUES(5, '2022-12-18', '11:50', '12:15', 1, 3, NULL, '35S', 6, 2, NULL);
INSERT INTO Reservations VALUES(6, '2022-12-18', '09:00', '09:15', 1, NULL, 3, '35S', 2, NULL, 2);
INSERT INTO Reservations VALUES(7, '2022-12-19', '18:35', '18:50', 1, 4, NULL, '29W', 1, 4, NULL);
INSERT INTO Reservations VALUES(8, '2022-12-16', '14:20', '14:35', 1, 5, NULL, '29W', 1, 4, NULL);
INSERT INTO Reservations VALUES(9, '2022-12-16', '14:40', '14:55', 1, 6, NULL, '29W', 2, 5, NULL);
INSERT INTO Reservations VALUES(10, '2022-12-19', '10:10', '10:25', 1, NULL, 4, '35S', 3, NULL, 3);
INSERT INTO Reservations VALUES(11, '2022-12-15', '13:40', '13:55', 1, NULL, 5, '35S', 2, NULL, 2);
INSERT INTO Reservations VALUES(12, '2022-12-17', '23:15', '23:30', 1, NULL, 6, '29W', 1, NULL, 2);

-- Flight num | Delay | PAX | Crew | Duration of flight | Arrival_schedule REF
INSERT INTO Arrived VALUES('WZ2345', 10, 67, 5, 60, 1); 
INSERT INTO Arrived VALUES('RY7624', 2, 129, 6, 100, 2);
INSERT INTO Arrived VALUES('AM0023', 2, 37, 4, 65, 3);
INSERT INTO Arrived VALUES('WZ2354', 3, 165, 5, 60, 4);
INSERT INTO Arrived VALUES('RY7632', 5, 131, 7, 100, 5);
INSERT INTO Arrived VALUES('WZ2347', 17, 155, 7, 90, 6);

-- Flight num | Delay | PAX | Crew | Duration of flight | Departure_schedule REF
INSERT INTO Departed VALUES('RY8361', 0, 140, 7, 100, 1);
INSERT INTO Departed VALUES('WZ4556', 7, 95, 5, 90, 2);
INSERT INTO Departed VALUES('AM0022', 3, 34, 4, 65, 3);
INSERT INTO Departed VALUES('WZ2352', 0, 163, 6, 60, 4);
INSERT INTO Departed VALUES('WZ2330', 0, 94, 4, 60, 5);
INSERT INTO Departed VALUES('RY8456', 4, 131, 5, 100, 6);

INSERT INTO DimCourse VALUES(1, 'DE', 1);
INSERT INTO DimCourse VALUES(2, 'IT', 1);
INSERT INTO DimCourse VALUES(3, 'Mathemtics', 0);
INSERT INTO DimCourse VALUES(4, 'Science', 0);
INSERT INTO DimCourse VALUES(5, 'Culture', 0)

INSERT INTO DimStudent VALUES(188939, 'German', 0, 0, 1, 12345678901, 1)
INSERT INTO DimStudent VALUES(188771, 'Bosnia', 0, 0, 1, 12345678902, 1)
INSERT INTO DimStudent VALUES(188899, 'Denmark', 0, 1, 1, 12345678903, 1)
INSERT INTO DimStudent VALUES(121345, 'Polish', 0, 0, 1, 12345678904, 0)
INSERT INTO DimStudent VALUES(100982, 'Romanian', 1, 1, 1, 12345678905, 1)

INSERT INTO DimBuilding VALUES(1, 0);
INSERT INTO DimBuilding VALUES(1, 0);
INSERT INTO DimBuilding VALUES(3, 1);
INSERT INTO DimBuilding VALUES(4, 0);
INSERT INTO DimBuilding VALUES(5, 1);

SELECT * FROM Aircraft;
SELECT * FROM Type_of_aircraft;
SELECT * FROM Flights;
SELECT * FROM Airports;
SELECT * FROM Arrival_schedule;
SELECT * FROM Departure_schedule;
SELECT * FROM Arrived;
SELECT * FROM Departed;
SELECT * FROM Reservations;
SELECT * FROM Gates;
SELECT * FROM Luggage_belts;
SELECT * FROM Check_in_desks
SELECT * FROM Runways;




