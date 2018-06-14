CREATE TABLE curso(
        nu_curso INT PRIMARY KEY,
        nm_curso VARCHAR(30),
        dt_curso DATE
);

CREATE TABLE departamento(
        nu_depto INT PRIMARY KEY,
        nm_depto VARCHAR(20),
        nm_localizacao VARCHAR(15),
        nu_setor INT 
);

CREATE TABLE empregado(
        nu_empregado INT PRIMARY KEY,
        nm_sobrenome VARCHAR(15),
        nm_empregado VARCHAR(30),
        dt_nascimento DATE,
        te_endereco VARCHAR(50),
        nu_telefone VARCHAR(20),
        nu_depto INT 
              REFERENCES departamento (nu_depto)
);



CREATE TABLE historico_emprego(nu_empregado INT REFERENCES empregado (nu_empregado),
                        nm_cargo VARCHAR(30),
                        dt_inicio DATE, 
                        dt_fim DATE,
                        salario  DECIMAL(8,2),
                        PRIMARY KEY (nu_empregado, nm_cargo));

CREATE TABLE empregado_curso(nu_empregado INT REFERENCES empregado (nu_empregado), 
                       nu_curso INT REFERENCES curso (nu_curso),
                       PRIMARY KEY (nu_empregado, nu_curso));