SELECT
    manufacturer,
    COUNT(drug) as drug_count,
    ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE
    total_sales - cogs < 0
GROUP BY
    1, 3
ORDER BY
    3 DESC
LIMIT 3;