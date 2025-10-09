# Resumo: Tecnologias de Armazenamento

Este estudo aborda as Tecnologias de Armazenamento bem como as respectivas características de cada forma de armazenamento. O material é distribuído sob licença CC BY-NC-ND 4.0.

## 1. Tecnologia de Armazenamento de Dados.

Desempenho e confiabilidade em sistemas de banco de dados estão intimamente relacionados à organização dos dados nos meios de armazenamento e à tecnologia de armazenamento de dados empregada.

- Minimizar o número de transferências de blocos e buffers.
- Agilizar o tempo de cada transferência.

Organização adequada de dados ajuda a minimizar o número de transferências.

- Tipo de arquivo empregado pode tornar a busca linear, logarítmica ou em tempo constante.

Tecnologia de armazenamento adequada ajuda a reduzir custo de transferência.

- Tipo de memória secundária empregada, bem como sua configuração, podem
  acelerar o acesso aos dados em ordens de magnitude.


## 2. Hardware de Armazenamento

* **Definição:** *O Hardware de Armazenamento é qualquer equipamento físico que tem a função de gravar e manter dados e informações, de forma permanente ou temporária, permitindo que o usuário salve arquivos, carregue o sistema operacional e execute programas.*

Desse modo, existem padrões de interligação de periféricos que otimizam o processamento de dados. Isso é extremamente importante durante a configuração de um sistema de computação,
pois cada ambiente pode ter demandas distintas, como escalabilidade e/ou desempenho.

### Principais padrões

- **ATA (Advanced Technology Attachment):** É um padrão que oferece baixos custos e desempenho, suportando velocidade de tranferência de 0,15 Gbps.
- **SATA (Serial ATA):** Padrão flexível, oferencendo uma gama de opções com custos variados, suportando uma velocidade de transferência de 6 Gbps.
- **SCSI (Small Computer System Interface):** Custo e desempenho elevados, suportanto uma velocidade de transferência de até 6 Gbps

 Padrões diferem entre si não só quanto à velocidade de transferência, mas também quanto aos recursos suportados, em especial a possibilidade de criação de conjuntos de discos magnéticos (RAID) com hot-swap

## 3. RAID (Redundant Array of Independent Disks)

Trata-se de uma tecnologia de vizualização de armazenamento que combina discos em uma unidade lógica.

- **Desempenho:** Possibilidade de ampliação de armazenamento e velocidade de transferência de dados, pois promove
distribuição de dados entre os discos e os mecanismos de leitura e escrita são paralelos.

- **Redundância:** Possibilidade de ampliação da disponibilidade e confiabilidade por ser tolerante a falhas, visto que distribui cópias de dados em vários discos.

## 4. Principais conjuntos de discos

- ### RAID 0

Trata-se de um conjuntos de discos distribuidos sem cópias. Nesta configuração, a velocidade de transferência e a capacidade de armazenamento 
são proporcionais ao número de discos. Todavia, o RAID 0 não aceita falhas, pois se um disco falhar haverá perdas de dados.
Ou seja, é uma configuração com ótimo desempenho porém com risco alto.

- ### RAID 1

Trata-se de um conjunto de discos espelhados sem distribuição. Nesta configuração, o desempenho é equivalente aos discos sem RAID e a
taxa de falhas é menor. O RAID 1 pode falhar a quantia de discos menos um, pois se eu tiver três discos e falhar duas vezes, ao realizar
uma terceira falha, os dados serão perdidos.

- ### RAID 5

Trata-se de um conjunto de dados distruibuidos em cópias. Nesta configuração, o desempenho se aproxima do RAID 0, porém com taxas
de falhas menores do que discos sem RAID, visto que o as paridades permitem reconstrução de dados que foram perdidos.

- ### RAID 10

Trata-se de um conjunto de dados espelhados com distribuição, ou seja, uma combinação de RAID 0 com RAID 1 que suporta
falhas enquanto houver cópias espelhadas. Desse modo, a velocidade e a capacidade são proporcionais ao número de discos
e inversamente aos espelhos.

## 5. Abordagens de Armazenamento

- **DAS (Direct-Attached Storage):** Discos magnéticos contendo arquivos dos bancos de dados intergrados ao hardware do sistema
de banco de dados.

    - Integração por meio de padrões de interligação (ATA, SATA, SCSI).
    - Discos acessíveis diretamente apenas pelo hardware do sistema.
    - Abordagem simples e barata, porém menos escalável e robusta.
 
- **NAS (Network-Attached Storage):** Arquivos de bancos de dados parcial ou totalmente contidos em hardware especializado de compartilhamento de arquivo.

    - Integração por meio de protocolos de compartilhamento, como NFS, SMB e AFP.
    - Os Hardwares de sistemas de Banco de Dados "enxergam" o hardware especializado como servidor de arquivo.
 
- **SAN (Storage Area Network):** Rede com hardwares de armazenamento e de sistemas de Bancos de Dados, geralmente em fibra óptica.

    - Suporta hardware dedicado de armazenamento interligado ao hardware desistema através da rede.
    - Hardware de sistema "enxerga" hardware dedicado como disco.
    - Ambientes empresáriais, pois abordagem é carríssima.
 
- **iSCSI (Internet SCSI):** Arquivos de Bancos de Dados parcial ou totalmente contidos em discos espalhados e acessíveis diretamente pela
rede

    - Integração por protocolos de camada de transporte TCP/IP.
    - Hardware de sistema "enxerga" e acessa os discos distribuidos.
    - Abordagem barata, flexível e escalável.


## Referências Bibliográficas

O documento cita as seguintes obras como referências:

*   [1] Elmasri, Ramez; Navathe, Sham. Fundamentals of Database Systems. 7ed. Pearson, 2016.
*   [2] Silberschatz, Abraham; Korth, Henry F.; Sudarshan, S. Database System Concepts. 6ed. McGraw-Hill, 2011.
*   [3] Date, Christopher J. An Introduction to Database Systems. 8ed. Pearson, 2004.
