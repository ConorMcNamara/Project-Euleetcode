WITH rank_vals AS (
SELECT 
    lat_n,
    rank() OVER (ORDER BY lat_n) as rank_n
FROM station
GROUP BY 
    1
)
SELECT 
    ROUND(lat_n, 4)
FROM rank_vals
WHERE rank_n = (SELECT CEIL(MAX(rank_n) / 2) FROM rank_vals)
