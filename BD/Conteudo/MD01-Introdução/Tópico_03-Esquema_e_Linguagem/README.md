# Resumo: Fundamentos em Bancos de Dados Relacionais

Este estudo aborda conceitos fundamentais relacionados a sistemas de banco de dados, com foco especial nos bancos de dados relacionais, abordando a estrutura, organização e manipulação de dados, bem como a arquitetura e as linguagens envolvidas na gestão de bancos de dados. O material é distribuído sob licença CC BY-NC-ND 4.0.

## Esquema de Banco de Dados (BD)

O esquema de um banco de dados é a descrição da sua estrutura, ou seja, os metadados que definem como os dados são organizados. É especificado durante o projeto e não sofre alterações frequentes. Existem convenções para representar esquemas usando diagramas, que captam aspectos como restrições, tipos de registros e itens de dados. Um construtor de esquema é um elemento que compõe o esquema, como, por exemplo, a definição de uma tabela 'professor'. É importante notar que o diagrama de esquema apresenta a estrutura dos tipos de elementos, mas não as instâncias (os dados reais) desses elementos.

## Instância de Banco de Dados (BD)

A instância de um banco de dados refere-se ao conjunto de dados armazenados em um determinado momento. O processo de um BD pode começar com um 'Estado Vazio', onde o esquema já está especificado, mas nenhum dado foi armazenado. Em seguida, passa para um 'Estado Inicial', onde o BD é carregado com dados iniciais. O estado do BD se altera continuamente à medida que dados são inseridos, removidos ou modificados.

## Arquitetura de Três Esquemas

A arquitetura de três esquemas é uma abordagem que permite a visualização do esquema em diferentes níveis de abstração, promovendo a autodescrição, o suporte a múltiplas visões e a independência de aplicação. Ela é composta por três níveis:

*   **Nível Externo:** Contém os esquemas externos, que são as visões de usuário. Cada visão descreve apenas a parte do BD de interesse para um grupo específico de usuários, ocultando o restante. É implementado com um modelo de dados representativo.
*   **Nível Conceitual:** Contém o esquema conceitual, que descreve a estrutura lógica do BD. Inclui a descrição de tipos de dados, entidades, relacionamentos, restrições e operações do usuário, ocultando detalhes de armazenamento físico.
*   **Nível Interno:** Contém o esquema físico, que descreve a estrutura do armazenamento físico do BD. Detalha como os dados são armazenados e os caminhos de acesso.

Os níveis apresentam descritores para dados que estão efetivamente armazenados em meio físico. O mapeamento é a transformação de requisições e resultados entre esses níveis. O Sistema Gerenciador de Banco de Dados (SGBD) é responsável por transformar uma solicitação do usuário em uma solicitação no esquema conceitual e, em seguida, no esquema interno para que o processamento de dados possa ser realizado.

## Independência de Dados

A independência de dados é a capacidade de alterar o esquema em um nível sem a necessidade de alterar o esquema no nível adjacente superior. Existem dois tipos:

*   **Independência Lógica:** Capacidade de alterar o esquema conceitual sem precisar alterar o esquema externo. Por exemplo, ao adicionar ou remover um tipo de dado, somente o mapeamento entre os níveis e a definição da visão são alterados.
*   **Independência Física:** Capacidade de alterar o esquema interno sem precisar alterar o esquema conceitual. Por exemplo, ao organizar arquivos físicos criando estruturas de acesso adicionais, somente o mapeamento entre os níveis é alterado.

A arquitetura de três esquemas facilita a independência de dados. No entanto, a independência lógica é mais difícil de ser alcançada, pois é mais complexo realizar alterações estruturais e de restrição sem afetar as aplicações. Poucos SGBDs comerciais implementam a arquitetura de três esquemas completamente devido à sobrecarga com os mapeamentos, o que pode levar à ineficiência.

## Linguagens de Banco de Dados

Uma abordagem de BD eficaz deve oferecer linguagens e interfaces apropriadas para cada tipo de usuário. As principais linguagens são:

*   **VDL (View Definition Language):** Linguagem de definição de visão que especifica o esquema externo, as visões de usuário e seus mapeamentos para o esquema conceitual.
*   **DDL (Data Definition Language):** Linguagem de definição de dados que especifica o esquema conceitual.
*   **SDL (Storage Definition Language):** Linguagem de definição de armazenamento que especifica o esquema interno.
*   **DML (Data Manipulation Language):** Linguagem de manipulação de dados utilizada para especificar operações de inserção, exclusão, modificação e recuperação de dados.

As linguagens DML se diferenciam quanto à forma como as operações são especificadas:

*   **Alto Nível (Não Procedural):** Especifica operações complexas de forma concisa, podendo recuperar muitos registros em uma única instrução. É declarativa, ou seja, especifica *quais* dados recuperar e não *como*. É frequentemente chamada de linguagem de consulta por ser usada de maneira interativa.
*   **Baixo Nível (Procedural):** É embutida em linguagens de programação de uso geral (linguagem hospedeira), sendo denominada sublinguagem de dados. Recupera objetos ou registros individuais e os processa separadamente.

Tipicamente, os SGBDs não consideram as diferentes linguagens como distintas. O **SQL (Structured Query Language)** é um exemplo de linguagem de consulta estruturada que combina VDL, DDL, SDL e DML, além de incluir instruções para especificação de restrições, evolução de esquema e outros recursos.

## Referências Bibliográficas

[1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
[2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
[3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.

