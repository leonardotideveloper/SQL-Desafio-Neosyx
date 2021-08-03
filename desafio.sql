-- Criando banco de edados
CREATE DATABASE desafio_neosyx;

-- Informando qual banco de dados vamos utilizar
USE desafio_neosyx;

-- Criando tabelas conforme Diagrama
CREATE TABLE estados (
	codigo INT auto_increment,
	nome VARCHAR (20) NOT NULL, /*São Paulo, Rio De Janeiro, Pará, Rio Grande do Sul*/
	PRIMARY KEY (codigo)
);

CREATE TABLE cidades (
	codigo INT auto_increment,
	nome VARCHAR (30) NOT NULL, /*Santa maria das graças de deus*/
	codigoestado INT NOT NULL,
	PRIMARY KEY (codigo),
	CONSTRAINT estados FOREIGN KEY (codigoestado) REFERENCES estados (codigo)
);

CREATE TABLE operadores(
	codigo INT auto_increment,
	nome VARCHAR (40) NOT NULL,
	codigoestado INT NOT NULL,
	PRIMARY KEY (codigo),
	CONSTRAINT cidades FOREIGN KEY (codigoestado) REFERENCES cidades (codigo)
);

CREATE TABLE ligacoes(
	numerocliente VARCHAR (12) NOT NULL,
	datahora DATETIME NOT NULL,
	codigooperador INT NOT NULL,
	CONSTRAINT operadores FOREIGN KEY (codigooperador) REFERENCES operadores (codigo)
);

-- Inserindo estados para testes
INSERT INTO estados (nome) VALUES ("Rio de Janeiro"); -- COD 1
INSERT INTO estados (nome) VALUES ("São Paulo"); 			-- COD 2
INSERT INTO estados (nome) VALUES ("Bahia");					-- COD 3

-- Inserindo Cidades para testes
INSERT INTO cidades (nome, codigoestado) VALUES ("Rio de Janeiro", 1);
INSERT INTO cidades (nome, codigoestado) VALUES ("Niterói", 1);
INSERT INTO cidades (nome, codigoestado) VALUES ("Duque da Caxias", 1);
INSERT INTO cidades (nome, codigoestado) VALUES ("São Gonçalo", 1);
INSERT INTO cidades (nome, codigoestado) VALUES ("Itaguaí", 1);

INSERT INTO cidades (nome, codigoestado) VALUES ("São Paulo", 2);
INSERT INTO cidades (nome, codigoestado) VALUES ("Campinas", 2);
INSERT INTO cidades (nome, codigoestado) VALUES ("Valinhos", 2);
INSERT INTO cidades (nome, codigoestado) VALUES ("Santo André", 2);
INSERT INTO cidades (nome, codigoestado) VALUES ("Praia Grande", 2);

INSERT INTO cidades (nome, codigoestado) VALUES ("Salvador", 3);
INSERT INTO cidades (nome, codigoestado) VALUES ("Feira de Santana", 3);
INSERT INTO cidades (nome, codigoestado) VALUES ("Vitória da Conquista", 3);
INSERT INTO cidades (nome, codigoestado) VALUES ("Itabuna", 3);
INSERT INTO cidades (nome, codigoestado) VALUES ("Lauro de Freitas", 3);

-- Inserindo um Operador
INSERT INTO operadores (nome, codigoestado) VALUES ("Leo Silva", 1);
INSERT INTO operadores (nome, codigoestado) VALUES ("Leo Sampa", 2);
INSERT INTO operadores (nome, codigoestado) VALUES ("Leo Bahiano", 3);

SELECT count(*) FROM ligacoes WHERE codigooperador = 3;

