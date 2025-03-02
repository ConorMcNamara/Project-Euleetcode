SELECT
    product_id,
    EXTRACT(MONTH FROM submit_date) AS month,
    ROUND(AVG(stars), 2) as avg_stars
FROM reviews
GROUP BY
    1,2