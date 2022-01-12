SELECT DISTINCT 
    city
FROM station
WHERE 
    RIGHT(LOWER(city), 1) not in ('a', 'e', 'i', 'o', 'u')
    and LEFT(LOWER(city), 1) not in ('a', 'e', 'i', 'o', 'u')
    
--Alternatively
SELECT DISTINCT
    city
FROM station
WHERE
    city NOT REGEXP('^[aeiou]')
    AND city NOT REGEXP('[aeiou]$')
