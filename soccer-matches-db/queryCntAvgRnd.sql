
-- Count the home wins, away wins, and ties in each country
SELECT 
    c.name AS country,
	count(case when m.home_goal > m.away_goal THEN m.id 
        END) AS home_wins,
	count(case when m.home_goal < m.away_goal THEN m.id 
        END) AS away_wins,
	count(case when m.home_goal = m.away_goal THEN m.id 
        END) AS ties
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;

-- Round the percentage of tied games to 2 decimal points
SELECT 
	c.name AS country,
	round(avg(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2013_2014,
	round(avg(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;