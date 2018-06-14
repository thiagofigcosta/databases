CREATE TABLE cliente (
  id_cliente		INTEGER	PRIMARY KEY
 ,nm_cliente	CHAR(20)	NOT NULL
 ,nu_casa_cliente	INTEGER	NOT NULL
 ,nu_cep_cliente	CHAR(9)	NOT NULL
 );

CREATE TABLE traje (
  id_traje	INTEGER	PRIMARY KEY
 ,te_descricao_traje	CHAR(20)	NOT NULL
 ,vl_custo_producao_traje	REAL		NOT NULL
 ,nm_detalhe_traje	CHAR(60)
 );

CREATE TABLE material (
  id_material	INTEGER	PRIMARY KEY
 ,nm_material	CHAR(20)	NOT NULL
 ,nm_cor_material	CHAR(20)	NOT NULL
 ,nm_padrao_material	CHAR(20)	NOT NULL
 ,vl_custo_material		REAL		NOT NULL
 );

CREATE TABLE quantidade (
  -- nu_tamanho is the UK dress size for the item in question. For example
  --   size 8,10,12,14,16 are all valid dress sizes.
  -- nu_quantidade is how many linear feet are needed to make the particular
  --   item. Material comes in a roll, and you get that many feet off the
  --   roll to make the item.
  id_traje	INTEGER NOT NULL REFERENCES traje
 ,nu_tamanho	INTEGER	NOT NULL
 ,nu_quantidade	REAL		NOT NULL
 ,PRIMARY KEY ( id_traje, nu_tamanho )
	);

CREATE TABLE pedido (
  id_pedido	INTEGER	PRIMARY KEY
 ,id_cliente	INTEGER REFERENCES cliente
 ,dt_pedido	DATE NOT NULL 
 ,in_finalizado	CHAR(1)
 );

CREATE TABLE detalhePedido (
  id_pedido	INTEGER	NOT NULL REFERENCES pedido
 ,id_detalhe_pedido	INTEGER	NOT NULL
 ,id_traje	INTEGER	NOT NULL
 ,nu_tamanho	INTEGER	NOT NULL
 ,id_material	INTEGER	REFERENCES material
 ,PRIMARY KEY (id_pedido, id_detalhe_Pedido)
 ,FOREIGN KEY (id_traje, nu_tamanho) REFERENCES quantidade
 );

CREATE TABLE costureiro(
  id_costureiro		INTEGER	PRIMARY KEY
 ,nm_costureiro	CHAR(20)	NOT NULL
 ,nu_casa_costureiro	INTEGER	NOT NULL
 ,nu_cep_costureiro	CHAR(8)	NOT NULL
 );

CREATE TABLE costura (
  id_costureiro		INTEGER	NOT NULL REFERENCES costureiro
 ,id_pedido	INTEGER	NOT NULL
 ,id_detalhe_pedido	INTEGER	NOT NULL
 ,dt_inicio_costura DATE NOT NULL 
 ,dt_fim_costura DATE 
 ,PRIMARY KEY ( id_costureiro, id_pedido, id_detalhe_Pedido )
 ,FOREIGN KEY ( id_pedido, id_detalhe_Pedido ) REFERENCES detalhePedido
 );