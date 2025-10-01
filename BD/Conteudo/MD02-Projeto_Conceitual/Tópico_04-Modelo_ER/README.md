# Resumo: Fundamentos em Bancos de Dados Relacionais e Modelo Entidade-Relacionamento

Este estudo apresenta um resumo dos conceitos fundamentais em sistemas de banco de dados, abordando tanto a estrutura e organização dos dados quanto o modelo conceitual. Serão explorados os temas de esquema e instância de banco de dados, arquitetura de três esquemas, independência de dados, linguagens de banco de dados e o Modelo Entidade-Relacionamento (ER).
O material é distribuído sob licença CC BY-NC-ND 4.0.

## Fundamentos em Bancos de Dados Relacionais

### Esquema de Banco de Dados (BD)

O esquema de um banco de dados é a descrição de sua estrutura, funcionando como os metadados que definem a organização dos dados. Ele é estabelecido durante a fase de projeto e tende a ser estável, com poucas alterações. A representação visual dos esquemas é feita por meio de diagramas que ilustram aspectos como restrições, tipos de registros e itens de dados. Um 

construtor de esquema é um componente do esquema, como a definição de uma tabela 'professor'. É crucial entender que o diagrama de esquema descreve a estrutura dos tipos de elementos, mas não as instâncias, ou seja, os dados reais contidos nesses elementos.

### Instância de Banco de Dados (BD)

A instância de um banco de dados representa o conjunto de dados armazenados em um momento específico. O ciclo de vida de um BD pode iniciar com um 'Estado Vazio', onde o esquema já está definido, mas ainda não há dados. Em seguida, ele transita para um 'Estado Inicial', no qual o BD é preenchido com dados iniciais. O estado do BD é dinâmico, alterando-se continuamente à medida que dados são inseridos, removidos ou modificados.

### Arquitetura de Três Esquemas

A arquitetura de três esquemas é uma metodologia que permite a visualização da estrutura do banco de dados em múltiplos níveis de abstração. Essa abordagem promove a autodescrição dos dados, o suporte a diversas visões de usuário e a independência das aplicações em relação à estrutura física do banco. Ela é composta por três níveis distintos:

*   **Nível Externo:** Este nível engloba os esquemas externos, que são as visões personalizadas para os usuários. Cada visão é projetada para exibir apenas a porção do banco de dados relevante para um grupo específico de usuários, mantendo o restante oculto. Sua implementação se baseia em um modelo de dados representativo.
*   **Nível Conceitual:** Aqui reside o esquema conceitual, que detalha a estrutura lógica global do banco de dados. Ele abrange a descrição de tipos de dados, entidades, relacionamentos, restrições de integridade e as operações que os usuários podem realizar, abstraindo os detalhes de como os dados são fisicamente armazenados.
*   **Nível Interno:** Este nível contém o esquema físico, que descreve a maneira como os dados são efetivamente armazenados no meio físico do banco de dados. Inclui informações detalhadas sobre a organização dos dados e os mecanismos de acesso.

Todos esses níveis fornecem descritores para os dados que estão fisicamente armazenados. O processo de 'mapeamento' é a conversão de requisições e resultados entre esses diferentes níveis. O Sistema Gerenciador de Banco de Dados (SGBD) é o responsável por traduzir uma solicitação do usuário para o esquema conceitual e, posteriormente, para o esquema interno, viabilizando o processamento dos dados.

### Independência de Dados

A independência de dados é a capacidade de modificar o esquema em um nível sem que isso exija alterações no esquema do nível adjacente superior. Existem duas formas principais de independência:

*   **Independência Lógica:** Refere-se à habilidade de alterar o esquema conceitual sem impactar o esquema externo. Por exemplo, se um novo tipo de dado for adicionado ou removido, apenas o mapeamento entre os níveis e a definição da visão precisam ser ajustados.
*   **Independência Física:** Trata-se da capacidade de modificar o esquema interno sem afetar o esquema conceitual. Um exemplo seria a reorganização de arquivos físicos ou a criação de novas estruturas de acesso; nessas situações, somente o mapeamento entre os níveis é alterado.

A arquitetura de três esquemas é fundamental para alcançar a independência de dados. Contudo, a independência lógica é geralmente mais desafiadora de ser implementada, pois alterações estruturais e de restrição podem ter um impacto significativo nas aplicações. Muitos SGBDs comerciais não implementam a arquitetura de três esquemas em sua totalidade devido à complexidade e à sobrecarga de desempenho associada aos mapeamentos.

### Linguagens de Banco de Dados

Para que uma abordagem de banco de dados seja eficaz, ela deve oferecer linguagens e interfaces adequadas para diferentes tipos de usuários. As principais linguagens são:

*   **VDL (View Definition Language):** Utilizada para definir o esquema externo, as visões de usuário e seus mapeamentos para o esquema conceitual.
*   **DDL (Data Definition Language):** Empregada para especificar o esquema conceitual do banco de dados.
*   **SDL (Storage Definition Language):** Usada para descrever o esquema interno, ou seja, a forma como os dados são armazenados fisicamente.
*   **DML (Data Manipulation Language):** Permite a especificação de operações como inserção, exclusão, modificação e recuperação de dados.

As linguagens DML podem ser classificadas pela forma como as operações são definidas:

