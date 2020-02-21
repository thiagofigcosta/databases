SET session_replication_role = replica; -- disable all triggers

INSERT INTO country (name) VALUES ('Brazil'), ('Netherlands'), ('United Kingdom'), ('Portugal'), ('Italy'), ('Argentine'), ('Paraguay');
INSERT INTO address (street, "number", complement, zipcode, district, city, state, id_country) VALUES 
	('Jorge Street', 20, 'apt 03', '304202', 'Zuid', 'Amsterdam', 'Hollande-Septentrionale', (SELECT id FROM country WHERE name='Netherlands')),
	('Rua da Alegria', 420, NULL, '645461', 'Savassi', 'Belo Horizonte', 'Minas Gerais', (SELECT id FROM country WHERE name='Brazil')),
	('Baker Street', 221, 'B', 'NW1 6XE', NULL, 'London', NULL, (SELECT id FROM country WHERE name='United Kingdom')),
	('Jorge street', 245, NULL, '53252', 'Hayes', 'Amsterdam', 'Hollande-Septentrionale', (SELECT id FROM country WHERE name='Netherlands')),
	('Michael street', 34, NULL, 'DE42534', 'Elyse', 'Turin', 'Brescia', (SELECT id FROM country WHERE name='Italy')),
	('Computer avenue', 89, NULL, 'eg564', 'Nadare', 'Utrecht', 'Zelande', (SELECT id FROM country WHERE name='Netherlands')),
	('Victory square', 321, '2nd floor', '326451', NULL, 'Buenos Aires', NULL, (SELECT id FROM country WHERE name='Argentine')),
	('Timoteo street', 645, NULL, '98626', NULL, 'Ciudad del Este', 'Hollande-Septentrionale', (SELECT id FROM country WHERE name='Paraguay')),
	('Sodre street', 64, NULL, '65465', '13', 'Lisbon', NULL, (SELECT id FROM country WHERE name='Portugal')),
	('Fonseca street', 32, NULL, '96264FF', 'Nova Suiça', 'The Hague', 'Hollande-Septentrionale', (SELECT id FROM country WHERE name='Netherlands')),
	('Secret Street', 666, NULL, '696969', 'Industries', 'Belo Horizonte', 'Minas Gerais', (SELECT id FROM country WHERE name='Brazil'));

INSERT INTO staff (firstname, lastname, class, phone, id_address, ssn, birth, admitted_at, fired_at, emergency_phone) VALUES 
	('Thiago', 'Figueiredo Costa', 'A', '4002-8922',1,'1324654646',make_date(1998,03,10),make_date(2019,08,19),NULL,'666'),
	('Taylor', 'Swift', 'D', '565656565',1,'4646546516',make_date(1989,12,13),make_date(2019,08,19),NULL,'292829848'),
	
	('Jorge Luiz', 'Silva', 'H', '98952662',2,'64616266',make_date(1959,01,24),make_date(2010,07,10),NOW(),'65161616'),
	('Bruno', 'Mars', 'H', '213132',2,'0321313',make_date(1960,08,28),NOW(),NULL,'43656335'),
	('Mano', 'Brown', 'H', '4654646',3,'1654654645',make_date(1969,11,13),make_date(2016,10,14),NULL,'646546'),
	('Camila', 'Coelho', 'H', '6546465',1,'661616',make_date(1994,05,07),make_date(2017,02,19),NULL,'54656321'),

	('Hugo', 'White', 'E', '73345863',2,'635363',make_date(1994,05,04),make_date(2015,02,19),NULL,'6356563'),
	('Jack', 'Black', 'E', '243452352',5,'25632445',make_date(1994,03,27),make_date(2012,02,19),NULL,'523452345'),
	('Adriana', 'Gibson', 'E', '543523',6,'2465454326',make_date(1994,11,12),make_date(2012,01,20),NULL,'53452'),
	('Michael', 'Costa', 'E', '523456',5,'536715',make_date(1984,03,26),make_date(2013,08,19),NULL,'523452345'),
	('William', 'Walls', 'E', '856785',7,'263462',make_date(1973,01,30),make_date(2014,06,16),NULL,'5324523'),
	('Joao', 'Lubinu', 'E', '1343431',8,'97689',make_date(1969,03,12),make_date(2017,05,08),make_date(2017,05,09),'53245234'),
	('Julio', 'Walls', 'E', '86578',8,'5346556',make_date(1982,05,16),make_date(2017,10,07),NULL,'5324523'),
	('Isabelle', 'Opere', 'E', '6435643',3,'853857',make_date(1984,07,18),make_date(2016,11,06),NULL,'5234523'),
	('Igor', 'Ibere', 'E', '5324523',7,'9791271',make_date(1992,12,05),make_date(2020,02,05),NULL,'5234523'),
	('Jade', 'Pera', 'E', '522355',4,'0065642',make_date(1991,09,23),make_date(2015,02,11),NULL,'655623'),
	('Andre', 'Maça', 'E', '6565345',5,'42346256',make_date(1994,05,23),make_date(2012,02,10),NULL,'523452');

