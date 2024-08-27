-- Plano de execução para uma consulta que retorna detalhes dos jogadores
EXPLAIN ANALYZE
SELECT * 
FROM VisaoJogadorDetalhes
WHERE NomeClasse = 'Mago';

-- Plano de execução para uma consulta que retorna itens de um jogador específico
EXPLAIN ANALYZE
SELECT NomeItem, Quantidade 
FROM VisaoJogadorItens
WHERE NomeJogador = 'Jogador1';
