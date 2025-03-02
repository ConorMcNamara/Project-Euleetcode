WITH prior_date AS(
    SELECT
          transaction_id,
          merchant_id,
          credit_card_id,
          amount,
          transaction_timestamp,
          LAG(transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) AS prior_transaction
    FROM transactions
)
SELECT
    COUNT(CASE WHEN EXTRACT(EPOCH FROM (transaction_timestamp - prior_transaction)) / 60 <= 10 THEN transaction_id END)
FROM prior_date