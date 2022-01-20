WITH purchase_lag AS (
    SELECT 
        user_id,
        created_at - LAG(created_at) OVER (PARTITION BY user_id ORDER BY created_at) AS second_purchase_diff
    FROM amazon_transactions 
    GROUP BY 
        1, created_at, id
    )
SELECT DISTINCT
    user_id
FROM purchase_lag
WHERE
    second_purchase_diff <= 7
ORDER BY 
    user_id
