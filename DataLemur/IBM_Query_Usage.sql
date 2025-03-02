WITH employee_queries AS (
    SELECT
        e.employee_id,
        COALESCE(COUNT(DISTINCT query_id), 0) AS queries_run
    FROM employees e
    LEFT JOIN queries q
        ON e.employee_id = q.employee_id
        AND CAST(query_starttime AS DATE) BETWEEN '2023-07-01' AND '2023-10-01'
    GROUP BY
        1
  )

SELECT
    queries_run AS unique_queries,
    COUNT(DISTINCT employee_id) AS employee_count
FROM employee_queries
GROUP BY
  1;