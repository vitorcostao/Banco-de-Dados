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

Para atores, o arquivo de índice ocupará, por registro, 32 bytes, que são 16 do código de atores e 16 do ponteiro para o bloco do disco.  

- **Fator de Bloco (FB):** 64  
- **Número de blocos por nível:**  
  - Nível 0 (BM1) = 157  
  - Nível 1 (BM2) = 3  
  - Nível 2 (BM3) = 1  
- **Espaço utilizado:** 322 KB  
- **Níveis do índice:** 3


### Clientes

Para clientes, o arquivo de índice ocupará, por registro, 27 bytes, que são 11 do CPF e 16 do ponteiro para o bloco do disco.  

- **Fator de Bloco (FB):** 75  
- **Número de blocos por nível:**  
  - Nível 0 (BM1) = 1334  
  - Nível 1 (BM2) = 18  
  - Nível 2 (BM3) = 1  
- **Espaço utilizado:** 2,64 MB  
- **Níveis do índice:** 3


### Filmes

Para filmes, o arquivo de índice ocupará, por registro, 32 bytes, que são 16 do código do filme e 16 do ponteiro para o bloco do disco.  

- **Fator de Bloco (FB):** 64  
- **Número de blocos por nível:**  
  - Nível 0 (BM1) = 31250  
  - Nível 1 (BM2) = 489  
  - Nível 2 (BM3) = 8  
  - Nível 3 (BM4) = 1  
- **Espaço utilizado:** 61,97 MB  
- **Níveis do índice:** 4


### Funcionários

Para funcionários, o arquivo de índice ocupará, por registro, 27 bytes, que são 11 do CPF e 16 do ponteiro para o bloco do disco.  

- **Fator de Bloco (FB):** 75  
- **Número de blocos por nível:**  
  - Nível 0 (BM1) = 47  
  - Nível 1 (BM2) = 1  
- **Espaço utilizado:** 96 KB  
- **Níveis do índice:** 2


### Mídias

Para mídias, o arquivo de índice ocupará, por registro, 40 bytes, que são 24 do identificador da mídia e 16 do ponteiro para o bloco do disco.  

- **Fator de Bloco (FB):** 51  
- **Número de blocos por nível:**  
  - Nível 0 (BM1) = 196079  
  - Nível 1 (BM2) = 3849  
  - Nível 2 (BM3) = 76  
  - Nível 3 (BM4) = 2  
  - Nível 4 (BM5) = 1  
- **Espaço utilizado:** 390,5 MB  
- **Níveis do índice:** 5


### Pagamentos

Para pagamentos, o arquivo de índice ocupará, por registro, 64 bytes, que são 48 do identificador do pagamento e 16 do ponteiro para o bloco do disco.  

- **Fator de Bloco (FB):** 32  
- **Número de blocos por nível:**  
  - Nível 0 (BM1) = 1562500  
  - Nível 1 (BM2) = 48829  
  - Nível 2 (BM3) = 1527  
  - Nível 3 (BM4) = 48  
  - Nível 4 (BM5) = 2  
  - Nível 5 (BM6) = 1  
- **Espaço utilizado:** 3,07 GB  
- **Níveis do índice:** 6


### Tabela de Dados do Índice Multinível Estático

| **Entidade / Índice** | **Tamanho por Registro (bytes)** | **Fator de Bloco** | **Nº Total de Blocos** | **Espaço Utilizado** |
|-----------------------|----------------------------------|--------------------|------------------------|---------------------|
| Atores                | 32                              | 64                | 161                    | 322 KB              |
| Clientes              | 27                              | 75                | 1353                   | 2,64 MB             |
| Filmes                | 32                              | 64                | 31748                  | 61,97 MB            |
| Funcionários          | 27                              | 75                | 48                     | 96 KB               |
| Mídias                | 40                              | 51                | 200008                 | 390,5 MB            |
| Pagamentos            | 64                              | 32                | 1612907                | 3,07 GB             |


## Índices Multinível Dinâmico
