-- TODO
--- quando modificar a tabela de funcionarios da missao, desaprova-la
--- verficar se há algum feriado do funcionario dentro do intervalo da missao ao adiciona-lo

--- criar uma tabela para STATUS e substituir as colunas de invoice e mission???????
----- colocar campo approval status (hold/validated/rejected) no que necessita de aprovacao

--- trigger de validacao pre insercao do invoice 

--- verficar se tabelas e procedures existem antes de criar (creat if no exists)
--- testar e corrigir erros
--- script de povoamento
--- query para calcular kilometragem do veiculo da empresa
--- scripts de visualizacao 
--- scripts de modificacao
--- fazer comentarios nos scripts como documentacao para a teacher
--- diagrama entidade relacionamento
--- modelo logico (aquele que parece com o sql, 1 linha por tabela)


CREATE SEQUENCE SQ_ADDRESS_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE address(
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_ADDRESS_PK'),
	street VARCHAR(64) NOT NULL, 
	"number" INT NOT NULL,
	complement VARCHAR(30),
	zipcode INT NOT NULL, 
	district VARCHAR(30),
	city VARCHAR(30) NOT NULL,
	state VARCHAR(30) NOT NULL,
	id_country INTEGER NOT NULL
);

CREATE SEQUENCE SQ_COUNTRY_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE country (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_COUNTRY_PK'),
	name VARCHAR(50) NOT NULL UNIQUE
);

ALTER TABLE address ADD CONSTRAINT FK_address_country FOREIGN KEY(id_country) REFERENCES country(id) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE SEQUENCE SQ_STAFF_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE staff (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_STAFF_PK'),
	name VARCHAR(32) NOT NULL,
	class VARCHAR(1) NOT NULL,
	phone VARCHAR (16) NOT NULL,
	id_address INTEGER NOT NULL,
	ssn VARCHAR (14) NOT NULL, -- social security number
	birth DATE NOT NULL,
	admitted_at TIMESTAMP NOT NULL,
	fired_at TIMESTAMP,
	emergency_phone VARCHAR (16) NOT NULL,
	constraint CK_staff_class check (class in (	'E',  -- employee
												'H',  -- service head
												'D',  -- director
												'A')) -- system admin
);

