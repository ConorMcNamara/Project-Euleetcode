WITH max_reviews AS (
SELECT 
    UNNEST(string_to_array(categories, ';')) as categories,
    SUM(review_count) as review_count
FROM yelp_business
GROUP BY 
    1
)
SELECT
    categories,
    review_count
FROM max_reviews
ORDER BY 
    2 DESC
