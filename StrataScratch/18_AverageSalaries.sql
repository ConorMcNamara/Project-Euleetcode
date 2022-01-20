SELECT 
    department,
    first_name,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_salary
FROM employee
GROUP BY 
    1, 2, 3
