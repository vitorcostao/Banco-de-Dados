# Respostas Hands On 5

### 1. Projetar o primeiro nome e o último nome dos atores que são diretores

**Consulta:**
```
A = π first_name, last_name ( actors )
B = π first_name, last_name ( directors )
A ∩ B
```

**Explicação:**
Esta consulta identifica indivíduos que são tanto atores quanto diretores. Primeiro, ela projeta o `first_name` e `last_name` da tabela `actors` para criar um conjunto `A`. Em seguida, faz o mesmo para a tabela `directors`, criando o conjunto `B`. Finalmente, a operação de interseção (`∩`) entre `A` e `B` retorna os nomes que aparecem em ambas as listas, ou seja, os atores que também são diretores.




### 2. Projetar o primeiro nome e o último nome dos atores que não são diretores

**Consulta:**
```
A = π first_name, last_name ( actors )
B = π first_name, last_name ( directors )
A - B
```

**Explicação:**
Esta consulta encontra os atores que não possuem o papel de diretor. Similar à consulta anterior, `A` representa o conjunto de nomes de atores e `B` representa o conjunto de nomes de diretores. A operação de diferença (`-`) entre `A` e `B` resulta em um conjunto de nomes que estão presentes em `A` mas não em `B`, ou seja, atores que não são diretores.




### 3. Projetar o primeiro nome e o último nome dos atores e diretores

**Consulta:**
```
A = π first_name, last_name ( actors )
B = π first_name, last_name ( directors )
A ∪ B
```

**Explicação:**
Esta consulta combina os nomes de todos os atores e diretores em uma única lista, removendo duplicatas. `A` é o conjunto de nomes de atores e `B` é o conjunto de nomes de diretores. A operação de união (`∪`) entre `A` e `B` resulta em um conjunto que contém todos os nomes únicos de indivíduos que são atores ou diretores (ou ambos).




### 4. Projetar o nome dos filmes que não são dirigidos por nenhum diretor

**Consulta:**
```
A = π id ( movies )
B = π movie_id ( movies_directors )
C = A - B
D = ρ idm←id ( C )
E = D ⨝ idm = id movies
π name ( E )
```

**Explicação:**
Esta consulta identifica filmes que não estão associados a nenhum diretor na tabela `movies_directors`. Primeiro, `A` obtém todos os `id`s de filmes da tabela `movies`. `B` obtém todos os `movie_id`s da tabela `movies_directors`. A diferença `C = A - B` resulta nos `id`s de filmes que estão em `movies` mas não em `movies_directors`, ou seja, filmes sem diretor. Em seguida, `C` é renomeado para `D` (com `id` virando `idm`), e `D` é unido com a tabela `movies` para recuperar os nomes (`name`) desses filmes.




### 5. Projetar primeiro nome e o último nome dos atores que não atuaram em pelo menos dois filmes

**Consulta:**
```
A = γ actor_id; count(movie_id)→Total ( roles )
B = σ Total >= 2 ( A )
C = π actor_id ( B )
D = π id ( actors )
E = D - C
F = ρ ida←id ( E )
G = F ⨝ ida = id actors
π first_name, last_name ( G )
```

**Explicação:**
Esta consulta encontra os atores que atuaram em menos de dois filmes. Primeiro, `A` agrupa a tabela `roles` por `actor_id` e conta o número de `movie_id`s para cada ator, resultando no `Total` de filmes. `B` seleciona os atores que atuaram em 2 ou mais filmes (`Total >= 2`). `C` projeta apenas os `actor_id`s desses atores. `D` obtém todos os `id`s de atores da tabela `actors`. A diferença `E = D - C` resulta nos `id`s dos atores que atuaram em menos de 2 filmes. Em seguida, `E` é renomeado para `F` (com `id` virando `ida`), e `F` é unido com a tabela `actors` para projetar o `first_name` e `last_name` desses atores.




### 6. Projetar, por gênero e ano, o número médio de filmes com menos de dois atores atuando.

**Consulta:**
```
A = γ movie_id; count(actor_id)→Total ( roles )
B = σ Total >= 2 ( A )
C = π movie_id ( B )
D = π id ( movies )
E = D - C
F = ρ idm←id ( E )
G = F idm = id movies⨝
H = G ⨝ id = movie_id movies_genres
γ genre, year;count(id)→Total ( H )
```

**Explicação:**
Esta consulta visa encontrar o número de filmes, por gênero e ano, que tiveram menos de dois atores atuando. Primeiro, `A` agrupa a tabela `roles` por `movie_id` e conta o número de `actor_id`s para cada filme, resultando no `Total` de atores por filme. `B` seleciona os filmes que tiveram 2 ou mais atores (`Total >= 2`). `C` projeta apenas os `movie_id`s desses filmes. `D` obtém todos os `id`s de filmes da tabela `movies`. A diferença `E = D - C` resulta nos `id`s dos filmes que tiveram menos de 2 atores. Em seguida, `E` é renomeado para `F` (com `id` virando `idm`), e `F` é unido com a tabela `movies` para obter os detalhes dos filmes. O resultado é então unido com `movies_genres` para associar os gêneros. Finalmente, `H` é agrupado por `genre` e `year`, e o `count(id)` é calculado para obter o `Total` de filmes que se encaixam no critério por gênero e ano.