INSERT INTO staff_holidays (id_staff, holiday) VALUES 
	((SELECT id FROM staff WHERE firstname='Thiago'), make_date(2020,02,22)),
	((SELECT id FROM staff WHERE firstname='Thiago'), make_date(2020,02,23)),
	((SELECT id FROM staff WHERE firstname='Thiago'), make_date(2020,02,24)),
	((SELECT id FROM staff WHERE firstname='Thiago'), make_date(2020,02,25)),
	((SELECT id FROM staff WHERE firstname='Thiago'), make_date(2020,02,26)),
	((SELECT id FROM staff WHERE firstname='Thiago'), make_date(2020,02,27)),
	((SELECT id FROM staff WHERE firstname='Thiago'), make_date(2020,02,28)),
	((SELECT id FROM staff WHERE firstname='Thiago'), make_date(2020,03,01)),
	((SELECT id FROM staff WHERE firstname='Mano'), make_date(2020,03,03)),
	((SELECT id FROM staff WHERE firstname='William'), make_date(2020,03,03)),
	((SELECT id FROM staff WHERE firstname='Isabelle'), make_date(2020,03,03)),
	((SELECT id FROM staff WHERE firstname='Andre'), make_date(2020,03,07)),
	((SELECT id FROM staff WHERE firstname='Jade'), make_date(2020,03,07));

INSERT INTO department (name, email, id_address, id_manager, id_assistant) VALUES 
	('Information Technology','it@company.com',(SELECT id FROM address WHERE zipcode='696969'),(SELECT id FROM staff WHERE firstname='Mano'),(SELECT id FROM staff WHERE firstname='Jade')),
	('Transportation','trans@company.com',(SELECT id FROM address WHERE zipcode='696969'),(SELECT id FROM staff WHERE firstname='Camila'),(SELECT id FROM staff WHERE firstname='William')),
	('Administration','adm@company.com',(SELECT id FROM address WHERE zipcode='696969'),(SELECT id FROM staff WHERE firstname='Bruno'),(SELECT id FROM staff WHERE firstname='William'));

INSERT INTO department_workers (id_staff, id_department) VALUES 
	((SELECT id FROM staff WHERE firstname='Thiago'),(SELECT id FROM department WHERE name='Information Technology')),
	((SELECT id FROM staff WHERE firstname='Hugo'),(SELECT id FROM department WHERE name='Information Technology')),
	((SELECT id FROM staff WHERE firstname='Andre'),(SELECT id FROM department WHERE name='Information Technology')),

	((SELECT id FROM staff WHERE firstname='Isabelle'),(SELECT id FROM department WHERE name='Transportation')),
	((SELECT id FROM staff WHERE firstname='Jack'),(SELECT id FROM department WHERE name='Transportation')),
	((SELECT id FROM staff WHERE firstname='Igor'),(SELECT id FROM department WHERE name='Transportation')),
	((SELECT id FROM staff WHERE firstname='Michael'),(SELECT id FROM department WHERE name='Transportation')),

	((SELECT id FROM staff WHERE firstname='Adriana'),(SELECT id FROM department WHERE name='Administration')),
	((SELECT id FROM staff WHERE firstname='Julio'),(SELECT id FROM department WHERE name='Administration'));

