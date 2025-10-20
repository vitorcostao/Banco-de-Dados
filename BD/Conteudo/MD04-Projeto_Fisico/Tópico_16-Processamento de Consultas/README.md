# Resumo: Processamento de Consulta

## Introdução

Os SGBDs são responsáveis por processar, otimizar e executar as consultas necessárias. Desse modo, para realização de processamento existem
as seguintes etapas:

- **Parsing:** Análise sintática
  - Varredura de tokenização.
  - Análise de regras gramaticais SQL.
  - Validação de metadados e esquemas

- **Otimização:** Escolha da estratégia eficiente para exucução da consulta
  - Árvore de consulta que é uma representação interna da consulta.
  - Plano de execução para a estratégia.
 
- **Geração de código:** Código compilado ou interpretado para execução.

## Tradução - Parsing

Durante o parsing, a consulta é traduzida para álgebra relacional ao decompor em blocos de expressões SELECT-FROM-WHERE

```bash
SELECT CPF, Nome FROM PROFESSOR WHERE Salario >
(SELECT AVG(Salario) FROM PROFESSOR WHERE Sexo = 'M');

SELECT CPF, Nome
FROM PROFESSOR           - π CPF, Nome (σ Salario > X (Professor))
WHERE Sexo = 'M';

SELECT AVG(Salario)
FROM PROFESSOR           - γ AVG(Salario) (σ Sexo = 'M' (Professor))
WHERE Sexo = 'M';
```


## Algoritmos

Processar consultas envolve a escolha de algoritmos corretos para manter eficiência e integridade dos dados.

- Ordenação: Agregação, Conjunto, Junção, Projeção (Distinct).
- Pesquisa: Junção e Seleção.
- Hashing: Agregação, Conjunto, Junção, Projeção e Seleção.

Além disso, o próprio SGBD escolhe as estratégias adequadas para armazenar e organizar os dados, seja pela memória primária livre, em que ocorre um hashing em operação de junção, seja pelo arquivo ordenado, em que ocorre uma pesquisa binária em operação com junção.



## Algoritmo: Ordenação Externa

__**Estratégia de ordenação e intercalação (merge-sort) de registros em disco**__

- **Ordenação:** Partes(runs) do arquivo são transferidas do disco para memória primária, ordenadas em memória primária e regravadas em disco (No repositório de Algoritmos e Estruturas de Dados possui exemplos).

    - Bm: Buffers disponíveis em memória primária.
    - Bd: Blocos do arquivo em disco.
    - R = $$\left\lceil \frac{R}{BM} \right\rceil$$ são os Runs

- **Intercalação:** Trata-se das mesclagem dos runs ordenadas em discos.

    - Grau(D) = min((Bm - 1), R): Trata-se dos runs mesclados em cada passo.
    - $$S = \log_D R$$: Corresponde aos passos de intercalação.


### Exemplo de Merge-Sort

<img width="721" height="355" alt="image" src="https://github.com/user-attachments/assets/ce686489-03d4-40d6-8a7e-e9f8e3ede926" />

Para ordenar um arquivo que ocupa **1024 blocos** em disco utilizando **5 buffers**, inicialmente são geradas **205 runs ordenadas em disco**, uma vez que cada run pode ser carregada em um buffer. Assim:

$$R = 1024$$

O **grau de intercalação (D)** é determinado pelo número de buffers disponíveis menos um, pois um buffer é reservado para escrita. Portanto:

$$D = \min((5 - 1), 205) = 4$$

O **número de passagens (S)** necessárias para a intercalação completa é dado por:

$$S = \log_{4}{205} \approx 4$$

Isso significa que serão necessárias quatro fases para completar a ordenação. O processo de intercalação ocorre da seguinte forma:

- **Passo 1:** as 205 runs iniciais são mescladas 4 a 4, resultando em 52 novas runs.  
- **Passo 2:** as 52 runs são novamente mescladas 4 a 4, formando 13 runs.  
- **Passo 3:** as 13 runs são mescladas 4 a 4, produzindo 4 runs.  
- **Passo 4:** as 4 runs finais são mescladas, obtendo-se uma única run ordenada, ou seja, o arquivo totalmente ordenado.

---

## Algoritmos: Projeção(π)

Estratégias envolvem eliminar registros duplicados

 - Ordenação-Intercalação O(nlogn)

     - Ordena-se o resultado da projeção e varre-se sequencialmente registros removendo duplicatas registrosadjacentes.
       
 - Hashing O(n)
     - Computa-se um endereço de partição (bucket) a partir de uma função hash sobre cada registro de resultado, alocando-o no bucket correspondente.
    - Antes da alocação verifica-se se o registro já está presente no bucket, somente
 alocando-o se não estiver presente.

