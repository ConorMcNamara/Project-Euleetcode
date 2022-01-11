SELECT DISTINCT
    city
FROM station
WHERE
    LOWER(city) REGEXP('^[aeiou]')
    
