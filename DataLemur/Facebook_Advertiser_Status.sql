WITH payment_status AS (
    SELECT
        COALESCE(advertiser.user_id, daily_pay.user_id) AS user_id,
        status,
        CASE WHEN paid IS NULL THEN 0 ELSE 1 END AS current_payment
    FROM advertiser
    FULL OUTER JOIN daily_pay
        ON advertiser.user_id = daily_pay.user_id
)
SELECT
    user_id,
    CASE
        WHEN current_payment = 0 THEN 'CHURN'
        WHEN status IN ('NEW', 'EXISTING', 'RESURRECT') AND current_payment = 1 THEN 'EXISTING'
        WHEN status = 'CHURN' AND current_payment = 1 THEN 'RESURRECT'
        WHEN status IS NULL AND current_payment = 1 THEN 'NEW'
    END AS new_status
FROM payment_status
ORDER BY 1;