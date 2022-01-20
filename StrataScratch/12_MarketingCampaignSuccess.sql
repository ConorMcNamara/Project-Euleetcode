WITH users AS (
SELECT 
    user_id,
    created_at,
    product_id,
    MIN(created_at) OVER(PARTITION BY user_id ) as m1, 
    MIN(created_at) OVER(PARTITION BY user_id,product_id ) as m2
FROM 
    marketing_campaign
GROUP BY 
    1, created_at, product_id
)
SELECT 
    COUNT(DISTINCT user_id)
FROM users
WHERE
    m1 <> m2
    
