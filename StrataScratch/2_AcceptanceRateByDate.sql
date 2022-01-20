WITH acceptances AS (
SELECT 
    user_id_sender,
    user_id_receiver,
    MAX(CASE WHEN action = 'accepted' THEN 1 ELSE 0 END) AS acceptance
FROM fb_friend_requests
GROUP BY 
    1, 2
    ),
requests AS (
SELECT 
    user_id_sender,
    user_id_receiver,
    CASE WHEN action = 'sent' THEN date END AS request_date
FROM 
    fb_friend_requests
) 

SELECT 
    request_date,
    AVG(acceptance)
FROM requests
JOIN acceptances
    oN requests.user_id_sender = acceptances.user_id_sender
    AND requests.user_id_receiver = acceptances.user_id_receiver
WHERE
    request_date IS NOT NULL
GROUP BY 
    1
ORDER BY 
    1
    
