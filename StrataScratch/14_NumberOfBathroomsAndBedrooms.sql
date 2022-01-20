SELECT
    city,
    property_type,
    AVG(bathrooms) AS bathrooms,
    AVG(bedrooms) AS bedrooms
FROM airbnb_search_details
GROUP BY 
    1, 2;
