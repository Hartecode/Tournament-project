# Tournament-project
This is my Udacity project that utilizes python and sql to create a database for a Swiss style tournament.

Udacity Tournament Project

udacity Back-End Project  - Tournament Results

Set up steps:

1. Install Vagrant and VirtualBox
2. Clone the fullstack-nanodegree-vm repository
3. Launch the Vagrant VM
4. Write SQL database and table definitions in a file (tournament.sql)
5. Write Python functions filling out a template of an API (tournament.py)
6. Run a test suite to verify your code (tournament_test.py)

tournament.py -- implementation of a Swiss-system tournament
tournament.sql -- table definitions for the tournament project.
tournament_test.py -- Test cases for tournament.py


----Using the files.----

Create the database and add the tournament.sql.

vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ psql
psql (9.3.5)
Type "help" for help.

vagrant=> CREATE DATABASE tournament;
CREATE DATABASE
tournament=> \i tournament.sql
DROP VIEW
DROP VIEW
DROP VIEW
DROP VIEW
DROP TABLE
DROP TABLE
CREATE TABLE
CREATE TABLE
CREATE VIEW
CREATE VIEW
CREATE VIEW
tournament=> \q

load SQL schema

vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ psql tournament < tournament.sql
run test

vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ python tournament_test.py
1. Old matches can be deleted.
2. Player records can be deleted.
3. After deleting, countPlayers() returns zero.
4. After registering a player, countPlayers() returns 1.
5. Players can be registered and deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After one match, players with one win are paired.
Success!  All tests pass!
