{% snapshot scd_raw_hosts %}

{{
    config(
        updated_at = 'updated_at',
        target_schema = 'dev',
        strategy = 'timestamp',
        unique_key = 'id',
        invalidate_hard_deletes = True
    )
}}

SELECT * FROM {{ source('airbnb', 'hosts') }}

{% endsnapshot %}