CREATE TABLE ship(
	"name" VARCHAR(30) UNIQUE NOT NULL PRIMARY KEY,
	"owner" VARCHAR(30) NOT NULL,
	"id_port" VARCHAR(30), -- Port Foreign Key Link
	"id_type" VARCHAR(30) NOT NULL -- Type Foreign Key Link
);

CREATE TABLE ship_movement( 
	"timestamp_date" VARCHAR(10) NOT NULL,
	"timestamp_hour" VARCHAR(9) NOT NULL,
	"longitude" DECIMAL(9,6) NOT NULL,
	"latitude" DECIMAL(9,6) NOT NULL,
	"id_ship" VARCHAR(30) NOT NULL, -- Ship Foreign Key Link
	PRIMARY KEY("timestamp_date", "timestamp_hour")  
);

CREATE TABLE port(
	"name" VARCHAR(30) UNIQUE NOT NULL PRIMARY KEY,
	"owner" VARCHAR(30) NOT NULL,
	"id_terrain_location" VARCHAR(30) NOT NULL, -- Terrain(state/country) Foreign Key Link
	"id_water_location" VARCHAR(30) NOT NULL -- Water(sea/ocean/lake) Foreign Key Link
);

CREATE TABLE terrain_location(
	"name" VARCHAR(30) UNIQUE NOT NULL PRIMARY KEY,
	"continent" VARCHAR(30) NOT NULL
);

CREATE TABLE water_location(
	"name" VARCHAR(30) UNIQUE NOT NULL PRIMARY KEY
);

CREATE TABLE ship_type(
	"type" VARCHAR(30) UNIQUE NOT NULL PRIMARY KEY,
	"tonnage" INT NOT NULL,
	"hull" VARCHAR(30) NOT NULL
);

CREATE TABLE visit(
	"arrive_datetime" VARCHAR(20) UNIQUE NOT NULL PRIMARY KEY,
	"departure_datetime" VARCHAR(20),
	"id_ship" VARCHAR(30), -- Ship Foreign Key Link
	"id_port" VARCHAR(30) -- Port Foreign Key Link
);

ALTER TABLE ship_movement ADD CONSTRAINT FK_ship_movement FOREIGN KEY(id_ship) REFERENCES ship(name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ship ADD CONSTRAINT FK_ship_port FOREIGN KEY(id_port) REFERENCES port(name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ship ADD CONSTRAINT FK_ship_type FOREIGN KEY(id_type) REFERENCES ship_type(type) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE port ADD CONSTRAINT FK_port_terrain_localtion FOREIGN KEY(id_terrain_location) REFERENCES terrain_location(name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE port ADD CONSTRAINT FK_port_water_localtion FOREIGN KEY(id_water_location) REFERENCES water_location(name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE visit ADD CONSTRAINT FK_visit_ship FOREIGN KEY(id_ship) REFERENCES ship(name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE visit ADD CONSTRAINT FK_visit_port FOREIGN KEY(id_port) REFERENCES port(name) ON DELETE CASCADE ON UPDATE CASCADE;