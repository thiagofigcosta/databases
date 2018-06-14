--Banco
SELECT * FROM supplier;
SELECT * FROM part;
SELECT * FROM project;
SELECT * FROM supply;

-- Questão 1 - Nome e cidade de todos os fornecedores
SELECT "name", "city" FROM supplier;

-- Questão 2 - Nome de todas as peças com peso maior que 15
SELECT "name" FROM part WHERE "weight" > 15;

-- Questão 3 - Nome dos fornecedores que fornecem peças para o projeto 1
SELECT DISTINCT S."name" FROM supplier S INNER JOIN supply S0 ON S0."id_supplier"=S."id" WHERE S0."id_project"=1 ORDER BY S."name"; -- Faster
SELECT DISTINCT S."name" FROM supplier S, supply S0 WHERE S."id"=S0."id_supplier" AND S0."id_project"=1 ORDER BY S."name";

-- Questão 4 - Quantidade de peças fornecidas ao projeto 2
SELECT SUM ("amount") FROM supply WHERE "id_project" = 2;

-- Questão 5 - Quantidade de peças fornecidas ao projeto 1 pelo fornecedor 1
SELECT SUM ("amount") FROM supply WHERE "id_project" = 1 AND "id_supplier"=1;

-- Questão 6 - Forncedores que não fornecem peças à projetos
SELECT "name" FROM supplier WHERE "id" NOT IN (SELECT "id_supplier" FROM supply);

-- Questão 7 - Nome e Quantidade total de peças fornecidas aos projetos
SELECT P."name" AS "Name", SUM(S."amount") AS "Sum" FROM part P INNER JOIN supply S ON P."id"=S."id_part" GROUP BY P."name";

-- Questão 8 - Quantidade de projetos existentes
SELECT COUNT(*) FROM project;

-- Questão 9 - Nome e cor das peças fornecidas ao projeto 3
SELECT DISTINCT P."name", P."color" FROM part P INNER JOIN supply S ON S."id_part"=P."id" WHERE S."id_project"=3;

-- Questão 10 - Nome de todos os fornecedores ordenados
SELECT "name" FROM supplier ORDER BY "name";

-- Questão 11 - Nome dos projetos que tem peças e fornecedores de 'Londres'
SELECT DISTINCT P."name" FROM project P INNER JOIN supply S ON P."id"=S."id_project" INNER JOIN part P0 ON P0."id"=S."id_part" INNER JOIN supplier S0 ON S0."id"=S."id_supplier" WHERE P0."city"='Londres' AND S0."city"='Londres' ORDER BY P."name";

-- Questão 12 - Nome das peças fornecidas por fornecedores de porte medio(20) e porte grande(30)
SELECT DISTINCT P."name" FROM part P INNER JOIN supply S ON P."id"=S."id_part" INNER JOIN supplier S0 ON S0."id"=S."id_supplier" WHERE S0."postage">=20 ORDER BY P."name";
