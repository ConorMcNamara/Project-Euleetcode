SELECT
    restaurant_id,
    AVG(EXTRACT(EPOCH FROM delivery_time - order_time) / 60) AS avg_delivery_time_in_minutes
FROM orders
GROUP BY
    1