# Resumo: Sistemas de Banco de Dados - Fundamentos em Bancos de Dados Relacionais

Este documento, aborda os fundamentos dos sistemas de banco de dados, com foco especial nos modelos de dados relacionais. O material é distribuído sob licença CC BY-NC-ND 4.0.

## 1. Modelo de Dados

Um modelo de dados é uma estrutura lógica que define como os dados são armazenados, organizados e manipulados em um banco de dados. Ele é composto por tipos, relacionamentos e restrições aplicados aos dados, oferecendo um meio para alcançar a abstração de dados. A estrutura do banco de dados é percebida de diferentes maneiras pelos usuários, dependendo do nível de detalhamento.

### Níveis de Abstração:

*   **Conceitual:** Alto nível de abstração, representando a estrutura como os usuários a percebem. Os conceitos principais são entidade, atributo e relacionamento.
*   **Representativo (ou de Implementação):** Nível intermediário de abstração, detalhando aspectos de implementação. Exemplos incluem modelos hierárquico, de rede, de objeto e relacional.
*   **Físico:** Baixo nível de abstração, descrevendo detalhes de armazenamento físico dos dados, como arquivos, registros, campos e índices.

## 2. Modelo de Dados Conceitual

Neste nível, os principais componentes são:

*   **Entidade:** Um ente ou objeto do universo de discurso (ex: Professor, Departamento).
*   **Atributo:** Uma propriedade que caracteriza uma entidade (ex: Nome, CPF, Salário para Professor).
*   **Relacionamento:** Uma associação entre duas ou mais entidades (ex: Professor *possui* Departamento).

## 3. Modelo de Dados Representativo

Existem diversos modelos representativos:

*   **Hierárquico:** O banco de dados é uma coleção de árvores, onde um nó filho pode ter apenas um pai (relação 1:N).
*   **Rede:** Uma extensão do modelo hierárquico que permite associações N:N.
*   **Objeto:** O banco de dados é uma coleção de objetos, onde registros são objetos e associações são ligações. É próximo ao modelo conceitual.
*   **Relacional:** Amplamente adotado em SGBDs comerciais, é baseado em lógica de predicados e teoria dos conjuntos. O banco de dados é uma coleção de relações (tabelas), onde cada linha é uma tupla (registro) e as associações são feitas através de relacionamentos entre tabelas. É consolidado e possui alto desempenho em operações básicas.

## 4. Modelo de Dados Físico

Descreve os detalhes de armazenamento dos dados em memória, incluindo:

*   Formatos e ordenação de registros em arquivos.
*   Organização dos dados em arquivos em memória secundária.
*   Caminhos de acesso alternativos para recuperação rápida de registros (ex: índices).

## 5. Referências Bibliográficas

O documento cita as seguintes obras:

*   Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.

