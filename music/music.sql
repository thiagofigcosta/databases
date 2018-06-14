CREATE TABLE local
	(
	nu_local		INTEGER 		PRIMARY KEY,
	nm_cidade		CHAR(20),
	nm_pais		CHAR(20)
	);

CREATE TABLE musico 
	(
	nu_musico 				INTEGER 		PRIMARY KEY,
	nm_musico				CHAR(20) NOT NULL,
	dt_nascimento     		DATE,
	dt_falecimento    		DATE default null,
	nu_local_nascimento		INTEGER 		REFERENCES local (nu_local),
	nu_local_residencia		INTEGER 		REFERENCES local (nu_local),
      check ((dt_nascimento IS NULL) OR 
             (TO_DATE ('1-Jan-1900', 'DD-Mon_YYYY') < dt_nascimento)),
	check ((dt_nascimento IS NULL) OR (dt_falecimento IS NULL) OR (dt_falecimento > dt_nascimento))
	);

CREATE TABLE interprete
	(
	nu_interprete		INTEGER		PRIMARY KEY,
	nu_musico_interprete	INTEGER NOT NULL	REFERENCES musico (nu_musico),
	nm_instrumento		CHAR(10) NOT NULL,
	tp_interprete		CHAR(10)		default 'not known'
	);

CREATE TABLE compositor
	(
	nu_compositor		INTEGER 		PRIMARY KEY,
	nu_musico_compositor	INTEGER NOT NULL	REFERENCES musico (nu_musico),
	tp_compositor		CHAR(10)
	);

CREATE TABLE banda
	(
	nu_banda			INTEGER 		PRIMARY KEY,
	nm_banda			CHAR(20),
	nu_local_banda		INTEGER NOT NULL	REFERENCES local (nu_local),
	tp_banda			CHAR(10),
	dt_criacao_banda	      DATE,
	nu_musico_contato_banda	INTEGER NOT NULL	REFERENCES musico (nu_musico)
	);

CREATE TABLE atuacao
	(
	nu_interprete		INTEGER  		 REFERENCES interprete (nu_interprete),
	nu_banda			INTEGER  		 REFERENCES banda (nu_banda),
	PRIMARY KEY ( nu_interprete, nu_banda)
	);

CREATE TABLE musica
	(
	nu_musica		INTEGER 		PRIMARY KEY,
	dt_musica		DATE,
	nm_musica		CHAR(40) NOT NULL,
	nu_local_musica			INTEGER 		REFERENCES local (nu_local)
	);

CREATE TABLE composicao
	(
	nu_compositor		INTEGER 		REFERENCES compositor (nu_compositor),
	nu_musica		INTEGER 		REFERENCES musica (nu_musica),
	PRIMARY KEY ( nu_compositor, nu_musica )
	);

CREATE TABLE evento
	(
	nu_evento	 		INTEGER 		PRIMARY KEY,
	nm_auditorio		CHAR(20),
	nu_local_evento		INTEGER NOT NULL	REFERENCES local (nu_local),
	dt_evento	      	DATE,             
	nu_musico_organizador	INTEGER 		REFERENCES musico (nu_musico)
	);

CREATE TABLE show
	(
	nu_show			INTEGER 		PRIMARY KEY,
	nu_banda			INTEGER NOT NULL	REFERENCES banda (nu_banda),
	nu_musica			INTEGER NOT NULL 	REFERENCES musica (nu_musica),
	nu_musico_condutor	INTEGER 		REFERENCES musico (nu_musico),
	nu_evento			INTEGER 		REFERENCES evento (nu_evento)
	);
