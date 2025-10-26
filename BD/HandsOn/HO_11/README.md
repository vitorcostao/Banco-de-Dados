# Respostas Hands On 11

## Enunciado

Construir um índice multinível estático na chave primária e índices multinível dinâmicos com árvore B+ em cada chave estrangeira para cada arquivo (tabela) presente no modelo relacional abaixo,
apresentando a blocagem (fator de bloco), o número de blocos necessários para armazenar o índice, o espaço total gasto para armazenar cada arquivo de índice e o número de acessos a blocos necessários
para recuperar um registro usando cada índice construído.

<img width="924" height="606" alt="Captura de tela 2025-10-24 175740" src="https://github.com/user-attachments/assets/78b5c896-753a-496e-b1f1-bf05cca7d7c8" />



Considere que o ponteiro para blocos de disco tem 16B, que o tamanho de bloco de disco é de 2KB, que um nó de árvore B+ seja armazenado em um bloco de disco, que a ocupação na árvore B+ seja de 69%,
que cada ponteiro de nó da árvore B+ ocupe 12B, que os arquivos possuem registros de tamanho fixo, não espalhados e que eles têm a seguinte configuração de número de registros e tamanhos de campos:

- Atores (10.000 registros) → Codigo (16B), Nome (160B)
- Clientes (100.000 registros) → CPF (11B), Nome (160B), Endereco (200B), Telefone (16B), DataNascimento (12B), Sexo (1B)
- Filmes (2.000.000 registros) → Codigo (16B), Nome (160B), Genero (80B)
- Funcionarios (3.500 registros) → CPF (11B), Nome (160B)
- Midias (10.000.000 registros) → Identificador (24B), Tipo (8B), PrecoDiaria (24B)
- Aluguel (20.000.000 registros)  → DataLocacao (12B), DataDevolucao (10B), ValorPagar (24B)
- Pagamentos (50.000.000 registros) → Codigo (48B), Data (12B), Valor (24B)
- AtoresEmFilmes (1.000.000 registros)

---

## Índice Multinível Estático

### Atores

Para atores, o arquivo de índice ocupará, por registro, 32 bytes, que são 16 do código de atores e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (16 + 16) = 64.
- **Número de Blocos:** BM1 = (10000/ 64) = 157 e BM2 = 157 / 64 = 3.
- **Espaço utilizado:** (160 * 2048) = 320 KB.
- **Número de acesso a blocos:**

### Clientes 

Para clientes, o arquivo de índice ocupará, por registro, 27 bytes, que são 11 do CPF e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (11 + 16) = 75.
- **Número de Blocos:** BM1 = (100000/ 75) = 1334 e BM2 = 1334 / 75 = 18.
- **Espaço utilizado:** (1352 * 2048) = 2,64 MB.

### Filmes

Para atores, o arquivo de índice ocupará, por registro, 32 bytes, que são 16 do código de filmes e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (16 + 16) = 64.
- **Número de Blocos:** BM1 = (2000000/ 64) = 31250 e BM2 = 31250 / 64 = 489.
- **Espaço utilizado:** (31739 * 2048) = 61,95 MB.

### Funcionários

Para funcionários, o arquivo de índice ocupará, por registro, 27 bytes, que são 11 do CPF e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (11 + 16) = 75
- **Número de Blocos:** BM1 = (3500 / 75) = 47 e BM2 = 47 / 75 = 1
- **Espaço utilizado:** (47 + 1) * 2048 = 96,5 KB


### Mídias

Para mídias, o arquivo de índice ocupará, por registro, 40 bytes, que são 24 do identificador da mídia e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (24 + 16) = 51
- **Número de Blocos:** BM1 = (10000000 / 51) = 196078 e BM2 = 196078 / 51 = 3847
- **Espaço utilizado:** (196078 + 3847) * 2048 = 390,3 MB



### Pagamentos

Para pagamentos, o arquivo de índice ocupará, por registro, 64 bytes, que são 48 do identificador do pagamento e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (48 + 16) = 32
- **Número de Blocos:** BM1 = (50000000 / 32) = 1562500 e BM2 = 1562500 / 32 = 48829
- **Espaço utilizado:** (1562500 + 48829) * 2048 = 3,07 GB



### Tabela de dados

| **Entidade / Índice** | **Tamanho por Registro (bytes)** | **Fator de Bloco** | **BM1 (Nº de Blocos)** | **BM2 (Nº de Blocos)** | **Espaço Utilizado** |
|-----------------------|----------------------------------|--------------------|------------------------|------------------------|----------------------|
| Geral                 | 32                               | 64                 | 157                    | 3                      | 320 KB               |
| Clientes              | 27                               | 75                 | 1.334                  | 18                     | 2,64 MB              |
| Filmes                | 32                               | 64                 | 31.250                 | 489                    | 61,95 MB             |
| Funcionários          | 27                               | 75                 | 47                     | 1                      | 96,5 KB              |
| Mídias                | 40                               | 51                 | 196.078                | 3.847                  | 390,3 MB               |
| Pagamentos            | 64                               | 32                 | 1.562.500              | 48.829                 | 3,07 GB              | 

---

## Índices Multinível Dinâmico


### Índice multinivel dinâmico (CPF_Cliente)

Para o índice secundário, cada registro ocupa 23 bytes, sendo 11 do CPF_Cliente e 12 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2 * 1024 * 0.69) / (11 + 12) ≈ 61
- **Número de Blocos:** (20.000.000 / 61) ≈ 327.869
- **Altura da Árvore:** 5
- **Altura dos Nós Índice:** 4



### Índice multinivel dinâmico (CodFilme + CodAtor)

Para o índice secundário, cada registro ocupa 44 bytes, sendo 16 do CodFilme, 16 do CodAtor e 12 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2 * 1024 * 0.69) / (16 + 16 + 12) ≈ 32
- **Número de Blocos:** (1.000.000 / 32) ≈ 31.250
- **Altura da Árvore:** 4
- **Altura dos Nós Índice:** 3


### Índice multinivel dinâmico (CodFilme)

Para o índice secundário, cada registro ocupa 28 bytes, sendo 16 do CodFilme e 12 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2 * 1024 * 0.69) / (16 + 12) ≈ 50
- **Número de Blocos:** (10.000.000 / 50) ≈ 200.000
- **Altura da Árvore:** 5
- **Altura dos Nós Índice:** 4



### Índice multinivel dinâmico (ID_Midia + CPF_Cliente)

Para o índice secundário, cada registro ocupa 47 bytes, sendo 24 do ID_Midia, 11 do CPF_Cliente e 12 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2 * 1024 * 0.69) / (24 + 11 + 12) ≈ 30
- **Número de Blocos:** (50.000.000 / 30) ≈ 1.666.667
- **Altura da Árvore:** 6
- **Altura dos Nós Índice:** 5


### Índice multinivel dinâmico (CPF_Cliente + ID_Midia + CPF_Funcionario)

Para o índice secundário, cada registro ocupa 58 bytes, sendo 11 do CPF_Cliente, 24 do ID_Midia, 11 do CPF_Funcionario e 12 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2 * 1024 * 0.69) / (11 + 24 + 11 + 12) ≈ 24
- **Número de Blocos:** (20.000.000 / 24) ≈ 833.333
- **Altura da Árvore:** 6
- **Altura dos Nós Índice:** 5
