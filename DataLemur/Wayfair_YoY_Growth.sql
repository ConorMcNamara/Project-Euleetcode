WITH product_spend AS (
    SELECT
        product_id,
        EXTRACT(YEAR FROM transaction_date) AS year,
        SUM(spend) AS spend,
        LAG(SUM(spend), 1) OVER (PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date)) as prev_spend
    FROM user_transactions
    GROUP BY
        1, 2
)
SELECT
    year,
    product_id,
    spend AS curr_year_spend,
    prev_spend as prev_year_spend,
    ROUND((spend - prev_spend) * 100.0 / prev_spend, 2) AS yoy_rate
FROM product_spend