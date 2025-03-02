WITH max_items AS (
    SELECT
        MAX(order_occurrences) AS max_orders
    FROM items_per_order
)
SELECT
    item_count AS mode
FROM items_per_order
JOIN max_items
    ON order_occurrences = max_orders
ORDER BY
    1