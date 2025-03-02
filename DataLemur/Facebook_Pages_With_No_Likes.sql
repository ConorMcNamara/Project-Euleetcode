WITH page_users AS (
    SELECT
        p.page_id,
        COUNT(DISTINCT pl.user_id) as unique_users
    FROM pages p
    LEFT JOIN page_likes pl
        ON p.page_id = pl.page_id
    GROUP BY
        1
)
SELECT
    page_id
FROM page_users
WHERE
    unique_users = 0