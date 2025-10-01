# Resumo: Organização dos dados

Este estudo aborda a Organização de Dados, métodos de acesso e tipos de arquivos em sistemas de banco de dados relacionais. O material é distribuído sob licença CC BY-NC-ND 4.0.

## 1. Organização de Dados

A forma como os dados são dispostos na memória secundária impacta diretamente o desempenho do Sistema Gerenciador de Banco de Dados (SGBD) na recuperação e manipulação. Os dados são tipicamente organizados como arquivos de registros.

*   **Registro:** Uma coleção de valores relacionados a fatos sobre o minimundo, como atributos, instâncias de entidades e relacionamentos.
*   **Arquivo:** Uma coleção de registros relacionados.

Os registros devem ser organizados para serem rapidamente localizados. Um arquivo possui um cabeçalho (descritor) com metadados úteis, como ordem, tipo e tamanho dos campos, endereços dos blocos de armazenamento e códigos de caracteres especiais.

## 2. Arquivos de Registros

Cada valor em um registro tem um tipo de dado restrito, com um número fixo de bytes (ex: Booleano: 1 byte, Inteiro: 4 bytes, Real: 4 bytes, Data: 10 bytes, String: n bytes, BLOB: p+n bytes).

Arquivos podem ser compostos por registros de tamanho:
*   **Fixo:** Todos os registros têm o mesmo tamanho.
*   **Variável:** Registros podem ter tamanhos diferentes, devido a campos de tamanho variável (VARCHAR, TEXT), campos opcionais (NULL) ou campos multivalorados.

Registros em um arquivo podem ser alocados em um ou vários blocos de disco:
*   **Não Espalhado:** Um registro não pode ultrapassar o limite de um bloco.
*   **Espalhado:** Um registro é armazenado em múltiplos blocos, com ponteiros indicando a continuidade.

**Blocagem (Fator de Bloco):** Quantidade de registros de um arquivo que cabem em um bloco de disco. Calculado como `F = t / r`, onde `t` é o tamanho do bloco e `r` é o tamanho do registro (ou tamanho médio para registros variáveis).

**Espaço não usado:** `U = t - (F * r)`.

**Número de blocos necessários (B):** `B = n / F`, onde `n` é o número de registros. Um exemplo prático demonstra o cálculo do fator de bloco, espaço não usado e número de blocos para um arquivo de 10.000 registros de 185B em blocos de 4KB.

## 3. Métodos de Acesso

São grupos de operações aplicadas a um arquivo:

*   **Recuperação:** Localização de registros para leitura e processamento.
*   **Atualização:** Alteração do arquivo pela inserção, exclusão ou modificação de registros.

A frequência de mudança determina a execução das operações de atualização:
*   **Arquivos Estáticos:** Atualizações raras.
*   **Arquivos Dinâmicos:** Atualizações constantes.

Muitas operações envolvem **pesquisa**, que especifica critérios (tipicamente expressões booleanas, simples ou complexas) que os registros devem satisfazer.

SGBDs acessam registros usando operações representativas, processando um registro por vez:

*   **Open:** Prepara o arquivo para leitura/escrita, aloca buffers, recupera o cabeçalho e posiciona o ponteiro no início.
*   **Reset:** Reposiciona o ponteiro para o início do arquivo.
*   **Close:** Libera buffers e realiza operações de limpeza.
*   **Find (Locate):** Procura o primeiro registro que satisfaça uma condição, transfere o bloco para um buffer e posiciona o ponteiro.
*   **FindNext:** Procura o próximo registro que satisfaça uma condição.
*   **Read (Get):** Copia o registro do buffer para uma variável de programa e posiciona o ponteiro no próximo registro.
*   **Delete:** Remove o registro atual, transferindo o buffer de volta ao disco.
*   **Modify:** Modifica valores de campos do registro atual, transferindo o buffer de volta ao disco.
*   **Insert:** Insere um novo registro no arquivo, localizando o bloco, transferindo-o para um buffer, escrevendo o registro e gravando o buffer de volta.
*   **Scan:** Combinação de Find, FindNext e Read, com ou sem condição especificada, reposicionando o ponteiro conforme necessário.

Existem também operações de nível mais alto para conjuntos de registros:

*   **FindAll:** Procura o conjunto de registros que satisfaça uma condição.
*   **FindOrdered:** Procura, em ordem específica, o conjunto de registros que satisfaça uma condição.
*   **FindN:** Procura os N primeiros registros que satisfaçam uma condição.
*   **Reorganize:** Reorganiza os blocos e registros de um arquivo.

## 4. Tipos de Arquivo

Os métodos de acesso variam conforme a organização dos arquivos:

*   **Arquivo Heap (Pilha):** Registros dispostos sem ordem, novos registros são adicionados ao final. A pesquisa é linear (O(n)), sendo ineficiente. A inserção é eficiente, mas alterações demandam pesquisa. Exclusões podem ser diretas ou por marcação, gerando desperdício de espaço e exigindo reorganização periódica.
    *   **Arquivo Direto (Relativo):** Um tipo de arquivo heap com registros de tamanho fixo, não espalhados e em alocação contígua. Permite acesso simples pela posição relativa, mas não auxilia na pesquisa baseada em critérios. Facilita a construção de índices.

*   **Arquivo Sequencial:** Registros dispostos ordenadamente por um ou mais campos de ordenação. Blocos em cilindros contíguos minimizam o tempo de busca. A pesquisa é binária (O(log n)) se feita com operadores de comparação nos campos de ordenação. Operações de alteração são onerosas, pois podem exigir reorganização. Alternativas para inclusão incluem espaços vazios (problema reaparece) e arquivos temporários (overflow) que são periodicamente mesclados ao principal, mas aumentam a complexidade da pesquisa.

*   **Arquivo Hash:** Registros distribuídos em blocos de acordo com uma função hash aplicada a um ou mais campos hash. A pesquisa é de tempo constante (O(1)) se feita com o operador de igualdade no campo hash. Operações de alteração são eficientes. A inclusão pode gerar colisões e necessidade de expansão do arquivo. Funções hash ideais são mantidas em memória primária e distribuem valores uniformemente.
    *   **Problemas comuns:** Colisão (valores diferentes mapeados para o mesmo endereço) e Expansão (falta de espaço para novos registros).
    *   **Hashing Universal:** Mapeia chaves de tamanho variável para um espaço de tamanho `m` com probabilidade de colisão de `1/m`. Lida com colisões via lista encadeada ou Hash Múltiplo. O fator de carga (`n/m`) deve ser mantido baixo (máx. 0.75) para evitar degradação. A expansão é fundamental.
    *   **Hashing Perfeito:** Mapeia um conjunto fixo de chaves para um espaço de tamanho `m` sem colisões. Funções ocupam mais memória. A expansão significa reconstruir o hash. Hashing perfeito dinâmico é uma solução complexa.

##

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.