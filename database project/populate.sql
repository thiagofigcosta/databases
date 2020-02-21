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
	('Fonseca street', 32, NULL, '96264FF', 'Nova Suiça', 'The Hague', 'Hollande-Septentrionale', (SELECT id FROM country WHERE name='Netherlands'));

INSERT INTO staff (firstname, lastname, class, phone, id_address, ssn, birth, admitted_at, fired_at, emergency_phone) VALUES 
	('Thiago', 'Figueiredo Costa', 'A', '4002-8922',1,'1324654646',make_date(1998,03,10),make_date(2019,08,19),NULL,'666'),
	('Taylor', 'Swift', 'D', '565656565',1,'4646546516',make_date(1989,12,13),make_date(2019,08,19),NULL,'292829848'),
	
	('Jorge Luiz', 'Silva', 'H', '98952662',2,'64616266',make_date(1959,01,24),make_date(2010,07,10),NOW(),'65161616'),
	('Mano', 'Brown', 'H', '4654646',3,'1654654645',make_date(1969,11,13),make_date(2016,10,14),NULL,'646546'),
	('Camila', 'Coelho', 'H', '6546465',1,'661616',make_date(1994,05,07),make_date(2017,02,19),NULL,'54656321'),

	('Hugo', 'White', 'E', '73345863',2,'635363',make_date(1994,05,04),make_date(2015,02,19),NULL,'6356563'),
	('Joao', 'Brown', 'E', '243452352',5,'25632445',make_date(1994,03,27),make_date(2012,02,19),NULL,'523452345'),
	('Adriana', 'Gibson', 'E', '543523',6,'2465454326',make_date(1994,11,12),make_date(2012,01,20),NULL,'53452'),
	('Michael', 'Costa', 'E', '523456',5,'536715',make_date(1984,03,26),make_date(2013,08,19),NULL,'523452345'),
	('William', 'Walls', 'E', '856785',7,'263462',make_date(1973,01,30),make_date(2014,06,16),NULL,'5324523'),
	('Joao', 'Lubinu', 'E', '1343431',8,'97689',make_date(1969,03,12),make_date(2017,05,08),make_date(2017,05,09),'53245234'),
	('Julio', 'Walls', 'E', '86578',8,'5346556',make_date(1982,05,16),make_date(2017,10,07),NULL,'5324523'),
	('Isabelle', 'Opere', 'E', '6435643',3,'853857',make_date(1984,07,18),make_date(2016,11,06),NULL,'5234523'),
	('Igor', 'Ibere', 'E', '5324523',7,'9791271',make_date(1992,12,05),make_date(2020,02,05),NULL,'5234523'),
	('Jade', 'Pera', 'E', '522355',4,'0065642',make_date(1991,09,23),make_date(2015,02,11),NULL,'655623'),
	('Andre', 'Maça', 'E', '6565345',5,'42346256',make_date(1994,05,23),make_date(2012,02,10),NULL,'523452');
