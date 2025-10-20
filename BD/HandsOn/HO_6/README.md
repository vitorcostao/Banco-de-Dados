# Sistema de Gestão Acadêmica

Este repositório contém o esquema do banco de dados para o Sistema de Gestão Acadêmica. O banco de dados foi projetado para gerenciar informações sobre áreas, alunos, cursos, professores, módulos, tópicos e matrículas.

## Esquema do Banco de Dados

O esquema do banco de dados é composto pelas seguintes tabelas:

### `AREA`

Gerencia as áreas de conhecimento. Pode ter uma superárea, criando uma hierarquia.

| Coluna    | Tipo       | Restrições                                   | Descrição                               |
| :-------- | :--------- | :------------------------------------------- | :-------------------------------------- |
| `Sigla`   | `CHAR(5)`  | `PRIMARY KEY`, `NOT NULL`                    | Sigla única da área.                    |
| `Nome`    | `VARCHAR(80)` | `NOT NULL`, `UNIQUE`                         | Nome completo da área.                  |
| `SuperArea` | `CHAR(5)`  | `FOREIGN KEY` referenciando `AREA(Sigla)` | Sigla da área superior, se houver.      |

### `ALUNO`

Armazena informações detalhadas sobre os alunos.

| Coluna      | Tipo        | Restrições                | Descrição                               |
| :---------- | :---------- | :------------------------ | :-------------------------------------- |
| `CPF`       | `CHAR(11)`  | `PRIMARY KEY`, `NOT NULL` | Cadastro de Pessoa Física do aluno.     |
| `Nome`      | `VARCHAR(20)` | `NOT NULL`                | Primeiro nome do aluno.                 |
| `Sobrenome` | `VARCHAR(20)` | `NOT NULL`                | Sobrenome do aluno.                     |
| `Sexo`      | `CHAR(1)`   |                           | Sexo do aluno (M/F).                    |
| `DataNasc`  | `DATE`      |                           | Data de nascimento do aluno.            |

### `CURSO`

Contém os detalhes dos cursos oferecidos, incluindo sua área de conhecimento, carga horária e custo.

| Coluna  | Tipo          | Restrições                                   | Descrição                               |
| :------ | :------------ | :------------------------------------------- | :-------------------------------------- |
| `Sigla` | `CHAR(5)`     | `PRIMARY KEY`, `NOT NULL`                    | Sigla única do curso.                   |
| `Nome`  | `VARCHAR(80)` | `NOT NULL`, `UNIQUE`                         | Nome completo do curso.                 |
| `Horas` | `INT`         | `DEFAULT 0`                                  | Carga horária total do curso em horas.  |
| `Custo` | `DECIMAL(10, 2)` | `DEFAULT 0.0`                                | Custo do curso.                         |
| `Area`  | `CHAR(5)`     | `FOREIGN KEY` referenciando `AREA(Sigla)` | Sigla da área de conhecimento do curso. |

### `PROFESSOR`

Registra os professores e o curso ao qual estão associados.

| Coluna  | Tipo          | Restrições                                   | Descrição                               |
| :------ | :------------ | :------------------------------------------- | :-------------------------------------- |
| `CPF`   | `CHAR(11)`    | `PRIMARY KEY`, `NOT NULL`                    | CPF do professor.                       |
| `Nome`  | `VARCHAR(80)` | `NOT NULL`                                   | Nome completo do professor.             |
| `Curso` | `CHAR(5)`     | `NOT NULL`, `FOREIGN KEY` referenciando `CURSO(Sigla)` | Sigla do curso que o professor leciona. |

### `MODULO`

Define os módulos que compõem cada curso.

| Coluna  | Tipo          | Restrições                                   | Descrição                               |
| :------ | :------------ | :------------------------------------------- | :-------------------------------------- |
| `Sigla` | `CHAR(5)`     | `PRIMARY KEY`, `NOT NULL`                    | Sigla única do módulo.                  |
| `Nome`  | `VARCHAR(80)` | `NOT NULL`, `UNIQUE`                         | Nome completo do módulo.                |
| `Curso` | `CHAR(5)`     | `NOT NULL`, `FOREIGN KEY` referenciando `CURSO(Sigla)` | Sigla do curso ao qual o módulo pertence. |

### `TOPICO`

Detalha os tópicos dentro de cada módulo, incluindo sua carga horária.

| Coluna  | Tipo          | Restrições                                   | Descrição                               |
| :------ | :------------ | :------------------------------------------- | :-------------------------------------- |
| `Modulo`| `CHAR(5)`     | `PRIMARY KEY`, `NOT NULL`, `FOREIGN KEY` referenciando `MODULO(Sigla)` | Sigla do módulo ao qual o tópico pertence. |
| `Sigla` | `CHAR(5)`     | `PRIMARY KEY`, `NOT NULL`                    | Sigla única do tópico dentro do módulo. |
| `Nome`  | `VARCHAR(80)` | `NOT NULL`, `UNIQUE`                         | Nome completo do tópico.                |
| `Horas` | `INT`         | `DEFAULT 0`                                  | Carga horária do tópico em horas.       |

