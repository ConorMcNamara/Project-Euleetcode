(
    SELECT 
    city, 
    LENGTH(city) AS city_length
FROM station
ORDER BY 
    LENGTH(city) ASC, 1
LIMIT 1
    )

UNION ALL

(
    SELECT 
    city,
    LENGTH(city) AS city_length
FROM station
ORDER BY 
    LENGTH(city) DESC, 1
LIMIT 1
    )
