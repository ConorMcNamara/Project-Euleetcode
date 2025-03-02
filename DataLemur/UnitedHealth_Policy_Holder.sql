WITH callers AS (
    SELECT
        policy_holder_id,
        COUNT(case_id) AS num_calls
FROM callers
GROUP BY
    1
)
SELECT
  COUNT(DISTINCT CASE WHEN num_calls >= 3 THEN policy_holder_id END) AS policy_holder_count
FROM callers;