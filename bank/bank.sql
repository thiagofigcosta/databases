CREATE TABLE Agencias(
	"codag" INT PRIMARY KEY,
	"nome" VARCHAR(30) NOT NULL
);

CREATE TABLE Clientes(
	"oid" INT PRIMARY KEY,
	"nome" VARCHAR(30) NOT NULL,
	"endereco" VARCHAR(30),
	"cidade" VARCHAR(30)
);

CREATE TABLE TelefoneClientes(
	"numero_telefone" VARCHAR(15) PRIMARY KEY,
	"id_cliente" INT NOT NULL
);

CREATE TABLE Contas(
	"oid" INT PRIMARY KEY,
	"id_agencia" INT NOT NULL,
	"numero" INT NOT NULL,
	"tipo" VARCHAR(2) NOT NULL,
	"valor" INT,
	"id_cliente" INT NOT NULL
);

CREATE TABLE LancamentosConta(
	"id_conta" INT NOT NULL,
	"id_lancamento" VARCHAR(1)
);

CREATE TABLE Lancamentos(
	"oid" VARCHAR(1) PRIMARY KEY,
	"valor" INT NOT NULL
);




ALTER TABLE TelefoneClientes ADD CONSTRAINT FK_TelefoneClientes_cliente FOREIGN KEY(id_cliente) REFERENCES Clientes(oid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Contas ADD CONSTRAINT FK_Contas_agencia FOREIGN KEY(id_agencia) REFERENCES Agencias(codag) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Contas ADD CONSTRAINT FK_Contas_cliente FOREIGN KEY(id_cliente) REFERENCES Clientes(oid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE LancamentosConta ADD CONSTRAINT FK_LancamentosConta_conta FOREIGN KEY(id_conta) REFERENCES Contas(oid) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE LancamentosConta ADD CONSTRAINT FK_LancamentosConta_lancamento FOREIGN KEY(id_lancamento) REFERENCES Lancamentos(oid) ON DELETE CASCADE ON UPDATE CASCADE;