-- Inserindo ligações
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("65 108197143","2021-07-08 13:32:23",1),("41 071070003","2021-07-14 06:44:28",1),("19 142609622","2021-07-04 06:31:40",3),("59 014075367","2021-07-14 02:01:55",3),("14 389353399","2021-07-07 23:11:19",1),("41 885290123","2021-07-01 06:36:27",3),("85 132272526","2021-07-06 12:57:45",3),("42 480346124","2021-07-15 01:09:59",3),("77 628878049","2021-07-06 15:00:28",3),("59 200607460","2021-07-13 01:50:52",2);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("65 108197143","2021-07-08 13:32:23",1),("41 071070003","2021-07-14 06:44:28",1),("19 142609622","2021-07-04 06:31:40",3),("59 014075367","2021-07-14 02:01:55",3),("14 389353399","2021-07-07 23:11:19",1),("41 885290123","2021-07-01 06:36:27",3),("85 132272526","2021-07-06 12:57:45",3),("42 480346124","2021-07-15 01:09:59",3),("77 628878049","2021-07-06 15:00:28",3),("59 200607460","2021-07-13 01:50:52",2);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("91 430508590","2021-07-04 03:26:25",3),("18 889227267","2021-07-07 18:57:21",3),("31 450650536","2021-07-03 09:50:56",2),("26 637950863","2021-07-08 11:17:58",3),("74 293732654","2021-07-07 10:23:19",3),("94 038679405","2021-07-04 21:58:52",2),("61 263330967","2021-07-08 14:22:17",3),("17 118678153","2021-07-02 18:18:20",1),("22 608461567","2021-07-06 01:47:24",1),("89 286034815","2021-07-10 09:24:55",1);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("21 195528534","2021-07-08 11:17:17",2),("86 759055069","2021-07-14 06:20:04",2),("79 722925215","2021-07-05 14:41:39",1),("18 509759826","2021-07-06 21:25:23",2),("35 500647865","2021-07-12 20:06:43",2),("51 916586442","2021-07-10 10:52:21",1),("66 813166362","2021-07-13 23:21:54",2),("11 733383488","2021-07-02 01:16:48",3),("43 138259952","2021-07-05 14:01:57",2),("64 526193697","2021-07-11 00:55:24",2);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("32 495531070","2021-07-02 19:14:16",2),("22 225968547","2021-07-04 03:07:08",3),("37 449053501","2021-07-11 18:50:12",3),("23 731724779","2021-07-02 18:58:08",1),("58 009706432","2021-07-11 07:13:26",2),("83 382385152","2021-07-15 08:47:30",1),("94 761924527","2021-07-06 16:30:52",2),("89 848084942","2021-07-08 18:21:11",1),("69 297466409","2021-07-05 05:52:02",2),("37 118026129","2021-07-06 12:57:48",2);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("76 013609239","2021-07-06 04:40:15",2),("87 904523233","2021-07-07 22:49:31",3),("84 394695764","2021-07-13 19:00:22",1),("52 421050263","2021-07-01 06:16:06",3),("21 813822479","2021-07-15 22:20:36",3),("85 941388541","2021-07-05 03:49:22",3),("52 857998465","2021-07-06 14:09:34",1),("56 368147317","2021-07-12 08:48:52",3),("79 255966842","2021-07-01 13:27:44",3),("39 283565399","2021-07-02 18:12:47",3);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("86 156160123","2021-07-06 10:27:46",2),("96 719249216","2021-07-03 10:44:27",1),("94 437467489","2021-07-11 00:15:20",2),("44 559331586","2021-07-02 06:16:00",3),("16 325188427","2021-07-06 07:09:32",2),("87 850146058","2021-07-06 21:18:55",2),("87 169321673","2021-07-13 16:11:39",3),("67 237188998","2021-07-01 17:29:53",1),("12 121621113","2021-07-05 07:38:22",3),("55 297752464","2021-07-04 20:23:08",2);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("48 820321661","2021-07-05 19:48:09",3),("35 255415609","2021-07-12 05:44:47",3),("43 247347231","2021-07-06 03:16:05",2),("71 311534881","2021-07-12 05:21:29",3),("76 184889380","2021-07-13 07:08:27",3),("84 605808105","2021-07-11 17:49:36",3),("48 067007770","2021-07-12 23:44:00",2),("36 151327905","2021-07-04 12:41:31",2),("23 270568953","2021-07-04 05:10:41",2),("93 111909063","2021-07-09 03:28:53",3);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("17 386179124","2021-07-05 04:13:54",3),("77 002021876","2021-07-06 19:14:43",2),("53 920803674","2021-07-14 15:46:45",1),("72 404600951","2021-07-12 14:40:42",2),("21 844673031","2021-07-14 04:12:47",3),("18 141917719","2021-07-11 08:50:37",1),("45 196904660","2021-07-06 03:20:08",3),("56 744659161","2021-07-03 05:40:18",2),("41 098915984","2021-07-13 00:53:23",3),("18 709778601","2021-07-01 11:59:50",3);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("54 455220520","2021-07-10 11:15:09",1),("18 248027704","2021-07-03 10:45:01",1),("31 912338352","2021-07-14 16:47:48",2),("57 024755792","2021-07-03 17:45:51",1),("45 843087910","2021-07-01 22:19:39",2),("33 922299229","2021-07-06 09:50:56",3),("32 391561814","2021-07-07 11:09:54",1),("79 081180028","2021-07-09 00:24:45",2),("21 800748459","2021-07-15 11:09:02",2),("69 040527445","2021-07-11 04:53:46",2);
INSERT INTO `ligacoes` (`numerocliente`,`datahora`,`codigooperador`) VALUES ("64 606778773","2021-07-04 23:44:02",1),("19 470363842","2021-07-06 09:55:39",1),("15 596719462","2021-07-11 14:10:00",2),("56 194729503","2021-07-05 04:40:57",3),("43 589828966","2021-07-11 05:59:14",3),("29 524414866","2021-07-04 21:53:27",2),("29 463320791","2021-07-05 08:06:07",3),("95 037676726","2021-07-15 06:43:18",2),("59 805055263","2021-07-08 06:38:23",1),("68 458916701","2021-07-14 02:59:52",1);

