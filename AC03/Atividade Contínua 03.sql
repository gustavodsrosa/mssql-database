-- ARQUIVO BASE

-- ATIVIDADE CONTINUA 03 - BANCO DE DADOS

-- CRIANDO BANCO DE DADOS
CREATE DATABASE AC03

-- USANDO BANCO DE DADOS
USE AC03

SET IDENTITY_INSERT TB_ANO ON

-- TABELA ANO
CREATE TABLE TB_ANO
(
	ID_ANO		 INT       IDENTITY(1,1), -- CHAVE PRIM�RIA
	ANO			 INT	      NOT NULL

	CONSTRAINT PK_ID_ANO     PRIMARY KEY(ID_ANO)
)

INSERT TB_ANO
( ID_ANO , ANO )
VALUES
( 123 , 2001 ),
( 132 , 2008 ),
( 213 , 1998 ),
( 231 , 2009 ),
( 312 , 1965 ),
( 321 , 1998 ),
( 124 , 2019 ),
( 234 , 2017 ),
( 221 , 2007 ),
( 122 , 1996 )

-- TABELA MES
CREATE TABLE TB_MES
(
	ID_MES		  INT	   IDENTITY(15,3), -- CHAVE PRIMARIA
	MES		      INT	   NOT NULL

	CONSTRAINT PK_ID_MES    PRIMARY KEY(ID_MES)
)

INSERT TB_MES
( ID_MES , MES )
VALUES
( 123 , 10 ),
( 132 , 8 ),
( 213 , 11 ),
( 231 , 2 ),
( 312 , 7 ),
( 321 , 7 ),
( 124 , 8 ),
( 234 , 3 ),
( 221 , 2 ),
( 122 , 4 )

-- TABELA MODELO
CREATE TABLE TB_MODELO
(
	ID_MODELO			   INT			IDENTITY(1,1), -- CHAVE PRIMARIA
	DESCRICAO			   VARCHAR(50)	NOT NULL

	CONSTRAINT PK_ID_MODELO         PRIMARY KEY (ID_MODELO)
)

INSERT TB_MODELO
( ID_MODELO , DESCRICAO )
VALUES
( 123 , 'COROLLA' ),
( 132 , 'MAREA' ),
( 213 , 'GOL' ),
( 231 , 'AVENTADOR' ),
( 312 , 'SPORTAGE' ),
( 321 , 'FIESTA' ),
( 124 , 'CAMARO' ),
( 234 , 'PAREJO' ),
( 221 , 'PALIO' ),
( 122 , 'CG 125 STD' )

-- TABELA FABRICANTE
CREATE TABLE TB_FABRICANTE
(
	ID_FABRICANTE      INT                  IDENTITY(1,1), -- CHAVE PRIMARIA
	NOME		       VARCHAR(50)          NOT NULL,
	CIDADE			   VARCHAR(50)          NOT NULL,
	ENDERECO		   VARCHAR(100),
	UF				   CHAR(2), -- VARI�VEL FIXA	
	TELEFONE		   VARCHAR(20),
	CONTATO			   VARCHAR(50)			 NOT NULL

	CONSTRAINT PK_ID_FABRICANTE  PRIMARY KEY (ID_FABRICANTE)
)

INSERT TB_FABRICANTE
( ID_FABRICANTE , NOME, CIDADE, ENDERECO, UF, TELEFONE, CONTATO )
VALUES
( 123 , 'AUDI', 'AFONSO CUNHA', 'RUA UM', 'MA', '9999-9999', '9999-9999' )						,
( 132 , 'TOYOTA', 'AMARGOSA', 'RUA DEZ', 'BA', '2222-22222', '9999-9999' )						,
( 231 , 'CHEVROLET', 'BEL�M', 'RUA DAS CATARATAS', 'PA', '1111-1111', '9999-9999' )				,
( 213 , 'FIAT', 'DIVIN�POLIS', 'RUA UM', 'MG', '9988-8899', '9999-9999' )						,
( 412 , 'WOLKSWAGEN', 'SALVADOR', 'RUA DEZ', 'BA', '2233-3322', '9999-9999' )					,
( 421 , 'FIAT', 'ARACAJU', 'AVENIDA DAS ARVORES', 'SE', '3233-3322', '9999-9999' )				,
( 432 , 'LAMBORGHINI', 'SOROCABA', 'AVENIDA RAPOSO TAVARES', 'SP', '3233-0322', '9999-9999' )	,
( 423 , 'MITSUBISHI', 'PALMARES', 'AVENIDA DOIS', 'PE', '3555-0322', '9999-9999' )				,
( 243,  'JEEP', 'ANGICOS', 'AVENIDA DEZ', 'SE', '0098-0322', '9999-9999' )						,
( 234 , 'SUZUKI', 'PARINTINS', 'AVENIDA DEZ', 'AM', '8888-0322', '9999-9999' )

