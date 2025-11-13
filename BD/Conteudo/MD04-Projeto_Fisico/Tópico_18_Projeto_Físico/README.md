# Resumo: Projeto Físico

## Introdução

Idealizar uma boa estrutura física para um Banco de Dados é essencial para manter o desempenho da execução de consultas e transações para armazenar
os dados de forma eficiente.

## Fatores de impacto

### 1) Característica da consulta

- **Recuperação dos dados**

  A característica da consulta é fundamental para garantir um desempenho ótimo em um SGBD. Para isso, é necessário considerar uma série de decisões relacionadas ao processo de recuperação de dados, 
  como a identificação de quais arquivos serão acessados e quais campos precisam ser analisados ou retornados. Também é essencial avaliar as condições aplicadas nas operações de junção e seleção, 
  já que essas expressões determinam o volume de dados filtrados e influenciam diretamente a estratégia de acesso escolhida pelo otimizador.
  
  Além disso, o uso de índices depende da natureza dessas condições: Operadores de igualdade geralmente permitem um aproveitamento mais eficiente, 
  enquanto operadores de intervalo podem reduzir a seletividade e aumentar o custo de busca. Em estruturas de indexação como hash, o uso fica ainda mais restrito,
  sendo adequado apenas para comparações por igualdade.

  Assim, compreender como cada aspecto da consulta afeta o acesso e a manipulação dos dados é decisivo para alcançar uma execução mais rápida e eficiente.

- **Atualização dos dados**

  A característica da consulta também é decisiva para garantir um desempenho eficiente durante operações de atualização em um SGBD. Nesse contexto, é necessário considerar uma série de decisões 
  que influenciam diretamente o custo do processamento, como a identificação de quais arquivos serão acessados e quais campos precisam ser analisados ou retornados. Também é essencial avaliar as
  condições aplicadas durante o processo de atualizações.

  Além disso, é fundamental identificar quais campos estão envolvidos na atualização, uma vez que a presença de índices
  sobre esses atributos pode aumentar o custo de escrita, tornando necessário avaliar se a estrutura de indexação deve ser mantida ou evitada em certos casos.
  Condições baseadas em igualdade tendem a permitir melhor aproveitamento de índices e reduzem o número de buscas, enquanto condições de intervalo podem limitar essa vantagem,
  exigindo varreduras mais amplas. Em estruturas de indexação como hash, essa limitação é ainda maior, já que seu uso é efetivo apenas em comparações por igualdade.

  Assim, compreender como as operações, os arquivos envolvidos, os índices existentes e as condições aplicadas influenciam o processo de atualização é essencial para garantir operações mais
  rápidas, seguras e otimizadas.



### 2) Frequência da execução

  A frequência de execução das consultas é outro fator determinante para definir estratégias de otimização em um SGBD. Quando determinadas operações são realizadas muitas vezes por unidade de tempo,
  é essencial avaliar cuidadosamente como os índices influenciam seu desempenho. Para consultas de recuperação que ocorrem com alta frequência, o uso de indexação costuma ser vantajoso, 
  pois reduz o tempo de acesso e melhora significativamente a eficiência. Em contrapartida, para operações de atualização frequentes, a presença de índices pode aumentar o custo, 
  já que cada alteração exige ajustes adicionais nessas estruturas.
  
  Nesse contexto, o princípio de Pareto se mostra especialmente útil: frequentemente, cerca de 80% do processamento é consumido por apenas 20% das consultas e transações. 
  Identificar esse conjunto crítico permite aplicar políticas de otimização de forma mais estratégica. Assim, para as consultas mais recorrentes e voltadas à leitura, é recomendável considerar
  o uso de índices que acelerem o acesso aos dados. Já para as operações de atualização mais frequentes dentro desse grupo prioritário, muitas vezes é melhor evitar a indexação excessiva, preservando
  o desempenho do sistema como um todo. Compreender essa distribuição e ajustar a arquitetura de indexação conforme o perfil real de uso resulta em um ambiente mais equilibrado, 
  eficiente e adaptado à carga de trabalho predominante.