-- 3. Escrever uma consulta para trazer a quantidade de ligações por dia (ignorando o horário).

SELECT count(*) AS quatidade_ligacao, CAST(datahora AS DATE) as data_ligacao FROM ligacoes GROUP BY DATE(datahora);

-- 4. Escrever uma consulta para trazer a quantidade de ligações por CIDADE.
	
select 
  est.codigo,
  est.nome,
  count(*) 
from
  ligacoes lig

inner join operadores ope
on lig.codigooperador = ope.codigo

inner join estados est
on ope.codigoestado = est.codigo

group by
  est.codigo,
  est.nome

-- 5. Escrever uma consulta para trazer o período do dia em que a ligação foi realizada (madrugada, manhã, tarde ou noite)
	
SELECT
  numerocliente AS Números,
  CASE
    WHEN CAST(datahora AS TIME) BETWEEN '00:00:00' AND '05:59:59' THEN 'Madrugada'
    WHEN CAST(datahora AS TIME) BETWEEN '06:00:00' AND '11:59:59' THEN 'Manhã'
    WHEN CAST(datahora AS TIME) BETWEEN '12:00:00' AND '17:59:59' THEN 'Tarde'
    ELSE 'Noite'
  END AS Períodos
FROM ligacoes

-- 6. Escrever uma consulta para trazer a participação de atendimento de cada CIDADE no total de atendimentos, ou seja, total de ligações, em percentual, que cada CIDADE ocupa do total de ligações de todas as CIDADES 

SELECT
	est.codigo,
	est.nome,
	CONCAT((count(*) * 100) / (SELECT count(*) FROM ligacoes), "%") as porcentagem 
FROM
	ligacoes lig
	INNER JOIN operadores ope ON lig.codigooperador = ope.codigo
	INNER JOIN estados est ON ope.codigoestado = est.codigo 
GROUP BY
	est.codigo,
	est.nome


-- 7 Escrever uma consulta, para trazer o número dos clientes que realizaram mais de uma ligação dentro do mesmo período de 1 dia. O campo identificador para a quantidade de chamadas excedentes à 1 será chamado de "Rechamadas".
-- SELECT CAST(datahora AS DATE) as dataligaca, numerocliente, count(*) - 1  AS rechamadas FROM ligacoes GROUP BY DATE(datahora), numerocliente ORDER BY datahora;

SELECT
  CAST(DATAHORA AS DATE) AS DATALIGACAO,
  NUMEROCLIENTE,
  COUNT(*) - 1 AS RECHAMADAS
FROM
  LIGACOES

GROUP BY
  CAST(DATAHORA AS DATE),
  NUMEROCLIENTE

HAVING COUNT(*) > 1