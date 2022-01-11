SELECT
    Department.name AS 'Department',
    Employee.name AS 'Employee',
    Salary
FROM
    Employee
        JOIN
    Department ON Employee.DepartmentId = Department.Id
WHERE
    (Employee.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
     )

# Alternatively

WITH rank_employee AS (
SELECT
    name,
    salary,
    RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as sal_rank
FROM employee
)
SELECT
    department.name AS Department,
    employee.name AS Employee,
    employee.salary AS salary
FROM employee
JOIN department
    ON employee.departmentId = department.id
JOIN rank_employee
    ON rank_employee.name = employee.name
WHERE
    sal_rank = 1