*   **Alto Nível (Não Procedural):** Permite especificar operações complexas de forma concisa, recuperando múltiplos registros com uma única instrução. É uma linguagem declarativa, focada em *o que* deve ser recuperado, e não *como*. É comumente referida como linguagem de consulta, devido ao seu uso interativo.
*   **Baixo Nível (Procedural):** Geralmente incorporada a linguagens de programação de uso geral (linguagem hospedeira), sendo chamada de sublinguagem de dados. Ela opera em objetos ou registros individuais, processando-os separadamente.

É comum que os SGBDs não diferenciem explicitamente essas linguagens. O **SQL (Structured Query Language)** é um exemplo proeminente que integra funcionalidades de VDL, DDL, SDL e DML, além de oferecer recursos para definição de restrições e evolução de esquemas.

## Modelo Entidade-Relacionamento (ER)

O Modelo Entidade-Relacionamento (ER) é um modelo conceitual de alto nível, essencial para o projeto de bancos de dados. Ele permite descrever a estrutura de um banco de dados em termos de entidades, seus atributos e os relacionamentos entre essas entidades. O desenvolvimento do Modelo ER parte da especificação de um 'minimundo', que é uma descrição textual dos requisitos de dados do sistema. O Diagrama Entidade-Relacionamento (Diagrama ER) é a representação gráfica desse modelo, ilustrando visualmente as entidades, atributos, relacionamentos e as restrições aplicadas.

### Entidade

Uma entidade representa um objeto ou conceito do mundo real que possui uma existência distinta e pode ser diferenciado de outros objetos. As entidades são agrupadas em 'tipos de entidade', que são coleções de entidades com características semelhantes. Um 'tipo de entidade (E)' é, portanto, um conjunto de instâncias de entidades do mesmo tipo, enquanto uma 'instância de entidade (e)' é um elemento específico pertencente a um tipo de entidade E. No Diagrama ER, um tipo de entidade é simbolizado por um retângulo rotulado. Uma 'entidade fraca' é aquela cuja existência depende diretamente da existência de outra entidade, sendo representada por um retângulo com borda dupla.

### Atributo

Um atributo é uma propriedade que descreve uma característica específica de uma entidade. No Diagrama ER, os atributos são representados por elipses rotuladas, conectadas à entidade que descrevem. Existem diferentes tipos de atributos:

*   **Simples:** É indivisível e representado por uma elipse simples.
*   **Composto:** Pode ser decomposto em outros atributos menores. É ilustrado por uma elipse principal com outras elipses (atributos componentes) ligadas a ela.
*   **Multivalorado:** Pode conter múltiplos valores para uma única instância de entidade. É representado por uma elipse com borda dupla.
*   **Derivado:** Seu valor não é armazenado diretamente, mas pode ser calculado a partir de outros atributos ou relacionamentos. É indicado por uma elipse com borda tracejada.
*   **Chave:** Um atributo ou um conjunto de atributos que identifica de forma única cada instância de uma entidade. No diagrama, é representado por uma elipse com o rótulo sublinhado.
*   **Chave Parcial (Discriminador):** Utilizado para identificar unicamente cada instância de uma entidade fraca dentro do contexto da entidade forte à qual está relacionada. É representado por uma elipse com o rótulo sublinhado de maneira tracejada.

### Relacionamento

Um relacionamento estabelece uma associação lógica entre duas ou mais entidades. Um 'tipo de relacionamento (R)' é um conjunto de associações de um mesmo tipo, enquanto uma 'instância de relacionamento (r)' é uma associação específica entre instâncias de entidades. No Diagrama ER, um tipo de relacionamento é simbolizado por um losango rotulado. Um 'relacionamento fraco' ou 'de dependência' é uma associação que envolve pelo menos uma entidade fraca, sendo representado por um losango com borda dupla. O 'grau do relacionamento' indica o número de entidades que participam da associação (por exemplo, binário para duas entidades, ternário para três). O 'nome de função' descreve o papel que cada entidade desempenha no relacionamento, enriquecendo sua semântica. Um 'relacionamento recursivo' ocorre quando a mesma entidade participa de um relacionamento mais de uma vez, desempenhando funções distintas.

### Restrição

Restrições são regras que limitam as possibilidades de associação entre entidades nos relacionamentos. As principais restrições incluem:

*   **Razão de Participação:** Define se a participação de uma entidade em um relacionamento é parcial (opcional) ou total (obrigatória). A 'participação total' é indicada por uma linha dupla conectando a entidade ao relacionamento, significando que todas as instâncias da entidade devem participar do relacionamento.
*   **Razão de Cardinalidade:** Especifica o número máximo de relacionamentos em que uma instância de entidade pode participar:
    *   **1:1 (Um para Um):** Cada instância de entidade pode participar de apenas um relacionamento.
    *   **1:N (Um para Muitos):** Uma instância de uma entidade pode se relacionar com múltiplas instâncias de outra, enquanto cada instância da segunda entidade se relaciona com apenas uma da primeira.
    *   **N:N (Muitos para Muitos):** Múltiplas instâncias de ambas as entidades podem se relacionar entre si.
*   **Mínimos e Máximos:** Permitem definir limites de cardinalidade mais específicos, representados por rótulos (min, max) nas extremidades do relacionamento.

### Convenção de Nomes

Para garantir clareza e consistência na construção de Diagramas ER, é fundamental adotar uma convenção de nomes. Por exemplo:

*   **Entidade:** Nome no singular, com a primeira letra em maiúscula.
*   **Relacionamento:** Nome no singular, com todas as letras em minúsculas.
*   **Atributo:** Nome com as letras iniciais de cada palavra em maiúscula. Atributos multivalorados podem ter o nome no plural.

## Referências Bibliográficas

[1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
[2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
[3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.

