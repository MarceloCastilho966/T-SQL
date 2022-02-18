SELECT RAND()

-- Valor Minimo seja 1
-- Valor Maximo seja 10

SELECT ((10 - 1 -1 ) * RAND() +1)
--------------------------------------

-- Valor Minimo seja 100
-- Valor Maximo seja 500

SELECT ((500 - 100 -1 ) * RAND() +100)
-----------------------------------------

-- Sem casas decimais

SELECT ROUND(((500 - 100 -1 ) * RAND() +100),0)
-------------------------------------------------------------------

CREATE FUNCTION NumeroAleatorio (@VAL_INIC INT, @VAL_FIN INT) RETURNS INT
BEGIN
	DECLARE @ALEATORIO INT
	SET @ALEATORIO = ROUND(((@VAL_FIN - @VAL_INIC -1 ) * RAND() +@VAL_INIC),0)
	RETURN @ALEATORIO
END
-- SQL Error [443] [S0001]: Uso inválido de um operador de efeito lateral 'rand' em uma função.
-- Não me deixa criar. Preciso criar uma VIEW primeiro

--------------------------------------------------------------------------------------------
CREATE VIEW VW_ALEATORIO AS SELECT RAND() AS VALUE



CREATE FUNCTION NumeroAleatorio (@VAL_INIC INT, @VAL_FIN INT) RETURNS INT
BEGIN
	DECLARE @ALEATORIO INT
	DECLARE @ALEATORIO_FLOAT FLOAT
	SELECT @ALEATORIO_FLOAT = VALUE FROM VW_ALEATORIO 
	SET @ALEATORIO = ROUND(((@VAL_FIN - @VAL_INIC -1 ) * @ALEATORIO_FLOAT +@VAL_INIC),0)
	RETURN @ALEATORIO
END

SELECT dbo.NumeroAleatorio (1,3)
