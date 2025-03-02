SELECT
    user_id
FROM (
    SELECT
        user_id,
        transaction_date,
        ROW_NUMBER() over (PARTITION BY user_id ORDER BY transaction_date) AS seqnum
    FROM transactions
     ) t
GROUP BY
    user_id,
    transaction_date - seqnum * INTERVAL '1 day'
HAVING
    COUNT(*) >= 3