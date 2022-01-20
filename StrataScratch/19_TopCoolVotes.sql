WITH max_cool AS (
SELECT 
    max(cool) as max_cool
FROM yelp_reviews
)
SELECT
    business_name,
    review_text,
    cool
FROM yelp_reviews
JOIN max_cool
    ON yelp_reviews.cool = max_cool.max_cool
