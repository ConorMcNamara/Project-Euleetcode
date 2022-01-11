WITH swap AS (
SELECT
    CASE WHEN id % 2 = 1 THEN id + 1
    ELSE id - 1 END AS id,
    student
FROM seat
)
SELECT
    seat.id,
    COALESCE(swap.student, seat.student) as student
FROM 
    seat
LEFT JOIN swap
    ON seat.id = swap.id
