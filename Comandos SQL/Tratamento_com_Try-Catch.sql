CREATE PROCEDURE TrataErroZerotry
@CPF VARCHAR (12), @ANO INT, @DENOMINADOR INT, @MENSAGEM VARCHAR (50) OUTPUT
AS
BEGIN 
	BEGIN TRY
	SELECT SUM(inf.[QUANTIDADE] * inf.[PREÇO]) AS FATURAMENTO,
	SUM(inf.[QUANTIDADE] * inf.[PREÇO])/@DENOMINADOR AS COMISSAO
	FROM [TABELA DE CLIENTES] tdc INNER JOIN [NOTAS FISCAIS] nf ON tdc.CPF = nf.CPF 
	INNER JOIN [ITENS NOTAS FISCAIS] inf ON inf.NUMERO = nf.NUMERO 
	WHERE tdc.CPF = @CPF AND YEAR(nf.[DATA]) = @ANO
	
	END TRY 
	BEGIN CATCH
		SET @MENSAGEM = 'Houve um erro número ' + CONVERT(VARCHAR(10), @@ERROR)
	END CATCH 
END



DECLARE @DENOMINADOR INT
DECLARE @CPF VARCHAR (12)
DECLARE @ANO INT
DECLARE @MENSAGEM VARCHAR (50)

SET @CPF = '1471156710'
SET @ANO = 2016
SET @DENOMINADOR = 0
SET @MENSAGEM = ''
EXEC TrataErroZerotry @CPF = @CPF, @ANO = @ANO, @DENOMINADOR = @DENOMINADOR, @MENSAGEM = @MENSAGEM OUTPUT
IF @MENSAGEM <> ''
	PRINT @MENSAGEM








