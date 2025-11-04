# Resumo: Otimização de Consultas

## Introdução

Otimização de consultas se trata de uma importante parte em um projeto físico de Bancos de Dados, 
pois é a partir da escolha de algoritmos eficientes e das
estratégias corretas que as operações de álgebra relacional serão executadas de forma ótima.
Desse modo, tem-se por métodos de otimização as seguintes técnicas:

- **Heurística:** Aplicações de regras utilizada em consultas interpretadas.
- **Custo:** Ocorre estimativa de custo em consultas compiladas.
- **Semântica:** Feita por meio de compreensão, substituindo consultas por outras melhores.

Além disso, os SGBDs, ao realizarem as consultas, criam as árvores de consulta iniciais, 
que são estruturas lógicas que representam expressões de álgebra relacional 
a partir dos scripts SQL, em sua estrutra tem-se:

- **Folha:** Arquivos de entrada.
- **Nó interno:** Operações de álgebra relacional.
- **Raiz:** Operação de projeção final da álgebra relacional.
- **Ordem:** Operações executadas da folha esquerda para raiz.

---

## Otimização Heurística

Trata-se de um método de otimização que realiza mudança da representação interna da consulta. 
Todavia, não há garante a melhor representação interna. Nesse contexto, a Heurística propõe que sejam
aplicadas determinadas regras sobre a árvore de consulta inicial que são as seguintes:

- Operações unárias de SELEÇÃO, PROJEÇÃO, AGREGAÇÃO ocorrem antes de operações binárias de JUNÇÃO e CONJUNTO.
- Operações binárias mais eficientes devem vir antes.

### Árvore Inicial

```sql
SELECT A.CPF, A.NOME
       FROM ALUNO A, PROFESSOR P
WHERE  A.CPF = P.CPF
       AND P.SEXO = 'F';
```

Com base no script acima é possível construir duas árvores, sendo a primeira começando da esquerda para direita
e a segunda sendo no sentido reverso do script:

<img width="440" height="218" alt="image" src="https://github.com/user-attachments/assets/b2ef624d-5bb7-4f31-80b6-7e0a9b18017f" />

### Regras - Reduzir para combinar

- **Redução:** Operações unárias precedem operações binárias
    
    - Em cada nó folhas, as operações devem ser SELEÇÃO, seguida de PROJEÇÃO, seguida de AGREGAÇÃO.

- **Combinação:** Operações de menor custo devem vir antes das de maior custo
    
    - Nós folhas deve ser reordenados de forma que JUNÇÕES mais eficientes venham antes.


### Exemplo prático

Para o script abaixo considerando o parsing reverso e existência de índice multinível em CPF de PROFESSOR
e ALUNO e índice primário em Numero de DEPARTAMENTO:

```sql
SELECT D.nome, A.CPF
       FROM ALUNO A, DEPARTAMENTO D, PROFESSOR P
WHERE   A.CPF = P.CPF
        AND A.Sexo = 'F'
        AND P.Depto = D.Numero
        AND P.Salario > 5.000,00
```

tem-se as árvores inicial e otimizada, respectivamente:

<img width="834" height="238" alt="image" src="https://github.com/user-attachments/assets/fc6fbce2-4441-4f9a-88b3-b5a48d64ffcd" />

Posteriormente, a fim de reduzir o tamanho dos resultados intermediários, faz-se necessário utilizar 
PROJEÇÕES internas: 

<img width="834" height="284" alt="image" src="https://github.com/user-attachments/assets/68fd454a-09d4-4c3a-ae90-116cd982432b" />

### Plano de consulta

Tendo finalizado as transformações da árvore inicial, faz-se necessário escolher os melhores algoritmos, métodos
de acesso e estratégias usadas no processamento das operações da árvore otimizada. Portanto, tem-se:

<img width="834" height="311" alt="image" src="https://github.com/user-attachments/assets/1e7c8e33-16a2-49ad-a0ed-9c61416541ec" />

---

## Otimização de Custo

A otimização baseada em custo utiliza uma função de custo para estimar o desempenho de diferentes estratégias 
de execução de uma consulta. O otimizador escolhe a alternativa com a menor estimativa de custo, buscando
o melhor desempenho possível. No entanto, esse método exige maior processamento e espaço, pois é necessário 
calcular e armazenar os custos de diversas estratégias antes de selecionar a ideal.

  - **Tempo de resposta:** Estratégias de execução avaliadas é limitado.
  - **Consultas compiladas:** Otimização feita na compilação.
  - **Evidências de custo:** Combinadas pela função de custo.

    - Computação: CPU em memória primária.
    - Memória: Consumo de buffers de memória primária.
    - Disco: Consumo de blocos de disco.
    - I/O: Custo de operações de páginação e transferência de dados entre memórias
    - Comunicação: Custo de transferências de dados via rede.
   
---

## Otimização Semântica

SGBD compreende o significado da consulta para reescrevê-la de forma ótima, ou seja, que gere um plano de
execução mais eficiente.

Tem-se, portanto, o script a seguir:

```sql

SELECT CPF, Nome
       FROM PROFESSOR
       WHERE CPF IN (SELECT CPF FROM ALUNO);
```

Tal script pode ser reescrito para:

```sql

SELECT A.CPF, A.Nome
       FROM PROFESSOR A, Aluno B
       WHERE A.CPF = B.CPF;
```

> A cláusula "IN" impede a utilização de um loop único, visto que ela ignora os arquivos de índice, que
são responsáveis por acelerar processos de pesquisa.

---

## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.