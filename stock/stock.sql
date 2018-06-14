CREATE TABLE supplier(
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(30) NOT NULL,
	"postage" INT,
	"city" VARCHAR(30) NOT NULL 
);

CREATE TABLE part( 
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(30) NOT NULL,
	"color" VARCHAR(15) NOT NULL,
	"weight" REAL NOT NULL,
	"city" VARCHAR(30) NOT NULL
);

CREATE TABLE project(
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(30) NOT NULL,
	"city" VARCHAR(30) NOT NULL
);

CREATE TABLE supply(
	"id_supplier" INT NOT NULL, -- Supplier Foreign Key Link
	"id_part" INT NOT NULL, -- Part Foreign Key Link
	"id_project" INT NOT NULL, -- Project Foreign Key Link
	"amount" INT NOT NULL,
	PRIMARY KEY("id_supplier", "id_part", "id_project")
);


ALTER TABLE supply ADD CONSTRAINT FK_supply_supplier FOREIGN KEY(id_supplier) REFERENCES supplier(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE supply ADD CONSTRAINT FK_supply_part FOREIGN KEY(id_part) REFERENCES part(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE supply ADD CONSTRAINT FK_supply_project FOREIGN KEY(id_project) REFERENCES project(id) ON DELETE CASCADE ON UPDATE CASCADE;