SELECT
    request_at AS day,
    ROUND(AVG(CASE WHEN status <> 'completed' THEN 1 ELSE 0 END), 2) AS `Cancellation Rate`
FROM trips
JOIN users client
    ON trips.client_id = client.users_id
    AND client.banned = 'No'
JOIN users drivers
    ON trips.driver_id = drivers.users_id
    AND drivers.banned = 'No'
WHERE
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 
    1
    
--Alternatively
SELECT
    request_at AS day,
    ROUND(AVG(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END), 2) AS `Cancellation Rate`
FROM trips
JOIN users client
    ON trips.client_id = client.users_id
    AND client.banned = 'No'
JOIN users drivers
    ON trips.driver_id = drivers.users_id
    AND drivers.banned = 'No'
WHERE
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 
    1
