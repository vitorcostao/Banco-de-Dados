SELECT A.CPF_Cliente, A.ID_Midia, A.DataLocacao
FROM Aluguel A, Clientes B, Pagamentos C
WHERE A.CPF_Cliente = B.CPF
AND C.CPF_Cliente = A.CPF_Cliente
AND C.ID_Midia = A.ID_Midia
AND C.DataLocacao = A.DataLocacao

EXCEPT

SELECT A.CPF_Cliente, A.ID_Midia, A.DataLocacao
FROM Aluguel A, Clientes B
WHERE A.CPF_Cliente = B.CPF
AND B.Sexo = "F";
