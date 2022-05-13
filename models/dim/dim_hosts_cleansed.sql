{{
    config(
        materialized = 'view',
        on_schema_change = 'fail'
    )
}}
WITH src_hosts AS(
    SELECT * FROM {{ ref('src_host')}}
)
SELECT 
    host_id,
    -- replacing null values with 'anonymous'
    NVL(
        host_name,
        'Anonymous'
    )AS host_name,
	is_superhost,
	created_at,
	updated_at
FROM 
    src_host