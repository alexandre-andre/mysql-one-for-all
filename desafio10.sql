SELECT
	c.nome AS nome,
  COUNT(h.usuario_id) AS reproducoes
FROM SpotifyClone.historico AS h
INNER JOIN SpotifyClone.cancao AS c
ON h.cancao_id = c.id
INNER JOIN SpotifyClone.usuario AS u
ON h.usuario_id = u.id
WHERE u.plano_id IN (1,3)
GROUP BY nome;