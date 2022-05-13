{{
    config(
        materialized = 'view',
        on_schema_change = 'fail'
    )
}}
WITH src_listings AS(
    SELECT * FROM {{ ref('src_listings')}}
)
SELECT 
    listings_id,
    lisitng_name,
    room_type,
    -- coverting the min nights of zeros to at least one night 
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    host_id,
    -- repleacing the $ sign with nothing and then converting the str to num upto 2 decimals
    REPLACE(
        price, 
        '$'
    ) :: NUMBER(
        10, 
        2
    ) AS price,
    created_at,
    updated_at
FROM 
    src_listings
