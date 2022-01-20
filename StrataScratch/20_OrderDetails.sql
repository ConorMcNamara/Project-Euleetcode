SELECT 
    order_date,
    order_details,
    total_order_cost,
    first_name
FROM customers
JOIN orders 
    ON customers.id = orders.cust_id
WHERE
    LOWER(first_name) IN ('jill', 'eva')
ORDER BY 
    cust_id ASC
