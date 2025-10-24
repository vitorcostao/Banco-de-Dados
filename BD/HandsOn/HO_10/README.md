# Respostas Hands On

## Enunciado

Construir um índice primário e índices secundários (para cada chave estrangeira) para cada arquivo (tabela) presente no modelo relacional abaixo, apresentando a blocagem (fator de bloco), 
o número de blocos necessários para armazenar o arquivo de índice, o espaço desperdiçado por bloco em cada arquivo de índice, o espaço total gasto para armazenar cada arquivo de índice e 
o número de acessos a blocos necessários para recuperar um registro usando cada índice construído.

<img width="883" height="615" alt="image" src="https://github.com/user-attachments/assets/64d8296d-32d9-407f-bc74-5a3364c4594b" />

Considere que o ponteiro para blocos de disco tem 16B, que o tamanho de bloco de disco é de 2KB, que os arquivos possuem registros de tamanho fixo, não espalhados e 
que eles têm a seguinte configuração de número de registros e tamanhos de campos:

- Atores (10.000 registros) → Codigo (16B), Nome (160B)
- Clientes (100.000 registros) → CPF (11B), Nome (160B), Endereco (200B), Telefone (16B), DataNascimento (12B), Sexo (1B)
- Filmes (2.000.000 registros) → Codigo (16B), Nome (160B), Genero (80B)
- Funcionarios (3.500 registros) → CPF (11B), Nome (160B)
- Midias (10.000.000 registros) → Identificador (24B), Tipo (8B), PrecoDiaria (24B)
- Aluguel (20.000.000 registros)  → DataLocacao (12B), DataDevolucao (10B), ValorPagar (24B)
- Pagamentos (50.000.000 registros) → Codigo (48B), Data (12B), Valor (24B)
- AtoresEmFilmes (1.000.000 registros)

---

## Índices Primários

### Atores

Para atores, o arquivo de índice ocupará, por registro, 32 bytes, que são 16 do código de atores e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (16 + 16) = 64.
- **Número de Blocos:** (10000/ 64) = 157.
- **Espaço desperdiçado:** (2 * 1024 - (64 * 32)) = 0.
- **Espaço utilizado:** (157 * 2048) = 314,25 KB.

### Clientes 

Para clientes, o arquivo de índice ocupará, por registro, 27 bytes, que são 11 do CPF e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (11 + 16) = 75.
- **Número de Blocos:** (100000/ 75) = 1334.
- **Espaço desperdiçado:** (2 * 1024 - (75 * 27)) = 23.
- **Espaço utilizado:** (1352 * 2048) = 2,54 MB.

### Filmes

Para atores, o arquivo de índice ocupará, por registro, 32 bytes, que são 16 do código de filmes e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (16 + 16) = 64.
- **Número de Blocos:** (2000000/ 64) = 31250.
- **Espaço desperdiçado:** (2 * 1024 - (64 * 32)) = 0.
- **Espaço utilizado:** (31250 * 2048) = 64 MB.

### Funcionários

Para funcionários, o arquivo de índice ocupará, por registro, 27 bytes, que são 11 do CPF e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (11 + 16) = 75.
- **Número de Blocos:** (3500/ 75) = 47.
- **Espaço desperdiçado:** (2 * 1024 - (75 * 27)) = 23.
- **Espaço utilizado:** (47 * 2048) = 96 KB.

### Mídias

Para mídias, o arquivo de índice ocupará, por registro, 40 bytes, que são 24 do identificador da mídia e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (24 + 16) = 51.
- **Número de Blocos:** (10000000/ 51) = 196078.
- **Espaço desperdiçado:** (2 * 1024 - (51 * 40)) = 8.
- **Espaço utilizado:** (196078 * 2048) = 383 MB.


### Pagamentos

Para pagamentos, o arquivo de índice ocupará, por registro, 64 bytes, que são 48 do identificador do pagamento e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (48 + 16) = 32.
- **Número de Blocos:** (50000000/ 32) = 1562500.
- **Espaço desperdiçado:** (2 * 1024 - (32 * 64)) = 0.
- **Espaço utilizado:** (1562500 * 2048) = 2,91 GB.


### Tabela de dados

| Entidade         | Tamanho Registro Índice (B) | Fator de Bloco | Nº de Blocos | Espaço Desperdiçado por Bloco (B) | Espaço Utilizado Total |
|------------------|------------------------------|----------------|--------------|----------------------------------|------------------------|
| **Atores**       | 32                          | 64             | 157          | 0                                | 314,25 KB               |
| **Clientes**     | 27                          | 75             | 1,334        | 23                               | 2,54 MB                 |
| **Filmes**       | 32                          | 64             | 31,250       | 0                                | 64 MB                   |
| **Funcionários** | 27                          | 75             | 47           | 23                               | 96 KB                   |
| **Mídias**       | 40                          | 51             | 196,078      | 8                                | 383 MB                  |
| **Pagamentos**   | 64                          | 32             | 1,562,500    | 0                                | 2,91 GB                 |


---

## Índices Secundários


### Índice Secundário (CPF_Supervisor)

Para o índice secundário, cada registro ocupa 27 bytes, sendo 11 do CPF_Supervisor e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2 * 1024) / (11 + 16) = 75.
- **Número de Blocos:** (3500 / 75) = 47.
- **Espaço desperdiçado:** (2 * 1024 - (75 * 27)) = 23.
- **Espaço utilizado:** (47 * 2048) = 96 KB.


