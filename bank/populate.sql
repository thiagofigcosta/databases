INSERT INTO Agencias VALUES(10, 'Viçosa');
INSERT INTO Agencias VALUES(20, 'BH');
INSERT INTO Agencias VALUES(30, 'Ouro Preto');

INSERT INTO Clientes VALUES(1, 'Antonio', 'Rua A', 'Viçosa');
INSERT INTO Clientes VALUES(2, 'Jose', 'Rua B', 'Viçosa');
INSERT INTO Clientes VALUES(3, 'Pedro', 'Rua A', 'Viçosa');
INSERT INTO Clientes VALUES(4, 'Maria', 'Rua X', 'Ubá');
INSERT INTO Clientes VALUES(5, 'Rita', 'Rua Y', 'Ubá');
INSERT INTO Clientes VALUES(6, 'Rosa', 'Rua A', 'Viçosa');

INSERT INTO TelefoneClientes VALUES ('11', 1);
INSERT INTO TelefoneClientes VALUES ('22', 1);
INSERT INTO TelefoneClientes VALUES ('33', 1);
INSERT INTO TelefoneClientes VALUES ('44', 2);
INSERT INTO TelefoneClientes VALUES ('55', 3);
INSERT INTO TelefoneClientes VALUES ('66', 3);
INSERT INTO TelefoneClientes VALUES ('77', 5);
INSERT INTO TelefoneClientes VALUES ('88', 6);

INSERT INTO Contas VALUES(1, 10, 100, 'cc', 200, 1);
INSERT INTO Contas VALUES(2, 10, 200, 'cc', 0, 1);
INSERT INTO Contas VALUES(3, 20, 300, 'cc', 1500, 2);
INSERT INTO Contas VALUES(4, 30, 400, 'cc', 500, 2);
INSERT INTO Contas VALUES(5, 30, 500, 'pp', 10000, 3);
INSERT INTO Contas VALUES(6, 30, 600, 'cc', 2000, 3);

INSERT INTO LancamentosConta VALUES(1, 'a');
INSERT INTO LancamentosConta VALUES(1, 'b');
INSERT INTO LancamentosConta VALUES(1, 'c');
INSERT INTO LancamentosConta VALUES(2, 'd');
INSERT INTO LancamentosConta VALUES(2, 'e');
INSERT INTO LancamentosConta VALUES(3, 'f');
INSERT INTO LancamentosConta VALUES(3, 'g');
INSERT INTO LancamentosConta VALUES(3, 'h');
INSERT INTO LancamentosConta VALUES(4, 'i');
INSERT INTO LancamentosConta VALUES(5, 'j');
INSERT INTO LancamentosConta VALUES(5, 'k');

INSERT INTO Lancamentos VALUES('a', -100);
INSERT INTO Lancamentos VALUES('b', -100);
INSERT INTO Lancamentos VALUES('c', -100);
INSERT INTO Lancamentos VALUES('d', 200);
INSERT INTO Lancamentos VALUES('e', 200);
INSERT INTO Lancamentos VALUES('f', 200);
INSERT INTO Lancamentos VALUES('g', 300);
INSERT INTO Lancamentos VALUES('h', -100);
INSERT INTO Lancamentos VALUES('i', -200);
INSERT INTO Lancamentos VALUES('j', -1000);
INSERT INTO Lancamentos VALUES('k', 100);
