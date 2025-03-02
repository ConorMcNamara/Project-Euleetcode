WITH even_orders AS (
    SELECT
        CASE
            WHEN order_id < (SELECT MAX(order_id) FROM orders) THEN order_id + 1
            ELSE order_id
        END AS corrected_order_id,
        item
    FROM orders
    WHERE
        order_id % 2 <> 0
),
odd_orders AS (
    SELECT
        order_id - 1 AS corrected_order_id,
        item
    FROM orders
    WHERE
        order_id % 2 = 0
)
SELECT
    *
FROM even_orders
UNION ALL
SELECT
    *
FROM odd_orders
ORDER BY
  corrected_order_id