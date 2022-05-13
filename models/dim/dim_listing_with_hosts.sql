WITH l as (
    SELECT * FROM {{ ref('dim_listings_cleansed') }}
),
h as (
    SELECT * FROM {{ ref('dim_hosts_cleansed') }}
)
SELECT
    l.listings_id,
    l.lisitng_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    h.host_id,
    h.host_name,
	h.is_superhost AS host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM l
LEFT JOIN h 
ON h.host_id = l.host_id