SELECT A.CodFilme, B.Nome
FROM Midias A, Filmes B
WHERE A.CodFilme = B.Codigo
AND A.Tipo = "DVD"

UNION

SELECT A.CodFilme, B.Nome
FROM Midias A, Filmes B
WHERE A.CodFilme = B.Codigo
AND A.Tipo = "VHS"