---

## Algoritmos: Seleção(σ)

Inúmeras estratégias possíveis, dependendo da existência de índices e da característica e complexidade da condição de seleção

 - **Arquivo não indexado**

     - Pesquisa Linear O(n): Recupera-se cada registro e verifica-se se valores em campos satisfazem a
 condição de seleção.

     - Pesquisa Binária O(logn): Condição de seleção envolve comparação de `<`, `=`, `>` em campo de ordenação
       
     - Hashing O(1): Condição de seleção envolve comparação de `=` em campo hash.

- **Arquivo Indexado**

    - Índice Primário, de Agrupamento, Secundário ou Multinível O(logn):  
      Condição de seleção envolve comparação de `<`, `=`, `>` em campo de indexação.

    - Índice Hash O(1):  
      Condição de seleção envolve comparação de `=` em campo de indexação.

    - Seleção Conjuntiva (operador AND na condição de seleção)

    - Índice Composto O(logn):  
      Condição de seleção envolve um subconjunto dos campos de indexação, desde que todos os campos iniciais estejam presentes.

- **Seleção Conjuntiva (operador AND na condição de seleção)**

    - Índice Individual O(logn):  
      Pesquisa-se no índice e verifica-se condições remanescentes da seleção.

    - Índice Múltiplo O(logn):  
      Pesquisa-se em cada índice secundário separadamente, realiza-se a intersecção de ponteiros recuperados, e verifica-se condições remanescentes da seleção.

- **Seleção Disjuntiva (operador OR na condição de seleção)**

    - Índice Múltiplo O(logn):  
      Pesquisa-se em cada índice secundário separadamente e realiza-se a união de ponteiros recuperados. Demanda índice para cada campo na condição de seleção.

---

## Algoritmos: Operação de Conjuntos (x u ∩ -)


- Força Bruta O(n²):  
      Produto Cartesiano (⋈) combina-se todos os registros de cada conjunto.

- Ordenação-Intercalação O(n log n):  
      Ordenam-se os registros dos dois conjuntos, varrem-se os dois conjuntos simultaneamente, e a operação de conjunto apropriada é efetuada.

- Hashing O(n):  

    - Computam-se endereços de bucket a partir de uma função hash para alocação dos registros do menor conjunto.  
    - Computa-se a função hash para cada registro do outro conjunto.
    - Aloca-se (união) ou desaloca-se (diferença ou interseção) o registro no bucket correspondente, de acordo com a operação de conjunto utilizada.

---

## Algoritmos: Agregação(γ)



- Completa (campo de agrupamento `GROUP BY` não especificado):

  - O(n): varre-se o arquivo de dados ou o índice, computando a função de agregação.  
  - O(logn): para índice B+Tree no campo usado na função de agregação.
 

- Particionada (campo de agrupamento `GROUP BY` especificado):

  - Ordenação O(n log n): ordena-se o arquivo pelo campo de agrupamento, varrendo-o e computando a função de agregação para cada partição.  
  - Hashing O(n): particiona-se o arquivo em buckets usando o campo de agrupamento e computa-se a função de agregação para cada bucket.  
  - Índice de Agrupamento O(n): arquivo já particionado, bastando computar a função de agregação.

---

## Algoritmos: Junção(⋈)


- Junção de Loop Aninhado O(n²):  

  - Força bruta.
  - Para cada registro, recuperar cada registro.
  - Combinar se satisfazem a condição de junção.

- Junção de Loop Único O(n log n):  

  - Aplicável caso haja índice em ao menos um arquivo.
  - Para cada registro ri, onde R é o arquivo com maior custo de busca.
  - Usar o índice para recuperar os registros que satisfazem a condição de junção, combinando-os com o registro ri.

- Junção Ordenação-Intercalação O(n log n):  

   - Ordena-se os arquivos por campos presentes na condição de junção.  
   - Varrem-se simultaneamente ambos os arquivos pelo campo de ordenação, combinando os registros que satisfazem a condição de junção.  
   - Registros em cada arquivo são acessados apenas uma vez.

- Junção Hash O(n):
  
  - Aplicável para condição de junção com comparação de `=`.  
  - Varre-se o arquivo R de menor tamanho, aplicando uma função hash sobre o campo presente na condição de junção para criar buckets em memória.  
  - Para cada registro de índice, usa-se a função hash para encontrar registros em R que satisfazem a condição de junção, combinando-os com o registro de S.


## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.






