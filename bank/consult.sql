--4

	--Nome dos clientes que tem conta em Ouro Preto
	SELECT DISTINCT C0."nome" FROM Clientes C0 INNER JOIN Contas C1 ON C0."oid"=C1."id_cliente" INNER JOIN Agencias A ON A."codag"=C1."id_agencia" WHERE A."nome"='Ouro Preto';

	--Nome e telefones dos clientes que moram na mesma rua que o “Pedro”
	SELECT C."nome", T."numero_telefone" FROM Clientes C INNER JOIN TelefoneClientes T ON T."id_cliente"=C."oid" WHERE C."endereco"=(SELECT "endereco" FROM Clientes WHERE "nome"='Pedro') AND C."nome"<>'Pedro';

	--Quais clientes residem na mesma cidade da agência 10
	SELECT C."nome" FROM Clientes C WHERE C."cidade"=(SELECT "nome" FROM Agencias WHERE "codag"=10);

	--Qual cliente tem conta na agência da mesma cidade onde mora 
	SELECT DISTINCT C0."nome" FROM Clientes C0 INNER JOIN Contas C1 ON C0."oid"=C1."id_cliente" INNER JOIN Agencias A ON A."codag"=C1."id_agencia" WHERE C0."cidade"=A."nome";

	--Calcule o saldo total de todas as contas de cada cliente, antes dos lançamentos
	select id_cliente, SUM(valor) from Contas GROUP BY id_cliente;

	--Calcule o saldo atual da conta de número 100
	SELECT  C."numero",(C."valor"+SUM(L."valor")) as "Saldo" FROM Contas C INNER JOIN LancamentosConta LC ON LC."id_conta"=C."oid" INNER JOIN Lancamentos L ON L."oid"=LC."id_lancamento" WHERE C."numero"=100 GROUP BY C."oid";

	--Calcule o saldo total da agencia 10
	SELECT  A."codag",(SUM(L."valor")+(SELECT SUM(C."valor") as "Saldo" FROM Agencias A INNER JOIN Contas C ON A."codag"=C."id_agencia" WHERE A."codag"=10 GROUP BY A."codag")) as "Saldo" FROM Agencias A INNER JOIN Contas C ON A."codag"=C."id_agencia" INNER JOIN LancamentosConta LC ON LC."id_conta"=C."oid" INNER JOIN Lancamentos L ON L."oid"=LC."id_lancamento" WHERE A."codag"=10 GROUP BY A."codag";


--5
CREATE OR REPLACE VIEW ajuda_geral AS SELECT * FROM (SELECT C.id_cliente as "Dono da Conta", C.id_agencia as "Numero Agencia", C.numero as "Numero Conta", C.tipo as "Tipo da Conta", C.valor as "Valor inicial",(C."valor"+SUM(L."valor")) as "Saldo atual" FROM Contas C INNER JOIN LancamentosConta LC ON LC."id_conta"=C."oid" INNER JOIN Lancamentos L ON L."oid"=LC."id_lancamento" INNER JOIN Clientes Cl ON Cl.oid=C.id_cliente GROUP BY C."oid") as test INNER JOIN Clientes c ON c.oid=test."Dono da Conta" ORDER BY test."Dono da Conta" ASC;	

--6
ALTER TABLE Contas ADD COLUMN saldoatual INT;






CREATE OR REPLACE FUNCTION refreshAccount(id int) 
RETURNS VOID 
AS 
$$
DECLARE
	saldo int;
	c int;
BEGIN
    SELECT INTO c COUNT(*) FROM Contas C INNER JOIN LancamentosConta LC ON LC."id_conta"=C."oid" INNER JOIN Lancamentos L ON L."oid"=LC."id_lancamento" WHERE C."oid"=id GROUP BY C."oid";
	IF(c IS NOT NULL) THEN
	SELECT INTO saldo (C."valor"+SUM(L."valor")) as "Saldo" FROM Contas C INNER JOIN LancamentosConta LC ON LC."id_conta"=C."oid" INNER JOIN Lancamentos L ON L."oid"=LC."id_lancamento" WHERE C."oid"=id GROUP BY C."oid";
	EXECUTE format('UPDATE Contas SET "saldoatual"='||saldo||' WHERE "oid"='||id);
	END IF;
END;
$$
LANGUAGE 'plpgsql'; 



CREATE OR REPLACE FUNCTION refreshAccs() 
RETURNS VOID 
AS 
$$
DECLARE
	row record;
BEGIN
	FOR row IN SELECT DISTINCT oid FROM Contas 
	LOOP
		EXECUTE format('SELECT refreshAccount('||row.oid||')'); 
	END LOOP;
END;
$$
LANGUAGE 'plpgsql'; 


SELECT refreshAccs();

SELECT * FROM Contas;
