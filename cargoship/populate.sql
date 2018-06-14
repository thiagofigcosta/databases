INSERT INTO terrain_location ("name","continent")
			VALUES  ('Brasil','America');
INSERT INTO terrain_location ("name","continent")
			VALUES  ('Japao','Asia');

INSERT INTO water_location ("name")
			VALUES  ('Lagoa Varzea das Flores');
INSERT INTO water_location ("name")
			VALUES  ('Mar Hills');

INSERT INTO port ("name","owner","id_terrain_location","id_water_location")
			VALUES  ('Betim','Irmao do Irmao do Leo','Brasil','Lagoa Varzea das Flores');
INSERT INTO port ("name","owner","id_terrain_location","id_water_location")
			VALUES  ('No * e Gritaria','Sonico e Nervoso','Japao','Mar Hills');

INSERT INTO ship_type ("type","tonnage","hull")
			VALUES  ('Cruzeiro Roberto Carlos',66666,'Bem duro');
INSERT INTO ship_type ("type","tonnage","hull")
			VALUES  ('Cargueiro',300,'Tipo A- Cd9263');
INSERT INTO ship_type ("type","tonnage","hull")
			VALUES  ('Gateiro',1,'Antipelo');

INSERT INTO ship ("name","owner","id_port","id_type")
			VALUES  ('Saudade da Morena','Thiagao SadBoy','No * e Gritaria','Cargueiro');
INSERT INTO ship ("name","owner","id_port","id_type")
			VALUES  ('Saudosista','Bernardera','Betim','Cruzeiro Roberto Carlos');
INSERT INTO ship ("name","owner","id_port","id_type")
			VALUES  ('Lasanha de Bacalhau','Mãe do Thiago','No * e Gritaria','Gateiro');

INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('29/03/2018','17:32,100','19.6534892','17.6234562','Saudade da Morena');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('29/03/2018','18:32,198','20.6534892','17.2544562','Saudade da Morena');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('30/03/2018','02:15,233','47.5452308','56.4131323','Saudosista');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('30/03/2018','23:23,956','19.4123412','17.5234524','Saudosista');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('30/03/2018','05:32,785','19.5353554','23.5243523','Saudosista');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('31/03/2018','13:02,330','20.1325262','17.3265626','Saudade da Morena');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('01/04/2018','18:52,666','07.9852365','42.6232665','Saudosista');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('02/04/2018','22:22,666','30.1262633','19.7922626','Lasanha de Bacalhau');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('02/04/2018','23:24,666','76.9856320','33.1606626','Saudade da Morena');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('02/04/2018','23:59,999','03.0065252','24.0062632','Lasanha de Bacalhau');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('03/04/2018','00:32,160','08.6425262','98.6123085','Saudade da Morena');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('03/04/2018','01:32,100','08.9262323','26.5426251','Saudosista');
INSERT INTO ship_movement ("timestamp_date","timestamp_hour","longitude","latitude","id_ship")
			VALUES  ('03/04/2018','01:32,101','16.0062006','23.1155536','Saudade da Morena');

INSERT INTO visit ("arrive_datetime","departure_datetime","id_ship","id_port")
			VALUES ('20/06/2017-21:00,920','20/06/2017-22:00','Saudade da Morena','Betim');
INSERT INTO visit ("arrive_datetime","departure_datetime","id_ship","id_port")
			VALUES ('22/03/2018-10:00,000','22/03/2018-15:30','Lasanha de Bacalhau','Betim');
INSERT INTO visit ("arrive_datetime","departure_datetime","id_ship","id_port")
			VALUES ('22/03/2018-21:02,323','01/04/2018-00:00','Saudosista','No * e Gritaria');