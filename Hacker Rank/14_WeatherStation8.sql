WITH start_vowel AS (
SELECT 
    city
FROM station
WHERE 
    (lower(city) like 'a%'
    OR lower(city) like 'e%'
    OR lower(city) like 'i%'
    OR lower(city) LIke 'o%'
    OR lower(city) like 'u%')
),
end_vowel AS (
SELECT 
    city
FROM station
WHERE 
    (lower(city) like '%a'
    OR lower(city) like '%e'
    OR lower(city) like '%i'
    OR lower(city) LIke '%o'
    OR lower(city) like '%u')
)
SELECT 
    start_vowel.city 
fROM start_vowel
JOIN end_vowel
ON start_vowel.city = end_vowel.city

--Alternatively
WITH start_vowel AS (
SELECT 
    city
FROM station
WHERE 
    lower(city) regexp '^[aeiou]'
),
end_vowel AS (
SELECT 
    city
FROM station
WHERE 
    lower(city) regexp '[aeiou]$'
)
SELECT 
    start_vowel.city 
fROM start_vowel
JOIN end_vowel
ON start_vowel.city = end_vowel.city

--Alternatively
SELECT 
    city
FROM station
WHERE 
    lower(city) regexp '^[aeiou]'
    AND
    lower(city) regexp '[aeiou]$'
    
--Alternatively
SELECT DISTINCT
    city
FROM 
    station
WHERE
    RIGHT(LOWER(city), 1) IN ('a', 'e', 'i', 'o', 'u')
    AND LEFT(LOWER(city), 1) IN ('a', 'e', 'i', 'o', 'u')
