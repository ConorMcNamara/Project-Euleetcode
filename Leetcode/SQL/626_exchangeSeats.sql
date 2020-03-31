select
case when (id % 2 = 1)
    then
    case when (id = (select max(id) from seat))
               then id
               else
               id + 1
               end
    else id - 1
    end as id,
    student
from seat
order by id