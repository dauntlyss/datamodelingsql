
DROP DATABASE IF EXISTS league_db;
CREATE DATABASE league_db;
\c league_db;

CREATE TABLE teams 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE positions 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE players 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  position_id INTEGER REFERENCES positions(id) ON DELETE SET NULL,
  team_id INTEGER REFERENCES teams(id) ON DELETE SET NULL
);

CREATE TABLE referees 
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  team1_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE SET NULL,
  team2_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE SET NULL,
  location VARCHAR(50) NOT NULL,
  winner_id INTEGER NOT NULL REFERENCES teams(id) ON DELETE SET NULL,
  ref_id INTEGER REFERENCES referees(id) ON DELETE SET NULL,
  date_played DATE
);

INSERT INTO teams (name)
VALUES
('Jaguars'),
('Panthers'),
('Falcons'),
('Beavers'),
('Green Jackets');

INSERT INTO positions (name)
VALUES
('Short Stop'),
('Goalie'),
('Defensive Back'),
('Tight End'),
('Guard');

INSERT INTO players (name, position_id, team_id)
VALUES
('Jane Doe', 1,2),
('Emily Rogan', 2,1),
('Jane Holden', 2,3),
('Emily Georrge', 4,5),
('Danny Franks', 3,4);

INSERT INTO referees (name)
VALUES
('Jane Doe'),
('Emily Rogan'),
('Jane Holden'),
('Emily Georrge'),
('Danny Franks');

INSERT INTO matches (team1_id, team2_id, location, winner_id, ref_id, date_played)
VALUES
(2, 1, 'Sydney', 2, 1, '1-1-2021'),
(2, 3, 'Atlanta', 3, 3, '1-2-2021');
