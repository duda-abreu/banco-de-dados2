-- Visão para exibir informações detalhadas dos jogadores, incluindo a classe e guilda
CREATE VIEW VisaoJogadorDetalhes AS
SELECT 
    j.ID AS JogadorID,
    j.Nome AS NomeJogador,
    c.Nome AS NomeClasse,
    g.Nome AS NomeGuilda,
    j.Nivel,
    j.PontosXP,
    j.DataCriacao,
    j.UltimoLogin
FROM 
    Jogador j
JOIN 
    Classe c ON j.ClasseID = c.ID
JOIN 
    Guilda g ON j.GuildaID = g.ID;

-- Visão para exibir as habilidades dos jogadores com detalhes
CREATE VIEW VisaoJogadorHabilidades AS
SELECT 
    j.Nome AS NomeJogador,
    h.Nome AS NomeHabilidade,
    jh.Nivel AS NivelHabilidade
FROM 
    JogadorHabilidade jh
JOIN 
    Jogador j ON jh.JogadorID = j.ID
JOIN 
    Habilidade h ON jh.HabilidadeID = h.ID;

-- Visão para exibir os itens dos jogadores com quantidades
CREATE VIEW VisaoJogadorItens AS
SELECT 
    j.Nome AS NomeJogador,
    i.Nome AS NomeItem,
    ji.Quantidade
FROM 
    JogadorItem ji
JOIN 
    Jogador j ON ji.JogadorID = j.ID
JOIN 
    Item i ON ji.ItemID = i.ID;
