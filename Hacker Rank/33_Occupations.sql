SELECT 
    MIN(CASE WHEN occupation = 'Doctor' THEN NAME ELSE NULL END),
    MIN(CASE WHEN occupation = 'Professor' THEN NAME ELSE NULL END),
    MIN(CASE WHEN occupation = 'Singer' THEN NAME ELSE NULL END),
    MIN(CASE WHEN occupation = 'Actor' THEN NAME ELSE NULL END)
FROM
(
    SELECT 
        occupation, 
        name, 
        ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rank_occ
    FROM OCCUPATIONS
) AS T
GROUP BY 
    rank_occ
