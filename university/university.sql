CREATE TABLE college (
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY, 
	"name" VARCHAR(50) NOT NULL,
	"id_addr" INT NOT NULL, -- Address Foreign Key Link
	"ftn" VARCHAR(20) NOT NULL -- Federal Tax Number
 );

CREATE TABLE college_tel_number(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"id_college" INT NOT NULL, -- College Foreign Key Link
	"tel" VARCHAR(33) NOT NULL
);

CREATE TABLE address(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"zipcode" INT NOT NULL, 
	"street" VARCHAR(61) NOT NULL, 
	"number" INT NOT NULL, 
	"xtrainfo" VARCHAR(30), 
	"district" VARCHAR(30) NOT NULL,
	"city" VARCHAR(30) NOT NULL,
	"state" VARCHAR(30) NOT NULL,
	"country" VARCHAR(30) NOT NULL
);

CREATE TABLE department(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"id_college" INT NOT NULL, -- College Foreign Key Link
	"name" VARCHAR(30) NOT NULL
);

CREATE TABLE department_tel_number(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"id_department" INT NOT NULL, -- Department Foreign Key Link
	"tel" VARCHAR(33) NOT NULL
);

CREATE TABLE student(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"id_college" INT NOT NULL, -- College Foreign Key Link
	"id_main_department" INT NOT NULL, -- Main Department Foreign Key Link
	"id_secondary_department" INT, -- Secondary Department Foreign Key Link
	"first_name" VARCHAR(20) NOT NULL,
	"last_name" VARCHAR(50) NOT NULL,
	"ssn" VARCHAR(20) NOT NULL, -- Social Security Number
	"id_permanent_addr" INT NOT NULL, -- Permanent Address Foreign Key Link
	"id_temporary_addr" INT, -- Temporary Address Foreign Key Link
	"day_of_birth" INT NOT NULL,
	"sex" VARCHAR(1) NOT NULL,
	"quarter" INT NOT NULL, -- Period of College, 0 Means graduated
	"graduate_program" VARCHAR(5) NOT NULL,
	CONSTRAINT CHK_student CHECK(("sex"='M' or "sex"='F') 
							and ("quarter">=0 and "quarter"<=10)
							and ("graduate_program"='B.A.' or "graduate_program"='B.S.' or "graduate_program"='M.Sc.' or "graduate_program"='PhD'))
);

CREATE TABLE student_permanent_tel_number(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"id_student" INT NOT NULL, -- Student Foreign Key Link
	"tel" VARCHAR(33) NOT NULL
);

CREATE TABLE student_temporary_tel_number(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"id_student" INT NOT NULL, -- Student Foreign Key Link
	"tel" VARCHAR(33) NOT NULL
);

CREATE TABLE course(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"name" VARCHAR(30) NOT NULL,
	"description" VARCHAR(250) NOT NULL,
	"hourly_schedule" INT NOT NULL,
	"level" INT NOT NULL,
	"id_department" INT NOT NULL -- Department Foreign Key Link
);

CREATE TABLE discipline(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"name" VARCHAR(30) NOT NULL,
	"instructor_name" VARCHAR(30) NOT NULL,
	"semester" INT NOT NULL,
	"year" INT NOT NULL,
	"level" INT NOT NULL,
	"id_course" INT NOT NULL -- Course Foreign Key Link
);

CREATE TABLE report(
	"id" SERIAL UNIQUE NOT NULL PRIMARY KEY,
	"id_student" INT NOT NULL, -- Student Foreign Key Link
	"id_discipline" INT NOT NULL, -- Discipline Foreign Key Link
	"concept" INT NOT NULL,
	CONSTRAINT CHK_report CHECK(("concept">=0 and "concept"<=4))
);

ALTER TABLE college ADD CONSTRAINT FK_college_addr FOREIGN KEY(id_addr) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE college_tel_number ADD CONSTRAINT FK_college_tel FOREIGN KEY(id_college) REFERENCES college(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE department ADD CONSTRAINT FK_department_college FOREIGN KEY(id_college) REFERENCES college(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE department_tel_number ADD CONSTRAINT FK_department_tel FOREIGN KEY(id_department) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student ADD CONSTRAINT FK_student_college FOREIGN KEY(id_college) REFERENCES college(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student ADD CONSTRAINT FK_student_main_dep FOREIGN KEY(id_main_department) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student ADD CONSTRAINT FK_student_scnd_dep FOREIGN KEY(id_secondary_department) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student ADD CONSTRAINT FK_student_main_addr FOREIGN KEY(id_permanent_addr) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student ADD CONSTRAINT FK_student_scnd_addr FOREIGN KEY(id_temporary_addr) REFERENCES address(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student_permanent_tel_number ADD CONSTRAINT FK_student_main_tel FOREIGN KEY(id_student) REFERENCES student(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student_temporary_tel_number ADD CONSTRAINT FK_student_scnd_tel FOREIGN KEY(id_student) REFERENCES student(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE course ADD CONSTRAINT FK_course_department FOREIGN KEY(id_department) REFERENCES department(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE discipline ADD CONSTRAINT FK_discipline_course FOREIGN KEY(id_course) REFERENCES course(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE report ADD CONSTRAINT FK_report_student FOREIGN KEY(id_student) REFERENCES student(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE report ADD CONSTRAINT FK_report_discipline FOREIGN KEY(id_discipline) REFERENCES discipline(id) ON DELETE CASCADE ON UPDATE CASCADE;