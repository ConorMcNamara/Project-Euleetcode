WITH server_time AS (
    SELECT
        server_id,
        status_time,
        session_status,
        LAG(status_time, 1) OVER (PARTITION BY server_id ORDER BY status_time) AS prev_session,
        ROW_NUMBER() OVER (PARTITION BY server_id ORDER BY status_time) AS rn
    FROM server_utilization
)
SELECT
    SUM(CAST(status_time AS date)- CAST(prev_session AS DAte))
FROM server_time
WHERE
    rn % 2 = 0