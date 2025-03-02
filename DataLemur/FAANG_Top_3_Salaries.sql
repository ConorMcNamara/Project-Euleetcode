WITH department_rank AS (
    SELECT
          department_name,
          name,
          salary,
          DENSE_RANK() OVER (PARTITION BY department_name ORDER BY salary DESC) AS rn
    FROM employee
    JOIN department
        ON employee.department_id = department.department_id
)
SELECT
      department_name,
      name,
      salary
FROM department_rank
WHERE
    rn <= 3
ORDER BY
    department_name,
    salary DESC,
    name ASC;