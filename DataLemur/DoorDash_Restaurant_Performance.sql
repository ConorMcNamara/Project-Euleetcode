SELECT
    restaurant_id,
    COUNT(order_id) AS num_orders
FROM orders
WHERE
    order_date BETWEEN NOW() - INTERVAL '1 month' BETWEEN AND NOW()
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT 5
