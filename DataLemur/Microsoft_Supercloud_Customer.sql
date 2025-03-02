WITH customer_products AS (
    SELECT
        customer_id,
        COUNT(DISTINCT product_category) as products_purchased
    FROM customer_contracts
    JOIN products
        ON customer_contracts.product_id = products.product_id
    GROUP BY
        1
)
SELECT
    customer_id
FROM customer_products
WHERE
    products_purchased = (SELECT COUNT(DISTINCT product_category) FROM products)