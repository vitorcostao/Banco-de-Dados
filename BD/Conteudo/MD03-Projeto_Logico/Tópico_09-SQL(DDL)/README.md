# Resumo: Fundamentos em Bancos de Dados relacionais - SQL Definição de Dados

Este estudo aborda a **Definição de Dados (DDL)** em SQL. O material é distribuído sob licença CC BY-NC-ND 4.0.

## SQL (Structured Query Language)

SQL é uma linguagem de consulta estruturada, declarativa e de alto nível. O usuário especifica o que deseja, e o Sistema Gerenciador de Banco de Dados (SGBD) decide como executar a consulta. SQL contém instruções para definição e manipulação de dados e é um padrão em SGBDs relacionais comerciais. Mantém equivalência com o modelo relacional, onde:

*   **Relação** → Tabela
*   **Tupla** → Linha
*   **Atributo** → Coluna

### Recursos do SQL

SQL oferece múltiplos recursos, incluindo:

*   Definição de visões sobre dados.
*   Definição de restrições sobre os dados.
*   Especificação de controles de transações.
*   Especificação de autorizações e segurança.

## SQL: Definição de Dados (DDL)

Existem diferentes instruções (comandos) para definição de dados:

*   **CREATE**: Cria elementos no catálogo, como esquemas, tabelas e domínios.
*   **ALTER**: Modifica elementos do catálogo.
*   **DROP**: Remove elementos do catálogo.

### Esquema e Catálogo

*   **Esquema**: Um elemento que agrupa outros elementos que pertencem à mesma aplicação de BD. Possui um nome (identificador) e um proprietário (usuário com autoridade sobre o esquema).
    *   **Exemplo**: `CREATE SCHEMA UNIVERSIDADE AUTHORIZATION 'Pedro';`
*   **Catálogo**: Uma coleção nomeada de esquemas. Contém um esquema padrão (`INFORMATION_SCHEMA`) que oferece informações sobre todos os esquemas e seus descritores.

### Tipos de Tabela

*   **Tabela Base**: Declarada por meio da instrução `CREATE TABLE`. É realmente criada e armazenada como um arquivo pelo SGBD.
*   **Tabela Virtual**: Declarada por meio da instrução `CREATE VIEW`. Geralmente não são realmente armazenadas em arquivo.

### CREATE TABLE

Cria uma nova tabela, dando-lhe um nome e especificando suas colunas e restrições iniciais. Restrições de tipo são geralmente especificadas. Colunas e suas restrições de tipo podem ser redefinidas com `ALTER TABLE`.

**Exemplo**: `CREATE TABLE PROFESSOR;` (O esquema é especificado implicitamente pelo ambiente de execução).

## SQL: Restrições

Restrições podem ser especificadas em SQL como parte da criação de tabela:

*   **Tipo**: Domínio de valores válidos para a coluna.
*   **Nulidade**: Possibilidade de valores `NULL` na coluna.
*   **Valor**: Faixa de valores válidos para uma coluna.
*   **Valor Padrão**: Valor atribuído a uma coluna caso nenhum valor seja especificado.
*   **Chave**: Coluna(s) identificadora(s) de uma instância.
*   **Unicidade**: Coluna(s) candidata(s) a identificadora(s) de uma instância.
*   **Integridade Referencial**: Regras para atualização de linhas correlacionadas em diferentes tabelas.

### Restrição de Tipo

Define o tipo de dados que uma coluna pode armazenar:

*   **Numérico**: `INTEGER`, `SMALLINT`, `FLOAT`, `REAL`, `DOUBLE PRECISION`.
*   **Cadeias de Caracteres**: 
    *   `CHAR(n)`: Cadeias de tamanho fixo, onde `n` é a quantidade exata de caracteres.
    *   `VARCHAR(n)`: Cadeias de tamanho variável, onde `n` é a quantidade máxima de caracteres.
    *   Valores literais devem ser entre aspas simples e são *case sensitive*.
