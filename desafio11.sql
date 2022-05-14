SELECT
  nome AS nome_musica,
  REPLACE(
  REPLACE(
  REPLACE(
  REPLACE(
  REPLACE(nome, 'Streets', 'Code Review'),
    'Her Own', 'Trybe'),
    'Inner Fire', 'Project'),
    'Silly', 'Nice'),
    'Circus', 'Pull Request') AS novo_nome
FROM SpotifyClone.cancao
WHERE nome LIKE('%Streets') OR
      nome LIKE('%Her Own') OR
      nome LIKE('%Inner Fire') OR
      nome LIKE('%Silly') OR
      nome LIKE('%Circus')
ORDER BY nome_musica;