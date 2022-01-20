WITH sessions AS (
SELECT 
    user_id,
    DATE(timestamp) AS day,
    MAX(CASE WHEN action = 'page_load' THEN timestamp END) AS page_load_ts,
    MIN(CASE WHEN action = 'page_exit' THEN timestamp END) as page_exit_ts
FROM facebook_web_log
GROUP BY 
    1, 2
    )
SELECT 
    user_id,
    AVG(page_exit_ts - page_load_ts) as avg_session_time
FROM sessions
WHERE
    page_exit_ts IS NOT NULL 
    AND page_load_ts IS NOT NULL
GROUP BY 
    user_id
