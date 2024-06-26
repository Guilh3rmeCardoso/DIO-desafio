-- Criação da tabela Construtora
CREATE TABLE Construtora (
    Codigo NUMBER PRIMARY KEY,
    Nome_Construtora VARCHAR2(100) NOT NULL,
    Nome_Construtora_Fant VARCHAR2(100),
    Telefone VARCHAR2(20),
    CNPJ VARCHAR2(14) UNIQUE NOT NULL
);    

-- Criação da tabela Trabalhador
CREATE TABLE Trabalhador (
    CPF VARCHAR2(11) PRIMARY KEY,
    Nome_Trabalhador VARCHAR2(100) NOT NULL,
    Salario NUMBER NOT NULL,
    Codigo_Construtora NUMBER,
    CONSTRAINT fk_trab_constr FOREIGN KEY (Codigo_Construtora) REFERENCES Construtora (Codigo)
);

-- Criação da tabela de relacionamento Obras_Trabalhadores
CREATE TABLE Obras_Trabalhadores (
    Cod_Obra NUMBER,
    CPF VARCHAR2(11),
    CONSTRAINT fk_ot_obra FOREIGN KEY (Cod_Obra) REFERENCES Obras (Cod_Obra),
    CONSTRAINT fk_ot_trab FOREIGN KEY (CPF) REFERENCES Trabalhador (CPF),
    PRIMARY KEY (Cod_Obra, CPF)
);

-- Criação da tabela Obras
CREATE TABLE Obras (
    Cod_Obra NUMBER PRIMARY KEY,
    Nome_Obra VARCHAR2(100) NOT NULL,
    Cod_Construtora NUMBER,
    CONSTRAINT fk_obra_constr FOREIGN KEY (Cod_Construtora) REFERENCES Construtora (Codigo)
);

-- Criação da tabela Equipamento
CREATE TABLE Equipamento (
    Cod_Equip NUMBER PRIMARY KEY,
    Nome_Equip VARCHAR2(100) NOT NULL,
    Valor_Diario NUMBER NOT NULL,
    Categoria VARCHAR2(50) NOT NULL
);

-- Criação da tabela Locacao
CREATE TABLE Locacao (
    Data_Inicio DATE NOT NULL,
    Data_Final DATE NOT NULL,
    Cod_Obra NUMBER,
    Cod_Equip NUMBER,
    CONSTRAINT fk_loc_obra FOREIGN KEY (Cod_Obra) REFERENCES Obras (Cod_Obra),
    CONSTRAINT fk_loc_equip FOREIGN KEY (Cod_Equip) REFERENCES Equipamento (Cod_Equip),
    PRIMARY KEY (Data_Inicio, Cod_Obra, Cod_Equip)
);

-- Criação da tabela Categoria
CREATE TABLE Categoria (
    Cod_Equip NUMBER PRIMARY KEY,
    Descricao_Equip VARCHAR2(100),
    CONSTRAINT fk_cat_equip FOREIGN KEY (Cod_Equip) REFERENCES Equipamento (Cod_Equip)
);

-- Criação da tabela Locacao
CREATE TABLE Locacao (
    Data_Inicio DATE NOT NULL,
    Data_Final DATE NOT NULL,
    Cod_Obra NUMBER,
    Cod_Equip NUMBER,
    CONSTRAINT fk_loc_obra FOREIGN KEY (Cod_Obra) REFERENCES Obras (Cod_Obra),
    CONSTRAINT fk_loc_equip FOREIGN KEY (Cod_Equip) REFERENCES Equipamento (Cod_Equip),
    PRIMARY KEY (Data_Inicio, Cod_Obra, Cod_Equip)
);

-- Criação da tabela de relacionamento Obras_Trabalhadores
CREATE TABLE Obras_Trabalhadores (
    Cod_Obra NUMBER,
    CPF VARCHAR2(11),
    CONSTRAINT fk_ot_obra FOREIGN KEY (Cod_Obra) REFERENCES Obras (Cod_Obra),
    CONSTRAINT fk_ot_trab FOREIGN KEY (CPF) REFERENCES Trabalhador (CPF),
    PRIMARY KEY (Cod_Obra, CPF)
);

-- Inserção da Construtora
INSERT INTO Construtora (Codigo, Nome_Construtora, Nome_Construtora_Fant, Telefone, CNPJ) VALUES (1, 'Construtora ALFA', 'The ALFA Company', '41999999999', '99999999999991');
INSERT INTO Construtora (Codigo, Nome_Construtora, Nome_Construtora_Fant, Telefone, CNPJ) VALUES (2, 'Guilherme', 'Guilherme Cardoso', '51999999999', '199999999999999');

-- Inserção das Obras
INSERT INTO Obras (Cod_Obra, Nome_Obra, Cod_Construtora) VALUES (1, 'Obra Beira rio', 1);
INSERT INTO Obras (Cod_Obra, Nome_Obra, Cod_Construtora) VALUES (2, 'Obra Arena', 2);

