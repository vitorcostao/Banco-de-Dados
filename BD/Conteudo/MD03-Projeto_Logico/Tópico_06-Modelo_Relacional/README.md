# Resumo do PDF: Fundamentos em Bancos de Dados Relacionais

Este estudo detalha o processo de mapeamento de um Modelo Entidade-Relacionamento (EER) para um Modelo Relacional em 7 etapas. O material é distribuído sob licença CC BY-NC-ND 4.0.

## Modelo Relacional

O modelo relacional é um modelo de implementação baseado no paradigma relacional, onde os dados são organizados de maneira tabular. Nele, uma entidade se torna uma relação, um relacionamento se torna uma relação, um atributo se torna um atributo e um registro se torna uma tupla. A criação de um modelo relacional a partir de um EER segue um procedimento de 7 etapas.

## Etapas do Mapeamento EER para o Modelo Relacional:




### Etapa 1: Entidades Fortes

Para cada entidade forte, cria-se uma relação e incluem-se todos os atributos simples. Um dos atributos chave da entidade forte é escolhido como chave primária da nova relação. Se a chave escolhida for composta, o conjunto de atributos simples que a compõe formará a chave primária.




### Etapa 2: Entidades Fracas

Para cada entidade fraca, cria-se uma relação e incluem-se todos os atributos simples. Os atributos de chave primária da relação que corresponde à entidade proprietária são incluídos como atributos de chave estrangeira. A chave primária da nova relação é formada pela chave estrangeira e um atributo chave parcial.




### Etapa 3: Relacionamentos Binários 1:N

Identifica-se a relação que representa a entidade participante no lado 'N' do relacionamento. A chave primária da outra entidade participante (lado '1') é incluída como chave estrangeira na relação do lado 'N'.




### Etapa 4: Relacionamentos Binários N:N

Cria-se uma nova relação para cada relacionamento N:N. As chaves primárias das relações participantes são incluídas como chaves estrangeiras na nova relação. A chave primária da nova relação será a combinação dessas chaves estrangeiras.




### Etapa 5: Relacionamentos Binários 1:1

Existem três estratégias para mapear relacionamentos 1:1:
1. **Mesclagem**: As entidades e o relacionamento são mesclados em uma única relação.
2. **Chave Estrangeira**: O relacionamento 1:1 é mapeado como um relacionamento 1:N.
3. **Referência Cruzada**: O relacionamento 1:1 é mapeado como um relacionamento N:N.




### Etapa 6: Atributos Multivalorados

Cria-se uma nova relação para cada atributo multivalorado. Esta nova relação incluirá o atributo multivalorado e a chave primária da relação original (entidade ou relacionamento) que o contém como chave estrangeira.




### Etapa 7: Relacionamentos de Alto Grau

Para cada relacionamento n-ário (onde n > 2), cria-se uma nova relação. As chaves primárias das entidades participantes são incluídas como chaves estrangeiras na nova relação. A chave primária desta nova relação é a combinação de todas as chaves estrangeiras que referenciam as relações das entidades participantes.

## Conclusão

O documento fornece um guia detalhado e sistemático para a conversão de um diagrama EER em um modelo relacional, essencial para a implementação de bancos de dados. As referências bibliográficas incluem obras clássicas de Elmasri & Navathe, Silberschatz & Korth & Sudarshan, e Date.


