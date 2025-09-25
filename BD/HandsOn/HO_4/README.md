# Respostas Hands On

### 1. Projetar o primeiro nome e o último nome dos atores de sexo feminino

**Consulta:**
```
A = σ gender = 'F' ( actors )
π first_name, last_name ( A )
```

**Explicação:**
Esta consulta seleciona todos os atores da tabela `actors` onde o `gender` (gênero) é 'F' (feminino). O resultado dessa seleção é então projetado para mostrar apenas as colunas `first_name` (primeiro nome) e `last_name` (último nome) dos atores, efetivamente listando o nome completo de todas as atrizes.




### 2. Projetar o nome dos filmes com ano superior à 1999

**Consulta:**
```
A = σ year > 1999 ( movies )
π name ( A )
```

**Explicação:**
Esta consulta filtra a tabela `movies` (filmes) para incluir apenas aqueles cujo `year` (ano de lançamento) é posterior a 1999. Em seguida, projeta a coluna `name` (nome) dos filmes resultantes, fornecendo uma lista de todos os filmes lançados a partir do ano 2000.




### 3. Projetar o nome do filme e o nome do diretor de cada filme

**Consulta:**
```
X = ρ idMovie ← id ( movies )
A = X ⨝ idMovie = movie_id movies_directors
B = A ⨝ director_id = id directors
π name, first_name, last_name ( B )
```

**Explicação:**
Esta consulta envolve a junção de três tabelas para associar filmes aos seus diretores. Primeiro, a tabela `movies` é renomeada para `X`, com a coluna `id` renomeada para `idMovie`. Em seguida, `X` é unida com `movies_directors` usando `idMovie = movie_id`. O resultado é então unido com a tabela `directors` usando `director_id = id`. Finalmente, as colunas `name` (do filme), `first_name` e `last_name` (do diretor) são projetadas, resultando em uma lista de filmes e seus respectivos diretores.




### 4. Projetar o nome do filme, nome do ator e o papel que cada ator teve no filme para filmes com ranking acima da nota 6

**Consulta:**
```
Y = σ rank > 6 ( movies )
X = ρ idMovie ← id ( Y )
A = X ⨝ idMovie = movie_id roles
B = A ⨝ actor_id = id actors
π name, first_name, last_name, role ( B )
```

**Explicação:**
Esta consulta identifica filmes com um ranking (nota) superior a 6 e, para esses filmes, lista o nome do filme, o nome do ator e o papel desempenhado. Inicia-se selecionando filmes com `rank > 6` na tabela `movies`, renomeando o `id` do filme para `idMovie`. Em seguida, essa seleção é unida com a tabela `roles` (papéis) e, posteriormente, com a tabela `actors` (atores). Finalmente, projeta-se o `name` do filme, `first_name` e `last_name` do ator, e o `role` (papel) que o ator teve no filme.




### 5. Projetar o nome do diretor e o número de filmes que cada diretor dirigiu

**Consulta:**
```
A = γ director_id;count(movie_id)→Total ( movies_directors )
B = A ⨝ director_id = id directors
π first_name, last_name, Total ( B )
```

**Explicação:**
Esta consulta calcula o número total de filmes dirigidos por cada diretor. Primeiro, agrupa a tabela `movies_directors` por `director_id` e conta o número de `movie_id` para cada diretor, armazenando o resultado como `Total`. Em seguida, une esse resultado com a tabela `directors` para obter os nomes dos diretores. Finalmente, projeta o `first_name`, `last_name` e o `Total` de filmes dirigidos por cada um.




### 6. Projetar o gênero e o número de filmes de cada gênero

**Consulta:**
```
γ genre;count(movie_id)→Total ( movies_genres )
```

**Explicação:**
Esta consulta agrupa a tabela `movies_genres` por `genre` (gênero) e conta o número de `movie_id` (filmes) associados a cada gênero. O resultado é uma lista de gêneros e o `Total` de filmes pertencentes a cada um.




### 7. Projetar o gênero, o ranking (nota) médio, mínimo e máximo dos filmes do gênero.

**Consulta:**
```
A = movies ⨝ id = movie_id movies_genres
γ genre;avg(rank)→Medio,min(rank)→Minimo,max(rank)→Maximo ( A )
```

**Explicação:**
Esta consulta calcula as estatísticas de ranking (nota) para cada gênero de filme. Primeiro, une as tabelas `movies` e `movies_genres` usando `id = movie_id` para associar os rankings aos gêneros. O resultado dessa junção é então agrupado por `genre`, e são calculados o `avg(rank)` (média), `min(rank)` (mínimo) e `max(rank)` (máximo) dos rankings para cada gênero, renomeados para `Medio`, `Minimo` e `Maximo`, respectivamente.



