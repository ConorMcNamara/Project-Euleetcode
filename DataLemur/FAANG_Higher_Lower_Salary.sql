WITH department_average AS (
    SELECT DISTINCT
        department_id,
        to_char(payment_date, 'YYYY-MM') AS payment_date,
        AVG(amount) OVER (PARTITION BY department_id) AS department_average,
        AVG(amount) OVER () AS overall_average
    FROM employee e
    JOIN salary s
    ON
        e.employee_id = s.employee_id
    WHERE
        to_char(payment_date, 'YYYY-MM') = '2024-03'
)
SELECT
    department_id,
    payment_date,
    CASE
        WHEN department_average < overall_average THEN 'lower'
        WHEN department_average = overall_average THEN 'same'
        ELSE 'higher'
    END AS comparison
FROM department_average