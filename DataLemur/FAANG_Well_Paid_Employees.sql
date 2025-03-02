WITH managers AS (
    SELECT
        employee_id,
        salary
    FROM employee
    WHERE
        manager_id IS NULL
)
SELECT
    e.employee_id,
    e.name
FROM employee e
JOIN managers
    ON e.manager_id = managers.employee_id
WHERE
    e.salary > managers.salary
;