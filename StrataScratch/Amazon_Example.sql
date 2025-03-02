WITH monthly_revenue AS (
    SELECT
        CAST(created_at AS DATE) AS created_date,
        SUM(value) AS revenue,
        LAG(SUM(value), 1) OVER (ORDER BY CAST(created_at AS DATE)) AS last_month_revenue
    GROUP BY
        1
)
SELECT
    created_date,
    round((revenue - last_month_revenue) * 100.0 / last_month_revenue, 2) AS revenue_diff
FROM monthly_revenue
ORDER BY
    1;