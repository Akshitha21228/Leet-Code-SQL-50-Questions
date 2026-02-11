SELECT 
    R.contest_id,
    ROUND(COUNT(R.user_id) * 100.0 / U.total_users, 2) AS percentage
FROM Register R
CROSS JOIN (
    SELECT COUNT(*) AS total_users
    FROM Users
) U
GROUP BY R.contest_id
ORDER BY percentage DESC, R.contest_id ASC;
