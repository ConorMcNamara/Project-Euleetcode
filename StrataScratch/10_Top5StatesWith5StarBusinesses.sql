WITH five_stars AS (
SELECT 
    state,
    COUNT(business_id) AS five_stars,
    RANK() OVER (ORDER BY COUNT(business_id) DESC) AS rnk
FROM yelp_business
WHERE
    stars = 5.0
GROUP BY 
    1
)
SELECT 
    state,
    five_stars
FROM five_stars
WHERE
    rnk <= 5
ORDER BY 
    2 DESC