INSERT INTO autorisation (status, checked_at, id_checker_staff) VALUES 
	('V',make_timestamp(2020,01,15, 14,30,14.33),(SELECT id FROM staff WHERE firstname='Thiago')),
	('D',make_timestamp(2020,01,15, 14,50,1.5),(SELECT id FROM staff WHERE firstname='Thiago')),
	('V',make_timestamp(2020,01,22, 15,30,16.96),(SELECT id FROM staff WHERE firstname='Thiago')),
	('V',make_timestamp(2020,01,22, 15,32,45.26),(SELECT id FROM staff WHERE firstname='Taylor')),
	('V',make_timestamp(2020,01,22, 14,00,01.02),(SELECT id FROM staff WHERE firstname='Taylor'));

INSERT INTO mission (start_at, end_at, name, description, id_dst_address, id_department, id_autorisation) VALUES 
	(make_date(2020,01,16),make_date(2020,01,20),'Count cars on the street','Very long description',2,(SELECT id FROM department WHERE name='Transportation'),1),
	(make_date(2020,01,18),make_date(2020,01,31),'Suspecious mission','Very long description of the suspecious mission',5,(SELECT id FROM department WHERE name='Administration'),2);

INSERT INTO mission (start_at, end_at, name, description, id_dst_address, id_department) VALUES 
	(make_date(2020,03,06),make_date(2020,03,08),'Fix some computers','Very long description',6,(SELECT id FROM department WHERE name='Information Technology')),
	(make_date(2020,04,01),make_date(2020,04,20),'Implement the new system','Very long description',7,(SELECT id FROM department WHERE name='Information Technology'));

INSERT INTO mission_staff (id_mission, id_staff) VALUES 
	(1,(SELECT id FROM staff WHERE firstname='Camila')),
	
	(2,(SELECT id FROM staff WHERE firstname='Julio')),
	
	(3,(SELECT id FROM staff WHERE firstname='Hugo')), -- If we put Jade here instead of Hugo, we get holiday exception
	
	(4,(SELECT id FROM staff WHERE firstname='Thiago')),
	(4,(SELECT id FROM staff WHERE firstname='Jade')),
	(4,(SELECT id FROM staff WHERE firstname='Andre'));

INSERT INTO mission_costs (id_mission, cost, description, id_staff,comments) VALUES 
	(1,100.99,'Accomodation',(SELECT id FROM staff WHERE firstname='Camila'),NULL),
	(1,20,'Transportation',(SELECT id FROM staff WHERE firstname='Camila'),NULL),
	(1,5,'Food',(SELECT id FROM staff WHERE firstname='Camila'),NULL),
	
	(2,100000,'Food',(SELECT id FROM staff WHERE firstname='Julio'),NULL),
	(2,100000,'Transportation',(SELECT id FROM staff WHERE firstname='Julio'),NULL),
	
	(3,50,'Accomodation',(SELECT id FROM staff WHERE firstname='Hugo'),NULL),
	(3,100.99,'Transportation',(SELECT id FROM staff WHERE firstname='Hugo'),NULL),

	(4,87.36,'Accomodation',(SELECT id FROM staff WHERE firstname='Thiago'),NULL),
	(4,120,'Transportation',(SELECT id FROM staff WHERE firstname='Thiago'),'Had to take a plane due an important meeting'),
	(4,87.36,'Accomodation',(SELECT id FROM staff WHERE firstname='Jade'),NULL),
	(4,20,'Transportation',(SELECT id FROM staff WHERE firstname='Jade'),NULL),
	(4,87.36,'Accomodation',(SELECT id FROM staff WHERE firstname='Andre'),NULL),
	(4,20,'Transportation',(SELECT id FROM staff WHERE firstname='Andre'),NULL);

INSERT INTO invoice (id_mission_cost, attachment_path, comments, id_autorisation) VALUES 
	(1,'/acc/35353543.pdf','Payment by card has 10% tax',3),
	(2,'/trans/a6df456sd.pdf',NULL,4),
	(3,'/food/s65z5fsd4.pdf',NULL,5),

	(6,'/acc/h26fh26r.pdf',NULL,NULL),
	(7,'/trans/fs6d5f6.pdf',NULL,NULL);

INSERT INTO cars (brand, model, chassis, license_plate, insurance_number) VALUES 
	('Chevrolet','Classic','2FMDK4KC6ABB07771','HLN-3842','6268246262'),
	('Fiat','Uno','5Y2SL62884Z406194','KKK-6652','45475345634'),
	('Fiat','Uno','1FAHP34N57W227820','GMF-1985','6456424564'),
	('Fiat','Uno','2HGFB2F55CH563646','ORB-4763','4564564539');

