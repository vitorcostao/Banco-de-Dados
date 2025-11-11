# Especificação do Minimundo

Esta é a descrição textual de minimundo do SAA. O SAA (Sistema de Adoções de Animais) é responsável por gerenciar adoções de animais para pessoas interessadas.

Desse modo, cada ONG é identificada por um ID e possui nome, descrição, telefone, email. Cada Ong possui abrigos sendo que cada abrigo pertence a uma única ONG. Os abrigos são identificados por um ID e possuem nome, telefone, e-mail e endereço, que é subdividido em cidade, estado, país, rua e número.

Cada ONG pode ter vários departamentos sendo que um departamento pertence a apenas uma ONG. Os departamentos são identificados por um ID e possuem nome. 

Além disso, um funcionário é alocado para um departamento sendo que um departamento pode ter vários funcionários. Os funcionários são identificados por CPF e possuem nome, telefone, cargo e e-mail, data de nascimento e a idade que é derivada da data de nascimento. 

Cada abrigo pode ter vários funcionários e um funcionário trabalha em apenas um abrigo. Cada abrigo pode abrigar vários animais sendo que um animal pertence a apenas um abrigo.

Os animais são identificados por um ID e possuem nome, sexo, espécie, peso e status de adoção. Um animal pode ser capturado por vários capturadores sendo que um capturador pode capturar vários animais. 

O capturador é identificado por CPF e possui nome, telefone e endereço, que é subdividido em cidade, estado, país, rua e número, e, para cada captura, é registrado o local e a data em que ela ocorreu. 

Um animal pode ser adotado por vários receptores, caso haja devolução, sendo que um receptor pode adotar vários animais. O receptor é identificado por CPF e possui nome, telefone e endereço, sendo necessário conhecer a data da adoção. 

Os animais também podem receber atendimentos de médicos veterinários, sendo que um médico veterinário pode atender vários animais. O veterinário é identificado por CPF e possui nome, telefone e especialidade. 

As ONG´s podem receber doações de doadores sendo que um doador pode doar para várias ONG´S, deve-se conhecer a data, a quantia e a descrição da doação. Cada doador é identificado por um ID e possui nome e telefone.
