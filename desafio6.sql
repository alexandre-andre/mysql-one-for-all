SELECT
  MIN(plano.preco) AS faturamento_minimo,
  MAX(plano.preco) AS faturamento_maximo,
  FORMAT(AVG(plano.preco), 2) AS faturamento_medio,
  SUM(plano.preco) AS faturamento_total
FROM SpotifyClone.plano AS plano
INNER JOIN SpotifyClone.usuario AS usuario
ON plano.id = usuario.plano_id;