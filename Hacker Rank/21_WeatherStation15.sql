SELECT 
    ROUND(long_w, 4) 
FROM station
WHERE
    lat_n = (SELECT MAX(lat_n) from station where lat_n < 137.2345)
    
--Alternatively
SELECT
    ROUND(long_w, 4) as long_w
FROM station
WHERE
    lat_n < 137.2345
ORDER BY
    lat_n DESC
LIMIT 1
