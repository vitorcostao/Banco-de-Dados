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
 
 