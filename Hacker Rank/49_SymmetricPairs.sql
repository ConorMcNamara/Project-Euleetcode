SELECT
    f.X, 
    f.Y
FROM
    functions f
JOIN
    functions f2
ON
    f.X = f2.Y
    AND f.Y = f2.X
GROUP BY
    f.X, 
    f.Y
HAVING
    count(f.X) > 1 
    OR f.X < f.Y
ORDER BY
    f.X
