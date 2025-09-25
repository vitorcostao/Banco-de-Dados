# Respostas Hands On

### 1. Projetar o primeiro nome e o último nome dos atores de sexo feminino

**Consulta:**
```sql
SELECT first_name, last_name
FROM actors
WHERE gender = 'F'
```

**Explicação:**
Esta consulta SQL seleciona o `first_name` (primeiro nome) e o `last_name` (último nome) de todos os atores da tabela `actors` onde a coluna `gender` (gênero) é igual a 'F' (feminino). O resultado é uma lista com o nome completo de todas as atrizes presentes no banco de dados.




### 2. Projetar o nome dos filmes com ano superior à 1999

**Consulta:**
```sql
SELECT name
FROM movies
WHERE year > 1999
```

**Explicação:**
Esta consulta SQL retorna o `name` (nome) de todos os filmes da tabela `movies` cujo `year` (ano de lançamento) é maior que 1999. Em outras palavras, ela lista todos os filmes lançados a partir do ano 2000.




### 3. Projetar o nome do filme e o nome do diretor de cada filme

**Consulta:**
```sql
SELECT A.name, B.first_name, B.last_name
FROM movies as A 
JOIN movies_directors as C ON (A.id = C.movie_id) 
JOIN directors as B ON (B.id = C.director_id)
```

**Explicação:**
Esta consulta utiliza `JOIN`s para combinar informações de três tabelas: `movies`, `movies_directors` e `directors`. Ela associa filmes (`movies` as `A`) com seus diretores (`directors` as `B`) através da tabela intermediária `movies_directors` (as `C`). O resultado inclui o nome do filme (`A.name`) e o primeiro e último nome do diretor (`B.first_name`, `B.last_name`) para cada filme.




### 4. Projetar o nome do filme, nome do ator e o papel que cada ator teve no filme para filmes com ranking acima da nota 6

**Consulta:**
```sql
SELECT A.name, B.first_name, B.last_name, C.role
FROM movies as A 
JOIN roles as C ON (A.id = C.movie_id) 
JOIN actors as B ON (B.id = C.actor_id)
WHERE A.rank > 6
```

**Explicação:**
Esta consulta complexa busca detalhes sobre filmes, atores e seus papéis, filtrando apenas filmes com `rank` (nota) superior a 6. Ela une as tabelas `movies` (as `A`), `roles` (as `C`) e `actors` (as `B`). O `WHERE A.rank > 6` garante que apenas filmes bem avaliados sejam considerados. O resultado exibe o nome do filme, o primeiro e último nome do ator, e o papel (`C.role`) que o ator desempenhou no filme.




### 5. Projetar o nome do diretor e o número de filmes que cada diretor dirigiu

**Consulta:**
```sql
SELECT A.id, A.first_name, A.last_name, COUNT(*) as TOTAL
FROM directors as A JOIN movies_directors as B ON (A.id = B.director_id)
GROUP BY A.id, A.first_name, A.last_name
```

**Explicação:**
Esta consulta calcula o número total de filmes dirigidos por cada diretor. Ela une a tabela `directors` (as `A`) com a tabela `movies_directors` (as `B`) usando o `id` do diretor. Em seguida, agrupa os resultados pelo `id`, `first_name` e `last_name` do diretor e usa a função `COUNT(*)` para contar o número de filmes (`TOTAL`) associados a cada diretor.




### 6. Projetar o gênero e o número de filmes de cada gênero

**Consulta:**
```sql
SELECT genre, COUNT(*) as TOTAL
FROM movies_genres
GROUP BY genre
```

**Explicação:**
Esta consulta agrega os dados da tabela `movies_genres` para contar quantos filmes pertencem a cada `genre` (gênero). O `GROUP BY genre` organiza os resultados por gênero, e `COUNT(*)` calcula o número total de filmes para cada um, apresentando-o como `TOTAL`.




### 7. Projetar o gênero, o ranking (nota) médio, mínimo e máximo dos filmes do gênero.

**Consulta:**
```sql
SELECT A.genre, AVG(B.rank) as MEDIA, MIN(B.rank) as MINIMO, MAX(B.rank) as MAXIMO
FROM movies_genres as A JOIN movies as B ON (A.movie_id = B.id)
GROUP BY A.genre
```

**Explicação:**
Esta consulta calcula estatísticas de ranking (nota) para cada gênero de filme. Ela une a tabela `movies_genres` (as `A`) com a tabela `movies` (as `B`) usando `movie_id = B.id` para associar os rankings aos gêneros. Os resultados são agrupados por `A.genre`, e as funções `AVG(B.rank)`, `MIN(B.rank)` e `MAX(B.rank)` são usadas para calcular a média, o mínimo e o máximo dos rankings, respectivamente, para cada gênero, renomeados para `MEDIA`, `MINIMO` e `MAXIMO`.



