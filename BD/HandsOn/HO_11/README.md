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

---

## Índices Multinível Dinâmico

### Funcionários (CPF_Supervisor)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (11 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{23} \right\rfloor = 88$$  

$$Altura = \log_{89}{3500} \approx 2$$  
> OBS: Número de elementos por Nó é 88 e a ordem é 89  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (11 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{27} \right\rfloor = 75$$  
> OBS: Número de elementos por Nó é 75  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 75 \times 0.69 \right\rceil = 52$$  

$$Blocos(b+) = \left\lceil \frac{3500}{52} \right\rceil = 68$$  

$$Nós(Blocos) = \left\lceil \frac{68}{(89 \times 0.69) + 2} \right\rceil = 2$$  

$$Espaço = (68 + 2) \times 2KB = 140KB$$  

$$Acessos = 2 + 1 = 3$$


### Aluguel (CPF_Funcionario)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (11 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{11 + 12} \right\rfloor = 88$$  

$$Altura = \log_{89}{20000000} \approx 2.97 \Rightarrow \lceil 2.97 \rceil = 3$$  
> OBS: Número de elementos por Nó é 88 e a ordem é 89  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (11 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{27} \right\rfloor = 75$$  
> OBS: Número de elementos por Nó é 75  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 75 \times 0.69 \right\rceil = 52$$  

$$Blocos(b+) = \left\lceil \frac{20000000}{52} \right\rceil = 384616$$  

$$Nós(Blocos) = \left\lceil \frac{384616}{(89 \times 0.69) + 2} \right\rceil = 4960$$  

$$Espaço = (384616 + 4960) \times 2KB \approx 770.7\text{MB}$$  

$$Acessos = 3 + 1 = 4$$

### Aluguel (CPF_Cliente)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (11 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{11 + 12} \right\rfloor = 88$$  

$$Altura = \log_{89}{20000000} \approx 3$$  
> OBS: Número de elementos por Nó é 88 e a ordem é 89  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (11 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{27} \right\rfloor = 75$$  
> OBS: Número de elementos por Nó é 75  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 75 \times 0.69 \right\rceil = 52$$  

$$Blocos(b+) = \left\lceil \frac{20000000}{52} \right\rceil = 384616$$  

$$Nós(Blocos) = \left\lceil \frac{384616}{(89 \times 0.69) + 2} \right\rceil = 4960$$  

$$Espaço = (384616 + 4960) \times 2KB \approx 770.7\text{MB}$$  

$$Acessos = 3 + 1 = 4$$



### Aluguel (ID_Midia)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (24 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{24 + 12} \right\rfloor = 56$$  

$$Altura = \log_{57}{20000000} \approx 4.7 \Rightarrow \lceil 4.7 \rceil = 5$$  
> OBS: Número de elementos por Nó é 56 e a ordem é 57  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (24 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{40} \right\rfloor = 50$$  
> OBS: Número de elementos por Nó é 50  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 50 \times 0.69 \right\rceil = 35$$  

$$Blocos(b+) = \left\lceil \frac{20000000}{35} \right\rceil = 571429$$  

$$Nós(Blocos) = \left\lceil \frac{571429}{(57 \times 0.69) + 2} \right\rceil = 9012$$  

$$Espaço = (571429 + 9012) \times 2KB \approx 1.13\text{GB}$$  

$$Acessos = 5 + 1 = 6$$



### Pagamentos (CPF_Cliente)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (11 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{11 + 12} \right\rfloor = 88$$  

$$Altura = \log_{89}{50000000} \approx 3.95 \Rightarrow \lceil 3.95 \rceil = 4$$  
> OBS: Número de elementos por Nó é 88 e a ordem é 89  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (11 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{27} \right\rfloor = 75$$  
> OBS: Número de elementos por Nó é 75  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 75 \times 0.69 \right\rceil = 52$$  

$$Blocos(b+) = \left\lceil \frac{50000000}{52} \right\rceil = 961539$$  

$$Nós(Blocos) = \left\lceil \frac{961539}{(89 \times 0.69) + 2} \right\rceil = 15164$$  

$$Espaço = (961539 + 15164) \times 2KB \approx 1.86\text{GB}$$  

$$Acessos = 4 + 1 = 5$$


### Pagamentos (ID_Midia)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (24 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{24 + 12} \right\rfloor = 56$$  

$$Altura = \log_{57}{50000000} \approx 4.6 \Rightarrow \lceil 4.6 \rceil = 5$$  
> OBS: Número de elementos por Nó é 56 e a ordem é 57  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (24 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{40} \right\rfloor = 50$$  
> OBS: Número de elementos por Nó é 50  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 50 \times 0.69 \right\rceil = 35$$  

$$Blocos(b+) = \left\lceil \frac{50000000}{35} \right\rceil = 1428572$$  

$$Nós(Blocos) = \left\lceil \frac{1428572}{(57 \times 0.69) + 2} \right\rceil = 22530$$  

$$Espaço = (1428572 + 22530) \times 2KB \approx 2.77\text{GB}$$  

$$Acessos = 5 + 1 = 6$$



### Midias (CodFilmes)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (16 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{16 + 12} \right\rfloor = 72$$  

$$Altura = \log_{73}{10000000} \approx 4$$  
> OBS: Número de elementos por Nó é 72 e a ordem é 73  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (16 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{32} \right\rfloor = 63$$  
> OBS: Número de elementos por Nó é 63  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 63 \times 0.69 \right\rceil = 44$$  

$$Blocos(b+) = \left\lceil \frac{10000000}{44} \right\rceil = 227273$$  

$$Nós(Blocos) = \left\lceil \frac{227273}{(73 \times 0.69) + 2} \right\rceil = 2923$$  

$$Espaço = (227273 + 2923) \times 2KB \approx 455.6\text{MB}$$  

$$Acessos = 4 + 1 = 5$$


### AtoresEmFilmes (CodAtor)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (16 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{16 + 12} \right\rfloor = 72$$  

$$Altura = \log_{73}{1000000} \approx 3$$  
> OBS: Número de elementos por Nó é 72 e a ordem é 73  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (16 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{32} \right\rfloor = 63$$  
> OBS: Número de elementos por Nó é 63  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 63 \times 0.69 \right\rceil = 44$$  

$$Blocos(b+) = \left\lceil \frac{1000000}{44} \right\rceil = 22728$$  

$$Nós(Blocos) = \left\lceil \frac{22728}{(73 \times 0.69) + 2} \right\rceil = 293$$  

$$Espaço = (22728 + 293) \times 2KB \approx 45.0\text{MB}$$  

$$Acessos = 3 + 1 = 4$$


### AtoresEmFilmes (CodFilme)  

**1) Cálculo de Nó Índice:**  
$$2\text{KB} = \left\lfloor ((m - 1) \times (16 + 12)) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{16 + 12} \right\rfloor = 72$$  

$$Altura = \log_{73}{1000000} \approx 3$$  
> OBS: Número de elementos por Nó é 72 e a ordem é 73  

**2) Cálculo de Nó Registro:**  
$$2\text{KB} = \left\lfloor (m - 1) \times (16 + 16) + 12 \right\rfloor$$  
$$m - 1 = \left\lfloor \frac{2036}{32} \right\rfloor = 63$$  
> OBS: Número de elementos por Nó é 63  

**3) Cálculo de armazenamento:**  
$$Fator(B+) = \left\lceil 63 \times 0.69 \right\rceil = 44$$  

$$Blocos(b+) = \left\lceil \frac{1000000}{44} \right\rceil = 22728$$  

$$Nós(Blocos) = \left\lceil \frac{22728}{(73 \times 0.69) + 2} \right\rceil = 293$$  

$$Espaço = (22728 + 293) \times 2KB \approx 45.0\text{MB}$$  

$$Acessos = 3 + 1 = 4$$
