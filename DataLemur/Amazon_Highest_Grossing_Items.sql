WITH products AS (
    SELECT
        category,
        product,
        SUM(spend) AS total_spend,
        DENSE_RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS row_num
    FROM product_spend
    WHERE
        EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY
        1, 2
)
SELECT
    category,
    product,
    total_spend
FROM products
WHERE
    row_num <= 2