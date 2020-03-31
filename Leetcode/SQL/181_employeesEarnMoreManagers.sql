select
a.name as employee
from
employee a,
employee b
where
a.managerid = b.id
and a.salary > b.salary

# Alternatively

select name as employee from (
select e2.name, e1.salary as manager_salary, e2.salary as user_salary from
employee e1
left join employee e2
 on e1.id = e2.managerid
    ) e3
    where user_salary > manager_salary