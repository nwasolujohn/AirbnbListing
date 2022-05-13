WITH raw_reviews (
    listings_id,
	review_date,
	reviewer_name,
	review_text,
	review_sentiment
) AS (
    /*SELECT * FROM AIRBNB.RAW.RAW_REVIEWS*/
	SELECT * FROM {{ source('airbnb', 'reviews')}}
)

SELECT * FROM raw_reviews