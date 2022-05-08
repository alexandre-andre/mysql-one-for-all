SELECT
  usuario.nome AS usuario,
  IF(MAX(YEAR(historico.data_reproducao)) > 2020, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.historico AS historico
INNER JOIN SpotifyClone.usuario AS usuario
ON historico.usuario_id = usuario.id
GROUP BY usuario.nome;