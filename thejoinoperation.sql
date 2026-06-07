--question-1
--Show the matchid and player name for all goals scored by Germany.
SELECT matchid, player
FROM goal
WHERE teamid = 'GER';


--question-2
--Show id, stadium, team1, team2 for just game 1012.
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;


--question-3
--Show the player, teamid, stadium and mdate for every German goal.
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game
LEFT JOIN goal
ON (id = matchid)
WHERE goal.teamid = 'GER';


--question-4
--Show the team1, team2 and player for every goal scored by a player called Mario.
SELECT game.team1, game.team2, goal.player
FROM game
JOIN goal
ON game.id = goal.matchid
WHERE goal.player LIKE 'Mario%';


--question-5
--Show player, teamid, coach, gtime for all goals scored in the first 10 minutes.
SELECT player, teamid, coach, gtime
FROM goal
JOIN eteam
ON teamid = id
WHERE gtime <= 10;


--question-6
--List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam
ON game.team1 = eteam.id
WHERE coach = 'Fernando Santos';


--question-7
--List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
SELECT goal.player
FROM goal
JOIN game
ON matchid = id
WHERE stadium = 'National Stadium, Warsaw';


--question-8
--Show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
FROM goal
JOIN game
ON matchid = id
WHERE (team1 = 'GER' OR team2 = 'GER')
  AND (teamid != 'GER');


--question-9
--Show teamname and the total number of goals scored.
SELECT teamname, COUNT(teamid)
FROM eteam
JOIN goal
ON id = teamid
GROUP BY teamname;


--question-10
--Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(player)
FROM game
JOIN goal
ON id = matchid
GROUP BY stadium;


--question-11
--For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT game.id AS matchid,
       game.mdate,
       COUNT(goal.player) AS goals_scored
FROM game
LEFT JOIN goal
ON goal.matchid = game.id
WHERE team1 = 'POL'
   OR team2 = 'POL'
GROUP BY game.id, game.mdate;


--question-12
--For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.
SELECT matchid,
       mdate,
       COUNT(player)
FROM goal
JOIN game
ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid, mdate;


--question-13
--List every match involving the ENG team, showing the goals scored by each team.
SELECT
    mdate,
    team1,
    SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
    team2,
    SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game
LEFT JOIN goal
ON matchid = id
WHERE team1 = 'ENG'
   OR team2 = 'ENG'
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2;

