DROP TABLE fights;
DROP TABLE players;

CREATE TABLE players (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR,
  strength INT2,
  ability INT2
);

CREATE TABLE battles (
  id SERIAL4 PRIMARY KEY,
  player1_id INT4 REFERENCES players(id),
  player2_id INT4 REFERENCES players(id)
);