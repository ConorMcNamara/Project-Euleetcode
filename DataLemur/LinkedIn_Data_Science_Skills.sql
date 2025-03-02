WITH talents AS (
    SELECT
        candidate_id,
        skill,
        CASE WHEN skill = 'Python' THEN 1
            WHEN skill = 'Tableau' THEN 1
            WHEN skill = 'PostgreSQL' THEN 1
          ELSE 0 END as num_skill
    FROM candidates
)
SELECT
    candidate_id
FROM
    talents
GROUP BY
  1
HAVING
    SUM(num_skill) = 3;