-- Select the average of home + away goals, multiplied by 3
SELECT 
	3 * avg(home_goal + away_goal)
FROM matches_2013_2014;

-- Select the date, home goals, and away goals scored
SELECT 
    date,
	home_goal,
	away_goal
FROM  matches_2013_2014
-- Filter for matches where total goals exceed 3x the average
WHERE (home_goal + away_goal) > 
       (SELECT 3 * AVG(home_goal + away_goal)
        FROM matches_2013_2014); 


-- Select the team long and short names 
SELECT 
	team_long_name,
	team_short_name
FROM team
-- Exclude all home teams found in match (from the subquery)
WHERE team_api_id NOT IN
     (SELECT DISTINCT hometeam_ID  FROM match);


-- Select the team long and short names
SELECT
	team_long_name,
	team_short_name
FROM team
-- Filter for teams with 8 or more home goals
WHERE team_api_id IN
	  (SELECT hometeam_ID
       FROM match
       WHERE home_goal >= 8);