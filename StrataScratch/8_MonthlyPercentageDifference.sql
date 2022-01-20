WITH revenue AS (
SELECT 
    to_char(created_at, 'YYYY-MM') as date,
    SUM(value) AS revenue
FROM sf_transactions
GROUP BY 
    1
),
lagged_revenue AS (
    SELECT
        date,
        LAG(revenue, 1) OVER (order by date) as lagged_revenue
    FROM revenue
    GROUP BY 
        1, revenue
)
SELECT 
    revenue.date,
    ROUND((revenue.revenue - lagged_revenue.lagged_revenue) * 100.0 / lagged_revenue.lagged_revenue, 2) AS perc_change
FROM revenue
JOIN lagged_revenue
    ON revenue.date = lagged_revenue.date
GROUP BY 
    1, revenue.revenue, lagged_revenue.lagged_revenue
ORDER BY 
    revenue.date ASC;
