WITH salary_rank AS (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rn
    FROM employee
)
SELECT
    salary
FROM salary_rank
WHERE
    rn = 2
LIMIT 1