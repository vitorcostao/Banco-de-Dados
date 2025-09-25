# Resumo: Armazenamento em Memória para Sistemas de Banco de Dados

Este estudo aborda os conceitos de **armazenamento em memória** em sistemas de banco de dados. O material é distribuído sob licença CC BY-NC-ND 4.0.

## Armazenamento em Memória

Bancos de Dados (BDs) são armazenados fisicamente em diversos meios de armazenamento computacional, que formam uma hierarquia. Essa hierarquia reflete a distância do meio à CPU, impactando diretamente a velocidade de acesso e o custo. Os principais tipos de memória são:

*   **Memória Primária**: Próxima e operada diretamente pela CPU (Registradores, Cache, RAM).
*   **Memória Secundária**: Distante e não operada diretamente pela CPU (Flash, HD).
*   **Memória Terciária**: Muito distante e não operada diretamente pela CPU (Fita, Óptica).

Programas residem e são executados em memória primária, enquanto BDs, por serem geralmente grandes, persistem em memória secundária. O SGBD é responsável por transferir partes do BD entre as memórias conforme a necessidade.

### Correlação entre Capacidade, Velocidade e Custo

Existe uma correlação inversa entre capacidade de armazenamento e velocidade de transferência, e uma correlação direta entre velocidade e custo:

*   **Capacidade de Armazenamento**: Quantidade de dados (bytes) que podem ser armazenados.
*   **Velocidade de Transferência**: Quantidade de dados (bits) que podem ser transferidos por unidade de tempo (segundo).
*   **Custo**: Unidade monetária por quantidade de dados (bytes) armazenados.

Em geral, maior capacidade implica menor velocidade, e maior velocidade implica maior custo.

### Hierarquia de Memória Detalhada

| Tipo        | Nome         | Capacidade      | Velocidade (bps) | Custo (R$/MB) | Volátil | Uso Principal                                     |
| :---------- | :----------- | :-------------- | :--------------- | :------------ | :------ | :------------------------------------------------ |n| Primária    | Registrador  | KB              | ≈ 60 Tbps        | > 500         | Sim     | Execução de instruções de programa                |
| Primária    | Cache        | MB (L0 a L4)    | ≈ 6 Tbps (L1)    | > 100 (L0)    | Sim     | Acelera execução de instruções (pré-busca)        |
| Primária    | RAM          | Dezenas de GB   | ≈ 80 Gbps        | ≈ 0,05        | Sim     | Manter instruções e dados temporários             |
| Secundária  | Flash        | Alguns TB       | ≈ 5 Gbps         | ≈ 0,0007      | Não     | Manter dados de maneira persistente               |
| Secundária  | HD           | Dezenas de TB   | ≈ 100 Mbps       | ≈ 0,0002      | Não     | Manter dados de maneira persistente               |
| Terciária   | Óptica       | PB (jukebox)    | ≈ 20 Mbps        | ≈ 0,0001      | Não     | Dados pouco mutáveis, acesso sequencial (multimídia) |
| Terciária   | Fita         | PB (jukebox)    | ≈ 2 Mbps         | ≈ 0,00003     | Não     | Dados pouco mutáveis, acesso sequencial (backups) |

*Os valores são estimativas para fornecer uma ordem de grandeza e podem variar.*n
## Gerenciamento de Dados em SGBDs

Em sistemas de banco de dados, os dados são armazenados de acordo com sua natureza:

*   **Transientes**: Persistem em memória por um período limitado, apenas durante a execução do programa.
*   **Persistentes**: Permanecem em memória por longos períodos, sendo acessados e processados repetidamente.

SGBDs devem gerenciar eficientemente a transferência de dados transientes e permanentes entre as memórias. No projeto físico, DBAs e projetistas devem escolher as melhores técnicas de organização de dados para equilibrar custo e desempenho.

Aplicações tipicamente necessitam de apenas uma pequena parte do BD de cada vez. É responsabilidade do SGBD garantir que:

