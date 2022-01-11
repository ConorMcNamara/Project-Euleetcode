SELECT
    employee.name AS Employee
FROM employee
JOIN employee manager
ON employee.managerId = manager.id
WHERE employee.salary > manager.salary

# Alternatively

SELECT name AS employee FROM (
    SELECT 
         employee.name, 
         manager.salary as manager_salary,
         employee.salary as user_salary 
    FROM employee manager
    LEFT JOIN employee
    ON manager.id = employee.managerid
    ) employee_manager
WHERE user_salary > manager_salary
