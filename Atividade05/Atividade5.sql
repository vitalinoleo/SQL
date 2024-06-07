-- Exercicio1
SELECT cli.NOME , ven.DUPLIC , ven.VALOR 
FROM cliente cli
INNER JOIN venda ven ON 
cli.CODCLI = ven.CODCLI
WHERE cli.NOME = 'PCTEC - MICROCOMPUTADORES S/A';
 

-- Exercicio2
SELECT cli.NOME , ven.DUPLIC , ven.VENC 
FROM cliente cli
INNER JOIN venda ven ON 
cli.CODCLI = ven.CODCLI
WHERE ven.VENC >= '2004-11-01' AND ven.VENC <= '2004-11-30'
ORDER BY ven.VENC;


-- Exercicio3 
SELECT cli.NOME , ven.DUPLIC , ven.VENC 
FROM cliente cli
INNER JOIN venda ven ON 
cli.CODCLI = ven.CODCLI
WHERE EXTRACT(MONTH FROM ven.VENC) = 10
ORDER BY ven.VENC;


-- Exercicio4 
SELECT cli.NOME , COUNT(ven.DUPLIC), SUM(ven.VALOR)
FROM cliente cli
LEFT JOIN venda ven ON 
cli.CODCLI = ven.CODCLI
GROUP BY cli.NOME;


-- Exercicio5
SELECT cli.NOME , COUNT(ven.DUPLIC), SUM(ven.VALOR) 
FROM cliente cli
LEFT JOIN venda ven ON 
cli.CODCLI = ven.CODCLI
GROUP BY cli.NOME;
 

-- Exercicio6
SELECT cli.NOME , COUNT(ven.DUPLIC) 
FROM cliente cli
INNER JOIN venda ven ON 
cli.CODCLI = ven.CODCLI
WHERE ven.VENC < '2003-12-31'
GROUP BY cli.NOME;


-- Exercicio7 
SELECT cli.NOME , ven.DUPLIC, ven.VALOR, (ven.VALOR * 0.10), (ven.VALOR * 1.10) 
FROM cliente cli
INNER JOIN venda ven ON 
cli.CODCLI = ven.CODCLI
WHERE ven.VENC < '2000-01-01'
ORDER BY cli.NOME;



