SELECT 
    company.company_code,
    company.founder,
    COUNT(DISTINCT employee.lead_manager_code) AS num_lead_managers,
    COUNT(DISTINCT employee.senior_manager_code) AS num_senior_managers,
    COUNT(DISTINCT employee.manager_code) AS num_managers,
    COUNT(DISTINCT employee.employee_code) AS num_employees
FROM 
    company
JOIN 
    employee
ON
    company.company_code = employee.company_code
GROUP BY 
    1, 2
ORDER BY 
    1
