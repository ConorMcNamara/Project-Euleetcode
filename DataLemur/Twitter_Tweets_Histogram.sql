WITH user_tweets AS (
    SELECT
        user_id,
        COUNT(tweet_id) AS num_tweets
    FROM tweets
    WHERE
        EXTRACT(year from tweet_date) = 2022
    GROUP BY
      1
)
SELECT
    num_tweets AS tweet_bucket,
    COUNT(user_id) AS users_num
FROM user_tweets
GROUP BY
    1;