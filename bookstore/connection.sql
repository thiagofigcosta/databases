CREATE EXTENSION dblink;
CREATE USER bernard WITH CREATEDB ENCRYPTED PASSWORD '123456' VALID UNTIL '2100-12-31'; -- IN GROUP nome_do_grupo [, ...] CREATEUSER
CREATE USER thiago WITH CREATEDB ENCRYPTED PASSWORD '123456' VALID UNTIL '2100-12-31'; -- IN GROUP nome_do_grupo [, ...] CREATEUSER

GRANT ALL PRIVILEGES ON DATABASE bookstore TO bernard;

CREATE MATERIALIZED VIEW external_RH_func AS SELECT * FROM dblink(
'dbname=bookstore host=172.16.17.24 user=thiago password=123456 port=5432',

'SELECT nome FROM funcionarios'
) AS funcionarios_(nome varchar(40));

REFRESH MATERIALIZED VIEW external_RH_func;

SELECT * FROM external_RH_func;

DROP TABLE funcionario;

CREATE MATERIALIZED VIEW external_RH_curso AS SELECT * FROM dblink(
'dbname=bookstore host=172.16.17.24 user=thiago password=123456 port=5432',

'SELECT nome FROM curso'
) AS t1(nome varchar(30));

SELECT * FROM external_RH_curso;