*   **Cadeias de Bits**: 
    *   `BIT(n)`: Cadeias binárias de tamanho fixo.
    *   `BIT VARYING(n)`: Cadeias binárias de tamanho variável.
    *   Valores literais entre apóstrofos, precedidos por `B` (ex: `B'10101'`).
*   **Booleano**: Valores binários `verdadeiro` (1) e `falso` (0).
*   **Date & Time**: 
    *   `Date`: `DD-MM-YYYY`.
    *   `Time`: `HH:MM:SS`.
    *   `Timestamp`: Valores temporais de alta precisão, incluindo data, hora e frações de segundos, com qualificador opcional `WITH TIME ZONE`. Representados por `TIMESTAMP 'DD-MM-YYYY HH:MM:SS.ffffff'`.

### Restrição de Nulidade (`NOT NULL`)

Especifica que uma coluna não pode conter valores `NULL`. É implícita para colunas que fazem parte da chave primária.

**Exemplo**: `CPF CHAR(11) NOT NULL`.

### Restrição de Valor Padrão (`DEFAULT`)

Define um valor padrão para uma coluna que será usado se nenhum valor explícito for fornecido. Se não especificado, o valor padrão será `NULL` (a menos que haja `NOT NULL`).

**Exemplo**: `Departamento INT DEFAULT 1`.

### Restrição de Valor (`CHECK`)

Limita os valores possíveis para uma coluna a uma faixa ou condição específica.

**Exemplo**: `ALTER TABLE PROFESSOR ADD CHECK (Departamento > 0 AND Departamento < 21);`

### Restrição de Chave (`PRIMARY KEY`)

Especifica uma ou mais colunas que compõem a chave primária de uma tabela. Se for uma única coluna, `PRIMARY KEY` pode acompanhar a coluna diretamente.

**Exemplo**: `PRIMARY KEY (CPF)`.

### Restrição de Unicidade (`UNIQUE`)

Especifica chaves secundárias alternativas, garantindo que os valores em uma coluna (ou conjunto de colunas) sejam únicos, mas permitindo `NULL` (ao contrário da `PRIMARY KEY`).

**Exemplo**: `UNIQUE (Nome)`.

### Restrição de Integridade Referencial (`FOREIGN KEY`)

Estabelece regras para a restrição de atualização de linhas correlacionadas em diferentes tabelas, referenciando uma chave primária em outra tabela através de uma chave estrangeira.

**Exemplo**: `FOREIGN KEY (Departamento) REFERENCES DEPARTAMENTO(Numero)`.

#### Ações de Disparo Referencial

Define ações alternativas para casos de violação de integridade (quando linhas são manipuladas ou uma chave primária é modificada):

*   **RESTRICT**: A linha da chave primária não pode ser modificada se houver linhas contendo chaves estrangeiras associadas.
*   **CASCADE**: A linha da chave primária e as linhas contendo chaves estrangeiras associadas são modificadas (ou removidas).
*   **SET NULL**: A linha da chave primária é modificada, e as chaves estrangeiras associadas são atualizadas para `NULL`.
*   **SET DEFAULT**: A linha da chave primária é modificada, e as chaves estrangeiras associadas são atualizadas para seu valor padrão.

Essas ações são escolhidas para `ON DELETE` (em caso de remoção) ou `ON UPDATE` (em caso de atualização).

**Exemplo**: `ON DELETE SET DEFAULT ON UPDATE CASCADE`.

### Restrições Nomeadas (`CONSTRAINT`)

Permite rotular restrições com um nome, que deve ser exclusivo dentro do esquema.

**Exemplos**: 
*   `CONSTRAINT PK_PROFESSOR PRIMARY KEY (CPF);`
*   `CONSTRAINT FK_DEPARTAMENTO_PROFESSOR FOREIGN KEY (Departamento) REFERENCES DEPARTAMENTO(Numero) ON DELETE SET DEFAULT ON UPDATE CASCADE;`

## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.

Este resumo foi elaborado por Manus AI com base no conteúdo do PDF "Sistemas de Banco de Dados - Fundamentos em Bancos de Dados Relacionais" de Wladmir Cardoso Brandão.