-- TABELA VEICULO
CREATE TABLE TB_VEICULO
(
	ID_VEICULO			INT			    IDENTITY(1,1), -- CHAVE PRIMARIA
	DESCRICAO			VARCHAR(50)	    NOT NULL,
	VALOR				DECIMAL(8,2)	NOT NULL,
	ID_MODELO			INT,
	ID_FABRICANTE		INT,
	ID_ANO_FABRICACAO   INT			    NOT NULL,
	DATA_COMPRA			DATE			NOT NULL

	CONSTRAINT PK_ID_VEICULO            PRIMARY KEY (ID_VEICULO),

	CONSTRAINT FK_ID_MODELO             FOREIGN KEY(ID_MODELO)
	REFERENCES TB_MODELO(ID_MODELO),

	CONSTRAINT FK_ID_FABRICANTE         FOREIGN KEY (ID_FABRICANTE)
	REFERENCES TB_FABRICANTE(ID_FABRICANTE),

	CONSTRAINT FK_ID_ANO_FABRICACAO     FOREIGN KEY(ID_ANO_FABRICACAO)
	REFERENCES TB_ANO(ID_ANO)
)

INSERT TB_VEICULO
( ID_VEICULO , DESCRICAO, VALOR, ID_ANO_FABRICACAO, DATA_COMPRA )
VALUES
( 789 , 'EM OPERA��O', 43000.00, 123, '2020-03-14' )		,                     
( 777 , 'EM OPERA��O', 47000.00, 132, '2019-05-31' )		,	
( 798 , 'EM OPERA��O', 34000.00, 213, '2010-09-23' )		,
( 897 , 'EM OPERA��O', 27000.00, 231, '2020-11-05' )		,
( 987 , 'EM OPERA��O', 17000.00, 312, '2020-12-30' )		,
( 888 , 'EM OPERA��O', 22000.00, 321, '2020-01-01' )		,
( 999 , 'EM OPERA��O', 80000.00, 124, '2019-04-10' )		,
( 778 , 'EM OPERA��O', 42000.00, 234, '2020-07-17' )		,
( 787 , 'EM OPERA��O', 21000.00, 221, '2020-07-13' )		,
( 878 , 'EM OPERA��O', 18000.00, 122, '2017-12-23' )

-- TABELA VENDAS
CREATE TABLE TB_VENDAS
(
	ID_VENDAS				 INT		IDENTITY(1,1), -- CHAVE PRIMARIA
	QTD						 TINYINT    NOT NULL,
	ID_VEICULO				 INT,
	ID_ANO_DA_VENDA			 INT, -- ANO
	ID_MES_DA_VENDA			 INT  -- MES

	CONSTRAINT PK_ID_VENDAS           PRIMARY KEY (ID_VENDAS)		,

	CONSTRAINT FK_ID_VEICULO          FOREIGN KEY(ID_VEICULO)
	REFERENCES TB_VEICULO(ID_VEICULO),

	CONSTRAINT FK_ID_ANO_DA_VENDA     FOREIGN KEY (ID_ANO_DA_VENDA)
	REFERENCES TB_ANO(ID_ANO),

	CONSTRAINT FK_ID_MES_DA_VENDA     FOREIGN KEY(ID_MES_DA_VENDA)
	REFERENCES TB_MES(ID_MES)
)

INSERT TB_VENDAS
( ID_VENDAS , QTD, ID_VEICULO, ID_ANO_DA_VENDA, ID_MES_DA_VENDA )
VALUES
( 567 , 144, 789, 123, 123 )		,                     
( 765 , 255, 777, 132, 132 )		,	
( 657 , 56, 798, 213, 213 )			,
( 675 , 34, 897, 231, 231 )			,
( 666 , 32, 987, 312, 312 )			,
( 656 , 45, 888, 321, 321 )			,
( 676 , 56, 999, 124, 124 )			,
( 678 , 152, 778, 234, 234 )		,	
( 665 , 199, 787, 221, 221 )		,
( 677 , 250, 878, 122, 122 )		-- C�DIGO DA CG


SELECT * FROM TB_ANO -- RECUPERANDO AS TABELAS DO BD
SELECT * FROM TB_MES -- RECUPERANDO AS TABELAS DO BD
SELECT * FROM TB_MODELO -- RECUPERANDO AS TABELAS DO BD
SELECT * FROM TB_FABRICANTE  -- RECUPERANDO AS TABELAS DO BD
SELECT * FROM TB_VEICULO -- RECUPERANDO AS TABELAS DO BD
SELECT * FROM TB_VENDAS -- RECEBENDO AS TABELAS DO BD

