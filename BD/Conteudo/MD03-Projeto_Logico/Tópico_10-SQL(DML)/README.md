# Resumo: SQL: Manipulação de Dados

Este estudo aborda a **Manipulação de Dados (DML)** em SQL. O material é distribuído sob licença CC BY-NC-ND 4.0.

## SQL (Structured Query Language)

SQL é uma linguagem de consulta estruturada, declarativa e de alto nível. O usuário especifica o que deseja, e o Sistema Gerenciador de Banco de Dados (SGBD) decide como executar a consulta. SQL contém instruções para definição e manipulação de dados e é um padrão em SGBDs relacionais comerciais. Mantém equivalência com o modelo relacional, onde:

*   **Relação** → Tabela
*   **Tupla** → Linha
*   **Atributo** → Coluna

## SQL: Manipulação de Dados (DML)

Existem diferentes instruções (comandos) para manipulação de dados:

*   **INSERT**: Inserir linhas em tabelas.
*   **DELETE**: Remover linhas de tabelas.
*   **UPDATE**: Atualizar valores de colunas em linhas de tabelas.
*   **SELECT**: Recuperar dados em tabelas.

### 1. Instrução INSERT

Acrescenta uma ou mais linhas em uma tabela. É necessário especificar o nome da tabela e uma lista de valores para a linha. Os valores devem ser listados na mesma ordem em que as colunas correspondentes foram definidas na tabela. É possível especificar nomes de colunas correspondentes aos valores fornecidos. Se alguma restrição (como chave primária ou integridade referencial) for violada, a operação é rejeitada.

**Exemplos:**

*   `INSERT INTO PROFESSOR VALUES ('12345678900', 'Ricardo Marini', 'M', 3000.00, 1);`
*   `INSERT INTO PROFESSOR (CPF, Sexo, Nome, Departamento) VALUES ('12345678900', 'M', 'Ricardo Marini', 1);`
*   Inserir múltiplas linhas usando `SELECT`: `INSERT INTO PROFESSOR (CPF, Nome, Sexo, Departamento) SELECT CPF, Nome, Sexo, 1 FROM ALUNO;`

### 2. Instrução DELETE

Remove linhas de uma tabela. As linhas são excluídas de apenas uma tabela, mas a exclusão pode se propagar para linhas em outras tabelas de acordo com restrições de integridade referencial. Se a cláusula `WHERE` for inexistente, todas as linhas da tabela serão excluídas, mas a tabela permanecerá no BD como uma tabela vazia.

**Exemplos:**

*   `DELETE FROM PROFESSOR WHERE Salario < 1000.00;` (Remove professores com salário menor que 1000)
*   `DELETE FROM PROFESSOR WHERE Sexo = 'M';` (Remove professores do sexo masculino)
*   `DELETE FROM PROFESSOR;` (Remove todas as linhas da tabela PROFESSOR)

### 3. Instrução UPDATE

Modifica valores em colunas de uma ou mais linhas. Cada instrução afeta apenas uma tabela, mas a atualização de uma chave primária pode ser propagada para chaves estrangeiras em outras tabelas devido à integridade referencial. A cláusula `SET` especifica as colunas a serem modificadas e seus novos valores.

**Exemplos:**

*   `UPDATE PROFESSOR SET Salario = 2500.00, Departamento = 2 WHERE CPF = '12345678900';`
*   `UPDATE PROFESSOR SET Salario = Salario * 1.1;` (Aumenta o salário de todos os professores em 10%)

### 4. Instrução SELECT

Recupera linhas em múltiplas tabelas. A forma básica é o bloco `SELECT-FROM-WHERE`:

```sql
SELECT <lista de colunas>
FROM <lista de tabelas>
WHERE <condição>;
```

*   `<lista de colunas>`: Nomes de colunas cujos valores devem ser recuperados.
*   `<lista de tabelas>`: Nomes das tabelas necessárias para processar a consulta.
*   `<condição>`: Expressão condicional que identifica as linhas a serem recuperadas.

**Exemplos:**

*   Recuperar nome e salário de professores masculinos do departamento 1: `SELECT Nome, Salario FROM PROFESSOR WHERE Departamento = 1 AND Sexo = 'M';`
*   Recuperar CPF e nome de professores masculinos que também são alunos: `SELECT A.CPF, A.Nome FROM PROFESSOR A, ALUNO B WHERE A.CPF = B.CPF AND A.Sexo = 'M';`
*   Junções podem ser especificadas na cláusula `WHERE` ou `FROM` com o operador `JOIN` (ex: `INNER JOIN`, `LEFT OUTER JOIN`, `FULL JOIN`).