-- Inserção dos Funcionários para Obra A
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('11111111110', 'Jorge', 3000.00, 1);
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('22222222220', 'Robson', 2500.00, 1);
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('33333333330', 'Alberto', 2800.00, 1);
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('44444444440', 'Renata', 2700.00, 1);
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('55555555550', 'Kleberson', 2900.00, 1);

-- Inserção dos Funcionários para Obra B
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('66666666666', 'Ramos', 3100.00, 2);
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('77777777777', 'Beatriz', 2600.00, 2);
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('88888888888', 'Camile', 2850.00, 2);
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('99999999999', 'Gabriel', 2750.00, 2);
INSERT INTO Trabalhador (CPF, Nome_Trabalhador, Salario, Codigo_Construtora) VALUES ('00000000000', 'Luciane', 2950.00, 2);

-- Associando os Funcionários à Obra A
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (1, '11111111110');
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (1, '22222222220');
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (1, '33333333330');
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (1, '44444444440');
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (1, '55555555550');

-- Associando os Funcionários à Obra B
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (2, '66666666666');
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (2, '77777777777');
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (2, '88888888888');
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (2, '99999999999');
INSERT INTO Obras_Trabalhadores (Cod_Obra, CPF) VALUES (2, '00000000000');

-- Inserção das Categorias
INSERT INTO Categoria (Cod_Equip, Descricao_Equip) VALUES (1, 'Escavadeira');
INSERT INTO Categoria (Cod_Equip, Descricao_Equip) VALUES (2, 'Betoneira');
INSERT INTO Categoria (Cod_Equip, Descricao_Equip) VALUES (3, 'Guindaste');
INSERT INTO Categoria (Cod_Equip, Descricao_Equip) VALUES (4, 'Compactador');

-- Inserção dos Equipamentos
INSERT INTO Equipamento (Cod_Equip, Nome_Equip, Valor_Diario, Categoria) VALUES (1, 'Escavadeira XYZ', 500.00, 'Escavadeira');
INSERT INTO Equipamento (Cod_Equip, Nome_Equip, Valor_Diario, Categoria) VALUES (2, 'Betoneira ABC', 200.00, 'Betoneira');
INSERT INTO Equipamento (Cod_Equip, Nome_Equip, Valor_Diario, Categoria) VALUES (3, 'Guindaste DEF', 800.00, 'Guindaste');
INSERT INTO Equipamento (Cod_Equip, Nome_Equip, Valor_Diario, Categoria) VALUES (4, 'Compactador GHI', 300.00, 'Compactador');
INSERT INTO Equipamento (Cod_Equip, Nome_Equip, Valor_Diario, Categoria) VALUES (5, 'Caixa de Ferramentas', 50.00, 'Ferramentas');

-- Associação dos Equipamentos as obras
INSERT INTO Locacao (Data_Inicio, Data_Final, Cod_Obra, Cod_Equip) VALUES (TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Locacao (Data_Inicio, Data_Final, Cod_Obra, Cod_Equip) VALUES (TO_DATE('2024-06-12', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 1, 2);
INSERT INTO Locacao (Data_Inicio, Data_Final, Cod_Obra, Cod_Equip) VALUES (TO_DATE('2024-06-10', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 1, 3);
INSERT INTO Locacao (Data_Inicio, Data_Final, Cod_Obra, Cod_Equip) VALUES (TO_DATE('2024-06-11', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 1, 4);
INSERT INTO Locacao (Data_Inicio, Data_Final, Cod_Obra, Cod_Equip) VALUES (TO_DATE('2024-06-09', 'YYYY-MM-DD'), TO_DATE('2024-06-20', 'YYYY-MM-DD'), 2, 5);

--Script para selecionar nomes e salários dos trabalhadores da empresa ALFA, ordenados em ordem alfabética crescente
SELECT t.Nome_Trabalhador, t.Salario
FROM Trabalhador t
JOIN Construtora c ON t.Codigo_Construtora = c.Codigo
WHERE c.Nome_Construtora = 'Alfa'
ORDER BY t.Nome_Trabalhador ASC;

--Script para calcular e exibir a folha de pagamento de cada obra. Uma folha de pagamento é determinada pela soma dos salários dos seus trabalhadores
SELECT o.Nome_Obra, SUM(t.Salario) AS Folha_Pagamento
FROM Obras o
JOIN Obras_Trabalhadores ot ON o.Cod_Obra = ot.Cod_Obra
JOIN Trabalhador t ON ot.CPF = t.CPF
GROUP BY o.Nome_Obra;

--Script para selecionar CPFs e nomes dos trabalhadores que ganham mais do que 2.500,00
SELECT CPF, Nome_Trabalhador
FROM Trabalhador
WHERE Salario > 2500.00;

--Script para listar as categorias de equipamentos utilizadas nas obras da construtora ALFA
SELECT DISTINCT e.Categoria
FROM Equipamento e
JOIN Locacao l ON e.Cod_Equip = l.Cod_Equip
JOIN Obras o ON l.Cod_Obra = o.Cod_Obra
JOIN Construtora c ON o.Cod_Construtora = c.Codigo
WHERE c.Nome_Construtora = 'Alfa';
