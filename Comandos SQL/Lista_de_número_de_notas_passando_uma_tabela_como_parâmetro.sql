SELECT tdc.[CPF], tdc.[NOME], SUM(inf.[QUANTIDADE] * inf.[PREÇO]) AS FATURAMENTO
FROM [TABELA DE CLIENTES] tdc INNER JOIN [NOTAS FISCAIS] nf 
ON tdc.CPF = nf.CPF AND YEAR(nf.[DATA]) = 2016
INNER JOIN [ITENS NOTAS FISCAIS] inf ON nf.NUMERO = inf.NUMERO 
GROUP BY tdc.CPF ,tdc.NOME 

CREATE TYPE ListaClientes AS TABLE (CPF VARCHAR (12) NOT NULL)

DECLARE @Lista AS ListaClientes 
INSERT INTO @Lista (CPF) VALUES ('8502682733'), ('8719655770'), ('9283760794')
SELECT * FROM @Lista

SELECT * FROM [TABELA DE CLIENTES] tdc 
--------------------------------------------------------------------------------------------

DECLARE @Lista AS ListaClientes 
INSERT INTO @Lista (CPF) VALUES ('8502682733'), ('8719655770'), ('9283760794')

SELECT tdc.[CPF], tdc.[NOME], SUM(inf.[QUANTIDADE] * inf.[PREÇO]) AS FATURAMENTO
FROM [TABELA DE CLIENTES] tdc INNER JOIN [NOTAS FISCAIS] nf 
ON tdc.CPF = nf.CPF AND YEAR(nf.[DATA]) = 2016
INNER JOIN [ITENS NOTAS FISCAIS] inf ON nf.NUMERO = inf.NUMERO 
INNER JOIN @Lista L ON tdc.CPF = L.CPF 
GROUP BY tdc.CPF ,tdc.NOME 


--------------------------------------------------------------------------------------------

CREATE PROCEDURE FaturamentoClientes2016
@Lista AS ListaClientes READONLY 
AS
SELECT tdc.[CPF], tdc.[NOME], SUM(inf.[QUANTIDADE] * inf.[PREÇO]) AS FATURAMENTO
FROM [TABELA DE CLIENTES] tdc INNER JOIN [NOTAS FISCAIS] nf 
ON tdc.CPF = nf.CPF AND YEAR(nf.[DATA]) = 2016
INNER JOIN [ITENS NOTAS FISCAIS] inf ON nf.NUMERO = inf.NUMERO 
INNER JOIN @Lista L ON tdc.CPF = L.CPF 
GROUP BY tdc.CPF ,tdc.NOME 

DECLARE @Lista AS ListaClientes 
INSERT INTO @Lista (CPF) VALUES ('5840119709'), ('7771579779'), ('9283760794')
EXEC FaturamentoClientes2016 @Lista = @lista

SELECT * FROM [TABELA DE CLIENTES] tdc 



