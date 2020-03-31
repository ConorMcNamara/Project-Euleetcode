select name as customers
FROM customers
WHERE customers.id not in
(select customerid from orders)