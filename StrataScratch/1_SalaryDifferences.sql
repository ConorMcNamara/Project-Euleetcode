WITH marketing AS (
SELECT 
    MAX(salary) AS salary
FROM db_employee
JOIN db_dept
    ON db_employee.department_id = db_dept.id
WHERE
    db_dept.department = 'marketing'
),
engineering AS (
    SELECT 
        MAX(salary) as salary
    FROM db_employee
    JOIN db_dept
        ON db_employee.department_id = db_dept.id
    WHERE
        db_dept.department = 'engineering'
)
SELECT
    ABS(marketing.salary - engineering.salary)
FROM marketing, engineering
