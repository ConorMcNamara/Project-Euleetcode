WITH user_max_dates AS (
    SELECT
        user_id,
        MAX(transaction_date) AS max_date
FROM user_transactions
GROUP BY
    1
)
SELECT
    max_date AS transaction_date,
    user_max_dates.user_id,
    COUNT(product_id) AS purchase_count
FROM user_transactions
JOIN user_max_dates
    ON user_transactions.user_id = user_max_dates.user_id
    AND user_transactions.transaction_date = user_max_dates.max_date
GROUP BY
    1, 2
ORDER BY
    1