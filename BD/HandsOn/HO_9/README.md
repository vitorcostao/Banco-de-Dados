# Respostas Hands On

| Entidade        | Fator de Bloco | Nº de Blocos Necessários | Espaço Desperdiçado por Bloco | Espaço Total Gasto  |
|-----------------|----------------|--------------------------|-------------------------------|---------------------|
| Atores          |      11        |        910               |           112                 |       1,78   MB     |
| Clientes        |      5         |        20000             |           48                  |       39,06  MB     |
| Filmes          |      8         |        250000            |           0                   |       488,28 MB     |
| Funcionarios    |      11        |        319               |           112                 |       639,09 KB     |
| Midias          |      36        |        277778            |           32                  |       542,04 MB     |
| Aluguel         |      42        |        476191            |           32                  |       930,04 MB     |
| Pagamentos      |      24        |        2083334           |           32                  |       3,97   GB     |
| AtoresEmFilmes  |      64        |        15.625            |           0                   |       30,52  MB     |

### Atores

* Cada registro ocupa **176B**.
* Em um bloco de 2048B cabem **11 registros**.
* Para armazenar 10.000 registros são necessários **910 blocos**.
* Cada bloco desperdiça **112B**.
* Espaço total = **1,78 MB**.

### Clientes

* Cada registro ocupa **400B**.
* Em 2048B cabem **5 registros**.
* Para 100.000 registros são necessários **20.000 blocos**.
* Desperdício de **48B** por bloco.
* Espaço total = **39,06 MB**.

### Filmes

* Cada registro ocupa **256B**.
* Em 2048B cabem exatamente **8 registros**, sem desperdício.
* Para 2.000.000 registros são necessários **250.000 blocos**.
* Espaço total = **488,28 MB**.

### Funcionários

* Cada registro ocupa **176B**.
* Em 2048B cabem **11 registros**.
* Para 3.500 registros são necessários **319 blocos**.
* Cada bloco desperdiça **112B**.
* Espaço total = **639 KB**.

### Mídias

* Cada registro ocupa **56B**.
* Em 2048B cabem **36 registros**.
* Para 10.000.000 registros são necessários **277.778 blocos**.
* Desperdício de **32B** por bloco.
* Espaço total = **542 MB**.

### Aluguel

* Cada registro ocupa **48B**.
* Em 2048B cabem **42 registros**.
* Para 20.000.000 registros são necessários **476.191 blocos**.
* Desperdício de **32B** por bloco.
* Espaço total = **930 MB**.

### Pagamentos

* Cada registro ocupa **84B**.
* Em 2048B cabem **24 registros**.
* Para 50.000.000 registros são necessários **2.083.334 blocos**.
* Desperdício de **32B** por bloco.
* Espaço total = **3,97 GB**.

### AtoresEmFilmes

* Cada registro ocupa **32B**.
* Em 2048B cabem exatamente **64 registros**, sem desperdício.
* Para 1.000.000 registros são necessários **15.625 blocos**.
* Espaço total = **30,52 MB**.
