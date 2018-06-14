-- 1 Selecione o nome dos clientes que já tiveram seus pedidos finalizados (sem repetição).
SELECT DISTINCT C."nm_cliente" FROM cliente C INNER JOIN pedido P ON c."id_cliente"=P."id_cliente" WHERE P."in_finalizado"='S' ORDER BY C."nm_cliente";

-- 2 Selecione o nome do cliente e a situação do pedido para aqueles pedidos que foram feitos no período de “01 de Janeiro de 2002” a “20 de Fevereiro de 2002”
SELECT DISTINCT C."nm_cliente", P."in_finalizado" FROM cliente C INNER JOIN pedido P ON c."id_cliente"=P."id_cliente" WHERE P."dt_pedido" >= '2002-01-01'::date AND P."dt_pedido" <= '2002-02-20'::date;

-- 3 Selecione o nome do cliente e a situação do pedido dos quatro pedidos mais antigos (PS:. RESPOSTA DO GABARITO INCORRETA)
SELECT "nm_cliente", "in_finalizado" FROM (SELECT C."nm_cliente", P."in_finalizado", P."dt_pedido" FROM cliente C INNER JOIN pedido P ON c."id_cliente"=P."id_cliente" ORDER BY P."dt_pedido" LIMIT 4) as "Busca";

-- 4a Selecione o nome e a cor do tecido (material) que foi utilizado em três pedidos existentes.
SELECT M."nm_material", M."nm_cor_material" FROM material M INNER JOIN detalhePedido DP ON DP."id_material"=M."id_material" INNER JOIN pedido P ON P."id_pedido"=DP."id_pedido" ORDER BY RANDOM() LIMIT 3;

-- 4b Selecione o nome e a cor do tecido (material) que foram utilizados pelo menos três vezes em pedidos existentes.
SELECT "nm_material", "nm_cor_material" FROM (SELECT M."nm_material", M."nm_cor_material", COUNT(*) FROM material M INNER JOIN detalhePedido DP ON DP."id_material"=M."id_material" INNER JOIN pedido P ON P."id_pedido"=DP."id_pedido" GROUP BY  M."nm_material", M."nm_cor_material" HAVING COUNT(*) >=3) as "Consulta";
-- 5 Selecione o nome do costureiro cujas costuras não foram finalizadas. (vagabo)
SELECT DISTINCT C0."nm_costureiro" FROM costureiro C0 INNER JOIN costura C1 ON C0."id_costureiro"=C1."id_costureiro" WHERE C1."dt_fim_costura" IS NULL ORDER BY  C0."nm_costureiro";

-- 6 Selecione o nome do costureiro que costura “Vestido de verão”.
SELECT DISTINCT C0."nm_costureiro" FROM costureiro C0 INNER JOIN costura C1 ON C0."id_costureiro"=C1."id_costureiro"  INNER JOIN detalhePedido DP ON C1."id_detalhe_pedido"=DP."id_detalhe_pedido" AND C1."id_pedido"=DP."id_pedido" INNER JOIN traje T ON DP."id_traje"=T."id_traje" WHERE T."te_descricao_traje"='Vestido de verão';

-- 7 Selecione os tamanhos disponíveis para “Mini saia” - ERR
SELECT DISTINCT Q."nu_tamanho" FROM quantidade Q INNER JOIN traje T ON Q."id_traje"=T."id_traje" WHERE T."te_descricao_traje"='Mini saia' ORDER BY Q."nu_tamanho";

-- 8 Selecione os nomes e as cores dos tecidos (materiais) em que foram pedidos o traje “Saia longa”.
SELECT M."nm_material", M."nm_cor_material" FROM material M INNER JOIN detalhePedido DP ON DP."id_material"=M."id_material" INNER JOIN traje T ON DP."id_traje"=T."id_traje" WHERE T."te_descricao_traje"='Saia longa';

-- 9 Quantos metros de tecido “Poliéster Amarelo palha” serão necessários para atender os pedidos pendentes?
SELECT SUM(Q."nu_quantidade") as "Quantidade necessária" FROM quantidade Q INNER JOIN detalhePedido DP ON DP."id_traje"=Q."id_traje" AND DP."nu_tamanho"=Q."nu_tamanho" INNER JOIN pedido P ON P."id_pedido"=DP."id_pedido" INNER JOIN material M ON M."id_material"=DP."id_material" WHERE P."in_finalizado"='N' AND M."nm_material"='Poliéster' AND M."nm_cor_material"='Amarelo palha';

-- 10 Calcule quantos metros de tecido serão necessários para confeccionar “10 Shorts em Sarja Azul marinho”, de tamanho 18. (PS:. busca nao faz sentido, estamos desconsiderando o custo do material, para calcula a quantidade de tecido basta saber o tamanho e o traje)
SELECT (Q."nu_quantidade"*10) as "Quantidade para 10 peças" FROM quantidade Q INNER JOIN detalhePedido DP ON DP."id_traje"=Q."id_traje" AND DP."nu_tamanho"=Q."nu_tamanho" INNER JOIN traje T ON T."id_traje"=DP."id_traje" WHERE T."te_descricao_traje"='Shorts' AND Q."nu_tamanho"=18;