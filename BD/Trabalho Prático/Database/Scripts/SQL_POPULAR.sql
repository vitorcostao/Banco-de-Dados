-- -----------------------------------------------------
-- POPULAÇÃO DE DADOS
-- -----------------------------------------------------

-- ONGs
INSERT INTO `Ong` (`ID`, `Nome`, `Descricao`) VALUES
(1, 'Amigos dos Animais', 'ONG dedicada ao resgate e adoção de animais.'),
(2, 'Patas Felizes', 'ONG que promove o bem-estar animal.'),
(3, 'SOS Pet', 'Resgate e abrigo para animais abandonados.'),
(4, 'Cuidar é Amar', 'Apoio à adoção e castração responsável.');

-- Abrigos
INSERT INTO `Abrigo` (`ID`, `Nome`, `Email`, `Telefone`, `Pais`, `Cidade`, `Estado`, `Rua`, `Numero`, `Ong_ID`) VALUES
(1, 'Abrigo Esperança', 'contato@esperanca.org', '11987654321', 'Brasil', 'São Paulo', 'SP', 'Rua das Flores', 120, 1),
(2, 'Lar dos Bichos', 'larbichos@gmail.com', '21987541236', 'Brasil', 'Rio de Janeiro', 'RJ', 'Av. Central', 85, 2),
(3, 'Refúgio Animal', 'refugioanimal@outlook.com', '31996587412', 'Brasil', 'Belo Horizonte', 'MG', 'Rua Verde', 42, 3),
(4, 'Casa dos Pets', 'casadospets@yahoo.com', '47987456321', 'Brasil', 'Florianópolis', 'SC', 'Rua das Acácias', 230, 4);

-- Departamentos
INSERT INTO `Departamento` (`ID`, `Nome`, `Telefone`, `Descricao`, `Ong_ID`) VALUES
(1, 'Administração', '1132456789', 'Gestão e planejamento da ONG', 1),
(2, 'Resgates', '2199876543', 'Equipe responsável por resgatar animais', 2),
(3, 'Veterinário', '3199632587', 'Atendimento médico e exames', 3),
(4, 'Adoção', '4799745632', 'Organização de feiras e adoções', 4);

-- Funcionários
INSERT INTO `Funcionario` (`CPF`, `Nome`, `Email`, `Telefone`, `Cargo`, `Departamento_ID`, `Abrigo_ID`) VALUES
('12345678900', 'Mariana Souza', 'mariana@esperanca.org', '11988887777', 'Gerente', 1, 1),
('98765432100', 'Carlos Lima', 'carlos@larbichos.com', '21999998888', 'Resgatador', 2, 2),
('11122233344', 'Fernanda Alves', 'fernanda@refugioanimal.com', '31988886666', 'Veterinária', 3, 3),
('55566677788', 'Rafael Mendes', 'rafael@casadospets.org', '47977775555', 'Coordenador', 4, 4);

-- Doador
INSERT INTO `Doador` (`ID`, `Nome`, `Telefone`) VALUES
(1, 'Ana Martins', '11999990000'),
(2, 'Pedro Oliveira', '21988881111'),
(3, 'Julia Santos', '31977772222'),
(4, 'Lucas Ferreira', '47966663333');

-- Doações
INSERT INTO `Doacao` (`Descricao`, `Quantia`, `Data`, `Ong_ID`, `Doador_ID`) VALUES
('Ração para cães', 300.00, '2025-01-15', 1, 1),
('Medicamentos veterinários', 450.00, '2025-02-10', 2, 2),
('Materiais de limpeza', 200.00, '2025-03-20', 3, 3),
('Roupinhas e cobertores', 150.00, '2025-04-05', 4, 4);

-- Capturadores
INSERT INTO `Capturador` (`CPF`, `Nome`, `Telefone`) VALUES
('10101010101', 'Tiago Ramos', '11977778888'),
('20202020202', 'Letícia Prado', '21966667777'),
('30303030303', 'Felipe Duarte', '31955556666'),
('40404040404', 'Camila Rocha', '47944445555');

-- Receptores (adotantes)
INSERT INTO `Receptor` (`CPF`, `Nome`, `Telefone`, `Pais`, `Estado`, `Cidade`, `Rua`, `Numero`) VALUES
('55555555555', 'Bruno Costa', '11933334444', 'Brasil', 'SP', 'São Paulo', 'Rua Bela Vista', 50),
('66666666666', 'Laura Mendes', '21922223333', 'Brasil', 'RJ', 'Niterói', 'Av. Atlântica', 120),
('77777777777', 'Patrícia Lima', '31911112222', 'Brasil', 'MG', 'Contagem', 'Rua das Palmeiras', 88),
('88888888888', 'João Vieira', '47900001111', 'Brasil', 'SC', 'Blumenau', 'Rua Primavera', 32);

-- Veterinários
INSERT INTO `Veterinario` (`CPF`, `Nome`, `Telefone`, `Especialidade`) VALUES
('90909090909', 'Dr. André Pires', '11999997777', 'Clínico Geral'),
('80808080808', 'Dra. Cláudia Reis', '21988886666', 'Cirurgiã'),
('70707070707', 'Dr. Gustavo Nunes', '31977775555', 'Anestesista'),
('60606060606', 'Dra. Helena Dias', '47966664444', 'Dermatologista');

-- Animais
INSERT INTO `Animal` (`ID`, `Nome`, `Sexo`, `Status`, `Peso`, `Especie`, `Abrigo_ID`) VALUES
(1, 'Luna', 'F', 1, 8.5, 'Cachorro', 1),
(2, 'Thor', 'M', 1, 12.0, 'Cachorro', 2),
(3, 'Mia', 'F', 0, 4.2, 'Gato', 3),
(4, 'Bob', 'M', 1, 10.3, 'Cachorro', 4);

-- Capturas
INSERT INTO `Captura` (`Animal_ID`, `Capturador_CPF`, `Local`, `Data`) VALUES
(1, '10101010101', 'Parque Ibirapuera - SP', '2024-11-20'),
(2, '20202020202', 'Copacabana - RJ', '2024-12-05'),
(3, '30303030303', 'Praça Sete - BH', '2025-01-12'),
(4, '40404040404', 'Centro - Florianópolis', '2025-02-08');

-- Atendimentos veterinários
INSERT INTO `Atendimento` (`Animal_ID`, `Veterinario_CPF`, `Servico`, `Data`) VALUES
(1, '90909090909', 'Vacinação antirrábica', '2025-03-10 10:30:00'),
(2, '80808080808', 'Castração', '2025-03-12 14:00:00'),
(3, '70707070707', 'Exame de sangue', '2025-03-15 09:00:00'),
(4, '60606060606', 'Tratamento dermatológico', '2025-03-20 11:00:00');

-- Adoções
INSERT INTO `Adocao` (`Animal_ID`, `Receptor_CPF`, `Data`) VALUES
(1, '55555555555', '2025-04-01'),
(2, '66666666666', '2025-04-10'),
(3, '77777777777', '2025-04-15'),
(4, '88888888888', '2025-04-22');
