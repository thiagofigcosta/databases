INSERT INTO cliente VALUES (  1,'Sr Jorge',12,'30245839');
INSERT INTO cliente VALUES (  2,'Sr Bruno',24,'40598382');
INSERT INTO cliente VALUES (  3,'Sr Getulio',78,'90483746');
INSERT INTO cliente VALUES (  4,'Sr Joao',25,'30240839');
INSERT INTO cliente VALUES (  5,'Sr Breno',34,'29485736');
INSERT INTO cliente VALUES (  6,'Sra Milla',31,'0394827');
INSERT INTO cliente VALUES (  7,'Dr Petrus',3,'39485736');
INSERT INTO cliente VALUES (  8,'Srta Patricia',100,'03948576');
INSERT INTO traje VALUES (  1,'Cal�as',18.00,'2 Zipper/sem 1.5cm bot�es/bainha cinta/cintura atadura');
INSERT INTO traje VALUES (  2,'Saia longa',15.00,'1 Zipper/sem bot�o 3cm/atadura ');
INSERT INTO traje VALUES (  3,'Shorts',10.00,'Zipper/Fecho Clip ');
INSERT INTO traje VALUES (  4,'Mini saia',14.25,'1 Zipper/sem 2cm bot�o');
INSERT INTO traje VALUES (  5,'Vestido de ver�o',20.00 ,NULL);
INSERT INTO traje VALUES (  6,'Suntop',6.50 ,NULL);
INSERT INTO material VALUES (  1,'Seda','Preto','Simples',7.00 );
INSERT INTO material VALUES (  2,'Seda','Vermelho escuro','Tingido',10.00 );
INSERT INTO material VALUES (  3,'Algod�o','Listrado amarelo','Tecido',3.00 );
INSERT INTO material VALUES (  4,'Algod�o','Listrado verde','Tecido',3.00 );
INSERT INTO material VALUES (  5,'Algod�o','Pontilhado preto','Tecido',3.00 );
INSERT INTO material VALUES (  6,'Algod�o','Listrado vermelho','Tecido',3.00 );
INSERT INTO material VALUES (  7,'Poli�ster','Amarelo palha','Tingido',2.55 );
INSERT INTO material VALUES (  8,'Algod�o','Listrado azul','Tecido',3.00 );
INSERT INTO material VALUES (  9,'Algod�o','Cor-de-rosa','Tecido',3.00 );
INSERT INTO material VALUES (  10,'Seda','Verde escuro','Tingido',15.00 );
INSERT INTO material VALUES (  11,'Seda real','Vermelho/laranja','Tingido',4.00 );
INSERT INTO material VALUES (  12,'Sarja','Azul marinho','Tecido',5.50 );
INSERT INTO material VALUES (  13,'Algod�o','Azul escuro','Tingido',3.50 );
INSERT INTO material VALUES (  14,'Algod�o','Verde escuro','Tingido',3.50 );
INSERT INTO quantidade VALUES (  1,8,2.7 );
INSERT INTO quantidade VALUES (  1,10,2.7 );
INSERT INTO quantidade VALUES (  1,12,2.8 );
INSERT INTO quantidade VALUES (  1,14,2.8 );
INSERT INTO quantidade VALUES (  1,16,3.0 );
INSERT INTO quantidade VALUES (  1,18,3.0 );
INSERT INTO quantidade VALUES (  2,8,3.4 );
INSERT INTO quantidade VALUES (  2,10,3.4 );
INSERT INTO quantidade VALUES (  2,12,3.8 );
INSERT INTO quantidade VALUES (  2,14,3.8 );
INSERT INTO quantidade VALUES (  2,16,4.2 );
INSERT INTO quantidade VALUES (  2,18,4.5 );
INSERT INTO quantidade VALUES (  3,8,1.3 );
INSERT INTO quantidade VALUES (  3,10,1.3 );
INSERT INTO quantidade VALUES (  3,12,1.3 );
INSERT INTO quantidade VALUES (  3,14,1.5 );
INSERT INTO quantidade VALUES (  3,16,1.6 );
INSERT INTO quantidade VALUES (  3,18,1.8 );
INSERT INTO quantidade VALUES (  4,8,1.2 );
INSERT INTO quantidade VALUES (  4,10,1.2 );
INSERT INTO quantidade VALUES (  4,12,1.2 );
INSERT INTO quantidade VALUES (  4,14,1.4 );
INSERT INTO quantidade VALUES (  4,16,1.5 );
INSERT INTO quantidade VALUES (  4,18,1.9 );
INSERT INTO quantidade VALUES (  5,8,3.2 );
INSERT INTO quantidade VALUES (  5,10,3.2 );
INSERT INTO quantidade VALUES (  5,12,3.2 );
INSERT INTO quantidade VALUES (  5,14,3.4 );
INSERT INTO quantidade VALUES (  5,16,5.2 );
INSERT INTO quantidade VALUES (  5,18,5.2);
INSERT INTO quantidade VALUES (  6,8,1.0 );
INSERT INTO quantidade VALUES (  6,10,1.0 );
INSERT INTO quantidade VALUES (  6,12,1.0 );
INSERT INTO quantidade VALUES (  6,14,1.5 );
INSERT INTO quantidade VALUES (  6,16,1.5 );
INSERT INTO quantidade VALUES (  6,18,1.8 );
INSERT INTO pedido VALUES (  1,8,'10 jan 2002','S');
INSERT INTO pedido VALUES (  2,7,'11 jan 2002','S');
INSERT INTO pedido VALUES (  3,6,'20 jan 2002','S');
INSERT INTO pedido VALUES (  4,5,'02 feb 2002','S');
INSERT INTO pedido VALUES (  5,4,'03 feb 2002','S');
INSERT INTO pedido VALUES (  6,3,'20 feb 2002','N');
INSERT INTO pedido VALUES (  7,2,'21 feb 2002','N');
INSERT INTO pedido VALUES (  8,1,'27 feb 2002','N');
INSERT INTO pedido VALUES (  9,2,'27 feb 2002','N');
INSERT INTO pedido VALUES (  10,3,'28 feb 2002','N');
INSERT INTO pedido VALUES (  11,4,'01 mar 2002','N');
INSERT INTO pedido VALUES (  12,5,'03 mar 2002','N');
INSERT INTO detalhePedido VALUES (  1,1,1,8,1);
INSERT INTO detalhePedido VALUES (  1,2,2,8,2);
INSERT INTO detalhePedido VALUES (  2,1,3,10,3);
INSERT INTO detalhePedido VALUES (  2,2,4,10,4);
INSERT INTO detalhePedido VALUES (  2,3,5,10,5);
INSERT INTO detalhePedido VALUES (  3,1,6,12,6);
INSERT INTO detalhePedido VALUES (  4,1,1,14,7);
INSERT INTO detalhePedido VALUES (  4,2,2,14,10);
INSERT INTO detalhePedido VALUES (  5,1,3,16,9);
INSERT INTO detalhePedido VALUES (  5,2,4,16,10);
INSERT INTO detalhePedido VALUES (  5,3,5,16,11);
INSERT INTO detalhePedido VALUES (  6,1,1,8,12);
INSERT INTO detalhePedido VALUES (  6,2,2,8,13);
INSERT INTO detalhePedido VALUES (  6,3,3,8,14);
INSERT INTO detalhePedido VALUES (  7,1,4,10,1);
INSERT INTO detalhePedido VALUES (  7,2,5,10,2);
INSERT INTO detalhePedido VALUES (  7,3,6,10,3);
INSERT INTO detalhePedido VALUES (  8,1,6,12,4);
INSERT INTO detalhePedido VALUES (  8,2,5,12,5);
INSERT INTO detalhePedido VALUES (  8,3,4,12,6);
INSERT INTO detalhePedido VALUES (  9,1,3,14,7);
INSERT INTO detalhePedido VALUES (  10,1,2,16,8 );
INSERT INTO detalhePedido VALUES (  10,2,1,16,9 );
INSERT INTO detalhePedido VALUES (  11,1,1,18,10);
INSERT INTO detalhePedido VALUES (  11,2,2,18,11);
INSERT INTO detalhePedido VALUES (  11,3,3,18,12);
INSERT INTO detalhePedido VALUES (  12,1,4,8,13);
INSERT INTO detalhePedido VALUES (  12,2,5,8,14);
INSERT INTO detalhePedido VALUES (  12,3,6,8,1);
INSERT INTO detalhePedido VALUES (  12,4,1,8,2);
INSERT INTO detalhePedido VALUES (  12,5,2,8,3);
INSERT INTO costureiro VALUES(  1,'Sra Renata',2,'26365544');
INSERT INTO costureiro VALUES(  2,'Srta Sandra',4,'30294857');
INSERT INTO costureiro VALUES(  3,'Sr Nelson',56,'30293847');
INSERT INTO costureiro VALUES(  4,'Sra Zenilda',27,'20394857');
INSERT INTO costureiro VALUES(  5,'Sr Saulo',31,'30298173');
INSERT INTO costureiro VALUES(  6,'Sr Taylor',3,'30309281');
INSERT INTO costureiro VALUES(  7,'Srta Paula',7,'30293827');
INSERT INTO costura VALUES (  1,1,1,'10 jan 2002','05 mar 2002');
INSERT INTO costura VALUES (  2,1,2,'10 jan 2002','15 mar 2002');
INSERT INTO costura VALUES (  3,2,1,'11 jan 2002','05 mar 2002');
INSERT INTO costura VALUES (  4,2,2,'11 jan 2002','25 mar 2002');
INSERT INTO costura VALUES (  5,2,3,'11 jan 2002','05 mar 2002');
INSERT INTO costura VALUES (  6,3,1,'20 jan 2002','25 mar 2002');
INSERT INTO costura VALUES (  7,4,1,'02 feb 2002','05 mar 2002');
INSERT INTO costura VALUES (  1,4,2,'02 feb 2002','25 mar 2002');
INSERT INTO costura VALUES (  2,5,1,'03 feb 2002','15 mar 2002');
INSERT INTO costura VALUES (  3,5,2,'03 feb 2002','25 mar 2002');
INSERT INTO costura VALUES (  4,5,3,'03 feb 2002','27 mar 2002');
INSERT INTO costura VALUES (  5,6,1,'20 feb 2002',NULL);
INSERT INTO costura VALUES (  6,6,2,'20 feb 2002','28 mar 2002');
INSERT INTO costura VALUES (  7,6,3,'20 feb 2002',NULL);
INSERT INTO costura VALUES (  1,7,1,'21 feb 2002',NULL);
INSERT INTO costura VALUES (  2,7,2,'21 feb 2002',NULL);
INSERT INTO costura VALUES (  3,7,3,'21 feb 2002','28 mar 2002');
INSERT INTO costura VALUES (  4,8,1,'27 feb 2002','03 mar 2002');
INSERT INTO costura VALUES (  5,8,2,'27 feb 2002',NULL);
INSERT INTO costura VALUES (  6,8,3,'27 feb 2002',NULL);
INSERT INTO costura VALUES (  7,9,1,'27 feb 2002',NULL);
INSERT INTO costura VALUES (  1,10,1,'28 feb 2002',NULL);
INSERT INTO costura VALUES (  2,10,2,'28 mar 2002',NULL );
INSERT INTO costura VALUES (  3,11,1,'01 mar 2002','04 mar 2002');
INSERT INTO costura VALUES (  4,11,2,'01 mar 2002',NULL);
INSERT INTO costura VALUES (  5,11,3,'01 mar 2002',NULL);
INSERT INTO costura VALUES (  7,12,2,'03 mar 2002',NULL);
INSERT INTO costura VALUES (  1,12,3,'03 mar 2002',NULL);
INSERT INTO costura VALUES (  2,12,4,'03 mar 2002',NULL);
INSERT INTO costura VALUES (  2,12,5,'03 mar 2002',NULL);
