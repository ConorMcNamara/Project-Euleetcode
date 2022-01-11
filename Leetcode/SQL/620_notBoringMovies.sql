SELECT 
    *
FROM Cinema
WHERE LOWER(description) <> 'boring'
AND id % 2 = 1
ORDER BY
    rating DESC