---=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=---

-- AC03: BANCO DE DADOS

-- EXERC�CIO 1:
-- Qual o n�mero de registros existentes na tabela VendasAnuais ?

	SELECT COUNT(*) AS REGISTROS FROM TB_VENDAS

-- EXERC�CIO 2:
-- Qual o acumulado da quantidade de vendas Totais at� o momento ?
	
	SELECT			SUM(QTD)		AS	TOTAL_QTD
	FROM			TB_VENDAS

-- EXERC�CIO 3:
-- Quais as quantidades de vendas Totais at� o momento para: menor venda, m�dia de vendas e a maior venda?

	SELECT			MIN(QTD)		AS VENDA_MINIMA,
					MAX(QTD)        AS VENDA_MAXIMA,
					AVG(QTD)		AS MEDIA
	FROM			TB_VENDAS       


-- EXERC�CIO 4:
-- Extraia a soma das vendas anuais por ano em ordem descendente.

	SELECT			QTD				AS	TOTAL_QTD
	FROM			TB_VENDAS  
	ORDER BY		TOTAL_QTD DESC

-- EXERC�CIO 5:
-- Traga a soma das vendas anuais para o ve�culo/modelo CG 125 STD (as informa��es do ve�culo devem constar na query).

	SELECT			QTD				AS	TOTAL_QTD
	FROM			TB_VENDAS  
	WHERE			ID_ANO_DA_VENDA LIKE '122'  -- ID DA CG: 122 -> RETORNAR A TB_MODELO
	ORDER BY		TOTAL_QTD DESC

-- EXERC�CIO 6:
/* Traga as primeiras datas (ANOS) de FABRICA��O de todos os ve�culos e modelos, ordenados pelo nome do fabricante (ascendente), 
ano (descendente), Ve�culo (ascendente) e Modelo (descendente). Todas as informa��es solicitadas, inclusive ordena��o, devem constar 
na query. */

	SELECT		ANO							AS FABRICACAO	,
				TB_FABRICANTE.NOME			AS FABRICANTE	,
				TB_ANO.ANO					AS ANO			,
				TB_VEICULO.DESCRICAO		AS VEICULO		,
				TB_MODELO.DESCRICAO			AS MODELO		

	FROM		TB_VENDAS									,
				TB_FABRICANTE								,
				TB_ANO										,
				TB_VEICULO									,
				TB_MODELO
	
	WHERE ID_ANO = ID_ANO_FABRICACAO 
	
	ORDER BY	FABRICANTE									,
				FABRICACAO				ASC					,
				ANO						DESC				,
				VEICULO					ASC					,
				MODELO					DESC

		
-- EXERC�CIO 7:
-- Extraia a menor, maior, m�dia e a soma das vendas de cada m�s do ano de 2000, em ordem ascendente.


		SELECT	ANO						,
				MES						,
				SUM(QTD) AS SOMA		,
				MAX(QTD) AS MAIOR		,
				MIN(QTD) AS MENOR		,
				AVG(QTD) AS MEDIA
		FROM TB_VENDAS AS VENDAS
		INNER JOIN TB_ANO AS AN ON VENDAS.ID_ANO_DA_VENDA = AN.ID_ANO
		INNER JOIN TB_MES AS ME ON VENDAS.ID_MES_DA_VENDA = ME.ID_MES
		WHERE AN.ANO LIKE  '2000' 
		GROUP BY	ANO ,
					MES 
		ORDER BY	
			SOMA	ASC						,
			MAIOR	ASC						,
			MENOR	ASC						,
			MEDIA	ASC
	
	SELECT * FROM TB_VENDAS 

-- EXERC�CIO 8:
-- Retorne a mesma consulta anterior, mas somente os registros que tiverem m�dia de vendas superior a 500.

		SELECT	ANO   ,
				MES   ,
				SUM(QTD) AS SOMA,
				MAX(QTD) AS MAIOR ,
				MIN(QTD) AS MENOR,
				AVG(QTD) AS MEDIA
		FROM TB_VENDAS AS VENDAS
		INNER JOIN TB_ANO AS AN ON VENDAS.ID_ANO_DA_VENDA = AN.ID_ANO
		INNER JOIN TB_MES AS ME ON VENDAS.ID_MES_DA_VENDA = ME.ID_MES
		WHERE AN.ANO =  2000 
		GROUP BY	ANO ,
					MES 
		HAVING AVG(QTD) > 500
		ORDER BY SOMA ASC ,
		MAIOR ASC ,
		MENOR ASC,
		MEDIA ASC
		
