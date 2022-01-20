--Assuming no duplicates, i.e. user1, user2 = user2, user1
WITH user1_friends AS (
SELECT 
    user1,
    COUNT(user2) AS user1_friends
FROM 
    facebook_friends
GROUP BY 
    1
),
user2_friends AS (
SELECT 
    user2,
    COUNT(user1) as user2_friends
FROM 
    facebook_friends
GROUP BY 
    1
),
all_users AS (
    SELECT
        user1 AS user
    FROM facebook_friends 
    
    UNION DISTINCT
    
    SELECT 
        user2 AS user
    FROM facebook_friends
),
cte AS (
SELECT
    all_users.user,
    SUM(COALESCE(user1_friends, 0) + COALESCE(user2_friends, 0)) AS num_friends
FROM all_users
LEFT JOIN user1_friends
    ON all_users.user = user1_friends.user1
LEFT JOIN user2_friends
    ON all_users.user = user2_friends.user2
GROUP BY 
    1
)
SELECT 
    cte.user,
    MAX(num_friends) * 100.0 / COUNT(all_users.user) AS pop_percent
FROM cte, all_users
GROUP BY 
    1
ORDER BY    
    1 ASC
