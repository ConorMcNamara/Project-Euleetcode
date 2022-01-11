SELECT DISTINCT
    log1.num AS ConsecutiveNums
FROM 
    logs log1
JOIN logs log2
    ON log1.id = log2.id + 1
    AND log1.num = log2.num
JOIN logs log3
    ON log2.id = log3.id + 1
    AND log2.num = log3.num

# Alternatively

SELECT T.Num as ConsecutiveNums
FROM
(SELECT DISTINCT A.Num FROM
Logs A
LEFT JOIN Logs B on A.Id = B.Id-1
LEFT JOIN Logs C on A.Id = C.Id-2
WHERE A.Num = B.Num AND A.Num = C.Num) T
