WITH total_costs AS (
SELECT
    first_name,
    order_date,
    SUM(total_order_cost) AS cost,
    RANK() OVER (ORDER BY SUM(total_order_cost) DESC) as rnk
FROM customers
JOIN orders
    ON customers.id = orders.cust_id
WHERE 
    order_date BETWEEN DATE('2019-02-01') AND DATE('2019-05-01')
GROUP BY 
    1, 2

    )
SELECT 
    first_name,
    order_date,
    cost
fROM total_costs
WHERE 
    rnk = 1
    
