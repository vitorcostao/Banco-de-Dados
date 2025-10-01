# Resumo: Fundamento em Bancos de Dados relacionais Álgebra Relacional I

Este estudo aborda a Álgebra Relacional, um conjunto de operações para manipulação de bancos de dados relacionais. O material é distribuído sob licença CC BY-NC-ND 4.0.

## Álgebra Relacional

A Álgebra Relacional é uma linguagem formal para o modelo relacional, onde consultas são especificadas por uma sequência de operações algébricas. O resultado de uma consulta é uma nova relação. O SQL incorpora seus principais conceitos. As operações podem ser unárias (aplicadas sobre uma relação), binárias (aplicadas sobre duas relações) ou de agregação (resumem dados de relações).

## Operações Fundamentais:




### Operação SELEÇÃO (σ - sigma)

Esta operação unária filtra tuplas de uma relação (R) que satisfazem uma condição booleana. As tuplas que não satisfazem a condição são descartadas. A relação resultante tem os mesmos atributos de R, mas com um número menor ou igual de tuplas. A condição de seleção pode envolver atributos, operadores de comparação (=, <>, <, <=, >, >=) e valores, conectados por operadores booleanos (∧, ∨, ¬). É uma operação comutativa.




### Operação PROJEÇÃO (π - pi)

Esta operação unária filtra atributos de uma relação (R), descartando os não especificados. A relação resultante possui um subconjunto dos atributos de R na mesma ordem. O número de tuplas na relação resultante é menor ou igual ao número de tuplas em R, pois duplicatas são eliminadas. Se a lista de atributos para projeção incluir a chave da relação R, o número de tuplas será o mesmo. Não é uma operação comutativa.




### Operação RENOMEAR (ρ - rho)

Esta operação renomeia relações e/ou seus atributos. Pode-se renomear apenas atributos, apenas a relação, ou ambos. A lista de novos nomes de atributos deve ser compatível com a ordem dos atributos originais. É útil para evitar ambiguidades quando relações diferentes possuem atributos com o mesmo nome.




### Operação PRODUTO (× - produto cartesiano)

Esta operação binária combina tuplas de duas relações (R1 e R2). A relação resultante possui os atributos de R1 e R2, incluindo todas as combinações possíveis entre as tuplas de R1 e R2. O número de tuplas na relação resultante é o produto cartesiano entre o número de tuplas de R1 e R2. Associada à SELEÇÃO, opera como uma JUNÇÃO.




### Operação JUNÇÃO (⋈ - join)

Esta operação binária combina tuplas de duas relações (R1 e R2) a partir de uma condição. A relação resultante possui atributos de R1 e R2, incluindo tuplas que respeitam a condição de junção. Tuplas com valores NULL nos atributos usados na condição ou que não respeitam a condição são descartadas. Existem variações como a Equijunção (condicionais com operadores de igualdade) e a Junção Natural (equijunção automática com atributos de mesmo nome, removendo duplicatas).




### Operação AGREGAÇÃO (G - gamma)

Esta operação agrega tuplas de uma relação a partir de uma lista de atributos de agregação, aplicando funções de agregação nos atributos remanescentes. Funções comuns incluem COUNT (contar tuplas), SUM (somar valores), AVG (média), MIN (valor mínimo) e MAX (valor máximo). Tuplas com valores NULL nos atributos usados na função de agregação são descartadas. O nome do atributo resultante, se não renomeado, será a concatenação do nome da função e do atributo usado.

## Conclusão

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.
