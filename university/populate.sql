INSERT INTO address ("zipcode","street","number","xtrainfo","district","city","state","country")
			VALUES  (30421169,'Av. Amazonas',5253,null,'Nova Suiça','Belo Horizonte','Minas Gerais','Brasil');
INSERT INTO address ("zipcode","street","number","xtrainfo","district","city","state","country")
			VALUES  (30510000,'Av. Amazonas',7675,null,'Nova Gameleira','Belo Horizonte','Minas Gerais','Brasil');
INSERT INTO address ("zipcode","street","number","xtrainfo","district","city","state","country")
			VALUES  (30421185,'Rua Olinda',544,'apto 03','Nova Suiça','Belo Horizonte','Minas Gerais','Brasil');

INSERT INTO college ("name","id_addr","ftn")
			VALUES  ('CEFET Campus I',(SELECT "id" from address WHERE "zipcode"=30421169),'17.220.203/0001-96');
INSERT INTO college ("name","id_addr","ftn")
			VALUES  ('CEFET Campus II',(SELECT "id" from address WHERE "zipcode"=30510000),'17.220.203/0001-96');

INSERT INTO college_tel_number ("id_college","tel")
			VALUES  ((SELECT "id" from college WHERE "name"='CEFET Campus I'),'+55 (31) 3319-7000');
INSERT INTO college_tel_number ("id_college","tel")
			VALUES  ((SELECT "id" from college WHERE "name"='CEFET Campus II'),'+55 (31) 3319-6722');

INSERT INTO department ("id_college","name")
			VALUES  ((SELECT "id" from college WHERE "name"='CEFET Campus II'),'DECOM');

INSERT INTO department_tel_number ("id_department","tel")
			VALUES  ((SELECT "id" from department WHERE "name"='DECOM'),'+55 (31) 3319-6870');

INSERT INTO student ("id_college","id_main_department","id_secondary_department","first_name","last_name","ssn","id_permanent_addr","id_temporary_addr","day_of_birth","sex","quarter","graduate_program")
			VALUES  ((SELECT "id" from college WHERE "name"='CEFET Campus II'),(SELECT "id" from department WHERE "name"='DECOM'),null,'Thiago','Figueiredo Costa','132.503.856.38',(SELECT "id" from address WHERE "zipcode"=30421185),null,10031998,'M',5,'B.A.');

INSERT INTO student_permanent_tel_number ("id_student","tel")
			VALUES  ((SELECT "id" from student WHERE "ssn"='132.503.856.38'),'+55 (31) 98524-6918');

INSERT INTO student_temporary_tel_number ("id_student","tel")
			VALUES  ((SELECT "id" from student WHERE "ssn"='132.503.856.38'),'+55 (31) 3334-2559');

INSERT INTO course ("name","description","hourly_schedule","level","id_department")
			VALUES  ('Engenharia de Computação','Curso que vai fazer vc sofrer pra caralho',4000,8001,(SELECT "id" from department WHERE "name"='DECOM'));

INSERT INTO discipline ("name","instructor_name","semester","year","level","id_course")
			VALUES  ('Banco de Dados I','Luciana',1,2018,5,(SELECT "id" from course WHERE "name"='Engenharia de Computação'));

INSERT INTO report ("id_student","id_discipline","concept")
			VALUES  ((SELECT "id" from student WHERE "ssn"='132.503.856.38'),(SELECT "id" from discipline WHERE ("name"='Banco de Dados I' and "semester"=1 and "year"=2018)),4);
