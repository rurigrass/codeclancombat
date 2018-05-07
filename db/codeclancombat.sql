DROP TABLE battles;
DROP TABLE players;

CREATE TABLE players (
  id SERIAL 4 PRIMARY KEY,
  name VARCHAR,
  strength INT2,
  skill INT2
);

CREATE TABLE fights (
  id SERIAL4 PRIMARY KEY,
  player1_id REFERENCES players(id),
  player2_id REFERENCES players(id),
  
);
