# Write your MySQL query statement below
select request_at as day,
round(1 - (t2.completed_num / t2.total), 2) as "Cancellation Rate"
from (
select request_at,
count(*) as total,
sum(case when t1.status = 'completed' then 1 else 0 end) as completed_num
from (select banned, request_at, status from
               trips
              inner join users
              on client_id = users_id and banned = 'No') t1
where request_at between '2013-10-01' and '2013-10-03'
group by request_at
    ) t2

# Alternatively
select request_at as day,
round(1 - (t2.completed_num / t2.total), 2) as "Cancellation Rate"
from (
select request_at,
count(*) as total,
sum(case when t1.status = 'completed' then 1 else 0 end) as completed_num
    # Here, we get the informat
from (select request_at, status from
               trips
              inner join users
              on client_id = users_id and banned = 'No') t1
where request_at between '2013-10-01' and '2013-10-03'
group by request_at
    ) t2