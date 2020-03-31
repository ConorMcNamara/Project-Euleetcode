DELETE p1
FROM Person p1, Person p2
WHERE p1.Email = p2.Email AND
p1.Id > p2.Id

# Alternatively
delete from Person where id not in(
    select t.id from (
        select min(id) as id from Person group by email
    ) t
)