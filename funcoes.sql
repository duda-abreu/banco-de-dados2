-- Função para calcular o total de pontos de experiência de um jogador
CREATE FUNCTION CalcularTotalXP(jogador_id INT) 
RETURNS INT AS $$
DECLARE
    total_xp INT;
BEGIN
    SELECT PontosXP INTO total_xp
    FROM Jogador
    WHERE ID = jogador_id;
    
    RETURN total_xp;
END;
$$ LANGUAGE plpgsql;

-- Função para adicionar experiência a um jogador
CREATE FUNCTION AdicionarXP(jogador_id INT, xp INT) 
RETURNS VOID AS $$
BEGIN
    UPDATE Jogador
    SET PontosXP = PontosXP + xp
    WHERE ID = jogador_id;
END;
$$ LANGUAGE plpgsql;

-- Função para verificar se um jogador possui um item específico
CREATE FUNCTION VerificarItem(jogador_id INT, item_id INT) 
RETURNS BOOLEAN AS $$
DECLARE
    item_count INT;
BEGIN
    SELECT Quantidade INTO item_count
    FROM JogadorItem
    WHERE JogadorID = jogador_id AND ItemID = item_id;

    RETURN item_count > 0;
END;
$$ LANGUAGE plpgsql;
