CREATE SEQUENCE IF NOT EXISTS SQ_ADDRESS_PK INCREMENT BY 1 START WITH 1; -- auto incrementer
CREATE TABLE IF NOT EXISTS address(
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_ADDRESS_PK'),
	street VARCHAR(64) NOT NULL, 
	"number" INT NOT NULL,
	complement VARCHAR(30),
	zipcode VARCHAR(15) NOT NULL, 
	district VARCHAR(30),
	city VARCHAR(30) NOT NULL,
	state VARCHAR(30),
	id_country INTEGER NOT NULL
);

CREATE SEQUENCE IF NOT EXISTS SQ_COUNTRY_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS country ( -- to avoid same countries to have diffent names (brazil, Brazil, brasil, BRASIL), should be done on more columns over the schema
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_COUNTRY_PK'),
	name VARCHAR(50) NOT NULL UNIQUE
);

CREATE SEQUENCE IF NOT EXISTS SQ_STAFF_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS staff (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_STAFF_PK'),
	firstname VARCHAR(32) NOT NULL,
	lastname VARCHAR(32) NOT NULL,
	class VARCHAR(1) NOT NULL,
	phone VARCHAR (16) NOT NULL,
	id_address INTEGER NOT NULL,
	ssn VARCHAR (14) NOT NULL, -- social security number
	birth DATE NOT NULL,
	admitted_at TIMESTAMP NOT NULL,
	fired_at TIMESTAMP,
	emergency_phone VARCHAR (16) NOT NULL,
	constraint CK_staff_class check (class in (	'E',  -- employee      -- avoid invalid chars
												'H',  -- department head
												'D',  -- director
												'A')) -- system admin
);

CREATE SEQUENCE IF NOT EXISTS SQ_STAFFHOLIDAYS_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS staff_holidays (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_STAFFHOLIDAYS_PK'),
	id_staff INTEGER NOT NULL,
	holiday DATE NOT NULL,
	UNIQUE(id_staff,holiday) -- avoid redundancy
);

