select a.firstname, a.lastname, b.city, b.state
from person a
LEFT JOIN address b
on a.personid = b.personid