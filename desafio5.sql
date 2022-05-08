SELECT
  cancao.nome AS cancao,
  COUNT(cancao.id) AS reproducoes
FROM SpotifyClone.historico AS historico
INNER JOIN SpotifyClone.cancao AS cancao
ON historico.cancao_id = cancao.id
GROUP BY cancao.id
ORDER BY COUNT(cancao.id) DESC, cancao.nome
LIMIT 2;