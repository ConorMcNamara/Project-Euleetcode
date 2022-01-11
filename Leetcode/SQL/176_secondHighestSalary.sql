SELECT (
  SELECt DISTINCT 
    salary 
  FROM employee
ORDER BY salary DESC
LIMIT 1,1
) as SecondHighestSalary;

--Alternatively
SELECT 
    MAX(e2.salary) AS SecondHighestSalary
FROM employee e1, employee e2
WHERE e1.salary > e2.salary