### Índice Secundário (CodFilme + CodAtor)

Para o índice secundário, cada registro ocupa 48 bytes, sendo 16 do CodFilme, 16 do CodAtor e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2 * 1024) / (16 + 16 + 16) = 42.
- **Número de Blocos:** (1.000.000 / 42) = 23.810.
- **Espaço desperdiçado:** (2 * 1024 - (42 * 48)) = 32.
- **Espaço utilizado:** (23.810 * 2048) = 48,76 MB.


### Índice Secundário (CodFilme)

Para o índice secundário, cada registro ocupa 32 bytes, sendo 16 do CodFilme e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2 * 1024) / (16 + 16) = 64.
- **Número de Blocos:** (10.000.000 / 64) = 156.250.
- **Espaço desperdiçado:** (2 * 2024 - (64 * 32)) = 0.
- **Espaço utilizado:** (156.250 * 2048) = 320 MB.


### Índice Secundário (ID_Midia + CPF_Cliente)

Para o índice secundário, cada registro ocupa 51 bytes, sendo 24 do ID_Midia, 11 do CPF_Cliente e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (24 + 11 + 16) = 40.
- **Número de Blocos:** (50.000.000 / 40) = 1.250.000.
- **Espaço desperdiçado:** (2 * 1024 - (40 * 51)) = 8.
- **Espaço utilizado:** (1.250.000 * 2048) = 2,56 GB.

### Índice Secundário (CPF_Cliente + ID_Midia + CPF_Funcionario)

Para o índice secundário, cada registro ocupa 62 bytes, sendo 11 do CPF_Cliente, 24 do ID_Midia, 11 do CPF_Funcionario e 16 do ponteiro para o bloco do disco. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (11 + 24 + 11 + 16) = 33.
- **Número de Blocos:** (20.000.000 / 33) = 606.061.
- **Espaço desperdiçado:** (2 * 1024 - (33 * 62)) = 2.
- **Espaço utilizado:** (606.061 * 2048) = 1,24 GB.


## Arquivo Indexado

### Atores

Para o arquivo indexado, cada registro ocupa 176 bytes, sendo 16 do Código e 160 do Nome. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (16 + 160) = 11.
- **Número de Blocos:** (10.000 / 11) = 910.
- **Espaço desperdiçado:** (2 * 1024 - (11 * 176)) = 8.
- **Espaço utilizado:** (910 * 2048) = 1,86 MB.


### Clientes

Para o arquivo indexado, cada registro ocupa 400 bytes, sendo 11 do CPF, 160 do Nome, 200 do Endereço, 16 do Telefone, 12 da DataNascimento e 1 do Sexo. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (11 + 160 + 200 + 16 + 12 + 1) = 5.
- **Número de Blocos:** (100.000 / 5) = 20.000.
- **Espaço desperdiçado:** (2 * 1024 - (5 * 400)) = 48.
- **Espaço utilizado:** (20.000 * 2048) = 39,06 MB.


### Filmes

Para o arquivo indexado, cada registro ocupa 256 bytes, sendo 16 do Código, 160 do Nome e 80 do Gênero. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (16 + 160 + 80) = 8.
- **Número de Blocos:** (2.000.000 / 8) = 250.000.
- **Espaço desperdiçado:** (2 * 1024 - (8 * 256)) = 0.
- **Espaço utilizado:** (250.000 * 2048) = 488,28 MB.


### Funcionários

Para o arquivo indexado, cada registro ocupa 182 bytes, sendo 11 do CPF, 160 do Nome e 11 do CPF_Funcionário. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (11 + 160 + 11) = 11.
- **Número de Blocos:** (3.500 / 11) = 319.
- **Espaço desperdiçado:** (2 * 1024 - (11 * 182)) = 46.
- **Espaço utilizado:** (319 * 2048) = 0,62 MB.


### Mídias

Para o arquivo indexado, cada registro ocupa 72 bytes, sendo 24 do Identificador, 8 do Tipo, 24 do PreçoDiária e 16 do CodFilme. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (24 + 8 + 24 + 16) = 28.
- **Número de Blocos:** (10.000.000 / 28) = 357.143.
- **Espaço desperdiçado:** (2 * 1024 - (28 * 72)) = 32.
- **Espaço utilizado:** (357.143 * 2048) = 696,28 MB.


### Aluguel

Para o arquivo indexado, cada registro ocupa 92 bytes, sendo 12 da DataLocacao, 10 da DataDevolucao, 24 do ValorPagar, 11 do CPF_Cliente, 24 do ID_Midia e 11 do CPF_Funcionario. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (12 + 10 + 24 + 11 + 24 + 11) = 22.
- **Número de Blocos:** (20.000.000 / 22) = 909.091.
- **Espaço desperdiçado:** (2 * 1024 - (22 * 92)) = 24.
- **Espaço utilizado:** (909.091 * 2048) = 1,73 GB.


### Pagamentos

Para o arquivo indexado, cada registro ocupa 119 bytes, sendo 48 do Código, 12 da Data, 24 do Valor, 11 do CPF_Cliente e 24 do ID_Midia. Logo, tem-se:

- **Fator de Bloco:** (2*1024) / (48 + 12 + 24 + 11 + 24) = 17.
- **Número de Blocos:** (50.000.000 / 17) = 2.941.177.
- **Espaço desperdiçado:** (2 * 1024 - (17 * 119)) = 25.
- **Espaço utilizado:** (2.941.177 * 2048) = 5,61 GB.





