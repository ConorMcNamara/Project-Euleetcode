/* Write your T-SQL query statement below */
SELECT 
    score,
    dense_rank() over (ORDER BY score DESC) AS `rank`
FROM scores
ORDER BY 
    1 DESC