### 3) Tempo de execução

  O tempo de execução das consultas é outro aspecto essencial na tomada de decisões de otimização em um SGBD. Ao projetar ou ajustar um sistema, é importante considerar tanto o tempo médio 
  quanto o tempo máximo esperado para a execução das operações, avaliando quais consultas e transações possuem restrições rígidas de desempenho. Processos classificados como críticos exigem 
  respostas rápidas e previsíveis, o que torna indispensável analisar cuidadosamente como os índices podem influenciar sua execução.
  
  Para consultas críticas voltadas à recuperação de dados, o uso de indexação costuma ser altamente recomendável, pois reduz significativamente o tempo de busca e garante maior estabilidade no desempenho.
  Por outro lado, quando essas operações críticas envolvem atualizações, a presença excessiva de índices pode ser prejudicial, já que cada modificação requer manutenção adicional dessas estruturas,
  aumentando a latência. Dessa forma, ao identificar consultas e transações com forte restrição de tempo de execução, torna-se fundamental equilibrar o uso de índices conforme a natureza da operação, 
  priorizando a agilidade em leituras e evitando sobrecarga desnecessária em atualizações.



### 4) Exclusividade em campo

  A exclusividade de campos também desempenha um papel importante no desempenho de consultas dentro de um SGBD. Identificar quais atributos possuem valores únicos permite definir estratégias de otimização mais precisas.
  Esses campos exclusivos costumam apresentar alta seletividade, o que os torna especialmente eficientes quando utilizados em operações de junção e seleção, já que reduzem drasticamente o conjunto de registros analisados.
  
  Devido a isto, é recomendável considerar a indexação para campos exclusivos, pois o ganho de desempenho costuma ser significativo tanto em junções quanto em buscas direcionadas. 
  Como esses atributos garantem unicidade, seus índices tendem a ser mais eficazes, aumentando a precisão das buscas e reduzindo a necessidade de varreduras completas. 
  
  Assim, avaliar cuidadosamente quais campos apresentam exclusividade e utilizá-los como base para a indexação contribui para consultas mais rápidas, 
  planejamentos de execução mais eficientes e um melhor aproveitamento dos recursos do sistema.
  

## Criação de índice em SQL

<img width="645" height="243" alt="image" src="https://github.com/user-attachments/assets/57166ce1-cd0c-4c7f-98f1-d78837543ada" />



## Ajustes em Bancos de Dados

Todo projeto de banco de dados necessita de ajustes contínuos à medida que é executado em um ambiente real, processo conhecido como **sintonia (tuning)**. A sintonia consiste na revisão e no aperfeiçoamento constante do projeto físico, acompanhando o comportamento do sistema durante sua operação. O objetivo principal é reduzir o tempo de processamento das consultas e transações, garantindo maior eficiência sem comprometer a integridade ou a disponibilidade do banco.

### Métricas de monitoramento

Para orientar os ajustes, o DBA monitora um conjunto de métricas essenciais:

- **Processamento**: Tempo de otimização e execução de consultas e transações.
- **Armazenamento**: Espaços ocupados por buffers, tabelas (*tablespaces*) e índices (*indexspaces*).
- **I/O**: Número de paginações em disco por unidade de tempo.
- **Concorrência**: Taxa de vazão (*throughput*) de transações, emissão de comandos de bloqueio e registro em log.
- **Índice**: Número de níveis e nós folha não contíguos.

### Problemas comuns

O monitoramento ajuda a identificar situações que afetam o desempenho:

- **Desperdício**: Tamanhos de buffers inadequados.
- **Sobrecarga**: Logging e dumping desnecessários.
- **Aumento de concorrência**: Disputa excessiva por bloqueios.
- **Ineficiência**: Alocação inadequada de discos, buffers ou processos.

### Formas de ajuste

Os ajustes podem ocorrer em diferentes níveis:

- **Sintonia de índice**: Criação, remoção ou reorganização de índices para melhorar o desempenho de consultas e atualizações.
- **Sintonia de projeto**: Alterações no projeto lógico ou físico, visando otimizar o armazenamento e o acesso aos dados.
- **Sintonia de consulta**: Reescrita ou reformulação de consultas para reduzir custos de execução e melhorar a eficiência do plano de execução (IN, DISTINCT, EXISTS, "!=" - Impedem uso de índices).

A aplicação contínua desses ajustes garante que o banco de dados permaneça eficiente, adaptado às necessidades reais da aplicação e capaz de processar consultas e transações de forma rápida e confiável.


## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.