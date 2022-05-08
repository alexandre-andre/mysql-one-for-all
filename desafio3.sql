SELECT
  usuario.nome AS usuario,
  COUNT(historico.cancao_id) AS qtde_musicas_ouvidas,
  ROUND(SUM(cancao.duracao_segundos/60),2) AS total_minutos
FROM SpotifyClone.historico AS historico
INNER JOIN SpotifyClone.usuario AS usuario
ON historico.usuario_id = usuario.id
INNER JOIN SpotifyClone.cancao AS cancao
ON historico.cancao_id = cancao.id
GROUP BY usuario.nome;