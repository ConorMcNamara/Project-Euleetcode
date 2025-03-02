WITH measurement_sum AS (
    SELECT
        CAST(measurement_time AS date) AS measurement_day,
        measurement_value,
        DENSE_RANK() OVER(PARTITION BY CAST(measurement_time AS date) ORDER BY measurement_time DESC) AS row_num
    FROM measurements
)
SELECT
    measurement_day,
    SUM(CASE WHEN row_num % 2 = 1 THEN measurement_value END) AS odd_sum,
    SUM(CASE WHEN row_num % 2 = 0 THEN measurement_value END) AS even_sum
FROM measurement_sum
GROUP BY
    1
ORDER BY
    1 ASC;