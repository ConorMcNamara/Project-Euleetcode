SELECT
    ROUND(
        AVG(
            CASE
                WHEN
                    COALESCE(call_category, 'n/a') = 'n/a' THEN 1
                    ELSE 0
                    END) * 100.0,
        1) AS uncategorised_call_pct
FROM callers;