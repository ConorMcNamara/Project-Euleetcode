WITH points AS (
SELECT
    MAX(lat_n) as max_n,
    MAX(long_w) as max_w,
    MIN(lat_n) AS min_n,
    MIN(long_w) AS min_w
FROM
    station
)
SELECT
    ROUND(SQRT(POWER(max_w - min_w, 2) + POWER(max_n - min_n, 2)), 4)
FROM points
