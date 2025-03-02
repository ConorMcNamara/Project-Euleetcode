WITH emails_texts AS (
    SELECT
        emails.user_id,
        COALESCE(MIN(signup_action), 'Not Confirmed') AS signup_action
    FROM emails
    LEFT JOIN texts
        ON emails.email_id = texts.email_id
    GROUP BY
        1
)
SELECT
  ROUND(AVG(CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END), 2) AS confirm_rate
FROM emails_texts;