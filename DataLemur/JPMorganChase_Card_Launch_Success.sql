WITH first_year AS (
    SELECT
        MIN(issue_year) AS first_year,
        card_name
    FROM monthly_cards_issued
    GROUP BY
        2
),
first_month AS (
    SELECT
        MIN(issue_month) AS first_month,
        first_year,
        monthly_cards_issued.card_name
    FROM monthly_cards_issued
    JOIN first_year
        ON monthly_cards_issued.card_name = first_year.card_name
        AND monthly_cards_issued.issue_year = first_year.first_year
GROUP BY
  2, 3
)
SELECT
    monthly_cards_issued.card_name,
    issued_amount
FROM monthly_cards_issued
JOIN first_month
    ON monthly_cards_issued.card_name = first_month.card_name
    AND monthly_cards_issued.issue_month = first_month.first_month
    AND monthly_cards_issued.issue_year = first_month.first_year
ORDER BY
    2 DESC