WITH cleaned AS (
    SELECT
        LPAD(TRIM(geolocation_zip_code_prefix::text), 5, '0')::varchar(5) AS geolocation_zip_code_prefix,
        geolocation_lat::double precision as geolocation_lat ,
        geolocation_lng::real as geolocation_lng ,
        LOWER(
            REGEXP_REPLACE(
                UNACCENT(TRIM(geolocation_city)),
                '[^a-zA-Z''\s]',
                '',
                'g'
            )
        )::varchar(50) AS geolocation_city,
        TRIM(geolocation_state)::varchar(2) AS geolocation_state
    FROM {{ source('raw', 'geolocation') }}
),
deduped AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY geolocation_zip_code_prefix, geolocation_lat, geolocation_lng
               ORDER BY geolocation_zip_code_prefix
           ) AS rn
    FROM cleaned
)
SELECT
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
FROM deduped
WHERE rn = 1