INSERT INTO car_maintenance (id_car, inspected_at, description) VALUES 
	((SELECT id FROM cars WHERE license_plate='HLN-3842'),make_timestamp(2018,06,06, 18,22,14.33),'Everything OK'),
	((SELECT id FROM cars WHERE license_plate='HLN-3842'),make_timestamp(2018,12,06, 18,22,14.33),'Exchanged brackets'),
	((SELECT id FROM cars WHERE license_plate='HLN-3842'),make_timestamp(2019,06,06, 18,22,14.33),'New oil added'),
	((SELECT id FROM cars WHERE license_plate='HLN-3842'),make_timestamp(2019,12,06, 18,22,14.33),'Everything OK'),

	((SELECT id FROM cars WHERE license_plate='KKK-6652'),make_timestamp(2018,12,06, 18,22,14.33),'Everything OK'),
	((SELECT id FROM cars WHERE license_plate='KKK-6652'),make_timestamp(2019,06,06, 18,22,14.33),'Everything OK'),
	((SELECT id FROM cars WHERE license_plate='KKK-6652'),make_timestamp(2019,12,06, 18,22,14.33),'Batery issues'),

	((SELECT id FROM cars WHERE license_plate='GMF-1985'),make_timestamp(2018,12,06, 18,22,14.33),'Everything OK'),
	((SELECT id FROM cars WHERE license_plate='GMF-1985'),make_timestamp(2019,06,06, 18,22,14.33),'Everything OK'),
	((SELECT id FROM cars WHERE license_plate='GMF-1985'),make_timestamp(2019,12,06, 18,22,14.33),'Everything OK'),

	((SELECT id FROM cars WHERE license_plate='ORB-4763'),make_timestamp(2018,12,06, 18,22,14.33),'New oil added'),
	((SELECT id FROM cars WHERE license_plate='ORB-4763'),make_timestamp(2019,06,06, 18,22,14.33),'New oil added'),
	((SELECT id FROM cars WHERE license_plate='ORB-4763'),make_timestamp(2019,12,06, 18,22,14.33),'Engine issues');

INSERT INTO train_transport (id_mission_cost, company_name, ticket_ref, train_number, seat_number, departure_at, arrival_at) VALUES
	(2,'TGV','KJI6260','T-895','A20',make_timestamp(2020,01,15, 14,22,14.33),make_timestamp(2020,01,15, 18,22,14.33)),
	(2,'TGV','KLL8940','T-875','A22',make_timestamp(2020,01,21, 08,22,14.33),make_timestamp(2020,01,21, 14,22,14.33));

INSERT INTO car_rental_transport (id_mission_cost, company_name, rental_ref, car_reg, rented_at, returned_at) VALUES
	(7,'Localiza','65dasd6sd','9566326',make_timestamp(2020,03,05, 08,00,18),make_timestamp(2020,03,09, 15,48,17.2));

INSERT INTO plane_transport (id_mission_cost, company_name, ticket_ref, flight_number, seat_number, departure_at, arrival_at) VALUES
	(9,'British Airlines','HGFH6562','8223','4A',make_timestamp(2020,04,01, 10,00,00),make_timestamp(2020,04,01, 13,00,00)),
	(9,'British Airlines','65DF6G2D','9601','6B',make_timestamp(2020,04,20, 18,00,00),make_timestamp(2020,04,20, 22,15,00));

INSERT INTO service_car_transport (id_mission_cost, id_car, km_driven, withdrawal_at, returned_at) VALUES
	(11,(SELECT id FROM cars WHERE license_plate='KKK-6652'),600.8,make_timestamp(2020,03,30, 06,00,52.65),make_timestamp(2020,04,20, 13,05,14.3)),
	(13,(SELECT id FROM cars WHERE license_plate='HLN-3842'),620.1,make_timestamp(2020,03,30, 06,10,23.5),make_timestamp(2020,04,20, 12,42,17.6)),
	(13,(SELECT id FROM cars WHERE license_plate='HLN-3842'),500.1,make_timestamp(2019,03,30, 06,10,23.5),make_timestamp(2019,04,20, 12,42,17.6)); -- added just to have 2 entries

SET session_replication_role = DEFAULT; -- enable all triggers