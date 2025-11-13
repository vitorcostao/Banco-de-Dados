-- -----------------------------------------------------
-- POPULAÇÃO DO BANCO DE DADOS SAA
-- -----------------------------------------------------

-- Desativa checagem de chave estrangeira temporariamente
SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------
-- 1. TABELAS PAIS
-- -----------------------------------------------------

-- Tabela: Ong
INSERT INTO `Ong` (`ID`, `Nome`, `Descricao`) VALUES
(1, 'Amigo Bicho', 'Resgate e reabilitação de animais.'),
(2, 'Patas Felizes', 'Adoções responsáveis de cães e gatos.'),
(3, 'SOS Selvagem', 'Especializada em resgate de fauna.'),
(4, 'Quatro Patas MG', 'Foco em castração social e apoio local.');

-- Tabela: Doador
INSERT INTO `Doador` (`ID`, `Nome`, `Telefone`) VALUES
(101, 'João Silva', '31998765432'),
(102, 'Maria Oliveira', '11987654321'),
(103, 'Carlos Pereira', '21991234567'),
(104, 'Empresa Solidária', '4130302020');

-- Tabela: Receptor
INSERT INTO `Receptor` (`CPF`, `Nome`, `Telefone`, `Estado`, `Cidade`, `Rua`, `Numero`) VALUES
('11122233344', 'Ana Costa', '31988887777', 'MG', 'Belo Horizonte', 'Rua das Flores', '15'),
('22233344455', 'Pedro Rocha', '21977776666', 'RJ', 'Niterói', 'Avenida Principal', '102'),
('33344455566', 'Lúcia Ferreira', '11966665555', 'SP', 'São Paulo', 'Alameda dos Anjos', '300'),
('44455566677', 'Rafaela Santos', '31955554444', 'MG', 'Contagem', 'Rua Nova', '22A');

-- Tabela: Veterinario
INSERT INTO `Veterinario` (`CPF`, `Nome`, `Telefone`, `Especialidade`) VALUES
('55566677788', 'Dr. Ricardo Mello', '31944443333', 'Clínica Geral'),
('66677788899', 'Dra. Sofia Lima', '11933332222', 'Cirurgia'),
('77788899900', 'Dr. Felipe Alves', '21922221111', 'Oftalmologia'),
('88899900011', 'Dra. Camila Nogueira', '31911110000', 'Felinos');

-- Tabela: Capturador
INSERT INTO `Capturador` (`CPF`, `Nome`, `Telefone`) VALUES
('99900011122', 'Mariana Gomes', '31910101010'),
('00011122233', 'Roberto Pires', '11920202020'),
('12345678900', 'Helena Dias', '31930303030'),
('09876543210', 'Sergio Matos', '21940404040');

-- Tabela: Animal (Sem FK de abrigo, pois N:N está em Abrigo_Animal)
INSERT INTO `Animal` (`ID`, `Nome`, `Sexo`, `Status`, `Peso`, `Especie`) VALUES
(1, 'Rex', 'M', 1, 35.50, 'Cachorro'),
(2, 'Mimi', 'F', 0, 4.20, 'Gato'),
(3, 'Apolo', 'M', 1, 12.00, 'Cachorro'),
(4, 'Bolinha', 'F', 0, 5.00, 'Gato');

-- -----------------------------------------------------
-- 2. TABELAS FILHAS 1:N
-- -----------------------------------------------------

-- Tabela: Departamento (Depende de Ong)
INSERT INTO `Departamento` (`ID`, `Nome`, `Telefone`, `Descricao`, `ID_Ong`) VALUES
(10, 'Administrativo', '3133331111', 'Gestão financeira e burocrática', 1),
(11, 'Resgate', '3133332222', 'Coordena as equipes de campo', 1),
(12, 'Adoção', '1144443333', 'Processo de triagem de receptores', 2),
(13, 'Comunicação', '3155554444', 'Marketing e mídias sociais', 4);

