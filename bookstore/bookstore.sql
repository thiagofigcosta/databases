CREATE TABLE Clientes
(
  cod_cliente   SERIAL,
  nome          VARCHAR(40),
  telefone      VARCHAR(20),
  identidade    VARCHAR(20),
  sexo          CHAR(1),
  rua           VARCHAR(40),
  numero        VARCHAR(10),
  bairro        VARCHAR(40),
  cep           VARCHAR(8),
  cidade        VARCHAR(40),
  uf            CHAR(2),
  PRIMARY KEY(cod_cliente)
);

CREATE TABLE Pedidos
(
  num_pedido       SERIAL,
  cod_funcionario  INTEGER,
  cod_cliente      INTEGER,
  data_pedido      DATE,
  total_pago       NUMERIC(9,2),
  PRIMARY KEY(num_pedido)
);

CREATE TABLE Funcionarios
(
  cod_funcionario SERIAL,
  nome            VARCHAR(40),
  data_nascimento DATE,
  identidade      VARCHAR(20),
  cpf             VARCHAR(11),
  sexo            CHAR(1),
  rua             VARCHAR(40),
  numero          VARCHAR(10),
  bairro          VARCHAR(40),
  cep             VARCHAR(8),
  cidade          VARCHAR(40),
  telefone        VARCHAR(15),
  data_adimissao  DATE,
  data_demissao   DATE,
  salario         NUMERIC(9,2),
  PRIMARY KEY(cod_funcionario)
);

CREATE TABLE PedidosLivros
(
  isbn        VARCHAR(15),
  num_pedido  INTEGER,
  quantidade  INTEGER,
  PRIMARY KEY(isbn, num_pedido)
);

CREATE TABLE Autores
(
  cod_autor SERIAL,
  nome      VARCHAR(40),
  PRIMARY KEY(cod_autor)
);


CREATE TABLE PalavrasChaves
(
  cod_palavra SERIAL,
  descricao   VARCHAR(30),
  PRIMARY KEY(cod_palavra)
);


CREATE TABLE Editoras
(
  cod_editora  SERIAL,
  nome         VARCHAR(40),
  telefone     VARCHAR(15),
  PRIMARY KEY(cod_editora)
);

CREATE TABLE CategoriaLivros
(
  cod_categoria   SERIAL,
  desc_categoria  VARCHAR(30),
  PRIMARY KEY(cod_categoria)
);

CREATE TABLE Encomendas
(
  num_encomenda    SERIAL,
  cod_funcionario  INTEGER,
  cod_cliente      INTEGER,
  data_encomenda   DATE,
  prazo_estimado   INTEGER,
  PRIMARY KEY(num_encomenda)
);


CREATE TABLE Livros
(
  isbn            VARCHAR(15),
  cod_categoria   INTEGER,
  cod_editora     INTEGER,
  titulo          VARCHAR(40),
  data_publicacao DATE,
  num_edicao      INTEGER,
  volume          INTEGER,
  preco           NUMERIC(7,2),
  foto_capa       OID,
  PRIMARY KEY(isbn)
);

CREATE TABLE EncomendasLivros
(
  num_encomenda   INTEGER,
  isbn            VARCHAR(15),
  quantidade      INTEGER,
  PRIMARY KEY(num_encomenda, isbn)
);

CREATE TABLE PalavrasChavesLivros
(
  isbn         VARCHAR(15),
  cod_palavra  INTEGER,
  PRIMARY KEY(isbn, cod_palavra)
);

CREATE TABLE AutoresLivros
(
  isbn       VARCHAR(15),
  cod_autor  INTEGER,
  PRIMARY KEY(isbn, cod_autor)
);