### `MATRICULA`

Registra as matrículas dos alunos em cursos específicos.

| Coluna  | Tipo        | Restrições                                   | Descrição                               |
| :------ | :---------- | :------------------------------------------- | :-------------------------------------- |
| `Curso` | `CHAR(5)`   | `PRIMARY KEY`, `FOREIGN KEY` referenciando `CURSO(Sigla)` | Sigla do curso matriculado.             |
| `Aluno` | `CHAR(11)`  | `PRIMARY KEY`, `FOREIGN KEY` referenciando `ALUNO(CPF)` | CPF do aluno matriculado.               |
| `Data`  | `DATE`      |                                              | Data da matrícula.                      |
| `Pago`  | `BOOLEAN`   |                                              | Indica se a matrícula foi paga.         |

## Criação do Esquema

O esquema pode ser criado executando o seguinte script SQL:

```sql
CREATE SCHEMA ADM_COLLEGE AUTHORIZATION 'WLADIMIR';

CREATE TABLE AREA (
    Sigla CHAR(5) NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    SuperArea CHAR(5),
    PRIMARY KEY (Sigla),
    UNIQUE (Nome)
);

CREATE TABLE ALUNO (
    CPF CHAR(11) NOT NULL,
    Nome VARCHAR(20) NOT NULL,
    Sobrenome VARCHAR(20) NOT NULL,
    Sexo CHAR(1),
    DataNasc DATE,
    PRIMARY KEY (CPF)
);

CREATE TABLE CURSO (
    Sigla CHAR(5) NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    Horas INT DEFAULT 0,
    Custo DECIMAL(10, 2) DEFAULT 0.0,
    Area CHAR(5),
    PRIMARY KEY (Sigla),
    UNIQUE (Nome)
);

CREATE TABLE PROFESSOR (
    CPF CHAR(11) NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    Curso CHAR(5) NOT NULL,
    PRIMARY KEY (CPF)
);

CREATE TABLE MODULO (
    Sigla CHAR(5) NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    Curso CHAR(5) NOT NULL,
    PRIMARY KEY (Sigla),
    UNIQUE (Nome)
);

CREATE TABLE TOPICO (
    Modulo CHAR(5) NOT NULL,
    Sigla CHAR(5) NOT NULL,
    Nome VARCHAR(80) NOT NULL,
    Horas INT DEFAULT 0,
    PRIMARY KEY (Sigla, Modulo),
    UNIQUE (Nome)
);

CREATE TABLE MATRICULA (
    Curso CHAR(5),
    Aluno CHAR(11),
    Data DATE,
    Pago BOOLEAN,
    PRIMARY KEY (Curso, Aluno)
);

-- AREA → AREA (SuperArea)
ALTER TABLE AREA
ADD CONSTRAINT FK_AREA_SUPERAREA
FOREIGN KEY (SuperArea)
REFERENCES AREA(Sigla)
ON DELETE SET NULL;

-- CURSO → AREA
ALTER TABLE CURSO
ADD CONSTRAINT FK_CURSO_AREA
FOREIGN KEY (Area)
REFERENCES AREA(Sigla)
ON DELETE SET NULL;

-- PROFESSOR → CURSO
ALTER TABLE PROFESSOR
ADD CONSTRAINT FK_PROFESSOR_CURSO
FOREIGN KEY (Curso)
REFERENCES CURSO(Sigla)
ON DELETE CASCADE;

-- MODULO → CURSO
ALTER TABLE MODULO
ADD CONSTRAINT FK_MODULO_CURSO
FOREIGN KEY (Curso)
REFERENCES CURSO(Sigla)
ON DELETE CASCADE;

-- TOPICO → MODULO
ALTER TABLE TOPICO
ADD CONSTRAINT FK_TOPICO_MODULO
FOREIGN KEY (Modulo)
REFERENCES MODULO(Sigla)
ON DELETE CASCADE;

-- MATRICULA → CURSO
ALTER TABLE MATRICULA
ADD CONSTRAINT FK_MATRICULA_CURSO
FOREIGN KEY (Curso)
REFERENCES CURSO(Sigla)
ON DELETE RESTRICT;

-- MATRICULA → ALUNO
ALTER TABLE MATRICULA
ADD CONSTRAINT FK_MATRICULA_ALUNO
FOREIGN KEY (Aluno)
REFERENCES ALUNO(CPF)
ON DELETE RESTRICT;

```