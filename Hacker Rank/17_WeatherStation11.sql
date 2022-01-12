SELECT DISTINCT
    city
FROM 
    station
WHERE
    RIGHT(LOWER(city), 1) NOT IN ('a', 'e', 'i', 'o', 'u')
    OR LEFT(LOWER(city), 1) NOT IN ('a', 'e', 'i', 'o', 'u')
    
--Alternatively
SELECT DISTINCT
    city
FROM station
WHERE
    city NOT REGEXP('^[aeiou]')
    OR city NOT REGEXP('[aeiou]$')
