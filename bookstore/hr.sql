create table curso(
        nu_curso integer primary key,
        nm_curso varchar(30),
        dt_curso date
);

create table departamento(
        nu_depto integer primary key,
        nm_depto varchar(20),
        nm_localizacao varchar(15),
        nu_setor integer 
);

create table empregado(
        nu_empregado integer primary key,
        nm_sobrenome varchar(15),
        nm_empregado varchar(30),
        dt_nascimento date,
        te_endereco varchar(50),
        nu_telefone varchar(20),
        nu_depto integer 
              references departamento (nu_depto)
);



create table historico_emprego(nu_empregado integer references empregado (nu_empregado),
                        nm_cargo varchar(30),
                        dt_inicio date, 
                        dt_fim date,
                        salario  decimal(8,2),
                        primary key (nu_empregado, nm_cargo));

create table empregado_curso(nu_empregado integer references empregado (nu_empregado), 
                       nu_curso integer references curso (nu_curso),
                       primary key (nu_empregado, nu_curso));

