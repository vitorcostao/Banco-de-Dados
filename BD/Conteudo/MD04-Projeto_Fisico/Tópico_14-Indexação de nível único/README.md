# Resumo: Indexação de Nível Único

Este estudo aborda a Indexação de Nível Único, algo que é essencial otimizar consultas em Bancos de Dados. O material é distribuído sob licença CC BY-NC-ND 4.0.

## 1. Indexação

### Definição e conceitos básicos

A indexação é uma estratégia utilizada para otimizar pesquisas de dados em diversos ambientes, sejam em sistemas de Bancos de Dados,
sejam em abordagens com processamento em arquivos. Nesse contexto, tal técnica se resume em definir um caminho alternativo para o acesso a
algum registro de um arquivo, que se trata de um índice, a fim de localiza-lo por meio de um atributo chave.

- O **Arquivo de Índice** é uma estrutura adicional que armazena os índices.
- Contém **campos de indexação** provenientes do arquivo de dados (indexado).
- Cada **registro de índice** consiste nos campos de indexação e um ponteiro para o bloco do arquivo de dados que armazena o registro correspondente.


## 2. Tipos de Índice de Nível Único

Existem diferentes abordagens para a criação de índices de nível único, que variam principalmente na forma como os registros do índice se relacionam com os registros do arquivo de dados.

### Índice Primário

O Índice Primário é construído sobre a chave primária do arquivo de dados. Ele é um **índice esparso**, o que significa que nem todos os registros do arquivo de dados possuem uma entrada correspondente no arquivo de índice.

- O campo de indexação é a própria chave primária.
- Exige que o arquivo de dados esteja fisicamente ordenado pela chave primária.
- Geralmente, cria-se um registro de índice para cada bloco do arquivo de dados, apontando para o primeiro registro daquele bloco (âncora do bloco).

### Índice de Agrupamento (Clustering)

O Índice de Agrupamento, ou *Clustering*, também é um **índice esparso**. Ele é criado sobre um campo de agrupamento que não é necessariamente uma chave, ou seja, permite valores duplicados.

- O campo de indexação é um campo não-chave pelo qual o arquivo está ordenado.
- Exige que o arquivo de dados esteja fisicamente ordenado pelo campo de agrupamento.
- Cria-se um registro de índice para cada valor distinto presente no campo de agrupamento, apontando para o primeiro registro de dados que contém aquele valor.

### Índice Secundário

O Índice Secundário é um **índice denso**, o que significa que existe uma entrada no arquivo de índice para cada registro no arquivo de dados. Sua principal vantagem é a flexibilidade.

- O campo de indexação pode ser qualquer campo do arquivo de dados, ordenado ou não.
- Não exige que o arquivo de dados esteja ordenado.
- Como é denso, o arquivo de índice possui um registro para cada registro do arquivo de dados, o que pode resultar em um índice maior em comparação com os esparsos, mas oferece maior flexibilidade, permitindo múltiplos índices sobre o mesmo arquivo.

## 3. Comparativo

A tabela abaixo resume as principais características dos diferentes tipos de índices de nível único.

| Tipo | Esparsidade | Arquivo Indexado | Quantidade de Registros no Índice |
| :--- | :--- | :--- | :--- |
| Primário | Esparso | Ordenado | Número de blocos do arquivo indexado |
| Agrupamento | Esparso | Ordenado | Número de valores distintos no campo de agrupamento |
| Secundário | Denso | Qualquer | Número de registros do arquivo indexado |


## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.