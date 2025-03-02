WITH phone_details AS (
  SELECT
        phone_calls.caller_id,
        CASE WHEN pi1.country_id <> pi2.country_id THEN 1 ELSE 0 END AS international,
        pi1.country_id AS caller_county,
        phone_calls.receiver_id,
        pi2.country_id AS receiver_country
    FROM phone_calls
    JOIN phone_info pi1
        ON phone_calls.caller_id = pi1.caller_id
    JOIN phone_info pi2
        ON phone_calls.receiver_id = pi2.caller_id
)
SELECT
    ROUND(AVG(international) * 100.0, 2) AS international_calls_pct
FROM phone_details