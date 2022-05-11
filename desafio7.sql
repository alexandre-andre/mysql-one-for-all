SELECT
  art.nome AS artista,
  alb.nome AS album,
  COUNT(sa.usuario_id) AS seguidores
FROM SpotifyClone.album AS alb
INNER JOIN SpotifyClone.artista AS art
ON alb.artista_id = art.id
INNER JOIN SpotifyClone.seguindo_artista AS sa
ON art.id = sa.artista_id
GROUP BY art.nome, alb.nome
ORDER BY COUNT(sa.usuario_id) DESC, art.nome, alb.nome;