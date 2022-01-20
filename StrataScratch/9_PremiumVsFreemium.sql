WITH all_users AS (
    SELECT
        date,
        paying_customer,
        SUM(downloads) AS total_downloads,
        LAG(SUM(downloads), 1) OVER (PARTITION BY date ORDER BY paying_customer DESC) AS paying_downloads
    FROM ms_download_facts AS mdf
    lEFT JOIN ms_user_dimension AS mud 
        ON mdf.user_id = mud.user_id
    lEFT JOIN ms_acc_dimension  AS mad 
        ON mud.acc_id = mad.acc_id
    GROUP BY
        date,
        paying_customer
)
SELECT 
    date,
    CASE WHEN paying_customer = 'no' THEN total_downloads END AS npc,
    CASE WHEN paying_customer = 'no' THEN paying_downloads END AS pc
FROM all_users 
WHERE
    total_downloads > paying_downloads
    
    