ALTER TABLE staff ADD CONSTRAINT FK_staff_address FOREIGN KEY(id_address) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE SEQUENCE SQ_STAFFHOLIDAYS_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE staff_holidays (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_STAFFHOLIDAYS_PK'),
	id_staff INTEGER NOT NULL,
	holiday DATE NOT NULL,
	UNIQUE(id_staff,holiday)
);
ALTER TABLE staff_holidays ADD CONSTRAINT FK_staffhollidays_staff FOREIGN KEY(id_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE SEQUENCE SQ_SERVICE_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE service (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_SERVICE_PK'),
	name VARCHAR(32) NOT NULL,
	email VARCHAR(56) NOT NULL,
	id_address INTEGER NOT NULL,
	id_manager INTEGER NOT NULL,
	id_assistant INTEGER NOT NULL
);
ALTER TABLE service ADD CONSTRAINT FK_service_address FOREIGN KEY(id_address) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE service ADD CONSTRAINT FK_service_staffmanager FOREIGN KEY(id_manager) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE service ADD CONSTRAINT FK_service_staffassistant FOREIGN KEY(id_assistant) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE service_workers (
	id_staff INTEGER NOT NULL,
	id_service INTEGER NOT NULL,
	PRIMARY KEY(id_staff, id_service)
);
ALTER TABLE service_workers ADD CONSTRAINT FK_serviceworkers_staff FOREIGN KEY(id_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE service_workers ADD CONSTRAINT FK_serviceworkers_service FOREIGN KEY(id_service) REFERENCES service(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE SEQUENCE SQ_MISSION_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE mission (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_MISSION_PK'),
	start_at TIMESTAMP NOT NULL,
	end_at TIMESTAMP NOT NULL,
	description TEXT NOT NULL,
	id_dst_address INTEGER NOT NULL,
	id_service INTEGER NOT NULL,
	approved_at TIMESTAMP,
	id_approval_staff INTEGER
);
ALTER TABLE mission ADD CONSTRAINT FK_mission_address FOREIGN KEY(id_dst_address) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mission ADD CONSTRAINT FK_mission_service FOREIGN KEY(id_service) REFERENCES service(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mission ADD CONSTRAINT FK_mission_approver FOREIGN KEY(id_approval_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE SEQUENCE SQ_MISSIONCOSTS_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE mission_costs (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_MISSIONCOSTS_PK'),
	cost DECIMAL(12,2) NOT NULL DEFAULT 0,
	description VARCHAR(300) NOT NULL,
	comments VARCHAR(300),
	id_mission INTEGER NOT NULL,
	id_staff INTEGER NOT NULL
);
ALTER TABLE mission_costs ADD CONSTRAINT FK_missioncosts_mission FOREIGN KEY(id_mission) REFERENCES mission(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mission_costs ADD CONSTRAINT FK_missioncosts_staff FOREIGN KEY(id_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE SEQUENCE SQ_INVOICE_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE invoice (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_INVOICE_PK'),
	id_mission_cost INTEGER NOT NULL,
	attachment_path VARCHAR(64) NOT NULL,
	comments VARCHAR(300),
	approved_at TIMESTAMP,
	id_approval_staff INTEGER
);
ALTER TABLE invoice ADD CONSTRAINT FK_invoice_missioncost FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE invoice ADD CONSTRAINT FK_invoice_approver FOREIGN KEY(id_approval_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE mission_staff (
	id_mission INTEGER NOT NULL,
	id_staff INTEGER NOT NULL,
	PRIMARY KEY (id_mission,id_staff)
);
ALTER TABLE mission_staff ADD CONSTRAINT FK_missionstaff_mission FOREIGN KEY(id_mission) REFERENCES mission(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mission_staff ADD CONSTRAINT FK_missionstaff_staff FOREIGN KEY(id_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE SEQUENCE SQ_CARS_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE cars (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_CARS_PK'),
	chassis VARCHAR(17) NOT NULL,
	license_plate VARCHAR(10) NOT NULL,
	insurance_number VARCHAR(15) NOT NULL,
);

CREATE SEQUENCE SQ_CARMAINTENANCE_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE car_maintenance (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_CARMAINTENANCE_PK'),
	id_car INTEGER NOT NULL,
	inspected_at TIMESTAMP NOT NULL,
	description TEXT
);
ALTER TABLE cars_maintenance ADD CONSTRAINT FK_carmaintenance_car FOREIGN KEY(id_car) REFERENCES car(id) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE SEQUENCE SQ_PLANETRANSPORT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE plane_transport (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_PLANETRANSPORT_PK'),
    id_mission_cost INTEGER NOT NULL, -- cost related to this transport
    company_name VARCHAR(20) NOT NULL,
    ticket_ref VARCHAR(12) NOT NULL,
    flight_number VARCHAR(12) NOT NULL,
    seat_number VARCHAR(12) NOT NULL,
    departure_at TIMESTAMP NOT NULL,
    arrival_at TIMESTAMP NOT NULL
);
ALTER TABLE plane_transport ADD CONSTRAINT FK_planetransport_missioncosts FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE SEQUENCE SQ_TRAINTRANSPORT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE train_transport (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_TRAINTRANSPORT_PK'),
    id_mission_cost INTEGER NOT NULL, -- cost related to this transport
    company_name VARCHAR(20) NOT NULL,
    ticket_ref VARCHAR(12) NOT NULL,
    train_number VARCHAR(12) NOT NULL,
    seat_number VARCHAR(12) NOT NULL,
    departure_at TIMESTAMP NOT NULL,
    arrival_at TIMESTAMP NOT NULL
);
ALTER TABLE train_transport ADD CONSTRAINT FK_traintransport_missioncosts FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE SEQUENCE SQ_CARRENTALTRANSPORT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE car_rental_transport (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_CARRENTALTRANSPORT_PK'),
    id_mission_cost INTEGER NOT NULL, -- cost related to this transport
    company_name VARCHAR(20) NOT NULL,
    rental_ref VARCHAR(12) NOT NULL,
    car_reg VARCHAR(12) NOT NULL,
    departure_at TIMESTAMP NOT NULL,
    arrival_at TIMESTAMP NOT NULL,
);
ALTER TABLE car_rental_transport ADD CONSTRAINT FK_carrentaltransport_missioncosts FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE SEQUENCE SQ_SERVICECARTRANSPORT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE service_car_transport (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_SERVICECARTRANSPORT_PK'),
    id_mission_cost INTEGER NOT NULL, -- cost related to this transport
    id_car INTEGER NOT NULL,
    km_driven INTEGER NOT NULL,
    departure_at TIMESTAMP NOT NULL,
    arrival_at TIMESTAMP NOT NULL,
);
ALTER TABLE service_car_transport ADD CONSTRAINT FK_servicecartransport_missioncosts FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE service_car_transport ADD CONSTRAINT FK_servicecartransport_cars FOREIGN KEY(id_car) REFERENCES cars(id) ON DELETE CASCADE ON UPDATE CASCADE;




-- DEFINE TRIGGER
CREATE OR REPLACE FUNCTION service_validation()
	RETURNS TRIGGER AS $$
DECLARE
_manager_class varchar(1);
_manager_fired_date timestamp;
_assistant_fired_date timestamp;
BEGIN
	SELECT S.class,S.fired_at INTO _manager_class, _manager_fired_date
	FROM staff S
	WHERE S.id = NEW.id_manager -- NEW = new record, OLD = previous record
	LIMIT 1;

	SELECT S.fired_at INTO _assistant_fired_date
	FROM staff S
	WHERE S.id = NEW.id_assistant
	LIMIT 1;

	IF (_manager_class IN ('H', 'D', 'A') ) AND (_manager_fired_date IS NOT NULL) AND (_assistant_fired_date IS NOT NULL)
	THEN
		RETURN NEW;
	END IF;
	RAISE EXCEPTION 'Invalid manager or assistant in service(id:%)!', NEW.id;
END;
$$ LANGUAGE plpgsql;

-- BIND TRIGGER
CREATE TRIGGER TR_service_validation 
BEFORE INSERT OR UPDATE ON service 
FOR EACH ROW EXECUTE PROCEDURE service_validation();


-- DEFINE TRIGGER
CREATE OR REPLACE FUNCTION mission_validation()
	RETURNS TRIGGER AS $$
DECLARE
_approver_class varchar(1);
_approver_fired_date timestamp;
_has_head_working boolean = False;

BEGIN
	SELECT S.class,S.fired_at INTO _approver_class, _approver_fired_date
	FROM staff S
	WHERE S.id = NEW.id_approval_staff -- NEW = new record, OLD = previous record
	LIMIT 1;

	-- check if mission has service head
	FOR row IN
        SELECT S.class FROM mission_staff M INNER JOIN staff S ON M.id_staff=S.id WHERE M.id_mission=NEW.id
    LOOP
    	IF row.class = 'H'
    	THEN
    		_has_head_working=True;
    		EXIT; -- breaks the loop
    	END IF;
    END LOOP;

	IF (NEW.id_approval_staff IS NULL) OR (NEW.approved_at IS NULL)
	THEN
		NEW.id_approval_staff=NULL;
		NEW.approved_at=NULL;
	END IF;

	IF ((_has_head_working=False AND _manager_class IN ('H', 'D', 'A')) OR 
	(_has_head_working AND _manager_class IN ('D', 'A'))) AND (_approver_fired_date IS NOT NULL) AND (NEW.approved_at<NEW.start_at)
	THEN
		RETURN NEW;
	END IF;
	RAISE EXCEPTION 'Invalid approver or approval date in mission(id:%)!', NEW.id;
END;
$$ LANGUAGE plpgsql;

-- BIND TRIGGER
CREATE TRIGGER TR_mission_validation
BEFORE INSERT OR UPDATE ON mission 
FOR EACH ROW EXECUTE PROCEDURE mission_validation();
