SELECT
    sender_id,
    COUNT(message_id) AS message_count
FROM messages
WHERE
    date_part('month', sent_date) = 8
    AND date_part('year', sent_date) = 2022
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 2;