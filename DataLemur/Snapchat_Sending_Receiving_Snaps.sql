WITH total_time AS (
    SELECT
          age_bucket,
          activity_type,
          SUM(time_spent) AS time_spent,
          SUM(SUM(time_spent)) OVER (PARTITION BY age_bucket) AS total_time_spent,
          ROUND(SUM(time_spent) * 100.0 / SUM(SUM(time_spent)) OVER (PARTITION BY age_bucket), 2) AS percentage_time_spent
    FROM activities a
    JOIN age_breakdown ag
    ON
        a.user_id = ag.user_id
    GROUP BY
        1, 2
)
SELECT
      age_bucket,
      MAX(CASE WHEN activity_type = 'send' THEN percentage_time_spent END) AS send_perc,
      MAX(CASE WHEN activity_type = 'open' THEN percentage_time_spent END) AS open_perc
FROM total_time
WHERE
    activity_type IN ('open', 'send')
GROUP BY
    1