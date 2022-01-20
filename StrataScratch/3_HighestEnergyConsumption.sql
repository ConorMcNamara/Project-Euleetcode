WITH total_consumption AS (
    SELECT
        COALESCE(eu.date, asia.date, na.date) AS date,
        SUM(COALESCE(eu.consumption, 0) + COALESCE(asia.consumption, 0) + COALESCE(na.consumption, 0)) as total_consumption,
        RANK() OVER(ORDER BY SUM(COALESCE(eu.consumption, 0) + COALESCE(asia.consumption, 0) + COALESCE(na.consumption, 0)) DESC) as consumption_rnk
    FROM fb_eu_energy eu 
    FULL OUTER JOIN fb_asia_energy asia
        ON eu.date = asia.date
    FULL OUTER JOIN fb_na_energy na 
        ON asia.date = na.date
    GROUP BY 
        1
)
SELECT 
    date,
    total_consumption
FROM total_consumption
WHERE
    consumption_rnk = 1
