WITH max_dept AS (
SELECT 
    department,
    MAX(salary) OVER (PARTITION BY department) as max_sal
FROM 
    employee
GROUP BY 
    1, salary
    )
SELECT DISTINCT
    max_dept.department,
    first_name,
    employee.salary
FROM employee
JOIN max_dept 
    ON employee.department = max_dept.department
    AND employee.salary = max_sal

    
