WITH salary_ranks AS (
SELECT
    departmentId,
    salary,
    DENSE_RANK() OVER (partition by departmentId ORDER BY salary DESC) AS sal_ranks
FROM employee
)
SELECT DISTINCT
    department.name AS Department,
    employee.name AS Employee,
    salary_ranks.salary AS Salary
FROM employee
JOIN department
    ON employee.departmentId = department.id
JOIN salary_ranks
    ON employee.departmentId = salary_ranks.departmentId
    AND employee.salary = salary_ranks.salary
WHERE
    sal_ranks <= 3
