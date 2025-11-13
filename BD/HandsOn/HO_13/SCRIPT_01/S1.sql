SELECT A.CPF, A.Nome
FROM Funcionarios A, Funcionarios D
WHERE A.CPF = D.CPF_Supervisor

EXCEPT

SELECT B.CPF, B.Nome
FROM Funcionarios B, Clientes C 
WHERE B.CPF = C.CPF