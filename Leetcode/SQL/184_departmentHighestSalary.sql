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

select d.name as department, c.name as employee, c.salary from
(select a.salary, a.departmentid, b.name from (select max(salary) as salary, departmentid
from employee
group by departmentid) a
inner join employee b
on a.departmentid = b.departmentid
and a.salary = b.salary) c
inner join department d
on c.departmentid = d.id
group by salary, department, employee