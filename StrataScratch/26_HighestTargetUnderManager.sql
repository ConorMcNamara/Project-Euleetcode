WITH max_target AS (
SELECT 
    MAX(target) OVER (PARTITION BY manager_id) as max_target,
    manager_id
FROM salesforce_employees
GROUP BY 
    2, target
)
SELECT DISTINCT
    salesforce_employees.target,
    salesforce_employees.first_name
FROM salesforce_employees
JOIN max_target
    ON max_target.manager_id = salesforce_employees.manager_id
    AND max_target.max_target = salesforce_employees.target
    AND max_target.manager_id = 13
