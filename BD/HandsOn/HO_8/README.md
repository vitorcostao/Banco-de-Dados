# Respostas Hands On

### 1. Projetar o primeiro nome e o último nome dos atores que são diretores

**Consulta:**
```sql
SELECT	first_name, last_name
        FROM actors 
INTERSECT
SELECT	first_name, last_name
        FROM directors 
```

**Explicação:**
Esta consulta utiliza o operador `INTERSECT` para encontrar os nomes completos (primeiro e último nome) que aparecem tanto na tabela `actors` quanto na tabela `directors`. O resultado são os indivíduos que desempenham ambos os papéis, sendo atores e diretores no banco de dados.




### 2. Projetar o primeiro nome e o último nome dos atores que não são diretores

**Consulta:**
```sql
SELECT	first_name, last_name
        FROM actors 
EXCEPT
SELECT	first_name, last_name
        FROM directors 
```

**Explicação:**
Utilizando o operador `EXCEPT`, esta consulta retorna os nomes completos de todos os indivíduos que estão presentes na tabela `actors` mas não na tabela `directors`. Em outras palavras, ela lista os atores que não possuem nenhum registro como diretor no banco de dados.




### 3. Projetar o primeiro nome e o último nome dos atores e diretores

**Consulta:**
```sql
SELECT	first_name, last_name
        FROM actors 
UNION
SELECT	first_name, last_name
        FROM directors 
```

**Explicação:**
Esta consulta emprega o operador `UNION` para combinar os nomes completos de todos os atores e diretores em uma única lista. O `UNION` automaticamente remove duplicatas, garantindo que cada nome apareça apenas uma vez, mesmo que o indivíduo seja tanto ator quanto diretor.




### 4. Projetar o nome dos filmes que não são dirigidos por nenhum diretor

**Consulta:**
```sql
SELECT	X.name
        FROM movies as X JOIN (
        SELECT	A.id
                FROM movies as A
        EXCEPT
        SELECT	B.movie_id
                FROM movies_directors as B 
        ) as Y ON X.id = Y.id
```

**Explicação:**
Esta consulta identifica filmes que não possuem diretores associados na tabela `movies_directors`. A subconsulta (`SELECT A.id FROM movies as A EXCEPT SELECT B.movie_id FROM movies_directors as B`) encontra os IDs de filmes que estão na tabela `movies` mas não na `movies_directors`. O resultado dessa subconsulta (apelidado de `Y`) é então unido com a tabela `movies` (apelidada de `X`) para recuperar o `name` dos filmes correspondentes.




### 5. Projetar primeiro nome e o último nome dos atores que não atuaram em pelo menos dois filmes

**Consulta:**
```sql
SELECT	X.first_name, X.last_name
          FROM	actors as X JOIN (
          SELECT id
                    FROM actors
          EXCEPT
          SELECT A.actor_id
                 FROM(
                 SELECT actor_id, COUNT(*) as TOTAL
                        FROM roles
                        GROUP BY actor_id
                        HAVING TOTAL >= 2
                 ) as A
          ) as Y ON X.id = Y.id
```

**Explicação:**
Esta consulta identifica atores que atuaram em menos de dois filmes. A subconsulta mais interna agrupa a tabela `roles` por `actor_id` e conta o número de filmes (`TOTAL`) para cada ator, filtrando aqueles com `TOTAL >= 2`. A subconsulta intermediária usa `EXCEPT` para encontrar os `id`s de atores que estão na tabela `actors` mas não na lista de atores que atuaram em pelo menos dois filmes. Finalmente, o resultado é unido com a tabela `actors` para projetar o `first_name` e `last_name` desses atores.




### 6. Projetar, por gênero e ano, o número médio de filmes com menos de dois atores atuando.

**Consulta:**
```sql
SELECT	  X.genre, K.year, COUNT(*) as TOTAL
          FROM	movies_genres as X JOIN (
          SELECT id
                 FROM movies
          EXCEPT
          SELECT A.movie_id
                 FROM(
                     SELECT movie_id, COUNT(*) as TOTAL
                            FROM roles
                            GROUP BY movie_id
                            HAVING TOTAL >= 2
                     ) as A
          ) as Y ON X.movie_id = Y.id
JOIN movies as K ON (K.id = Y.id)
GROUP BY X.genre, K.year
```

**Explicação:**
Esta consulta complexa calcula o número de filmes, por gênero e ano, que tiveram menos de dois atores. A subconsulta mais interna identifica os `movie_id`s de filmes com dois ou mais atores. A subconsulta intermediária usa `EXCEPT` para encontrar os `id`s de filmes que tiveram menos de dois atores. Esse resultado (`Y`) é então unido com `movies_genres` (as `X`) para obter o gênero e com `movies` (as `K`) para obter o ano. Finalmente, os resultados são agrupados por `genre` e `year`, e `COUNT(*)` calcula o `TOTAL` de filmes que atendem aos critérios.



