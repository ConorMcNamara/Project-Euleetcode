WITH june_2022 AS (
SELECT
    customer_id,
    signup_timestamp,
    signup_timestamp + INTERVAL '14 DAYS' AS first_two_weeks
FROM customers
WHERE
    EXTRACT(MONTH FROM signup_timestamp) = 6
    AND EXTRACT(YEAR FROM signup_timestamp) = 2022
)
SELECT
    ROUND(AVG(CASE
            WHEN status = 'completed successfully' THEN 0
            ELSE 1
         END AS unsuccessful_order) * 100.0, 2) AS percentage_unsuccessful
FROM orders
JOIN june_2022
    ON orders.customer_id = june_2022.customer_id
WHERE
    orders.order_timestamp BETWEEN signup_timestamp AND first_two_weeks