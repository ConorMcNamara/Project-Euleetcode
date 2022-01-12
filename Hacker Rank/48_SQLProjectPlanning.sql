WITH starting_dates AS (
    SELECT
        p1.start_date
    FROM projects p1
    WHERE p1.start_date NOT IN (SELECT end_date FROM projects)
),
ending_dates AS (
    SELECT
        p1.end_date
    FROM projects p1
    WHERE p1.end_date NOT IN (SELECT start_date FROM projects)
)
SELECT 
    starting_dates.start_date,
    MIN(ending_dates.end_date)
FROM starting_dates, ending_dates
WHERE 
    start_date < end_date
GROUP BY 
    1
ORDER BY 
    DATEDIFF(start_date, MIN(end_date)) DESC, start_date
