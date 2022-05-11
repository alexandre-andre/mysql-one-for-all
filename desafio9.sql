SELECT
	COUNT(h.usuario_id)  AS quantidade_musicas_no_historico
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico AS h
ON u.id = h.usuario_id
WHERE u.nome = 'Bill';