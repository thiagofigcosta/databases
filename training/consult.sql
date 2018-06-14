-- Selecione o nome e sobrenome dos empregados que já tiveram cargo “Accountant”
SELECT nm_empregado, nm_sobrenome FROM empregado e WHERE e.nu_empregado IN (SELECT nu_empregado FROM historico_emprego WHERE nm_cargo='Accountant');

-- Selecione o nome e sobrenome dos empregados que fizeram os cursos de “Ada” ou “LANs”, renomeando os atributos para “NomeEmpregado” e “SobrenomeEmpregado”.
SELECT nm_empregado AS NomeEmpregado, nm_sobrenome AS SobrenomeEmpregado FROM empregado e INNER JOIN empregado_curso c ON e.nu_empregado=c.nu_empregado and c.nu_curso IN (SELECT nu_curso FROM curso cu WHERE cu.nm_curso='Ada' or  cu.nm_curso='LANs');

-- Selecione o nome dos cursos que tiveram até 10 empregados e apresente-os em ordem decrescente.
SELECT A.nome FROM (SELECT c.nm_curso AS nome, count(ec.nu_curso) AS quantidade FROM curso c INNER JOIN empregado_curso ec ON ec.nu_curso=c.nu_curso GROUP BY c.nm_curso) AS A WHERE A.quantidade<=10 ORDER BY A.nome desc;

-- Selecione o nome do departamento e a quantidade de empregados por departamento, apresentando o resultado em ordem crescente de nome de departamento.
SELECT d.nm_depto, count(d.nu_depto) FROM departamento d INNER JOIN empregado e ON e.nu_depto=d.nu_depto GROUP BY d.nm_depto ORDER BY d.nm_depto;

-- Selecione o nome dos departamentos e a quantidade de empregados apenAS para aqueles que possuem mais de 6 empregados.
SELECT A.nome, A.quantidade FROM (SELECT d.nm_depto AS nome, count(d.nu_depto) AS quantidade FROM departamento d INNER JOIN empregado e ON e.nu_depto=d.nu_depto GROUP BY d.nm_depto ORDER BY d.nm_depto) AS A WHERE A.quantidade>6;

-- Selecione o nome e o sobrenome dos empregados que trabalham em departamentos com 6 empregados
SELECT e.nm_empregado, e.nm_sobrenome FROM empregado e WHERE e.nu_depto IN (SELECT A.id_depto FROM (SELECT d.nu_depto AS id_depto, count(d.nu_depto) AS quantidade FROM departamento d INNER JOIN empregado e ON e.nu_depto=d.nu_depto GROUP BY d.nu_depto ORDER BY d.nu_depto) AS A WHERE A.quantidade=6);

-- Selecione o nome e sobrenome dos empregados que ocuparam um cargo por 3 anos.
SELECT e.nm_empregado, e.nm_sobrenome FROM empregado e WHERE e.nu_empregado IN (SELECT nu_empregado FROM (SELECT * FROM historico_emprego WHERE dt_fim IS NOT NULL) AS A WHERE (A.dt_fim-A.dt_inicio)/365=3);

-- Selecione o nome, data de início e data fim dos cursos que ocorreram simultaneamente (mesma data de início)
SELECT c1.nm_curso AS nome, c1.dt_curso AS data_inicial, c1.dt_curso AS data_final FROM curso c1 INNER JOIN curso c2 ON c1.dt_curso=c2.dt_curso and c1.nu_curso!=c2.nu_curso;

-- Selecione o nome dos cursos que não tiveram nenhum empregado
SELECT nm_curso FROM curso c WHERE c.nu_curso not IN (SELECT c.nu_curso FROM curso c INNER JOIN empregado_curso ec ON ec.nu_curso=c.nu_curso);

-- Selecione o nome dos cursos que ocorreram no mês de Outubro
SELECT nm_curso FROM curso c WHERE date_part('month', c.dt_curso)=10;

-- Selecione o curso com maior número de alunos. Apresente o nome do curso e o número de alunos, renomeando os atributos
SELECT A.nome_curso, A.quantidade FROM (SELECT c.nm_curso AS nome_curso, count(ec.nu_empregado) AS quantidade FROM curso c INNER JOIN empregado_curso ec ON ec.nu_curso=c.nu_curso GROUP BY c.nm_curso) AS A WHERE A.quantidade IN (SELECT max(q.count) FROM (SELECT c.nm_curso, count(*) FROM curso c INNER JOIN empregado_curso ec ON ec.nu_curso=c.nu_curso GROUP BY c.nm_curso) AS q);

-- Selecione o nome e sobrenome dos 3 empregados mais velhos.
SELECT nm_empregado, nm_sobrenome, (date(now())-dt_nAScimento)/365 FROM empregado ORDER BY dt_nAScimento LIMIT 3;