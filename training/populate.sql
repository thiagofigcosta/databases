INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 1, 'Basic Accounting','11/JAN/1989');                
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 2, 'Further Accounting','25/JAN/1989');                 
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 3,'Issues In Administration','27/SEP/1988');                 
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 4,'More Administration','16/OCT/1988');                 
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 5,'Ada','01/NOV/1988');                 
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 6, 'Introduction To Ingres','05/FEB/1989');                 
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 7, 'New Topologies','10/MAR/1989');                 
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 8,'LANs','12/DEC/1988');                 
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 9,'Structural Stress Analysis','20/FEB/1989');                 
INSERT INTO curso (nu_curso, nm_curso, dt_curso) 
       VALUES ( 10,'Taffic Flow Analysis','24/OCT/1988');                 
INSERT INTO departamento (nu_depto, nm_depto, nm_localizacao, nu_setor)  
       VALUES (1,'accounts','floor 3',1);
INSERT INTO departamento (nu_depto, nm_depto, nm_localizacao, nu_setor)  
       VALUES (2, 'administration', 'floor 2', 1);
INSERT INTO departamento (nu_depto, nm_depto, nm_localizacao, nu_setor)  
       VALUES (3, 'software design', 'floor 1', 2);
INSERT INTO departamento (nu_depto, nm_depto, nm_localizacao, nu_setor)  
       VALUES (4, 'communications', 'floor 4', 3);
INSERT INTO departamento (nu_depto, nm_depto, nm_localizacao, nu_setor)  
       VALUES (5, 'engineering', 'floor 5', 7);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (1,'Jones','Elizabeth Barbara','05/JAN/1944',
       '26 Agnews Terrace, Shamrock Bay','212 337 2288',1);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (2,'Smith','Robert', '07/FEB/1947',
       '18 Marsh Street, Tollcross, Edinburgh','031 732 8972', 1);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (3,'White','Allan','05/MAY/1961',
       '6 Remote Place, North Berwick','121 555 6622', 1);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (4,'Reid','Gordon', '10/AUG/1963',
       '9 Noble Road, Penicuik', '629 424 6713', 1);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (5,'MacCallan','Claire', '18/SEP/1958',
       '25 Crisis Avenue, Leith, Edinburgh', '031 337 4166',1);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (6,'Murphy','Brian Charles', '30/JUN/1954',
       '9 Roberts Street, Biggar', '331 229 4147', 1);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (7,'Gibson','James', '09/MAR/1948',
       '11 Depressed Way, Glasgow', '041 447 8001', 2);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (8,'Andrews','John', '02/JAN/1958','73 Long Road, Lengthitown', 
      '70 229 7213', 2);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (9,'Wright','Audrey Mary', 
       '02/JAN/1958','10 Nile Terrace, Polwarth, Edinburgh', '031 424 7092', 2);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (10,'Reagan','Anne', '17/AUG/1961',
       '82 Longstone Road, Longstone, Edinburgh', '031 111 2799',2);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (11,'North','Annabel', '01/SEP/1962',
       '35 Marchmont Terrace, Marchmont, Edinburgh', '031 447 2266', 2);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (12,'South','Todd James','28/FEB/1959',
       '10 Shandon Road, Merchiston, Edinburgh', '031 333 1008', 2);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (13,'East','Ian','13/MAY/1942',
       '47 Colinton Road, Craighlochart, Edinburgh', '031 424 5665', 2);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (14,'West','Jack', '15/JUN/1946',
       '15 South West Gardens, Peebles','466 3176', 3);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (15,'Allen','Ester','27/FEB/1955', 
       '10 Troon Street, Leith, Edinburgh', '031 424 2907', 3);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (16,'Brunell','Liza', '18/AUG/1962',
       '8 Commercial Street, Tollcross, Edinburgh','031 424 1656', 3);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (17,'Robertson','David Andrew', '07/AUG/1960',
       '9 North Loan,South Queensferry', '031 447 8213', 3);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (18,'Robinson','Allan','09/JUN/1961','31 Newall Terrace, Hawick',
       '229 0854', 3);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (19,'Roberts','Robert', '01/JAN/1959', 
       '7 Peebles Road,Melrose','402 9213', 3);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (20,'Murray','James', '06/MAR/1964',
       '40 Blackhall Loan,Biggar','121 444 4580', 3);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (21,'Bryce','Anne', '13/SEP/1965', 
       '22 Forresthill Place, Greyfriars, Edinburgh','031 402 6666', 3);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (22,'Cowan','Audrey', '03/APR/1940',
       '12 Down Street, Brayend', '228 9321', 4);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (23,'Stevenson','John David', '12/DEC/1954',
       '16 Rubber Road,Stampingham', '337 6262', 4);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (24,'Dickson','William', '06/JAN/1950',
       '11 Newplace Road, Newton', '041 444 6730', 4);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (25,'Brownlie','Matthew',	'14/MAY/1954',
       '80 Cowan Road, Shandon, Edinburgh', '031 228 4141', 4);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (26,'Gordon','Mark','12/FEB/1960',
       '10 Whyte Place, North Berwick','424 1024', 4);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (27,'Kennedy','Luke','26/JUL/1952',
       '14 Bucket Street, Musselburgh','031 414 7312', 5);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (28,'Grant','Lynn','12/JUL/1956','3 Dey Terrace, Selkirk', 
       '337 8911', 5);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (29,'MacDonald','Elizabeth', '03/SEP/1968',
       '23 Neidpath Road, Peebles', '444 8998',5);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (30,'MacDugle','Shirley', '09/OCT/1964',
       '8 Rosebank Terrace, Shandon, Edinburgh', '031 447 1189', 5);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (31,'Douglas','Chris', '23/JUN/1955',
       '19 High Street, Livingston', '031 229 6792', 5);