CREATE SEQUENCE IF NOT EXISTS SQ_DEPARTMENT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS department ( -- "service" seams like a job, department is more appropriate
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_DEPARTMENT_PK'),
	name VARCHAR(32) NOT NULL UNIQUE, -- must be unique
	email VARCHAR(56) NOT NULL UNIQUE, -- must be unique, very hard to find email larger than 56
	id_address INTEGER NOT NULL,
	id_manager INTEGER NOT NULL,
	id_assistant INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS department_workers ( -- doesnt need to have id, but it could have to optimize results
	id_staff INTEGER NOT NULL,
	id_department INTEGER NOT NULL,
	PRIMARY KEY(id_staff, id_department) -- composite PK
);

CREATE SEQUENCE IF NOT EXISTS SQ_APPROVEMENT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS approvement (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_APPROVEMENT_PK'),
	status VARCHAR(1) NOT NULL,
	checked_at TIMESTAMP, -- timestamps are very important on business databases, we should have more stamps and more historical data on a real scenario
	id_checker_staff INTEGER,
	constraint CK_status check (status in (	'H',  -- on hold
											'V',  -- validated
											'D',  -- denied
											'R')) -- revision requested
);

CREATE SEQUENCE IF NOT EXISTS SQ_MISSION_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS mission (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_MISSION_PK'),
	start_at TIMESTAMP NOT NULL,
	end_at TIMESTAMP NOT NULL,
	name VARCHAR(32) NOT NULL,
	description TEXT NOT NULL, -- to allow huge texts
	id_dst_address INTEGER NOT NULL,
	id_department INTEGER NOT NULL,
	id_approvement INTEGER UNIQUE, -- avoid 2 missions to have same autorization
	constraint CK_dates check (start_at<end_at) -- avoid non-sense data
);

CREATE SEQUENCE IF NOT EXISTS SQ_MISSIONCOSTS_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS mission_costs (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_MISSIONCOSTS_PK'),
	cost DECIMAL(12,2) NOT NULL DEFAULT 0, -- this data type is recomended for money
	description VARCHAR(300) NOT NULL,
	comments VARCHAR(300),
	cost_date TIMESTAMP NOT NULL, -- to permit date filters on reports
	id_mission INTEGER NOT NULL,
	id_staff INTEGER NOT NULL
);

CREATE SEQUENCE IF NOT EXISTS SQ_INVOICE_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS invoice (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_INVOICE_PK'),
	id_mission_cost INTEGER NOT NULL,
	attachment_path VARCHAR(64) NOT NULL UNIQUE, -- path to invoice comprovation, must be implemented on application to save the file and store the path
	comments VARCHAR(300),
	paid BOOLEAN DEFAULT False,
	id_approvement INTEGER UNIQUE -- avoid 2 missions to have same autorization
);

CREATE TABLE IF NOT EXISTS mission_staff ( -- to allow several employees on the same mission
	id_mission INTEGER NOT NULL,
	id_staff INTEGER NOT NULL,
	PRIMARY KEY (id_mission,id_staff)
);

CREATE SEQUENCE IF NOT EXISTS SQ_CARS_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS cars (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_CARS_PK'),
	brand VARCHAR(15) NOT NULL,
	model VARCHAR(15) NOT NULL,
	chassis VARCHAR(17) NOT NULL UNIQUE, -- chassis have always 17 chars 
	license_plate VARCHAR(10) NOT NULL UNIQUE,
	insurance_number VARCHAR(15) NOT NULL UNIQUE
);

CREATE SEQUENCE IF NOT EXISTS SQ_CARMAINTENANCE_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS car_maintenance (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_CARMAINTENANCE_PK'),
	id_car INTEGER NOT NULL,
	inspected_at TIMESTAMP NOT NULL,
	description TEXT
);

CREATE SEQUENCE IF NOT EXISTS SQ_PLANETRANSPORT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS plane_transport (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_PLANETRANSPORT_PK'),
	id_mission_cost INTEGER NOT NULL, -- cost related to the transport are inside mission cost table
	company_name VARCHAR(20) NOT NULL,
	ticket_ref VARCHAR(12) NOT NULL,
	flight_number VARCHAR(12) NOT NULL,
	seat_number VARCHAR(12) NOT NULL,
	departure_at TIMESTAMP NOT NULL,
	arrival_at TIMESTAMP NOT NULL,
	constraint CK_plane_dates check (departure_at<arrival_at)
);


CREATE SEQUENCE IF NOT EXISTS SQ_TRAINTRANSPORT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS train_transport (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_TRAINTRANSPORT_PK'),
	id_mission_cost INTEGER NOT NULL,
	company_name VARCHAR(20) NOT NULL,
	ticket_ref VARCHAR(12) NOT NULL,
	train_number VARCHAR(12) NOT NULL,
	seat_number VARCHAR(12) NOT NULL,
	departure_at TIMESTAMP NOT NULL,
	arrival_at TIMESTAMP NOT NULL,
	constraint CK_train_dates check (departure_at<arrival_at)
);

CREATE SEQUENCE IF NOT EXISTS SQ_CARRENTALTRANSPORT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS car_rental_transport (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_CARRENTALTRANSPORT_PK'),
	id_mission_cost INTEGER NOT NULL, 
	company_name VARCHAR(20) NOT NULL,
	rental_ref VARCHAR(12) NOT NULL,
	car_reg VARCHAR(12) NOT NULL,
	rented_at TIMESTAMP NOT NULL, -- instead of departure and arrival, it's better to put rent and return date
	returned_at TIMESTAMP NOT NULL,
	constraint CK_rental_dates check (rented_at<returned_at)
);


CREATE SEQUENCE IF NOT EXISTS SQ_SERVICECARTRANSPORT_PK INCREMENT BY 1 START WITH 1;
CREATE TABLE IF NOT EXISTS service_car_transport (
	id INTEGER PRIMARY KEY DEFAULT NEXTVAL('SQ_SERVICECARTRANSPORT_PK'),
	id_mission_cost INTEGER NOT NULL, -- cost related to this transport
	id_car INTEGER NOT NULL,
	km_driven FLOAT NOT NULL,
	withdrawal_at TIMESTAMP NOT NULL, -- same as rent cars, but with the company cars
	returned_at TIMESTAMP NOT NULL,
	constraint CK_car_dates check (withdrawal_at<returned_at)
);

-- below the foreign keys
ALTER TABLE address ADD CONSTRAINT FK_address_country FOREIGN KEY(id_country) REFERENCES country(id) ON DELETE CASCADE ON UPDATE CASCADE; -- ON DELETE CASCADE ON UPDATE CASCADE - means that if the PK is modified, its new value is going to be propaged trough the FKs
																																				-- and if the entry with the PK is deleted, the dependant entries with the FK will be deleted as well
ALTER TABLE staff ADD CONSTRAINT FK_staff_address FOREIGN KEY(id_address) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE staff_holidays ADD CONSTRAINT FK_staffhollidays_staff FOREIGN KEY(id_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE department ADD CONSTRAINT FK_department_address FOREIGN KEY(id_address) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE department ADD CONSTRAINT FK_department_staffmanager FOREIGN KEY(id_manager) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE department ADD CONSTRAINT FK_department_staffassistant FOREIGN KEY(id_assistant) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE department_workers ADD CONSTRAINT FK_departmentworkers_staff FOREIGN KEY(id_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE department_workers ADD CONSTRAINT FK_departmentworkers_department FOREIGN KEY(id_department) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE mission ADD CONSTRAINT FK_mission_address FOREIGN KEY(id_dst_address) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mission ADD CONSTRAINT FK_mission_department FOREIGN KEY(id_department) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mission ADD CONSTRAINT FK_mission_approvement FOREIGN KEY(id_approvement) REFERENCES approvement(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE approvement ADD CONSTRAINT FK_approvement_approver FOREIGN KEY(id_checker_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE mission_costs ADD CONSTRAINT FK_missioncosts_mission FOREIGN KEY(id_mission) REFERENCES mission(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mission_costs ADD CONSTRAINT FK_missioncosts_staff FOREIGN KEY(id_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE invoice ADD CONSTRAINT FK_invoice_missioncost FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE invoice ADD CONSTRAINT FK_invoice_approvement FOREIGN KEY(id_approvement) REFERENCES approvement(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE mission_staff ADD CONSTRAINT FK_missionstaff_mission FOREIGN KEY(id_mission) REFERENCES mission(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE mission_staff ADD CONSTRAINT FK_missionstaff_staff FOREIGN KEY(id_staff) REFERENCES staff(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE car_maintenance ADD CONSTRAINT FK_carmaintenance_car FOREIGN KEY(id_car) REFERENCES cars(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE plane_transport ADD CONSTRAINT FK_planetransport_missioncosts FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE train_transport ADD CONSTRAINT FK_traintransport_missioncosts FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE car_rental_transport ADD CONSTRAINT FK_carrentaltransport_missioncosts FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE service_car_transport ADD CONSTRAINT FK_servicecartransport_missioncosts FOREIGN KEY(id_mission_cost) REFERENCES mission_costs(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE service_car_transport ADD CONSTRAINT FK_servicecartransport_cars FOREIGN KEY(id_car) REFERENCES cars(id) ON DELETE CASCADE ON UPDATE CASCADE; 

-- TRIGGERS
CREATE OR REPLACE FUNCTION department_validation() -- define the trigger function -- $$ is the separator (can be anything), this means a sort of 'BEGIN'
	RETURNS TRIGGER AS $$ 
DECLARE -- define some variables to store data
_manager_class varchar(1);
_manager_fired_date timestamp;
_assistant_fired_date timestamp;
BEGIN
	SELECT S.class,S.fired_at INTO _manager_class, _manager_fired_date -- filling the variables
	FROM staff S
	WHERE S.id = NEW.id_manager -- NEW refers to new record or the the update values, OLD refers to previous record value (if it's INSERT instead of UPDATE, OLD==null)
	LIMIT 1;

	SELECT S.fired_at INTO _assistant_fired_date -- filling the variables
	FROM staff S
	WHERE S.id = NEW.id_assistant
	LIMIT 1;

	IF (_manager_class IN ('H', 'D', 'A') ) AND (_manager_fired_date IS NULL) AND (_assistant_fired_date IS NULL) -- check approval permissions, and if the approver still works on the company
	THEN
		RETURN NEW; -- this allows the INSERT or UPDATE to occour
	END IF;
	RAISE EXCEPTION 'Invalid manager or assistant in department(id:%)!', NEW.id; -- exception cancels the INSERT or UPDATE and returns the error
END;
$$ LANGUAGE plpgsql; -- 'END' and especification of the procedure language

CREATE TRIGGER TR_department_validation --  create the trigger on the table and bind the function to it
BEFORE INSERT OR UPDATE ON department  -- must execute BEFORE INSERT or UPDATE
FOR EACH ROW EXECUTE PROCEDURE department_validation();

CREATE OR REPLACE FUNCTION mission_validation()
	RETURNS TRIGGER AS $$
DECLARE
_approval_status varchar(1);
_approver_class varchar(1);
_approver_fired_date timestamp;
_has_head_working boolean = False; -- declaring with start value false
_checked_at timestamp;
_id_checker_staff integer;
row record; -- we need to declare this as well to use as iterator on LOOP
BEGIN
	IF (NEW.id_approvement IS NULL) -- another way to do "NOT NULL", but instead of raising error it creates a default entry on the other table for it
	THEN
		INSERT INTO approvement (status) VALUES ('H') RETURNING id INTO NEW.id_approvement; -- create the entry and put its id value on the id_approvement FK field
	END IF;

	SELECT A.checked_at,A.id_checker_staff,A.status INTO _checked_at, _id_checker_staff, _approval_status -- filling the variables, getting the approval status
	FROM approvement A
	WHERE A.id = NEW.id_approvement 
	LIMIT 1;

	SELECT S.class,S.fired_at INTO _approver_class, _approver_fired_date -- filling the variables
	FROM staff S
	WHERE S.id = _id_checker_staff
	LIMIT 1;

	FOR row IN -- check if mission has department head working on it, if it has, the mission must be approved at least by a director
	SELECT S.class FROM mission_staff M INNER JOIN staff S ON M.id_staff=S.id WHERE M.id_mission=NEW.id -- it iterates over this query results
	LOOP
		IF row.class = 'H'
		THEN
			_has_head_working=True;
			EXIT; -- breaks the loop to save processing time
		END IF;
	END LOOP;

	IF (_approval_status!='V' OR ((_has_head_working=False AND _approver_class IN ('H', 'D', 'A')) OR -- when the status is validated, check if has the permission to approve, if the approver still works on the company and if the approval date is lower than mission start date
	(_has_head_working AND _approver_class IN ('D', 'A'))) AND (_approver_fired_date IS NULL) AND (_checked_at<NEW.start_at))
	THEN
		RETURN NEW;
	END IF;
	RAISE EXCEPTION 'Invalid approver or approval date in mission(id:%)!', NEW.id; 
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TR_mission_validation
BEFORE INSERT OR UPDATE ON mission 
FOR EACH ROW EXECUTE PROCEDURE mission_validation();

CREATE OR REPLACE FUNCTION approvement_validation()
	RETURNS TRIGGER AS $$
DECLARE
_id_mission integer;
_id_invoice integer;
BEGIN
	SELECT M.id INTO _id_mission -- filling the variables
	FROM mission M
	WHERE M.id_approvement = NEW.id 
	LIMIT 1;

	SELECT I.id INTO _id_invoice -- filling the variables
	FROM invoice I
	WHERE I.id_approvement = NEW.id 
	LIMIT 1;

	IF (_id_mission IS NOT NULL) -- checks if the autorization is for invoice or mission, since they share the autorization
	THEN
		UPDATE mission SET id=id WHERE id=_id_mission; -- force trigger to fire, to validade mission status
	END IF;
	IF (_id_invoice IS NOT NULL) -- checks if the autorization is for invoice or mission, since they share the autorization
	THEN
		UPDATE invoice SET id=id WHERE id=_id_invoice; -- force trigger to fire, to validade invoice status
	END IF;

	IF (NEW.id_checker_staff IS NULL) OR (NEW.checked_at IS NULL) -- synchronize these two inter-dependent fields, if one of then is null the other one must be null as well (if not approved)
	THEN
		IF (NEW.status!='V')
		THEN
			NEW.id_checker_staff=NULL; -- set both to null
			NEW.checked_at=NULL;
		ELSE -- else statement, to run case status=validated
			RAISE EXCEPTION 'Autorization(id:%) without timestamp or staff related to it!', NEW.id; -- raise exception to cancel the update
		END IF;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TR_approvement_validation 
BEFORE INSERT OR UPDATE ON approvement 
FOR EACH ROW EXECUTE PROCEDURE approvement_validation();


CREATE OR REPLACE FUNCTION missionstaff_validation()
	RETURNS TRIGGER AS $$
DECLARE
_staff_holidays date[]; -- array of dates, i just want to iterate in a different way now
_mission_start timestamp;
_mission_end timestamp;
i integer; -- iterator
BEGIN
	SELECT ARRAY(SELECT H.holiday  -- store the query result on the array
	FROM staff_holidays H
	WHERE H.id_staff = NEW.id_staff) INTO _staff_holidays;

	SELECT M.start_at, M.end_at INTO _mission_start, _mission_end -- fill the variables
	FROM mission M
	WHERE M.id = NEW.id_mission
	LIMIT 1;

	FOR i IN 1..coalesce(array_upper(_staff_holidays, 1), 0) -- iterates holidays using an index from 1 until its size, coalesce is here to add robustness to the code, avoiding NULL exceptions
	LOOP
		IF (_staff_holidays[i]>=_mission_start) AND (_staff_holidays[i]<=_mission_end) -- check if there is a holiday during mission
		THEN
			RAISE EXCEPTION 'Staff(id:%) has a holiday during mission in missionstaff!', NEW.id_staff; -- raise exception to cancel
		END IF;
	END LOOP;

	UPDATE approvement SET id_checker_staff=NULL, checked_at=NULL, status='H' -- when we add or modify information about mission's employees we need to put the mission on hold again to be validated with the new data
	WHERE id=(SELECT id_approvement FROM mission WHERE id=NEW.id_mission LIMIT 1);
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TR_missionstaff_validation 
BEFORE INSERT OR UPDATE ON mission_staff 
FOR EACH ROW EXECUTE PROCEDURE missionstaff_validation();


CREATE OR REPLACE FUNCTION invoice_validation()
	RETURNS TRIGGER AS $$
DECLARE
_approval_status varchar(1);
_requester_class varchar(1);
_approver_class varchar(1);
_approver_fired_date timestamp;
_id_checker_staff integer;
BEGIN
	IF (NEW.id_approvement IS NULL) -- forcing id_approvement to be NOT NULL
	THEN
		INSERT INTO approvement (status) VALUES ('H') RETURNING id INTO NEW.id_approvement;
	END IF;

	SELECT A.id_checker_staff,A.status INTO _id_checker_staff, _approval_status -- filling vars
	FROM approvement A
	WHERE A.id = NEW.id_approvement 
	LIMIT 1;

	SELECT S.class,S.fired_at INTO _approver_class, _approver_fired_date -- filling vars
	FROM staff S
	WHERE S.id = _id_checker_staff
	LIMIT 1;

	SELECT S.class INTO _requester_class -- filling vars
	FROM staff S INNER JOIN mission_costs M on S.id=M.id_staff
	WHERE M.id = NEW.id_mission_cost
	LIMIT 1;

	IF (_approval_status='V') -- we validate only on approved scenario
	THEN
		IF (_requester_class='E' AND _approver_class NOT IN ('H', 'D', 'A')) OR (_requester_class='H' AND _approver_class NOT IN ('D', 'A')) OR (_approver_fired_date IS NOT NULL) -- check permission level
		THEN
			RAISE EXCEPTION 'Invalid approver or approval date in invoice(id:%)!', NEW.id; -- raise exception to cancel
		END IF;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER TR_invoice_validation
BEFORE INSERT OR UPDATE ON invoice 
FOR EACH ROW EXECUTE PROCEDURE invoice_validation();
