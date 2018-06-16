--q1 
--OBS: (nao colocamos mais colunas no select para facilitar a visualizacao)
CREATE OR REPLACE VIEW view_participantes_artigo AS SELECT P.nm_participante, A.nm_titulo_artigo, C.id_congresso, PC.in_eh_revisor FROM artigo A 
	INNER JOIN autor_artigo Aart ON A.id_artigo=Aart.id_artigo 
	INNER JOIN revisor_artigo Rart ON A.id_artigo=Rart.id_artigo 
	INNER JOIN participante P ON P.id_participante=Aart.id_participante OR P.id_participante=Rart.id_participante 
	INNER JOIN participante_congresso PC ON P.id_participante=PC.id_participante
	INNER JOIN congresso C ON C.id_congresso=PC.id_congresso
ORDER BY P.nm_participante,C.id_congresso;

SELECT * FROM view_participantes_artigo;


--q2
CREATE SEQUENCE SQ_id_revisor_artigo INCREMENT BY 1 start with 101;
ALTER TABLE revisor_artigo ALTER COLUMN id_revisor_artigo SET DEFAULT nextval('SQ_id_revisor_artigo');




CREATE OR REPLACE FUNCTION getRevisorPreguicoso(idCongresso INT) 
RETURNS INT 
AS 
$$
DECLARE
	id_preguicoso INT;
BEGIN
	SELECT TESTE.id_participante INTO id_preguicoso FROM (SELECT COUNT(*) as NUMERO, P.id_participante FROM artigo A 
	INNER JOIN autor_artigo Aart ON A.id_artigo=Aart.id_artigo 
	INNER JOIN revisor_artigo Rart ON A.id_artigo=Rart.id_artigo 
	INNER JOIN participante P ON P.id_participante=Aart.id_participante OR P.id_participante=Rart.id_participante 
	INNER JOIN participante_congresso PC ON P.id_participante=PC.id_participante
	INNER JOIN congresso C ON C.id_congresso=PC.id_congresso 
	WHERE C.id_congresso=84
	GROUP BY P.id_participante,C.id_congresso
	ORDER BY NUMERO ASC LIMIT 1) TESTE;

	RETURN id_preguicoso;
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE; 


--Apenas aloca revisores para artigos que não tem nenhuma revisão;

CREATE OR REPLACE FUNCTION makeCrossBetweenAutorAndRevisor(idCongresso INT) 
RETURNS VOID 
AS 
$$
DECLARE
	row record;
	r_id_revisor_artigo INT;
	a_id_artigo INT;
BEGIN
	
	FOR row IN SELECT * FROM artigo a WHERE qt_revisoes_artigo=0	
	LOOP
		SELECT row."id_artigo" INTO a_id_artigo;
		SELECT getRevisorPreguicoso(idCongresso) INTO r_id_revisor_artigo;

		INSERT INTO revisor_artigo(id_participante, id_artigo) VALUES(r_id_revisor_artigo, a_id_artigo);

	END LOOP;
END;
$$
LANGUAGE 'plpgsql';

SELECT makeCrossBetweenAutorAndRevisor(84);

--q3
CREATE OR REPLACE FUNCTION informReview() 
RETURNS trigger 
AS 
$$
DECLARE
	old_rev integer;
	name varchar(50);
	artname varchar(100);
	scr_mail varchar(40):='do-not-reply@congressoX.com';
	dst_mail varchar(50);
BEGIN
	SELECT qt_revisoes_artigo FROM artigo A WHERE A.id_artigo=new.id_artigo INTO old_rev;


	IF old_rev<new.qt_revisoes_artigo THEN
	    SELECT P.nm_email_participante FROM artigo A INNER JOIN autor_artigo AA ON A.id_artigo=AA.id_artigo INNER JOIN participante P ON P.id_participante=AA.id_participante WHERE A.id_artigo=new.id_artigo INTO dst_mail; 
		SELECT P.nm_participante FROM artigo A INNER JOIN autor_artigo AA ON A.id_artigo=AA.id_artigo INNER JOIN participante P ON P.id_participante=AA.id_participante WHERE A.id_artigo=new.id_artigo INTO name; 
		SELECT A.nm_titulo_artigo FROM artigo A WHERE A.id_artigo=new.id_artigo INTO artname; 
		RAISE NOTICE '
		---HEADER
			mailfrom: %
			mailto: %
			subject: Artigo revisado
		---
		Prezado %,
		Seu artigo (%) do congresso foi revisado.
		Att, CongressoX
		',RTRIM(scr_mail),RTRIM(dst_mail),RTRIM(name),RTRIM(artname);
	END IF;

	
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql' IMMUTABLE; 


DROP TRIGGER informReview ON artigo; -- Comentar na primeira execucao
CREATE TRIGGER informReview BEFORE INSERT OR UPDATE ON artigo
    FOR EACH ROW EXECUTE PROCEDURE informReview();

UPDATE artigo SET qt_revisoes_artigo=((SELECT qt_revisoes_artigo FROM artigo A WHERE A.id_artigo=2)+1) WHERE id_artigo=2;


--q4
SELECT A.nm_titulo_artigo, RA.nu_nota, A.dt_envio_artigo FROM revisor_artigo RA 
	INNER JOIN artigo A ON RA.id_artigo=A.id_artigo 
WHERE RA.nu_nota>8 AND  RA.dt_revisao IS NOT NULL
ORDER BY A.dt_envio_artigo DESC;