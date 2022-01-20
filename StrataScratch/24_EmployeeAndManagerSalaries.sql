SELECT 
    employee.first_name,
    employee.last_name,
    employee.salary
FROM employee
JOIN employee manager
ON employee.manager_id = manager.id
WHERE
    employee.salary > manager.salary
