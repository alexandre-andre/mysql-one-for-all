DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano(
  id SMALLINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR (30) NOT NULL,
  preco DECIMAL (4, 2) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO plano(nome, preco)
VALUES ('gratuito', 0),
       ('universitario', 5.99),
       ('pessoal', 6.99),
       ('familiar', 7.99);

CREATE TABLE usuario(
  id SMALLINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(50) NOT NULL,
  idade TINYINT(3) NOT NULL,
  plano_id SMALLINT,
  PRIMARY KEY (id),
  FOREIGN KEY (plano_id) REFERENCES plano(id)
) ENGINE = InnoDB;

INSERT INTO usuario(nome, idade, plano_id)
VALUES ('Thati', 23, 1),
       ('Cíntia', 35, 4),
       ('Bill', 20, 2),
       ('Roger', 45, 3),
       ('Norman', 58, 3),
       ('Partick', 33, 4),
       ('Vivian', 26, 2),
       ('Carol', 19, 2),
       ('Angelina', 42, 4),
       ('Paul', 46, 4);

CREATE TABLE assinatura_plano(
  usuario_id SMALLINT,
  plano_id SMALLINT,
  data_assinatura DATE,
  CONSTRAINT PRIMARY KEY (usuario_id, plano_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (plano_id) REFERENCES plano(id)
) ENGINE = InnoDB;

INSERT INTO assinatura_plano(usuario_id, plano_id, data_assinatura)
VALUES (1, 1, '2019-10-20'),
       (2, 4, '2017-12-30'),
       (3, 2, '2020-02-17'),
       (4, 3, '2019-06-05'),
       (5, 3, '2018-05-13'),
       (6, 4, '2017-01-06'),
       (7, 2, '2018-01-05'),
       (8, 2, '2018-02-14'),
       (9, 4, '2018-04-29'),
       (10, 4, '2017-01-17');

CREATE TABLE artista(
  id SMALLINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  sobrenome VARCHAR(30) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) ENGINE=InnoDB;

INSERT INTO artista(nome, sobrenome)
VALUES ('Walter', 'Phoenix'),
       ('Peter', 'Strong'),
       ('Lance', 'Day'),
       ('Freedie', 'Shannon'),
       ('Tyler', 'Isle'),
       ('Fog', '');

CREATE TABLE album(
  id SMALLINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  ano_lancamento YEAR,
  artista_id SMALLINT,
  PRIMARY KEY (id),
  FOREIGN KEY (artista_id) REFERENCES artista(id)
) ENGINE=InnoDB;

INSERT INTO album(nome, ano_lancamento, artista_id)
VALUES ('Envious', 1990, 1),
       ('Exuberant', 1993, 1),
       ('Hallowed Steam', 1995, 2),
       ('Incandescent', 1998, 3),
       ('Temporary Culture', 2001, 4),
       ('Library of liberty', 2003, 4),
       ('Chained Down', 2007, 5),
       ('Cabinet of foods', 2012, 5),
       ('No guarantees', 2015, 5),
       ('Apparatus', 2015, 6);

CREATE TABLE cancao(
  id SMALLINT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(40) NOT NULL,
  duracao_segundos SMALLINT NOT NULL,
  album_id SMALLINT,
  artista_id SMALLINT,
  PRIMARY KEY (id),
  FOREIGN KEY (album_id) REFERENCES album(id),
  FOREIGN KEY (artista_id) REFERENCES artista(id)
) ENGINE=InnoDB;

INSERT INTO cancao(nome, duracao_segundos, album_id, artista_id)
VALUES ('Soul For Us', 200, 1, 1),
       ('Reflections Of Magic', 163, 1, 1),
       ('Dance With Her Own', 116, 1, 1),
       ('Troubles Of My Fire', 203, 2, 1),
       ('Time Fireworks', 152, 2, 1),
       ('Magic Circus', 105, 2, 2),
       ('Honey, So Do I', 207, 2, 2),
       ('Sweetie, Let`s Go Wild', 139, 2, 2),
       ('She Knows', 244, 2, 2),
       ('Fantasy For Me', 100, 4, 3),
       ('Celebration Of More', 146, 4, 3),
       ('Rock His Everything', 223, 4, 3),
       ('Home Forever', 231, 4, 3),
       ('Diamond Power', 241, 4, 3),
       ('Let`s Be Silly', 132, 4, 3),
       ('Thang Of Thunder', 240, 5, 3),
       ('Words Of Her Life', 185, 5, 4),
       ('Without My Streets', 176, 5, 4),
       ('Need Of The Evening', 190, 6, 4),
       ('History Of My Roses', 222, 6, 4),
       ('Without My Love', 111, 6, 4),
       ('Walking And Game', 123, 6, 4),
       ('Young And Father', 197, 6, 4),
       ('Finding My Traditions', 179, 7, 5),
       ('Walking And Man', 229, 7, 5),
       ('Hard And Time', 135, 7, 5),
       ('Honey, I`m A Lone Wolf', 150, 7, 5),
       ('She Thinks I Won`t Stay Tonight', 166, 8, 5),
       ('He Heard You`re Bad For Me', 154, 8, 5),
       ('He Hopes We Can`t Stay', 210, 8, 5),
       ('I Know I Know', 117, 8, 5),
       ('He`s Walking Away', 159, 9, 5),
       ('He`s Trouble', 138, 9, 5),
       ('I Heard I Want To Be Alone', 120, 9, 5),
       ('I Ride Alone', 151, 9, 5),
       ('Honey', 79, 10, 6),
       ('You Cheated On Me', 95, 10, 6),
       ('Wouldn`t It Be Nice', 213, 10, 6),
       ('Baby', 136, 10, 6),
       ('You Make Me Feel So..', 83, 10, 6);


CREATE TABLE historico(
  usuario_id SMALLINT,
  cancao_id SMALLINT,
  CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
  FOREIGN KEY(usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (cancao_id) REFERENCES cancao(id)
) ENGINE=InnoDB;

INSERT INTO historico(usuario_id, cancao_id)
VALUES (1, 36),
       (1, 25),
       (1, 23),
       (1, 14),
       (1, 15),
       (2, 34),
       (2, 24),
       (2, 21),
       (2, 39),
       (3, 6),
       (3, 3),
       (3, 26),
       (4, 2),
       (4, 35),
       (4, 27),
       (5, 7),
       (5, 12),
       (5, 14),
       (5, 1),
       (6, 38),
       (6, 29),
       (6, 30),
       (6, 22),
       (7, 5),
       (7, 4),
       (7, 11),
       (8, 39),
       (8, 40),
       (8, 32),
       (8, 33),
       (9, 16),
       (9, 17),
       (9, 8),
       (9, 9),
       (10, 20),
       (10, 21),
       (10, 12),
       (10, 13);

CREATE TABLE seguindo_artista(
  usuario_id SMALLINT,
  artista_id SMALLINT,
  CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(id),
  FOREIGN KEY (artista_id) REFERENCES artista(id)
) ENGINE=InnoDB;

INSERT INTO seguindo_artista(artista_id, usuario_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 6),
       (1, 8),
       (2, 3),
       (2, 7),
       (2, 10),
       (3, 1),
       (3, 2),
       (3, 6),
       (3, 9),
       (4, 1),
       (4, 4),
       (4, 9),
       (5, 5), 
       (5, 7),
       (5, 8),
       (6, 5),
       (6, 6),
       (6, 9),
       (6, 10);
