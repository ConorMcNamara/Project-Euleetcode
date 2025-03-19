WITH driver_data AS (
SELECT
    driver_id,
    DATE(delivery_start_time) AS day,
    extract(epoch from delivery_end_time - delivery_start_time) / 60 AS delivery_duration,
    AVG(extract(epoch from delivery_end_time - delivery_start_time) / 60) AS avg_deliver_duration
FROM deliveries
GROUP BY
    1, 2
    )
SELECT
    driver_id,
    day,
    avg_delivery_duration,
    DENSE_RANK() OVER (PARTITION BY driver_id, ORDER BY avg_deliver_duration) AS rank,
    AVG(avg_deliver_duration) OVER (PARTITION BY driver_id) AS overall_avg_delivery_duration
FROM driver_data
GROUP BY
    1, 2


