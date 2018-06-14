--Funcao que retorna o email de um musico (Ignorar conteudo da funcao ela apenas simula uma conexao com outro banco, que seria um banco de emails)
CREATE OR REPLACE FUNCTION getMail(name varchar) 
RETURNS varchar 
AS 
$$
DECLARE
	mus_number INT;
BEGIN
	SELECT nu_musico INTO mus_number FROM musico where nm_musico = name;
	RETURN name||'_'||mus_number||'@municipal.bh.br';
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE; 



-- Função que manda email para musicos que tem afinidade com determinado instrumento
CREATE OR REPLACE FUNCTION contactMusiciansAffinityWith(instr varchar) 
RETURNS VOID 
AS 
$$
DECLARE
	row record;
	scr_mail varchar(40):='orquestra@municipal.bh.br';
	dst_mail varchar(40);
BEGIN
	FOR row IN SELECT DISTINCT M."nm_musico",I."nm_instrumento" FROM interprete I INNER JOIN musico M ON I."nu_musico_interprete"=M."nu_musico" WHERE I."nm_instrumento"=instr 
	LOOP
		SELECT getMail(row."nm_musico") INTO dst_mail; 
		RAISE NOTICE '
		---HEADER
			mailfrom: %
			mailto: %
			subject: Convite para tocar em Orquestra
		---
		Prezado %,
		Você foi selecionado em nosso banco de dados em virtude da sua habilidade em tocar %.
		Atualmente, surgiu uma vaga para pianista na Orquestra Municipal e, caso você tenha interesse,
		entre contato através do telefone (31) 3321-2323
		',RTRIM(scr_mail),RTRIM(dst_mail),RTRIM(row."nm_musico"),RTRIM(row."nm_instrumento");
	END LOOP;
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE; 
SELECT contactMusiciansAffinityWith('guitar');


-- Função que convida musicos para eventos em determinada data
CREATE OR REPLACE FUNCTION inviteMusicians(data DATE) 
RETURNS VOID 
AS 
$$
DECLARE
	row_event record;
	row_mus record;
	scr_mail varchar(40);
	dst_mail varchar(40);
BEGIN
	FOR row_event IN SELECT M."nm_musico", S."nu_musico_condutor", E."nm_auditorio", L."nm_cidade", L."nm_pais" FROM show S INNER JOIN musico M ON S."nu_musico_condutor"=M."nu_musico" INNER JOIN evento E ON E."nu_evento"=S."nu_evento" INNER JOIN local L ON E."nu_local_evento"=L."nu_local" WHERE E."dt_evento"=data LOOP
		SELECT getMail(row_event."nm_musico") INTO scr_mail; 
		FOR row_mus IN SELECT "nm_musico" FROM musico WHERE "nu_musico"<>row_event."nu_musico_condutor" LOOP
			SELECT getMail(row_mus."nm_musico") INTO dst_mail; 
			RAISE NOTICE '
			---HEADER
				mailfrom: %
				mailto: %
				subject: Convite para evento
			---
			Prezado %,
			% tem o prazer de convidá-lo para o evento que irá ocorrer no dia % no
			% em %, %. Seria uma honra poder contar com sua presença.
			',RTRIM(scr_mail),RTRIM(dst_mail),RTRIM(row_mus."nm_musico"),RTRIM(row_event."nm_musico"),data,RTRIM(row_event."nm_auditorio"),RTRIM(row_event."nm_cidade"),RTRIM(row_event."nm_pais");
		END LOOP;
	END LOOP;
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE; 
SELECT inviteMusicians('1997-06-15'::date);


-- Função que consulta através de uma view musicos que ja atuaram em mais de uma banda
CREATE OR REPLACE VIEW musicos_bandas AS SELECT M."nm_musico", B."nm_banda" FROM musico M INNER JOIN interprete I ON I."nu_musico_interprete"=M."nu_musico" INNER JOIN atuacao A ON A."nu_interprete"=I."nu_interprete" INNER JOIN banda B ON A."nu_banda"=B."nu_banda";
CREATE OR REPLACE FUNCTION consultMus() 
RETURNS TABLE(nome char(20))
AS 
$$
DECLARE
	row record;
BEGIN
	RETURN QUERY EXECUTE
	format ('SELECT nm_musico FROM musicos_bandas GROUP BY nm_musico HAVING count(*)>1');
END;
$$
LANGUAGE 'plpgsql'; 
SELECT consultMus();