SELECT 
    salary * months AS earnings,
    COUNT(employee_id) AS num_employees
FROM employee
WHERE
    salary * months = (SELECT MAX(salary * months) FROM employee)
GROUP BY 
    1
