WITH src_hosts (
    host_id,
	host_name,
	is_superhost,
	created_at,
	updated_at
) AS(
    /*SELECT * FROM AIRBNB.RAW.RAW_HOSTS*/
	SELECT * FROM {{ source('airbnb', 'hosts')}}
)
SELECT * FROM src_hosts