WITH row_count AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS rownum
FROM transactions
)
SELECT
    user_id
FROM row_count
WHERE
    rownum = 3;