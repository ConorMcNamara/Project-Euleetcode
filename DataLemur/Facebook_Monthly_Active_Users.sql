WITH july_actions AS (
    SELECT
        user_id
    FROM user_actions
    WHERE
        date_part('month', event_date) = 7
        AND date_part('year', event_date) = 2022
),
june_actions AS (
    SELECT
        user_id
    FROM user_actions
    WHERE
        date_part('month', event_date) = 6
        AND date_part('year', event_date) = 2022
)
SELECT
    7 as month,
    COUNT(DISTINCT july_actions.user_id)
FROM july_actions
JOIN june_actions
    ON july_actions.user_id = june_actions.user_id