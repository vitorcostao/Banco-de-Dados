# Resumo: Sistemas de Banco de Dados

Este documento apresenta uma introdução aos Sistemas de Banco de Dados (SBD), abordando seus fundamentos, propriedades, taxonomia, abordagens de projeto, atores envolvidos, modelos de dados e as características dos Sistemas Gerenciadores de Banco de Dados (SGBD), incluindo suas propriedades e limitações. O material é distribuído sob licença CC BY-NC-ND 4.0.

## Introdução aos Sistemas de Banco de Dados (SBD)

Um SBD é definido como um conjunto de dados relacionados e sua respectiva forma de acesso e organização. É composto por uma coleção de dados organizados, uma estrutura lógica (modelo de dados) e um software (SGBD) que provê acesso aos dados para usuários e aplicações. Usuários e aplicações interagem com o sistema submetendo consultas, que são interpretadas e otimizadas pelo sistema para recuperar os dados necessários.

## Banco de Dados (BD)

Um Banco de Dados é uma coleção de dados organizados (símbolos, sinais, códigos) que atende a necessidades específicas de usuários e está presente em diversos ambientes de negócio, como reservas de hotéis, bibliotecas, catálogos de filmes e transações bancárias. Exemplos de sua aplicação incluem bilhões de produtos em catálogo, milhões de transações diárias e atualização frequente de estoque e pedidos.

### Propriedades dos BDs

Os BDs possuem características distintas:
- **Finalidade:** Construídos com um propósito específico.
- **Realidade:** Representam o "mundo real" (minimundo, universo de discurso).
- **Coerência:** Mantêm a coerência lógica da coleção de dados.
- **Compartilhamento:** Permitem o compartilhamento de dados.

### Taxonomia dos BDs

Os BDs podem ser categorizados por forma de utilização e aplicação:
- **Forma de Utilização:**
    - **Manual:** Criado e mantido sem computadores (ex: lista telefônica).
    - **Computadorizado:** Criado e mantido com computadores (ex: The Human Genome Database).
- **Aplicação:**
    - **Tradicional:** Texto, números, registros temporais.
    - **Multimídia:** Imagens, áudios, vídeos.
    - **Geográfico:** Mapas, imagens de satélite, registros climáticos.
    - **Data Warehouse:** Armazém de dados para processamento analítico online (OLAP).
    - **Ativo (Tempo Real):** Para aplicações com requisitos rigorosos de desempenho (ex: processos industriais).

### Abordagens de Implementação

Duas abordagens principais são discutidas:
- **Processamento em Arquivo:** Usuário define arquivos para aplicações específicas.
- **Sistema Gerenciador de Banco de Dados (SGBD):** Repositório único com abstração de dados, natureza autod descritiva, compartilhamento de dados, isolamento entre programas e dados, suporte a múltiplas visões e processamento de transações multiusuário.

## Projeto de Banco de Dados

A construção de modelos para implementação de BDs segue etapas:
1. **Especificação:** Descrição do minimundo.
2. **Análise de Requisitos:** Restrições de operação.
3. **Projeto Conceitual:** Estruturas e restrições conceituais.
4. **Projeto Lógico:** Estruturas e restrições lógicas.
5. **Projeto Físico:** Estruturas e restrições físicas.

O projeto é continuamente revisado para refletir o estado do minimundo.

## Atores do Banco de Dados

Os papéis desempenhados na interação com o BD incluem:
- **Administrador (DBA):** Responsável pela operação e cumprimento de requisitos.
- **Projetista:** Responsável pelo projeto em todas as etapas.
- **Analista:** Mais presente nas etapas de projeto conceitual e lógico.
- **Programador:** Atua predominantemente no projeto lógico.
- **Usuário:** Demandante, conhecedor do minimundo, presente na especificação e análise de requisitos.

## Modelo de Dados

É a estrutura lógica que determina como os dados são armazenados, organizados e manipulados. Inclui uma coleção de conceitos que descrevem a estrutura do BD e incorpora operações para especificar a atualização e recuperação de dados (inserir, remover, modificar, recuperar). Define o comportamento de uma aplicação.

## Sistema Gerenciador de Banco de Dados (SGBD)

Uma coleção de programas (software) que permite aos usuários criar e manter BDs. Suas funções incluem:
- **Definir:** Especificar tipos, estruturas e restrições (metadados no catálogo).
- **Construir:** Armazenar dados de forma controlada.
- **Manipular:** Inserir, remover, modificar e recuperar dados.
- **Compartilhar:** Prover acesso simultâneo a múltiplos usuários.

### Propriedades do SGBD

- Controle de Redundância
- Flexibilidade
- Múltiplas Interfaces
- Economia de Escala
- Garantia de Padrões
- Restrições de Acesso
- Backup e Recuperação
- Disponibilidade Elevada
- Restrições de Integridade
- Tempo de Desenvolvimento
- Relacionamentos Complexos

### Limitações do SGBD

O uso de SGBDs pode ser inadequado em situações como:
- **Monousuário:** Acesso por múltiplos usuários não é requerido.
- **Baixa Complexidade:** Aplicações muito simples e bem definidas.
- **Requisitos Rigorosos:** Aplicações de tempo real, alta escalabilidade ou sistemas embarcados com armazenamento limitado.
- **Alta Especialização:** Aplicações que demandam recursos não suportados pela generalidade do SGBD (ex: funções de segurança sofisticadas).
- **Custo Proibitivo:** Impossibilidade de investimento inicial significativo em hardware, software e treinamento.

## Referências Bibliográficas

O documento cita obras de autores como Elmasri & Navathe, Silberschatz, Korth & Sudarshan, e Christopher J. Date.

