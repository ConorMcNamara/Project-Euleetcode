select distinct l1.num as consecutivenums
from logs l1,
logs l2,
logs l3
where
l1.id = l2.id - 1
and l2.id = l3.id - 1
and l1.num = l2.num
and l2.num = l3.num

# Alternatively

SELECT T.Num as ConsecutiveNums
FROM
(SELECT DISTINCT A.Num FROM
Logs A
LEFT JOIN Logs B on A.Id = B.Id-1
LEFT JOIN Logs C on A.Id = C.Id-2
WHERE A.Num = B.Num AND A.Num = C.Num) T