1.  A parte necessária seja transferida da memória secundária para a primária.
2.  A CPU processe os dados na memória primária adequadamente.
3.  Os dados processados sejam transferidos de volta à memória secundária.

### Discos Magnéticos (HD)

Tipicamente, BDs são armazenados permanentemente em discos magnéticos (HDs) devido à sua excelente relação custo-benefício, que é mais vantajosa que outros tipos de memória secundária. HDs oferecem acesso aleatório e armazenam dados em trilhas, que são divididas em blocos.

*   **Bloco (página)**: Unidade mínima de transferência de dados entre disco e memória primária. Seu tamanho é fixado na formatação (geralmente entre 512B e 8KB) e não pode ser alterado dinamicamente. Blocos são separados por lacunas e podem ser acessados aleatoriamente pelo seu endereço de hardware.
*   **Buffer**: Área reservada contígua em memória primária. Controladores de disco usam o endereço do bloco e do buffer para realizar a transferência.
    *   **Leitura (Input)**: Bloco é copiado para o buffer.
    *   **Escrita (Output)**: Buffer é copiado para o bloco.

#### Leitura e Escrita (I/O) em HD

O processo de I/O envolve:

1.  Controlador recebe endereços de bloco e buffer.
2.  Controlador aciona o atuador para posicionar a cabeça na trilha do endereço de bloco.
3.  Discos giram até o ponto de leitura e escrita.
4.  Dados são copiados de ou para o buffer.

O **Tempo de Transferência** de um bloco é composto por:

*   **Tempo de Busca**: Para posicionar a cabeça de leitura/escrita na trilha.
*   **Tempo de Latência**: Para o disco girar até o ponto de leitura/escrita.
*   **Tempo de Transferência de Bloco**: Para os dados serem copiados.

`Transferência de Bloco ≤ Busca + Latência`

Transferir múltiplos blocos consecutivos na mesma trilha ou cilindro torna a transferência mais eficiente, eliminando tempos de busca e latência acumulados.

#### Buffering de Blocos

Técnica que reserva vários buffers em memória primária para agilizar a transferência de blocos. Controladores de disco e CPUs podem operar de forma independente e paralela usando buffers diferentes.

*   **Duplo Buffering**: Uso de dois buffers para leitura ou gravação. Enquanto um buffer está sendo preenchido/esvaziado pelo controlador de disco, a CPU processa dados no outro buffer. Isso permite leitura/gravação contínua em blocos consecutivos, eliminando tempos de busca e latência (exceto para o primeiro bloco) e reduzindo a ociosidade da CPU.

#### Alocação de Blocos em HD

A forma como os blocos são alocados em disco impacta o desempenho de I/O:

*   **Alocação Contígua**: Blocos consecutivos em disco. Oferece I/O rápido com duplo buffering, mas dificulta a expansão e pode resultar em realocações em caso de alteração de dados.
*   **Alocação por Ligação**: Cada bloco contém um ponteiro para o próximo. Facilita a expansão, mas o I/O é mais lento devido à impossibilidade de usar duplo buffering.
*   **Alocação por Segmento (Clusters)**: Agrupa blocos consecutivos em segmentos, e cada segmento contém um ponteiro para o próximo. Combina características da alocação contígua e por ligação, tornando o duplo buffering viável em um segmento e facilitando a expansão com menos realocações.
*   **Alocação Indexada**: Blocos especiais de índice são criados contendo ponteiros para blocos de dados. Oferece I/O rápido (busca efetuada em blocos de índice, que podem ter alocação contígua ou por segmento) e fácil expansão, com realocações ocorrendo em blocos de índice.

## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.

Este resumo foi elaborado por Manus AI com base no conteúdo do PDF "Sistemas de Banco de Dados - Fundamentos em Bancos de Dados Relacionais" de Wladmir Cardoso Brandão.

