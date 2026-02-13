WITH game AS (
    SELECT 
        player_id,
        MIN(event_date) OVER (PARTITION BY player_id) AS first_login,
        LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS next
    FROM Activity
)
SELECT 
ROUND(
    SUM(CASE WHEN DATE_ADD(first_login, INTERVAL 1 DAY) = next THEN 1 ELSE 0 END) * 1.0
    / COUNT(DISTINCT player_id),
    2
) AS fraction
FROM game;
