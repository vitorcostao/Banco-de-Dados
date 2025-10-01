# Resumo: Fundamentos em Bancos de Dados Relacionais Álgebra Relacional II

Este estudo aborda as operações fundamentais da álgebra relacional, essenciais para a manipulação e consulta de dados em bancos de dados relacionais. O material é distribuído sob licença CC BY-NC-ND 4.0.

## Operações da Álgebra Relacional

A álgebra relacional é um conjunto de operações que recebem uma ou duas relações como entrada e produzem uma nova relação como resultado. As operações discutidas no documento incluem Projeção, Junção e Operações de Conjunto.

### 1. Operação PROJEÇÃO

A operação de Projeção (representada por π) é utilizada para selecionar colunas (atributos) de uma relação. A Projeção Generalizada estende essa operação, permitindo que funções sejam incluídas na lista de atributos para projeção. Essas funções podem envolver operações aritméticas e valores constantes.

**Exemplo:**

No exemplo fornecido, a projeção é usada para selecionar CPF, Nome Completo (com concatenação de Nome e Sobrenome) e Salário (multiplicado por 1.1) da relação PROFESSOR. Em seguida, uma nova relação B é criada com CPF, NomeCompleto e Bonus (que é o Salário * 1.1).

### 2. Operação JUNÇÃO

A operação de Junção (JOIN) combina tuplas de duas relações com base em um critério de correspondência. O documento detalha diferentes tipos de junção:

#### a. Junção Interna (INNER JOIN)

A Junção Interna é a operação de junção convencional que combina tuplas de duas relações apenas quando há correspondência nos atributos especificados. Tuplas que não possuem correspondência em ambas as relações são descartadas.

**Exemplo:**

`PROFESSOR JOIN DEPARTAMENTO WHERE Departamento = Numero`. O resultado mostra professores e seus respectivos departamentos, apenas para aqueles que têm um departamento correspondente.

#### b. Junção Externa (OUTER JOIN)

A Junção Externa permite que tuplas de uma ou ambas as relações que não possuem correspondência na junção interna sejam incluídas no resultado. O documento menciona a "relação externa" que participa com tuplas não correspondentes.

#### c. Junção Externa à Esquerda (LEFT OUTER JOIN)

Neste tipo de junção, todas as tuplas da relação da esquerda são mantidas no resultado, mesmo que não haja correspondência na relação da direita. Se não houver correspondência, os atributos da relação da direita são preenchidos com valores nulos.

**Exemplo:**

`PROFESSOR LEFT OUTER JOIN DEPARTAMENTO WHERE Departamento = Numero`.

#### d. Junção Externa à Direita (RIGHT OUTER JOIN)

Similar à junção à esquerda, mas todas as tuplas da relação da direita são mantidas no resultado, mesmo que não haja correspondência na relação da esquerda. Os atributos da relação da esquerda são preenchidos com nulos se não houver correspondência.

**Exemplo:**

`PROFESSOR RIGHT OUTER JOIN DEPARTAMENTO WHERE Departamento = Numero`.

#### e. Junção Externa Completa (FULL OUTER JOIN)

Combina as características das junções externas à esquerda e à direita, mantendo todas as tuplas de ambas as relações, preenchendo com nulos onde não há correspondência.

**Exemplo:**

`PROFESSOR FULL OUTER JOIN DEPARTAMENTO WHERE Departamento = Numero`.

### 3. Operações de Conjunto

As operações de conjunto são baseadas na teoria dos conjuntos e são usadas para combinar elementos de duas relações. Para que essas operações sejam válidas, as relações devem ser compatíveis, ou seja, possuir o mesmo número de atributos alinhados de acordo com o domínio de dados. Tuplas duplicadas são eliminadas do resultado e os nomes dos atributos da primeira relação são mantidos.

#### a. União (UNION)

A operação de União (representada por ∪) adiciona todas as tuplas de ambas as relações, eliminando duplicatas. É uma operação comutativa (`R1 ∪ R2 = R2 ∪ R1`).

**Exemplo:**

`PROFESSOR ∪ ALUNO` combina as tuplas de ambas as relações, mostrando nomes e departamentos.

#### b. Interseção (INTERSECTION)

A operação de Interseção (representada por ∩) seleciona apenas as tuplas comuns entre as duas relações. Também é uma operação comutativa (`R1 ∩ R2 = R2 ∩ R1`).

**Exemplo:**

`PROFESSOR ∩ ALUNO` mostra as tuplas (nomes e departamentos) que são comuns a ambas as relações.

#### c. Diferença (DIFFERENCE)

A operação de Diferença (representada por −) seleciona as tuplas da primeira relação que não estão contidas na segunda relação. É uma operação não comutativa (`R1 − R2 ≠ R2 − R1`).

**Exemplo:**

`PROFESSOR − ALUNO` mostra as tuplas de PROFESSOR que não existem em ALUNO.

#### d. Divisão (DIVISION)

A operação de Divisão (representada por ÷) é usada para extrair um subconjunto de tuplas de uma relação (R1) que estão presentes em outra relação (R2). A relação resultante possui os atributos de R1 que não estão presentes em R2 e contém as tuplas de R1 que correspondem a todas as tuplas de R2. É uma operação não comutativa (`R1 ÷ R2 ≠ R2 ÷ R1`).

**Exemplo:**

`CARGA ÷ EXATAS` é usado para encontrar professores que possuem cargas horárias em *todos* os cursos da área de ciências exatas. O exemplo mostra que Felipe e Max possuem cargas em Computação e Engenharia, que são os cursos em EXATAS.

## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.

Este resumo foi elaborado por Manus AI com base no conteúdo do PDF "Sistemas de Banco de Dados - Fundamentos em Bancos de Dados Relacionais" de Wladmir Cardoso Brandão.

