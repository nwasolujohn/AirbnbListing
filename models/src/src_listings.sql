WITH raw_listings (
    listings_id,
	listing_url,
	lisitng_name,
	room_type,
	minimum_nights,
	host_id,
	price,
	created_at,
	updated_at) as (
   /*SELECT * FROM AIRBNB.RAW.RAW_LISTINGS*/
   SELECT * FROM {{ source('airbnb', 'listings')}}

)

SELECT * FROM raw_listings