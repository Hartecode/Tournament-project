-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

--This deletes the old database and creates a new one.
DROP VIEW IF EXISTS standings;
DROP VIEW IF EXISTS num_matches;
DROP VIEW IF EXISTS totalloses;
DROP VIEW IF EXISTS totalwins;
DROP TABLE Matches;
DROP TABLE Players;


-- This table holds the list of players in the game. Each player gets a unique id.
CREATE TABLE Players (
       id serial NOT NULL PRIMARY KEY,
       name text NOT NULL
     );

-- This table hold each match in the game. Each match has a unique number.
-- The number for the winner and loser columns are from the players tbale.
CREATE TABLE Matches(
       match serial NOT NULL PRIMARY KEY,
       winner integer  NOT NULL REFERENCES Players (id),
       loser integer NOT NULL REFERENCES Players (id)
     );

--This views the the total wins player in order by wins.
CREATE VIEW totalwins AS
       SELECT Players.id AS id,
       Players.name AS name,
       count(Matches.winner) AS wins
       FROM Players LEFT JOIN Matches
       ON Players.id = Matches.winner
       GROUP BY Players.id;

--This views the the total wins player in order by loses.
CREATE VIEW totalloses AS
       SELECT Players.id AS id,
       Players.name AS name,
       count(Matches.loser) AS loses
       FROM Players LEFT JOIN Matches
       ON Players.id = Matches.loser
       GROUP BY Players.id;

---This view counts the total of matches per player
CREATE VIEW num_matches AS
      SELECT Players.id AS id, Players.name AS name, sum(wins) AS match
      FROM (
        SELECT * from totalwins
        UNION ALL
        SELECT * from totalloses
      ) source JOIN Players
      ON source.id = Players.id
       GROUP BY Players.id;
