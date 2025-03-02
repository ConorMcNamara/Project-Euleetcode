WITH postings AS (
    SELECT
        company_id,
        title,
        description,
        COUNT(*) AS num_listings
    FROM job_listings
    GROUP BY
        1, 2, 3
)
SELECT
  COUNT(DISTINCT company_id) AS duplicate_companies
FROM postings
WHERE
    num_listings > 1