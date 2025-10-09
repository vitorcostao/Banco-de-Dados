# Resumo: Indexaão Multinível

## Indexação

Corresponde em diferentes níveis de índices construídos, reduzindo o espaço da pesquisa, além disso, existem dois tipos de índices multinível.

- **Estático:** Compacto sem expaço extra em blocos de índice para acomodação de novos registros.
  
  - Tipicamente implementado como arquivos de índice, em que se constroí índices sobre índices.

- **Dinâmicos:** Flexível, com espaço para alocação dinâmica de registros, tornando operações de alteração de dados mais eficientes.

  - Tipicamente implementado como árvore B ou B+, estruturas baseadas em árvores de pesquisa de múltiplos caminhos com restrições

## Multinível estático

Neste exemplo, existe um nível base, que possuem valores distintos do campo de ordenação, e o nível subsequente que é um índice 
primário sobre nível adjacente anterior. Em termos práticos, é como aumentar a base durante uma pesquisa logaritmica.
Ou seja, é como se armazenassem os dados em regiões e fosse filtrando essas regiões para encontrar os dados.

>Observação: A quantia de arquivos sequenciais indexados com índice multinível é igual ao número de chaves primárias.

<img width="691" height="262" alt="image" src="https://github.com/user-attachments/assets/81217bde-8cb0-4e34-a212-43f80cef7ff7" />

### Análises de desempenho e espaço

Para pesquisas, é necessário apenas do número de níveis mais a transferência para memória, ou seja, há uma redução enorme de transferências dos dados, porém
as expansão não é algo interessante, pois o arquivo deve se manter ordenado.

>Observação: Por padrão, ao utilizar o CREATE TABLE, é criado um arquivo sequencial indexado com índice multinível na chave primária.


### Cálculos




## Multinível dinâmico

O índice multinível dinâmico possui como base as estruturas de árvore, que é uma estrutura hierarquica que possuem nós
conectados uns aos outros.

- **Raiz:** Nó inicial.
- **Folha:** Nó sem filhos.
- **Interno:** Nó que não é folha e nem raiz.
- **Subárvore:** Árvore formada por descendentes.

### Árvore de Busca

É umas estrutura que possui restrições para tornar a pesquisa mais eficiente.

<img width="390" height="189" alt="image" src="https://github.com/user-attachments/assets/c043d286-eee3-4f93-a98a-cd1bbcf3ad41" />


### **Árvore binária**

O número máximo de filhos por nó é dois, além disso as chaves menores ficam à direita e as chaves maiores ficam à esquerda. No entanto,
para uma pesquisa eficiente de fato, a árvore precisa estar balanceada para que a pesquisa não gaste muitas comparações.

<img width="426" height="208" alt="image" src="https://github.com/user-attachments/assets/ddf686b5-0cfd-4f5d-9836-716553b68f76" />


### **Árvore binária de busca**

Corresponde a uma árvore binária balanceada, o que facilita a pesquisa. Desse modo, o balanceamento é aquela que a sua altura é aproximadamente
o logaritmo na base dois da quantia de nós que ela possui, ou seja, as subárvores possuem mesmo tamanho.

<img width="693" height="242" alt="image" src="https://github.com/user-attachments/assets/22ddcf15-f314-4a77-b130-4917d5df36b5" />


### **Árvore binária de busca de múltiplos caminhos (M-WAY)**

Nesta configuração, cada nó possui m filhos e armazena n-1 elementos, além disso, é necessário balancear esta árvore, para isso a altura
deve ser logaritmo na base m do número de nós.

<img width="283" height="141" alt="image" src="https://github.com/user-attachments/assets/92b3c20b-52f8-4b06-ad94-bf71d5d1df31" />


### **Árvore B**

As restrições, nesse caso, são as seguintes: Nó raiz tem ao menos dois filhos, nó interno tem ao menos m/2 filhos, nós folhas estão no mesmo nível.
Além disso, sua pesquisa é eficiente e perfeitamente balanceada, as alterações possuem esaço para acomodar novos registros, e ela é ideal
para armazenamento em memória secundária. É a estrutura apropriada para armazenar índices. 

<img width="656" height="212" alt="image" src="https://github.com/user-attachments/assets/ac0cbbbd-d168-4842-8091-3b86344ff219" />

### **Árvore B+**

Nesta configuração, na base da árvore, tem-se todos os elementos pelo índice, ou seja, a busca pode ser feita pela raiz ou horizontalmente pela base.
Os dados estão ligados por ponteiros em sua base, o que facilita a busca dos dados, visto que estão ordenados.

  - Os nós internos armazenam apenas chaves de índice.

  - Os nós folha guardam os registros completos.

  - As folhas são ligadas em uma lista encadeada ordenada, facilitando o acesso sequencial aos dados.

<img width="410" height="151" alt="image" src="https://github.com/user-attachments/assets/00bd04d9-4458-465e-852d-2b8fa980c63e" />


## Conclusão

O índice multinível estático apresenta boa eficiência para conjuntos de dados de tamanho fixo ou pouco variável, pois sua estrutura é simples e o custo de busca é previsível. 
No entanto, sua limitação está na falta de flexibilidade: Quando há inserções ou remoções frequentes, o desempenho tende a cair, exigindo reestruturações manuais do índice.

Por outro lado, o índice multinível dinâmico é mais eficiente em ambientes com grande variação de dados, pois se ajusta automaticamente ao crescimento ou redução do arquivo.
Embora tenha um custo ligeiramente maior de manutenção, ele garante buscas rápidas e equilibradas mesmo com atualizações constantes.

Assim, do ponto de vista da eficiência, o modelo dinâmico é superior em sistemas com dados voláteis, enquanto o modelo estático é mais eficiente em contextos estáveis e previsíveis.

## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.