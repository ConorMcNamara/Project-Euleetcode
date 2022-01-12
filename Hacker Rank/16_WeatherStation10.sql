SELECT DISTINCT
    city
FROM station
WHERE
    city NOT REGEXP('[aeiou]$')
    
--Alternatively
SELECT DISTINCT
    city
FROM station
WHERE 
    right(LOWER(city), 1) not in ('a', 'e', 'i', 'o', 'u')
