SELECT
    id,
    first_name,
    last_name,
    department_id,
    MAX(salary) AS salary
FROM 
    ms_employee_salary
GROUP BY 
    1, 2, 3, 4
ORDER BY 
    id ASC
