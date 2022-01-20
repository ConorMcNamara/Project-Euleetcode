WITH worker_rank AS (
SELECT 
    worker_title,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rnk
FROM worker
JOIN title
    ON worker.worker_id = title.worker_ref_id
GROUP BY 
    1, 2
    )
SELECT 
    worker_title
FROM 
    worker_rank
WHERE
    rnk = 1
