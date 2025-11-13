# Resumo: Processamento de Transação

## Introdução

Uma Transação é definida como um conjunto de operações de acesso ao Banco de Dados que constitui uma unidade lógica. Tipicamente, é executada em sistemas multiusuários de forma intercalada ou paralela. 
Todas as operações de uma transação são tratadas como um bloco único, sendo todas confirmadas ou todas abortadas.

As transações podem ser de Somente Leitura ou Leitura-Escrita.


## Propriedades ACID

As transações devem manter as propriedades ACID para garantir a integridade e confiabilidade do Banco de Dados:


### Atomicidade

A transação é uma unidade atômica, ou seja, deve ser executada integralmente ou não ser executada de forma alguma.


### Consistência

As restrições especificadas no esquema do Banco de Dados devem ser respeitadas antes e após o processamento da transação.


### Isolamento

Transações concorrentes devem ser independentes na sua execução, sem sofrer interferência umas das outras. O nível de isolamento pode ser configurado.


### Durabilidade

As alterações que são confirmadas devem persistir permanentemente no Banco de Dados, mesmo em caso de falha do sistema.


## Concorrência e Problemas

A execução concorrente de múltiplas transações pode levar a problemas de integridade de dados:


### Problemas Comuns de Concorrência

*   **Atualização Perdida:** A escrita de uma transação é sobrescrita pela escrita de outra, resultando na perda da primeira atualização.
*   **Leitura Suja:** Uma transação lê um item que foi atualizado por outra transação que, posteriormente, falha.
*   **Leitura Não Repetitiva:** A mesma transação lê valores diferentes para o mesmo item em momentos distintos, pois outra transação alterou o valor no meio tempo.
*   **Resumo Incorreto:** Uma transação de agregação lê itens que estão sendo atualizados por outras transações, gerando um resultado incorreto.


### Controle de Concorrência

As técnicas de controle de concorrência, como o Bloqueio, resolvem esses problemas, garantindo a execução independente. 
O bloqueio restringe a concorrência, mas está sujeito a problemas como travamento e espera indefinida.


## Escalonamento e Serialização

O Escalonamento é a intercalação das operações de transações distintas para execução simultânea.


### Escalonamento Serial

Não há intercalação, ou seja, todas as operações de uma transação precedem as de outra. Garante o isolamento, mas limita a concorrência e pode gerar ociosidade de CPU.


### Escalonamento Serializável

É um escalonamento não serial que é equivalente a algum escalonamento serial. Os escalonamentos serializáveis são considerados corretos, pois garantem o isolamento. 
A Equivalência por Conflito e o Grafo de Precedência são métodos para determinar a serialização.


### Escalonamento Recuperável

Uma transação confirmada não será desfeita, garantindo a durabilidade. Nenhuma transação que lê um item escrito por outra pode confirmar antes da transação escritora.



## Falhas e Recuperação

A execução de transações está sujeita a diferentes tipos de falhas (Sistema, Operação, Concorrência, Disco, Catástrofe). Os SGBDs são preparados para lidar com elas através de:

*   **Logging:** Registro histórico de todas as operações de transações.
*   **Dumping:** Cópia de segurança do banco de dados.



## Níveis de Isolamento (SQL)

Os SGBDs permitem configurar o nível de isolamento através do comando `SET TRANSACTION`, que define quais problemas de concorrência são evitados:

| Nível de Isolamento | Problemas Evitados |
| :--- | :--- |
| **Read Uncommitted** | Nenhum (permite leitura suja e atualização perdida) |
| **Read Committed** | Atualização Perdida e Leitura Suja |
| **Repeatable Read** | Atualização Perdida e Leitura Suja, garantindo Leitura Repetitiva |
| **Serializable** | Todos os problemas (Atualização Perdida, Leitura Suja, Resumo Incorreto), garantindo Leitura Repetitiva |