#### Ambiguidade

Mesmo nome pode ser usado em mais de uma coluna, desde que as colunas pertençam a tabelas diferentes e estejam devidamente prefixadas para evitar ambiguidade (ex: `PROFESSOR.Nome` ou usando apelidos como `A.Nome`).

#### Ausência de Cláusula WHERE

*   **Tabela Única**: Todas as linhas da tabela são retornadas (ex: `SELECT CPF FROM PROFESSOR;`).
*   **Múltiplas Tabelas**: Todas as combinações possíveis entre linhas das tabelas são retornadas, equivalente ao Produto Cartesiano (ex: `SELECT A.CPF FROM PROFESSOR A, DEPARTAMENTO B;`).

#### Duplicatas

Uma tabela constitui um multiconjunto, e linhas duplicadas podem aparecer no resultado. O operador `DISTINCT` elimina linhas duplicadas no resultado (ex: `SELECT DISTINCT Departamento FROM PROFESSOR WHERE Salario < 5000.00;`).

#### Operadores Especiais

*   **Asterisco (`*`)**: Recupera todas as colunas sem a necessidade de listar seus nomes explicitamente (ex: `SELECT * FROM PROFESSOR WHERE Departamento = 1;`).
*   **LIKE**: Comparação sobre subcadeias de caracteres, usando `%` (zero ou mais caracteres) e `_` (um único caractere) (ex: `WHERE Endereco LIKE '%Belo Horizonte%';`).
*   **BETWEEN**: Comparação com intervalos (ex: `WHERE Salario BETWEEN 2000.00 AND 5000.00;`).

#### Ordenação de Resultados (`ORDER BY`)

Ordena as linhas do resultado de uma consulta. Pode ser `ASC` (crescente, padrão) ou `DESC` (decrescente). Pode ordenar por múltiplas colunas.

**Exemplo**: `ORDER BY B.Nome, A.Nome DESC;`

#### Valores NULL

`IS NULL` (ou `IS NOT NULL`) verifica se o valor de uma coluna é `NULL`. `NULL` tem semântica imprecisa (valor desconhecido, indisponível ou não aplicável).

**Exemplo**: `WHERE Departamento IS NULL;`

#### Consulta Aninhada

Um bloco `SELECT` completo na cláusula `WHERE` de outra consulta (consulta externa).

*   **IN (NOT IN)**: Verifica se um conjunto de valores pertence a um multiconjunto de valores (ex: `WHERE (A.CPF, A.Nome) IN (SELECT B.CPF, B.Nome FROM ALUNO B WHERE A.Sexo = B.Sexo);`).
*   **EXISTS (NOT EXISTS)**: Verifica se o resultado da consulta interna é um conjunto vazio (ex: `WHERE NOT EXISTS (SELECT * FROM DEPARTAMENTO B WHERE A.Departamento = B.Numero AND B.Nome = 'Pesquisa');`).

#### Agregação (`GROUP BY`)

Agrupa múltiplas linhas em uma, utilizando funções de agregação:

*   **COUNT**: Conta o número de linhas agrupadas.
*   **SUM**: Soma o valor na coluna de linhas agrupadas.
*   **MAX**: Retorna o valor máximo na coluna de linhas agrupadas.
*   **MIN**: Retorna o valor mínimo na coluna de linhas agrupadas.
*   **AVG**: Retorna a média dos valores na coluna de linhas agrupadas.

Funções de agregação não têm efeito em linhas com colunas participantes da função com valor `NULL`.

**Exemplos:**

*   `SELECT COUNT(*), SUM(Salario) FROM PROFESSOR WHERE Sexo = 'F';`
*   `SELECT Departamento, COUNT(*), SUM(Salario), MAX(Salario), MIN(Salario), AVG(Salario) FROM PROFESSOR GROUP BY Departamento;`

## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.

Este resumo foi elaborado por Manus AI com base no conteúdo do PDF "Sistemas de Banco de Dados - Fundamentos em Bancos de Dados Relacionais" de Wladmir Cardoso Brandão.

