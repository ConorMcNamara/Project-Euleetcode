select a.class
from (select student, class
      from courses
      group by student, class
      having count(*) = 1) a
      group by a.class
      having count(a.class) >= 5