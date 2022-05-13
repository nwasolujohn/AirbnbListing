SELECT * FROM 
    {{ ref('dim_listings_cleansed') }}
Where minimum_nights < 1
LIMIT 10