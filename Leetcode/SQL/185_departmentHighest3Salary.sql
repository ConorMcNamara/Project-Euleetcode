Select dep.name as Department, emp.name as Employee, emp.salary from
Department dep,
Employee emp
where emp.departmentid=dep.id and
(select count(distinct salary) from Employee where departmentid=dep.id and salary > emp.salary)<3