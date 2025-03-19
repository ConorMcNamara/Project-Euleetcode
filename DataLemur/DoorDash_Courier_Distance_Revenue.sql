WITH courier_fee AS (
SELECT
    courier_id,
    ROUND(AVG(ABS(start_point - end_point)), 2) AS avg_distance,
    SUM(CASE
        WHEN AVG(ABS(start_point - end_point)) > delivery_fee THEN AVG(ABS(start_point - end_point)) * quantity
        ELSE delivery_fee * quantity
    END) AS revenue
FROM deliveries
WHERE
    deliveries.date >= CURRENT_DATE() - INTERVAL '1 month'
GROUP BY
    1
)