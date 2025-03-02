WITH tweet_by_day AS (
    SELECT
        user_id,
        CAST(tweet_date AS date) AS tweet_date,
        SUM(tweet_count) AS tweet_count
    FROM tweets
    GROUP BY
      1, 2
)
SELECT
    user_id,
    tweet_date,
    ROUND(AVG(tweet_count) OVER (PARTITION BY tweet_date ORDER BY tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT row), 2) AS rolling_avg_3d
FROM tweet_by_day