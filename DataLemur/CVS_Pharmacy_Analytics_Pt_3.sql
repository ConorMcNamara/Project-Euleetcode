SELECT
    manufacturer,
    CONCAT('$', ROUND(SUM(total_sales) / 1000000), ' million') AS sale
FROM pharmacy_sales
GROUP BY
    1
ORDER BY
    SUM(total_sales) DESC, 1;