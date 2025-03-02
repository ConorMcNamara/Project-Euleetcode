WITH signups AS (
    SELECT
        emails.user_id,
        CAST(action_date AS date) - CAST(signup_date AS date)  AS date_difference
    FROM emails
    JOIN texts
        on emails.email_id = texts.email_id
    WHERE
        signup_action = 'Confirmed'
)
SELECT
    user_id
FROm signups
WHERE
    date_difference = 1;