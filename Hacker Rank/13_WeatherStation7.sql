SELECT DISTINCT
    city
FROM 
    station
WHERE
    RIGHT(LOWER(city), 1) IN ('a', 'e', 'i', 'o', 'u')
    
--Alternatively
SELECT DISTINCT
    city
FROM 
    station
WHERE
    LOWER(city) LIKE '%a' 
    OR LOWER(city) LIKE '%e' 
    OR LOWER(city) LIKE '%i' 
    OR LOWER(city) LIKE '%o' 
    OR LOWER(city) LIKE '%u'
