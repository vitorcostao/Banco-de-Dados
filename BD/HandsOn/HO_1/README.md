# Respostas Hands On 1

## 1. O que é um Sistema de Banco de Dados (SBD)?

Um **SBD** é um conjunto de dados relacionados e sua respectiva forma de acesso e organização. Ele é composto por dados organizados, uma estrutura lógica que define como os dados são armazenados, organizados e manipulados, e um software que provê acesso aos dados aos usuários e aplicações.

---

## 2. Do que um SBD é composto?

Um SBD é composto por:

- **Dados:** informações organizadas e armazenadas.  
- **Estrutura lógica:** determina como os dados são armazenados e manipulados.  
- **Sistema Gerenciador de Banco de Dados (SGBD):** software que gerencia o acesso aos dados.

---

## 3. Como usuários e aplicações interagem com um SBD?

Usuários e aplicações submetem consultas ao SBD, que são interpretadas e otimizadas pelo sistema. O SBD decide quais dados são necessários e os recupera a partir dos repositórios sob seu controle.

---

## 4. O que é um Banco de Dados (BD)?

Um **Banco de Dados (BD)** é uma coleção organizada de dados, projetada para representar a realidade e permitir o armazenamento, manipulação e consulta eficiente.  

**Exemplo:** [IMDb - Internet Movie Database](https://www.imdb.com/interfaces/)

---

## 5. Quais são as propriedades de um BD?

1. **Finalidade:** construídos com um propósito específico.  
2. **Realidade:** representam aspectos do mundo real.  
3. **Coerência:** mantém consistência lógica das relações.  
4. **Compartilhamento:** permite acesso compartilhado aos dados.

---

## 6. Quais são as etapas de um projeto de BD?

1. **Especificação**  
2. **Análise de Requisitos**  
3. **Projeto Conceitual**  
4. **Projeto Lógico**  
5. **Projeto Físico**

---

## 7. O que é um Sistema Gerenciador de Banco de Dados (SGBD)?

Um **SGBD** é um software que permite criar, gerenciar e manipular bancos de dados, atuando como interface entre os usuários/aplicações e os dados armazenados.

---

## 8. Quais são as propriedades de um SGBD?

- Repositório único  
- Abstração de dados  
- Natureza autodescritiva  
- Compartilhamento de dados  
- Isolamento entre programas e dados  
- Suporte a múltiplas visões sobre dados  
- Processamento de transação multiusuário

---

## 9. Situações em que o uso de SGBD pode ser inadequado

- Uso monousuário  
- Aplicações de baixa complexidade  
- Requisitos muito rigorosos ou específicos  
- Aplicações que demandam recursos extremos  
- Aplicações com custo proibitivo

---

## 10. O que é um modelo de dados?

Um **modelo de dados** é uma estrutura lógica que determina como os dados são armazenados, organizados e manipulados.

---

## 11. Tipos de modelos de dados (nível de abstração)

- **Conceitual**  
- **Representativo**  
- **Físico**

---

## 12. O que é um Esquema de BD?

Um **esquema** é a descrição do banco de dados, composta por metadados que definem a estrutura e organização dos dados.

---

## 13. O que é uma Instância de BD?

Uma **instância** é o conjunto de dados armazenados em determinado momento no banco de dados.

---

## 14. Vantagens da Arquitetura de Três Esquemas

- Permite **visões restritas** aos usuários, fornecendo apenas os dados necessários.  
- Garante **independência de aplicação**, evitando que mudanças na estrutura do BD afetem as aplicações.

---

## 15. Níveis da Arquitetura de Três Esquemas

1. **Nível Externo** – visão do usuário  
2. **Nível Conceitual** – estrutura lógica do BD  
3. **Nível Físico** – armazenamento físico dos dados

---

## 16. O que é Mapeamento em uma Arquitetura de Três Esquemas?

O **Mapeamento** refere-se à transformação de requisições e resultados entre os diferentes níveis da arquitetura.

---

## 17. O que é Independência de Dados e sua importância?

**Independência de dados** é a capacidade de alterar o esquema de um nível sem modificar o nível adjacente superior, garantindo flexibilidade e menor impacto nas aplicações.

---

## 18. O que é uma Linguagem de Consulta?

Uma **linguagem de consulta** é utilizada para interagir com bancos de dados, permitindo recuperar, manipular e gerenciar dados de forma eficiente.

---

## 19. Linguagens incorporadas na SQL

- **VDL** (View Definition Language)  
- **DDL** (Data Definition Language)  
- **SDL** (Storage Definition Language)  
- **DML** (Data Manipulation Language)

---

Este README serve como referência rápida e organizada para quem deseja estudar os conceitos fundamentais de Sistemas de Banco de Dados e SGBD.
