WITH host_type AS (
    SELECT DISTINCT
        CONCAT(price, room_type, host_since, zipcode, number_of_reviews) AS host_id,
        number_of_reviews,
        price
    FROM 
        airbnb_host_searches
    )
SELECT
    CASE WHEN number_of_reviews = 0 THEN 'New'
        WHEN number_of_reviews <= 5 THEN 'Rising'
        WHEN number_of_reviews <= 15 THEN 'Trending Up'
        WHEN number_of_reviews <= 40 THEN 'Popular'
        ELSE 'Hot' END AS popularity_rating,
    MIN(price) AS min_price,
    AVG(price) AS avg_price,
    MAX(price) AS max_price
FROM host_type
GROUP BY 
    1
