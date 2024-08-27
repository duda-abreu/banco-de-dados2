-- Criação da tabela Classe
CREATE TABLE Classe (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descricao TEXT,
    PontosVida INT,
    PontosMana INT,
    PontosAtaque INT
);

-- Criação da tabela Guilda
CREATE TABLE Guilda (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descricao TEXT,
    DataFundacao DATE,
    Nivel INT
);

-- Criação da tabela Habilidade
CREATE TABLE Habilidade (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Descricao TEXT,
    ClasseID INT,
    CustoMana INT,
    Dano INT,
    FOREIGN KEY (ClasseID) REFERENCES Classe(ID)
);

-- Criação da tabela Item
CREATE TABLE Item (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Tipo VARCHAR(100),
    Valor INT,
    Efeito TEXT
);

-- Criação da tabela Missao
CREATE TABLE Missao (
    ID SERIAL PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Descricao TEXT,
    RecompensaXP INT,
    Dificuldade INT
);

-- Criação da tabela Jogador
CREATE TABLE Jogador (
    ID SERIAL PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    ClasseID INT REFERENCES Classe(ID),
    GuildaID INT REFERENCES Guilda(ID),
    Nivel INT,
    PontosXP INT,
    DataCriacao DATE,
    UltimoLogin TIMESTAMP
);

-- Criação da tabela JogadorHabilidade
CREATE TABLE JogadorHabilidade (
    JogadorID INT,
    HabilidadeID INT,
    NivelHabilidade INT DEFAULT 1,
    PRIMARY KEY (JogadorID, HabilidadeID),
    FOREIGN KEY (JogadorID) REFERENCES Jogador(ID),
    FOREIGN KEY (HabilidadeID) REFERENCES Habilidade(ID)
);

-- Criação da tabela JogadorItem
CREATE TABLE JogadorItem (
    JogadorID INT,
    ItemID INT,
    Quantidade INT,
    PRIMARY KEY (JogadorID, ItemID),
    FOREIGN KEY (JogadorID) REFERENCES Jogador(ID),
    FOREIGN KEY (ItemID) REFERENCES Item(ID)
);

-- Criação da tabela JogadorMissao
CREATE TABLE JogadorMissao (
    JogadorID INT,
    MissaoID INT,
    Status VARCHAR(100),
    DataConclusao DATE,
    PRIMARY KEY (JogadorID, MissaoID),
    FOREIGN KEY (JogadorID) REFERENCES Jogador(ID),
    FOREIGN KEY (MissaoID) REFERENCES Missao(ID)
);

-- Criação de um índice não padrão para melhorar performance de consultas
CREATE INDEX idx_jogador_nome ON Jogador(Nome);
