WITH stock_min_max AS (
    SELECT
        ticker,
        MAX(open) AS max_open,
        MIN(open) AS min_open
    FROM stock_prices
    GROUP BY
        1
)
SELECT
    stock_prices.ticker,
    MAX(CASE WHEN stock_prices.open = max_open THEN to_char(date, 'Mon-yyyy') END) AS highest_mth,
    MAX(max_open) AS highest_open,
    MAX(CASE WHEN stock_prices.open = min_open THEN to_char(date, 'Mon-yyyy') END) AS lowest_mth,
    MAX(min_open) AS min_open
FROM stock_prices
JOIN stock_min_max
    ON stock_prices.ticker = stock_min_max.ticker
GROUP BY
    1
ORDER BY
    1;
