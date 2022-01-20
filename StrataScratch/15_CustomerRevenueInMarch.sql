SELECT  
    cust_id,
    SUM(total_order_cost) as revenue
FROM orders 
WHERE
    order_date BETWEEN DATE('2019-03-01') AND DATE('2019-03-31')
GROUP BY 
    1
ORDER BY 
    2 DESC
