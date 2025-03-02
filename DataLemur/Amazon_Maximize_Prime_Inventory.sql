WITH batches AS (
    SELECT
        item_type,
        COUNT(DISTINCT item_category) AS num_items,
        SUM(square_footage) AS total_footage
  FROM inventory
  GROUP BY
        1
),
prime_eligible AS (
    SELECT
        item_type,
        total_footage,
        FLOOR(500000 / total_footage) AS num_batches,
        FLOOR(500000 / total_footage) * num_items AS item_count
    FROM batches
    WHERE
        item_type = 'prime_eligible'
),
not_prime AS (
    SELECT
        item_type,
        FLOOR((500000 - ((SELECT total_footage from prime_eligible) * (SELECT num_batches from prime_eligible))) / total_footage) AS num_batches,
        FLOOR((500000 - ((SELECT total_footage from prime_eligible) * (SELECT num_batches from prime_eligible))) / total_footage) * num_items AS item_count
FROM batches
WHERE
     item_type = 'not_prime'
)
SELECT
    item_type,
    item_count
FROM not_prime
UNION ALL
SELECT
    item_type,
    item_count
FROM prime_eligible