INSERT INTO empregado (nu_empregado, nm_sobrenome, nm_empregado, dt_nascimento, te_endereco, nu_telefone, nu_depto) 
       VALUES (32,'Christie','Malcolm',	'25/JUL/1959',
       '11 Rounders Park, Polwarth, Edinburgh','031 424 8406', 5);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (1, 'Accounts Manager', '12/JAN/1976', NULL, 30000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (1, 'Assistant Accounts Manager',	'11/FEB/1972', '12/JAN/1976',
       22000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (1, 'Accountant',	'10/MAR/1968','11/FEB/1972',  15000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (1, 'Junior Accountant','09/APR/1964','10/MAR/1968', 6000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (2, 'Assistant Accounts Manager',	'08/MAY/1976', NULL, 25000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (2, 'Accountant',	'07/JUN/1971', '08/MAY/1976', 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (2,  'Junior Accountant', '06/JUL/1967', '07/JUN/1971', 
       8000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (3, 'Accountant', '05/AUG/1984', NULL, 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (3, 'Junior Accountant', '04/SEP/1981','05/AUG/1984', 8000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (4, 'Accountant', '05/OCT/1989', NULL, 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (5,'Accountant','02/NOV/1980',NULL, 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (5, 'Junior Accountant','01/DEC/1978','02/NOV/1980', 8000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (6, 'Accountant', '12/JAN/1980', NULL, 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (6, 'Junior Accountant', '11/FEB/1974', '12/JAN/1980', 
       8000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (7, 'Admin Manager', '10/MAR/1980',NULL, 30000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (7, 'Assistant Admin Manager', '09/APR/1974', '10/MAR/1980',
       22000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (7, 'Senior Admin Assistant', '01/DEC/1968', '09/APR/1974',
       16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (7, 'Admin Assistant', '07/MAY/1960', '01/DEC/1968', 10000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (8, 'Assistant Admin Manager', '10/MAR/1980', NULL, 20000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (8, 'Senior Admin Assistant', '09/APR/1977', '10/MAR/1980',
       12000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (8, 'Admin Assistant', '01/DEC/1976', '09/APR/1977', 8000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (9, 'Senior Admin Assistant', '10/JUL/1988', NULL, 14000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (9, 'Admin Assistant', '08/JUN/1982', '10/JUL/1988',  10000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (10,'Admin Assistant', '06/SEP/1986', NULL, 12000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (10,'Junior Admin Assistant', '22/SEP/1983','06/SEP/1986',
       6000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (11,'Admin Assistant', '13/MAR/1982', NULL, 15000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (11,'Junior Admin Assistant', '23/OCT/1980', '13/MAR/1982',
       8000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (12,'Admin Assistant','26/FEB/1982', NULL, 15000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (12,'Junior Admin Assistant', '03/JAN/1977', '26/FEB/1982', 
       6500.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (13,'Admin Assistant', '17/APR/1988', NULL, 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (14,'Admin Assistant', '14/NOV/1985', NULL, 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (15,'Senior Systems Analyst', '21/AUG/1988', NULL, 35000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (15,'Systems Analyst', '09/FEB/1986','21/AUG/1988', 31000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (15,'Analyst Programmer', '17/JAN/1984', '09/FEB/1986', 25000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (15, 'Programmer', '13/MAY/1980', '17/JAN/1984', 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (16,'Systems Analyst', '25/APR/1991', NULL, 30000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (16,'Analyst Programmer',	'16/NOV/1986', '25/APR/1991',
       21000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (16,'Programmer',	'01/OCT/1984', '16/NOV/1986', 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (17,'Analyst Programmer',	'17/JAN/1988', NULL,  21000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (17,'Programmer', '01/OCT/1984','17/JAN/1988', 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (18,'Analyst Programmer',	'23/SEP/1988', NULL,  22000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (18,'Programmer',	'01/OCT/1984','23/SEP/1988', 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (19,'Analyst Programmer',	'23/SEP/1988', NULL, 22000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (19,'Programmer',	'01/OCT/1984','23/SEP/1988'  , 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (20,'Analyst Programmer',	'23/SEP/1988', NULL,  22000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (20,'Programmer',	'01/OCT/1984' ,'23/SEP/1988' , 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (21,'Analyst Programmer',	'13/DEC/1991', NULL, 25000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (21,'Programmer',	'11/SEP/1989','13/DEC/1991', 21000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (22,'Communications Manager', '03/AUG/1985', NULL, 36000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (22,'Senior Communications Engineer', '21/JUN/1977','03/AUG/1985', 
       26000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (22,'Communications Engineer', '13/MAY/1975', '21/JUN/1977', 
       12000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (22,'Electrical Engineer', '08/FEB/1966', '13/MAY/1975' ,
       8000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (23,'Senior Communications Engineer', '03/AUG/1985', NULL, 
      18000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (23,'Communications Engineer','21/JUN/1979', '03/AUG/1985',
       9000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (23,'Software Engineer', '14/FEB/1977', '21/JUN/1979', 5000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (24,'Communications Engineer','08/OCT/1985', NULL, 15000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (24,'Electrical Engineer', '06/MAY/1980', '08/OCT/1985',
       13000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (25,'Communications Engineer', '01/OCT/1988', NULL, 19000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (25,'Software Engineer', '25/AUG/1985','01/OCT/1988', 16000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (25,'Systems Programmer',	'29/JAN/1983', '25/AUG/1985', 
       11000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (25,'Programmer',	'14/SEP/1980', '29/JAN/1983', 9000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (26,'Communications Engineer', '13/MAR/1988', NULL, 19500.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (26,'Software Engineer', '30/AUG/1985','13/MAR/1988', 17000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (26,'Trainee Engineer', '13/SEP/1982','30/AUG/1985', 11000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (26,'Electronic Engineer', '01/SEP/1980','13/SEP/1982', 9000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (27,'Senior Chief Engineer', '01/NOV/1990', NULL, 25000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (27,'Chief Engineer', '20/JUN/1986','01/NOV/1990', 17000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (27,'Mechanical Engineer', '19/APR/1981' ,'20/JUN/1986',
       11000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (27,'Graduate Engineer', '13/SEP/1975','19/APR/1981', 6000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (28,'Chief Engineer', '06/JUL/1989', NULL, 29000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (28,'Civil Engineer', '17/APR/1984', '06/JUL/1989', 17000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (28,'Trainee Engineer', '10/DEC/1978','17/APR/1984', 12000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (28,'Graduate Engineer','01/SEP/1978','10/DEC/1978', 3000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (29,'Electrical Engineer', '09/FEB/1986', NULL, 17000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (29,'Graduate Engineer',	'03/OCT/1980','09/FEB/1986', 
       14000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (30,'Senior Electrical Engineer',	'30/APR/1992', NULL,  22000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (30,'Electrical Engineer', '06/MAR/1987','30/APR/1992', 
       17000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (31,'Senior Mechanical Engineer',	'30/MAY/1987',NULL, 22000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (31,'Mechanical Engineer', '06/JUN/1980', '30/MAY/1987',
       17000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (32,'Systems Engineer', '01/MAR/1991', NULL, 19000.00);
INSERT INTO historico_emprego (nu_empregado, nm_cargo, dt_inicio, dt_fim, salario) 
       VALUES (32,'Electronics Engineer', '31/OCT/1989','01/MAR/1991', 
       18000.00);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (1, 1);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (1, 2);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (2, 1);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (2, 2);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (7, 3);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (7,   4);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (8, 3);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (8, 4);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (14, 5);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (14, 6);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (15, 5);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (15, 6);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (21, 7);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (22, 7);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (22, 8);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (19, 5);

INSERT INTO empregado_curso(nu_empregado, nu_curso) VALUES (19, 6);