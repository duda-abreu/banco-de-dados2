-- Trigger para atualizar a data do último login quando um jogador faz login
CREATE OR REPLACE FUNCTION AtualizarUltimoLogin() 
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Jogador
    SET UltimoLogin = NOW()
    WHERE ID = NEW.ID;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_atualizar_ultimo_login
AFTER UPDATE OF UltimoLogin
ON Jogador
FOR EACH ROW
EXECUTE FUNCTION AtualizarUltimoLogin();

-- Trigger para garantir que a quantidade de itens não seja negativa
CREATE OR REPLACE FUNCTION VerificarQuantidadeItem() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Quantidade < 0 THEN
        RAISE EXCEPTION 'A quantidade de um item não pode ser negativa.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_verificar_quantidade_item
BEFORE INSERT OR UPDATE ON JogadorItem
FOR EACH ROW
EXECUTE FUNCTION VerificarQuantidadeItem();