-- Tabela: Abrigo (Depende de Ong)
INSERT INTO `Abrigo` (`ID`, `Nome`, `Email`, `Telefone`, `Cidade`, `Estado`, `Rua`, `Numero`, `ID_Ong`) VALUES
(50, 'Central BH', 'central@amigobicho.com', '3132221010', 'Belo Horizonte', 'MG', 'Av. Brasil', '100', 1),
(51, 'Unidade Contagem', 'contagem@amigobicho.com', '3132222020', 'Contagem', 'MG', 'Rua Principal', '500', 1),
(52, 'Sede SP', 'sede@patasfelizes.org', '1140003030', 'São Paulo', 'SP', 'Rua dos Gatos', '20', 2),
(53, 'Abrigo Local', 'local@quatropatas.org', '3130301010', 'Betim', 'MG', 'Rua C', '1', 4);

-- Tabela: Funcionario (Depende de Departamento e Abrigo)
INSERT INTO `Funcionario` (`CPF`, `Nome`, `Email`, `Telefone`, `Cargo`, `ID_Departamento`, `ID_Abrigo`) VALUES
('10101010101', 'Paula Mendes', 'paula@ong.com', '3199998888', 'Gerente', 10, 50),
('20202020202', 'Marcos Lima', 'marcos@ong.com', '3199887777', 'Resgatista', 11, 51),
('30303030303', 'Sofia Rocha', 'sofia@ong.com', '1199776666', 'Atendente Adocao', 12, 52),
('40404040404', 'Bruno Neves', 'bruno@ong.com', '3199665555', 'Marketing', 13, 53);

-- -----------------------------------------------------
-- 3. TABELAS ASSOCIATIVAS N:N COM DADOS
-- -----------------------------------------------------

-- Tabela: Abrigo_Animal (Abrigo <-> Animal)
INSERT INTO `Abrigo_Animal` (`Abrigo_ID`, `Animal_ID`) VALUES
(50, 1), 
(50, 2), 
(51, 1), 
(52, 3); 

-- Tabela: Doacao (Doador <-> Ong)
INSERT INTO `Doacao` (`ID_Doador`, `ID_Ong`, `Descricao`, `Quantia`, `Data`) VALUES
(101, 1, 'Doação em dinheiro', 200.00, '2025-10-20'),
(102, 2, 'Ração para gatos', 50.00, '2025-11-01'),
(103, 1, 'Doação mensal', 100.00, '2025-11-10'),
(104, 4, 'Caminhas e cobertores', 500.00, '2025-11-13');

-- Tabela: Adocao (Animal <-> Receptor)
INSERT INTO `Adocao` (`ID_Animal`, `CPF_Receptor`, `Data`) VALUES
(4, '11122233344', '2025-11-05 10:00:00'), 
(3, '22233344455', '2025-09-15 14:30:00'),
(2, '33344455566', '2025-11-20 16:00:00'),
(1, '44455566677', '2025-12-01 11:00:00');

-- Tabela: Captura (Capturador <-> Animal)
INSERT INTO `Captura` (`CPF_Capturador`, `ID_Animal`, `Local`, `Data`) VALUES
('99900011122', 1, 'Rua das Gaivotas, Contagem', '2025-10-01 08:00:00'),
('99900011122', 2, 'Praça da Liberdade, BH', '2025-10-05 15:00:00'),
('00011122233', 3, 'Parque Municipal, Niterói', '2025-09-01 11:00:00'),
('12345678900', 4, 'Bairro Jardim, Betim', '2025-11-04 17:00:00');

-- Tabela: Atendimento (Veterinario <-> Animal)
INSERT INTO `Atendimento` (`CPF_Veterinario`, `ID_Animal`, `Data`, `Servico`) VALUES
('55566677788', 1, '2025-10-02 10:00:00', 'Primeira Avaliação e Vacinação'),
('66677788899', 3, '2025-09-05 13:00:00', 'Cirurgia de Castração'),
('55566677788', 2, '2025-10-06 09:30:00', 'Exame de Rotina'),
('88899900011', 4, '2025-11-04 18:00:00', 'Avaliação Pós-Captura');

-- Reativa checagem de chave estrangeira
SET FOREIGN_KEY_CHECKS = 1;