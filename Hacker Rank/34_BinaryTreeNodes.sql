SELECT DISTINCT
    bst1.N,
    CASE WHEN bst1.P IS NULL THEN 'Root'
    WHEN bst2.P IS NULL THEN 'Leaf'
    ELSE 'Inner' END AS node_type
FROM bst bst1
LEFT JOIN bst bst2
    ON bst1.N = bst2.P
ORDER BY 
    bst1.N
