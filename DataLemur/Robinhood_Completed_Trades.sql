SELECT
    city,
    COUNT(CASE WHEN status = 'Completed' THEN quantity END) AS total_orders
FROM trades
JOIN users
    ON trades.user_id = users.user_id
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 3;